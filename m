Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DE5FD70D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4317810E6AC;
	Thu, 13 Oct 2022 09:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0557010E6AC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:27:26 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 983CB3EEEF;
 Thu, 13 Oct 2022 11:27:22 +0200 (CEST)
Date: Thu, 13 Oct 2022 11:27:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 07/10] drm/msm/dsi: Disallow 8 BPC DSC configuration
 for alternative BPC values
Message-ID: <20221013092719.323h6ts6o5n4blag@SoMainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185150.461323-1-marijn.suijten@somainline.org>
 <eda0e4c0-2b5a-f2e9-0c53-a417fe85f12f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda0e4c0-2b5a-f2e9-0c53-a417fe85f12f@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-12 16:08:07, Abhinav Kumar wrote:
> 
> 
> On 10/9/2022 11:51 AM, Marijn Suijten wrote:
> > According to the `/* bpc 8 */` comment below only values for a
> > bits_per_component of 8 are currently hardcoded in place.  This is
> > further confirmed by downstream sources [1] containing different
> > constants for other BPC values (and different initial_offset too,
> > with an extra dependency on bits_per_pixel).  Prevent future mishaps by
> > explicitly disallowing any other bits_per_component value until the
> > right parameters are put in place and tested.
> > 
> > [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde_dsc_helper.c#L110-139
> > 
> 
> Seems like a valid kbot error.
> 
> https://patchwork.freedesktop.org/patch/506359/#comment_912830

It is correct, and I suggested in [1] to either reorder this patch 7/10
after 8/10, or pull back the msm_host pointer argument into this patch.

[1]: https://lore.kernel.org/linux-arm-msm/20221011075119.tvn5j5jm6aqnhqv2@SoMainline.org/

- Marijn

> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 68c39debc22f..7e6b7e506ae8 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1774,6 +1774,11 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> >   {
> >   	int i;
> >   
> > +	if (dsc->bits_per_component != 8) {
> > +		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> >   	dsc->rc_model_size = 8192;
> >   	dsc->first_line_bpg_offset = 12;
> >   	dsc->rc_edge_factor = 6;
