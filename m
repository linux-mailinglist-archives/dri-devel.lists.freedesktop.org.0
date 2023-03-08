Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE806B0871
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8377A10E5D8;
	Wed,  8 Mar 2023 13:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B8F10E147;
 Wed,  8 Mar 2023 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678281578; x=1709817578;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=D2Anq1p3blmLcbAnUL/3EMfPaTwxDXaBDMRthxKOOOc=;
 b=RGW4VTRHKgua4gCG57yjojMCcrDwU5+XFO/0ONGqGaIOpMtuVTfauhq3
 W0R1ix8I1NiaE0c2dmDiG7glpE6sTTC4TgYp/21zeMWOX2MgY7rP2oJ4X
 svK48RevqsX9drQpk46cPijFFlt3ajBiwBs6bImoPWyFC0t4dKrge4wP/
 aTvj6c2ONvlQL7czEBgtL2sPBgKWJB/xyFknbAIQC0hq0bDCSDeMKxa7i
 fAeWZVmlRTOW77GqVEA0kvbO01aCRvzy1sZ+VCEiXo4VWOr8Op/qpZL9+
 iSlPkOEaYplDgHQmsytZnpn+u7g9M79g8DCv74Hgy0p60v0ETV4vle0s6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363784446"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="363784446"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="741121381"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="741121381"
Received: from eharan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.177])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:19:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 06/10] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
In-Reply-To: <CAA8EJprgvhS0YavBi2QfMLnkr+KhRge4FhfQz09ani794uYDcQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
 <20230307134901.322560-7-dmitry.baryshkov@linaro.org>
 <874jqvczy1.fsf@intel.com>
 <CAA8EJprgvhS0YavBi2QfMLnkr+KhRge4FhfQz09ani794uYDcQ@mail.gmail.com>
