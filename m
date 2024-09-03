Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F105D969C70
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB010E4EE;
	Tue,  3 Sep 2024 11:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538AB10E4F6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:51:04 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DE3F61F965;
 Tue,  3 Sep 2024 13:51:01 +0200 (CEST)
Date: Tue, 3 Sep 2024 13:51:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
Message-ID: <p6xw4newsbrpog5ftclvgi2mpg3hn3ujfukmtilqewz7kbjhqh@6geosjawh3ul>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <rspuwp3zpnzwfe26hv2yezy5ad5o7wliq7ucpobyaheytvcs3j@qtshf6cewb2f>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rspuwp3zpnzwfe26hv2yezy5ad5o7wliq7ucpobyaheytvcs3j@qtshf6cewb2f>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-09-03 11:50:36, Marijn Suijten wrote:
> On 2024-08-29 18:17:31, Jun Nie wrote:
> > From: Jonathan Marek <jonathan@marek.ca>
> > 
> > For the bonded DSI case, DSC pic_width and timing calculations should use
> > the width of a single panel instead of the total combined width.
> 
> When this patch was originally proposed we already discussed [1] that this is
> **not** universally true.  On my hardware a single bonded panel always receives
> the full width, at least on downstream kernels, and it works [2].
> 
> [1]: https://lore.kernel.org/linux-arm-msm/eanx45rnasj7lu3r2tfhtg4qkqkcidd6zctsz6ci6jlklu4fgi@3nf73w2ka4li/T/#u
> [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/41
> 
> Can we please figure this out before landing this patch?

For completeness I've picked this patch, together with the following
mis-squashed change from patch 03/21:

	diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
	index 7a4d9c071be5a..5abade8f26b88 100644
	--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
	+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
	@@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
	 			return;
	 		}
 
	-		dsc->pic_width = mode->hdisplay;
	+		dsc->pic_width = hdisplay;
	 		dsc->pic_height = mode->vdisplay;
	 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);

And this is what it looks like on a bonded DSI CMD-mode display:
https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2553207
https://gitlab.freedesktop.org/-/project/2206/uploads/dc5c53d09ecb635fdc9f190fbc9b37ac/1000027079.jpg

That's a clear regression :)

- Marijn
