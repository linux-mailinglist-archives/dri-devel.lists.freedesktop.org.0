Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552D5F1F54
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 22:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90A010E682;
	Sat,  1 Oct 2022 20:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07C010E682
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 20:23:16 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A6E70200A7;
 Sat,  1 Oct 2022 22:23:14 +0200 (CEST)
Date: Sat, 1 Oct 2022 22:23:13 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Message-ID: <20221001202313.fkdsv5ul4v6akhc3@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221001190807.358691-6-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-01 21:08:07, Marijn Suijten wrote:
> msm's dsi_host specifies negative BPG offsets which fill the full 8 bits
> of a char thanks to two's complement: this however results in those bits
> bleeding into the next parameter when the field is only expected to
> contain 6-bit wide values.
> As a consequence random slices appear corrupted on-screen (tested on a
> Sony Tama Akatsuki device with sdm845).
> 
> Use AND operators to limit all values that constitute the RC Range
> parameter fields to their expected size.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index c869c6e51e2b..2e7ef242685d 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -243,11 +243,11 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>  	 */
>  	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>  		pps_payload->rc_range_parameters[i] =
> -			cpu_to_be16((dsc_cfg->rc_range_params[i].range_min_qp <<
> +			cpu_to_be16(((dsc_cfg->rc_range_params[i].range_min_qp & 0x1f) <<
>  				     DSC_PPS_RC_RANGE_MINQP_SHIFT) |
> -				    (dsc_cfg->rc_range_params[i].range_max_qp <<
> +				    ((dsc_cfg->rc_range_params[i].range_max_qp & 0x1f) <<
>  				     DSC_PPS_RC_RANGE_MAXQP_SHIFT) |
> -				    (dsc_cfg->rc_range_params[i].range_bpg_offset));
> +				    (dsc_cfg->rc_range_params[i].range_bpg_offset & 0x3f));

Pre-empting the reviews: I was contemplating whether to use FIELD_PREP
here, given that it's not yet used anywhere else in this file.  For that
I'd remove the existing _SHIFT definitions and replace them with:

	#define DSC_PPS_RC_RANGE_MINQP_MASK		GENMASK(15, 11)
	#define DSC_PPS_RC_RANGE_MAXQP_MASK		GENMASK(10, 6)
	#define DSC_PPS_RC_RANGE_BPG_OFFSET_MASK	GENMASK(5, 0)

And turn this section of code into:

	cpu_to_be16(FIELD_PREP(DSC_PPS_RC_RANGE_MINQP_MASK,
			       dsc_cfg->rc_range_params[i].range_min_qp) |
		    FIELD_PREP(DSC_PPS_RC_RANGE_MAXQP_MASK,
			       dsc_cfg->rc_range_params[i].range_max_qp) |
		    FIELD_PREP(DSC_PPS_RC_RANGE_BPG_OFFSET_MASK,
			       dsc_cfg->rc_range_params[i].range_bpg_offset));

Is that okay/recommended?

- Marijn

>  	}
>  
>  	/* PPS 88 */
> -- 
> 2.37.3
> 