Date: Wed, 08 Mar 2023 15:19:29 +0200
Message-ID: <87lek7bcta.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Mar 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, 8 Mar 2023 at 12:14, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Tue, 07 Mar 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> > The array of rc_parameters contains a mixture of parameters from DSC 1.1
>> > and DSC 1.2 standards. Split these tow configuration arrays in
>> > preparation to adding more configuration data.
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  drivers/gpu/drm/display/drm_dsc_helper.c  | 127 ++++++++++++++++++----
>> >  drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>> >  include/drm/display/drm_dsc_helper.h      |   7 +-
>> >  3 files changed, 119 insertions(+), 25 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>> > index acb93d4116e0..35b39f3109c4 100644
>> > --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>> > +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>> > @@ -324,11 +324,81 @@ struct rc_parameters_data {
>> >
>> >  #define DSC_BPP(bpp) ((bpp) << 4)
>> >
>> > +static const struct rc_parameters_data rc_parameters_pre_scr[] = {
>> > +     {
>> > +             .bpp = DSC_BPP(8), .bpc = 8,
>> > +             { 512, 12, 6144, 3, 12, 11, 11, {
>> > +                     { 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>> > +                     { 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> > +                     { 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
>> > +                     { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> > +                     }
>> > +             }
>> > +     },
>> > +     {
>> > +             .bpp = DSC_BPP(8), .bpc = 10,
>> > +             { 512, 12, 6144, 7, 16, 15, 15, {
>> > +                     /*
>> > +                      * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
>> > +                      * VESA DSC 1.1 Table E-5 sets it to 4.
>> > +                      */
>> > +                     { 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>> > +                     { 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> > +                     { 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> > +                     { 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> > +                     }
>> > +             }
>> > +     },
>> > +     {
>> > +             .bpp = DSC_BPP(8), .bpc = 12,
>> > +             { 512, 12, 6144, 11, 20, 19, 19, {
>> > +                     { 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>> > +                     { 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> > +                     { 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> > +                     { 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> > +                     { 21, 23, -12 }
>> > +                     }
>> > +             }
>> > +     },
>> > +     {
>> > +             .bpp = DSC_BPP(12), .bpc = 8,
>> > +             { 341, 15, 2048, 3, 12, 11, 11, {
>> > +                     { 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>> > +                     { 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> > +                     { 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
>> > +                     { 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> > +                     }
>> > +             }
>> > +     },
>> > +     {
>> > +             .bpp = DSC_BPP(12), .bpc = 10,
>> > +             { 341, 15, 2048, 7, 16, 15, 15, {
>> > +                     { 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>> > +                     { 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> > +                     { 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> > +                     { 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> > +                     }
>> > +             }
>> > +     },
>> > +     {
>> > +             .bpp = DSC_BPP(12), .bpc = 12,
>> > +             { 341, 15, 2048, 11, 20, 19, 19, {
>> > +                     { 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>> > +                     { 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> > +                     { 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> > +                     { 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> > +                     { 21, 23, -12 }
>> > +                     }
>> > +             }
>> > +     },
>> > +     { /* sentinel */ }
>> > +};
>> > +
>> >  /*
>> >   * Selected Rate Control Related Parameter Recommended Values
>> >   * from DSC_v1.11 spec & C Model release: DSC_model_20161212
>> >   */
>>
>> The comment is no longer accurate, is it?
>
> Ugh, yes. it is no longer DSC 1.1. I cross-checked, the rc*cfg files
> are the same between 20161212 and 20210623
>
>>
>> There are various ways to determine the parameters to use. There's even
>> an application note "VESA DSC v1.2a Guidance on Deriving DSC Rate
>> Control Parameters" that lists the options. They are all valid and
>> should "provide visually lossless quality".
>>
>> Would it be simplest to always use the C model parameters in the tables
>> here, referencing the zip file name with date above each table? That
>> could at least be consistent, and drivers could override parameters
>> using other methods if they desire. And it would be easiest to review.
>
> Do you mean the calculated RC parameters?

No, I simply mean using the values from the .cfg files, and clearly
stating that in the source. Your reply below implies this is exactly
what you're doing. What we currently have in intel_vdsc.c isn't clear by
any means.

Moreover, I started checking some of the values against the *specs* and
those actually differ from the .cfg files. I just want to get rid of the
ambiguity.

> As I mentioned in another
> email, it is at least worth investigating. I haven't looked into that,
> as my primary goal (driven by the forthcoming drm/msm needs) were the
> .cfg tables. I targeted cleaning up the simplest path to reduce
> duplication (see [1]). Anyway, with the proposed patches we have the
> API, which tells nothing about the way it fills out the RC tables.
> They can be based on top of the cfg files (method 2) or calculated
> (methods 3, 4).
>
> [1] https://patchwork.freedesktop.org/patch/524051/?series=114355&rev=1
>
>>
>> I'm having a hard time finding time to review all this in a timely
>> fashion. Would be good to try to get other folks to review the rest,
>> it's really not very i915 specific anyway. In the mean time I think
>> patches 1-5 are okay to merge via drm-misc.
>
> For reference, the tables here are a direct conversion of the rc*cfg
> files found in the DSC model. If you wish, I can post the program that
> I used to convert these files into C arrays. Will that help the
> review?

Probably; it's a bit annoying to cross check as the values aren't in the
same order.

BR,
Jani.


>
>>
>> BR,
>> Jani.
>>
>> > -static const struct rc_parameters_data rc_parameters[] = {
>> > +static const struct rc_parameters_data rc_parameters_1_2_444[] = {
>> >       {
>> >               .bpp = DSC_BPP(6), .bpc = 8,
>> >               { 768, 15, 6144, 3, 13, 11, 11, {
>> > @@ -388,22 +458,18 @@ static const struct rc_parameters_data rc_parameters[] = {
>> >               { 512, 12, 6144, 3, 12, 11, 11, {
>> >                       { 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>> >                       { 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> > -                     { 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
>> > -                     { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> > +                     { 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
>> > +                     { 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
>> >                       }
>> >               }
>> >       },
>> >       {
>> >               .bpp = DSC_BPP(8), .bpc = 10,
>> >               { 512, 12, 6144, 7, 16, 15, 15, {
>> > -                     /*
>> > -                      * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
>> > -                      * VESA DSC 1.1 Table E-5 sets it to 4.
>> > -                      */
>> > -                     { 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>> > +                     { 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>> >                       { 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> > -                     { 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> > -                     { 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> > +                     { 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
>> > +                     { 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
>> >                       }
>> >               }
>> >       },
>> > @@ -412,9 +478,9 @@ static const struct rc_parameters_data rc_parameters[] = {
>> >               { 512, 12, 6144, 11, 20, 19, 19, {
>> >                       { 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>> >                       { 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> > -                     { 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> > -                     { 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> > -                     { 21, 23, -12 }
>> > +                     { 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
>> > +                     { 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
>> > +                     { 20, 21, -12 }
>> >                       }
>> >               }
>> >       },
>> > @@ -498,8 +564,8 @@ static const struct rc_parameters_data rc_parameters[] = {
>> >               { 341, 15, 2048, 3, 12, 11, 11, {
>> >                       { 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>> >                       { 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> > -                     { 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
>> > -                     { 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> > +                     { 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
>> > +                     { 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
>> >                       }
>> >               }
>> >       },
>> > @@ -508,8 +574,8 @@ static const struct rc_parameters_data rc_parameters[] = {
>> >               { 341, 15, 2048, 7, 16, 15, 15, {
>> >                       { 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>> >                       { 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> > -                     { 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> > -                     { 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> > +                     { 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
>> > +                     { 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
>> >                       }
>> >               }
>> >       },
>> > @@ -518,9 +584,9 @@ static const struct rc_parameters_data rc_parameters[] = {
>> >               { 341, 15, 2048, 11, 20, 19, 19, {
>> >                       { 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>> >                       { 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> > -                     { 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> > -                     { 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> > -                     { 21, 23, -12 }
>> > +                     { 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
>> > +                     { 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
>> > +                     { 18, 19, -12 }
>> >                       }
>> >               }
>> >       },
>> > @@ -602,7 +668,8 @@ static const struct rc_parameters_data rc_parameters[] = {
>> >       { /* sentinel */ }
>> >  };
>> >
>> > -static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
>> > +static const struct rc_parameters *get_rc_params(const struct rc_parameters_data *rc_parameters,
>> > +                                              u16 dsc_bpp,
>> >                                                u8 bits_per_component)
>> >  {
>> >       int i;
>> > @@ -622,11 +689,13 @@ static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
>> >   * function.
>> >   *
>> >   * @vdsc_cfg: DSC Configuration data partially filled by driver
>> > + * @kind: operating mode and standard to follow
>> >   *
>> >   * Return: 0 or -error code in case of an error
>> >   */
>> > -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
>> > +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind)
>> >  {
>> > +     const struct rc_parameters_data *data;
>> >       const struct rc_parameters *rc_params;
>> >       int i;
>> >
>> > @@ -634,7 +703,19 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
>> >                        !vdsc_cfg->bits_per_component))
>> >               return -EINVAL;
>> >
>> > -     rc_params = get_rc_params(vdsc_cfg->bits_per_pixel,
>> > +     switch (kind) {
>> > +     case DRM_DSC_1_2_444:
>> > +             data = rc_parameters_1_2_444;
>> > +             break;
>> > +     case DRM_DSC_1_1_PRE_SCR:
>> > +             data = rc_parameters_pre_scr;
>> > +             break;
>> > +     default:
>> > +             return -EINVAL;
>> > +     }
>> > +
>> > +     rc_params = get_rc_params(data,
>> > +                               vdsc_cfg->bits_per_pixel,
>> >                                 vdsc_cfg->bits_per_component);
>> >       if (!rc_params)
>> >               return -EINVAL;
>> > diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> > index 20a4c2f343fe..a4d1d2ba71bb 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> > @@ -157,7 +157,15 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>> >       if (DISPLAY_VER(dev_priv) >= 13) {
>> >               calculate_rc_params(vdsc_cfg);
>> >       } else {
>> > -             ret = drm_dsc_setup_rc_params(vdsc_cfg);
>> > +             if ((compressed_bpp == 8 ||
>> > +                  compressed_bpp == 12) &&
>> > +                 (vdsc_cfg->bits_per_component == 8 ||
>> > +                  vdsc_cfg->bits_per_component == 10 ||
>> > +                  vdsc_cfg->bits_per_component == 12))
>> > +                     ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_1_PRE_SCR);
>> > +             else
>> > +                     ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_2_444);
>> > +
>> >               if (ret)
>> >                       return ret;
>> >
>> > diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> > index 1681791f65a5..c634bb2935d3 100644
>> > --- a/include/drm/display/drm_dsc_helper.h
>> > +++ b/include/drm/display/drm_dsc_helper.h
>> > @@ -10,12 +10,17 @@
>> >
>> >  #include <drm/display/drm_dsc.h>
>> >
>> > +enum drm_dsc_params_kind {
>> > +     DRM_DSC_1_2_444,
>> > +     DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
>> > +};
>> > +
>> >  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>> >  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>> >  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>> >                             const struct drm_dsc_config *dsc_cfg);
>> >  void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>> > -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
>> > +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>> >  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>> >
>> >  #endif /* _DRM_DSC_HELPER_H_ */
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
