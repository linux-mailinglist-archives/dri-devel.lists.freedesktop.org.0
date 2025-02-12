Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188BA32367
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9445D10E840;
	Wed, 12 Feb 2025 10:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB30D10E847;
 Wed, 12 Feb 2025 10:21:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8A5693ED76;
 Wed, 12 Feb 2025 11:21:31 +0100 (CET)
Date: Wed, 12 Feb 2025 11:21:30 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 jonathan@marek.ca, 
 jun.nie@linaro.org, fekz115@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <doekhvdynp4mxqarf4lripv6cf3x6lojuaslfroi6r3s6d5sm4@n2nkhsghbmwe>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>
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

On 2025-02-11 21:06:19, Danila Tikhonov wrote:
> On 2/9/25 01:09, Marijn Suijten wrote:
> > On 2025-02-03 21:14:26, Danila Tikhonov wrote:
> >> From: Eugene Lepshy <fekz115@gmail.com>
> >>
> >> DRM DSC helper has parameters for various bpc values ​​other than 8:
> > Weird zero-width \u200b spaces here between "values" and "other", please delete
> > those.
> Thanks, I will fix it in the next version.
> >> (8/10/12/14/16).
> >>
> >> Remove this guard.
> >>
> >> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> >> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > Should this patch elaborate that those "DRM DSC helper" don't have any
> > additional guarding for the values you mention either, i.e. passing 9 or 11 or
> >> 16 don't seem to be checked anywhere else either?
> There are no other bpc checks, you are right. But to be honest I don't
> really see any sense in this. Anyway, if you still want us to leave the
> current guard and just extend it with new values ​​(for example via
> switch case) - let me know.

Yes please: extend the guard.  drm_dsc_setup_rc_params() supports 8bbp with bpc
of 8, 10, 12, 14 or 16, which are not all supported by DPU (yet?).  Any other
value should be considered an error.

> > And your title might have space to spell out "Bits Per Component" entirely.
> I'll fix that too.
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
> >>   1 file changed, 1 insertion(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 007311c21fda..d182af7bbb81 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >>   		return -EINVAL;
> >>   	}
> >>   
> >> -	if (dsc->bits_per_component != 8) {
> >> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> >> -		return -EOPNOTSUPP;
> >> -	}
> >> -
> >>   	dsc->simple_422 = 0;
> >>   	dsc->convert_rgb = 1;
> >>   	dsc->vbr_enable = 0;
> > This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> > dpu_hw_dsc_config(), which has:
> >
> > 	data |= (dsc->line_buf_depth << 3);
> > 	data |= (dsc->simple_422 << 2);
> > 	data |= (dsc->convert_rgb << 1);
> > 	data |= dsc->bits_per_component;
> >
> > The original value of `8` would overlap with the lowest bit of line_buf_depth
> > (4th bit in `data`).  Now, the 2nd bit which will take the value from
> > convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> > your new bpc value of 10.
> >
> > Can you double-check that this code in DPU1 is actually valid?  I assume you
> > have tested this panel at least and it is working (worthy mention in the cover
> > letter?), this just seems like yet another mistake in the original bindings
> > (though the register always had a matching value with downstream on 8 BPC panels
> > for me).
> 
> Of course I have tested the panel and it works, I just thought it would
> be obvious.

It's worth mentioning, also if the timings / framerate are correct or if there's
any hiccups (common on CMD panels).

> We also have tested sm7150-xiaomi-courbet, sm8450-xiaomi-cupid
> and sm8475-nothing-pong, which already have bpp = bpc = 10 panels and
> with some hack it also work without any changes to the DRM.

It's strange because, as mentioned in a followup patch all the bits in bpc=10
overlap with existing bits in the data field except the lowest bit of data
wasn't getting set even though it should according to downstream sources.  Can
you test [1] and confirm whether "correctly" setting the lowest bit in the data
field doesn't break anything?

[1]: https://lore.kernel.org/linux-arm-msm/20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org/

> >> @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >>   	drm_dsc_set_const_params(dsc);
> >>   	drm_dsc_set_rc_buf_thresh(dsc);
> >>   
> >> -	/* handle only bpp = bpc = 8, pre-SCR panels */
> >> +	/* handle only pre-SCR panels */
> >>   	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> > Good catch - this comment sounds like it's documenting a limitation of
> > this helper function, but the function does not have such limitations...
> > rc_parameters_pre_scr has values for all these combinations.
> Maybe we should remove this comment entirely?

Maybe it should be reworded instead.  It's clear that the function will handle
pre-SCR panels, that's why this "type" enum variant is passed.  Perhaps it
should instead explain that DPU (in its current implementation) only supports
pre-SCR panels?

- Marijn

> 
> Regards,
> Danila
> > - Marijn
> >
> >>   	if (ret) {
> >>   		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> >> -- 
> >> 2.48.1
> >>
