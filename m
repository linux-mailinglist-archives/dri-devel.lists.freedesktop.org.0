Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299D5F4BA8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B4F10E031;
	Tue,  4 Oct 2022 22:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C022310E031;
 Tue,  4 Oct 2022 22:11:37 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5CD8A20088;
 Wed,  5 Oct 2022 00:11:35 +0200 (CEST)
Date: Wed, 5 Oct 2022 00:11:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 4/5] drm/msm/dpu1: Account for DSC's bits_per_pixel
 having 4 fractional bits
Message-ID: <20221004221134.roino4u2waawgh6u@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-5-marijn.suijten@somainline.org>
 <7f7a5d78-e50f-b6af-bb3e-bbfbc7fa5f75@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f7a5d78-e50f-b6af-bb3e-bbfbc7fa5f75@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Alex Deucher <alexander.deucher@amd.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 David Airlie <airlied@linux.ie>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Thomas Zimmermann <tzimmermann@suse.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, phone-devel@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 10:03:07, Abhinav Kumar wrote:
> 
> 
> On 10/1/2022 12:08 PM, Marijn Suijten wrote:
> > According to the comment this DPU register contains the bits per pixel
> > as a 6.4 fractional value, conveniently matching the contents of
> > bits_per_pixel in struct drm_dsc_config which also uses 4 fractional
> > bits.  However, the downstream source this implementation was
> > copy-pasted from has its bpp field stored _without_ fractional part.
> > 
> > This makes the entire convoluted math obsolete as it is impossible to
> > pull those 4 fractional bits out of thin air, by somehow trying to reuse
> > the lowest 2 bits of a non-fractional bpp (lsb = bpp % 4??).
> > 
> > The rest of the code merely attempts to keep the integer part a multiple
> > of 4, which is rendered useless thanks to data |= dsc->bits_per_pixel <<
> > 12; already filling up those bits anyway (but not on downstream).
> > 
> > Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Many of this bugs are because the downstream code from which this 
> implementation was derived wasnt the latest perhaps?

Perhaps, this code is "identical" to what I'm looking at in some
downstream 4.14 / 4.19, where the upstream struct for DSC either wasn't
there or wasn't used.  We have to find and address these bugs one by one
to make our panels work, and this series gets one platform (sdm845) down
but has more work pending for others (sm8250 has my current focus).

Or are you suggesting to "redo" the DSC integration work based on a
(much) newer display techpack (SDE driver)?

> Earlier, downstream had its own DSC struct maybe leading to this 
> redundant math but now we have migrated over to use the upstream struct 
> drm_dsc_config.

Found the 3-year-old `disp: msm: use upstream dsc config data` commit
that makes this change.  It carries a similar comment:

    /* integer bpp support only */

The superfluous math was howerver removed earlier, in:

    disp: msm: fix dsc parameters related to 10 bpc 10 bpp

- Marijn

> That being said, this patch LGTM
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
