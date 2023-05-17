Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B47075AF
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0214B10E2DD;
	Wed, 17 May 2023 22:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D8310E2DD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 22:58:47 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 75436202ED;
 Thu, 18 May 2023 00:58:45 +0200 (CEST)
Date: Thu, 18 May 2023 00:58:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v11 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Message-ID: <dhkvnr3inohrkxpwlhia65zip6m5f766scxniluv42xzjibqae@vczzpgynsmos>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-1-30270e1eeac3@quicinc.com>
 <oqodgwsp4hybx5fzy7n72kl64t4bjrb5rvxbytledcjeh6a2cg@474be3fom6rm>
 <f50cf783-2cb2-44c1-7aa3-e009407fba74@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f50cf783-2cb2-44c1-7aa3-e009407fba74@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 14:32:42, Jessica Zhang wrote:
> 
> 
> On 5/17/2023 2:13 PM, Marijn Suijten wrote:
> > On 2023-05-17 11:51:10, Jessica Zhang wrote:
> >> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> >> these calculations are defined within the DSC spec.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > 
> > Was this r-b dropped because of changing the return types in v10->v11?
> 
> Hi Marijn,
> 
> Yea. I'm not sure what the protocol is for keeping/dropping r-b tags, so 
> dropped the r-b because I wasn't sure if the change counted as significant.

Yeah, seems to be standard practice on nontrivial changes but in this
case I left a review on a patch that already has my r-b, and you changed
exactly what I requested.  Probably fine either way.

- Marijn

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> >> index 0bb0c3afd740..528dfb5e25fc 100644
> >> --- a/include/drm/display/drm_dsc_helper.h
> >> +++ b/include/drm/display/drm_dsc_helper.h
> >> @@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
> >>   int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
> >>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> >>   
> >> +static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> >> +{
> >> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> >> +}
> >> +
> >> +static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
> >> +{
> >> +	return 2 << (dsc->bits_per_component - 8);
> >> +}
> >> +
> >>   #endif /* _DRM_DSC_HELPER_H_ */
> >>   
> >>
> >> -- 
> >> 2.40.1
> >>
