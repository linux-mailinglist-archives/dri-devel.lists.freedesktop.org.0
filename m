Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C143BAAA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78236E857;
	Tue, 26 Oct 2021 19:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E16E488
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:24:31 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k13so558585ljj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SyrHeHgeH6T/SflPJDYfBTTTZwEiMMUitiv/LozCvo4=;
 b=guCxyeCQt75Hgtdr7S7c6CEMtmPWXCI6A4N6PMddjdMKQE1KmhJ24mWLIJdNnTNj3U
 d83B8CLkAPIOyCH015kKsSZ4Ond8R7TaoK74RmhpPUOSKIhQ++ghR50RheJnOK+Tvcdc
 qb2zlCmWJovcluVsKr/SriP9n/OH7zhjDz1M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SyrHeHgeH6T/SflPJDYfBTTTZwEiMMUitiv/LozCvo4=;
 b=CzLKuEf1tBshYoogu9rgrzbiiLUrUPxJyiXCncMvUXgh2mAu7/PI8zKIcIAmPAcdY4
 w58fZuL067et/smxBvsRHu6mrNzXug+xGuroJmE0JEEd83W+6sccjJ7/spwonJmISL0D
 wKgrNv2xZx1lbWA5ZM0o/0qmoswNu9nb6EW4wRjIrc1SqMY5eyvRG17IwJfgxGQqrokF
 wXfBt80YhML/WPjmhpLW86LucMaqjxIVTq+oBmBefOsYVKwok/uk7Tc1UvzVPtB0pyJA
 n5XiVIAgjTtgHR8o9MY7e9WASUmOrGI8/OKy4D+SNdGU2+gL6+a4l7Z3R2ai7JFhwiKl
 v7Aw==
X-Gm-Message-State: AOAM5332GMSZxGi/3Vn36XJiOsxnSQATemMAHQh1zyY68mlihjJzf/XI
 9zNvB+rptHiheJLTgdYUwQdhTC0CBuxFaiKBUXiIYQ==
X-Google-Smtp-Source: ABdhPJwJGvpOXoH4ZKF19kGyuQrOanNYlAQ2uJhsOWFUZaHw8hG4k6Bt/2d+f1mbfHPMimVuksUaaLOuSqD8gQlAP68=
X-Received: by 2002:a05:651c:1582:: with SMTP id
 h2mr18396093ljq.89.1635276270060; 
 Tue, 26 Oct 2021 12:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20211013181228.1578201-1-markyacoub@chromium.org>
 <cb482b45-d98c-1860-6cf2-313b831e6066@molgen.mpg.de>
In-Reply-To: <cb482b45-d98c-1860-6cf2-313b831e6066@molgen.mpg.de>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 26 Oct 2021 15:24:19 -0400
Message-ID: <CAJUqKUoLYogBbUKoVVDMQErdx3tFEpLBtKDfgYtHSPOVDnEs0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Add Gamma and Degamma LUT sizes props to
 drm_crtc to validate.
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: seanpaul@chromium.org, harry.wentland@amd.com, 
 Mark Yacoub <markyacoub@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Oct 26, 2021 at 8:02 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Mark,
>
>
> Thank you for your patch.
>
> On 13.10.21 20:12, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > 1. drm_atomic_helper_check doesn't check for the LUT sizes of either Gamma
> > or Degamma props in the new CRTC state, allowing any invalid size to
> > be passed on.
> > 2. Each driver has its own LUT size, which could also be different for
> > legacy users.
>
> How can the problem be reproduced?
It was caught using igt@kms_color@pipe-A-invalid-gamma-lut-sizes.
it validates that drivers will only LUTs of their expected size not
any random (smaller or larger) number.
>
> > [How]
> > 1. Create |degamma_lut_size| and |gamma_lut_size| to save the LUT sizes
> > assigned by the driver when it's initializing its color and CTM
> > management.
> > 2. Create drm_atomic_helper_check_crtc which is called by
> > drm_atomic_helper_check to check the LUT sizes saved in drm_crtc that
> > they match the sizes in the new CRTC state.
> > 3. Rename older lut checks that test for the color channels to indicate
> > it's a channel check. It's not included in drm_atomic_helper_check_crtc
> > as it's hardware specific and is to be called by the driver.
> > 4. As the LUT size check now happens in drm_atomic_helper_check, remove
> > the lut check in intel_color.c
> >
> > Fixes: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
>
> If I am not mistaken, the Fixes tag is used for commits I believe. Maybe
> use Resolves or something similar?
fixed!
>
> > Tested on Zork(amdgpu) and Jacuzzi(mediatek), volteer(TGL)
>
> Please add a space before the (.
>
> How did you test this?
smoke test on both MTK and TGL devices along with running
igt@kms_color on both devices.
>
> > v1:
> > 1. Fix typos
> > 2. Remove the LUT size check from intel driver
> > 3. Rename old LUT check to indicate it's a channel change
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >   drivers/gpu/drm/drm_atomic_helper.c        | 60 ++++++++++++++++++++++
> >   drivers/gpu/drm/drm_color_mgmt.c           | 14 ++---
> >   drivers/gpu/drm/i915/display/intel_color.c | 14 ++---
> >   include/drm/drm_atomic_helper.h            |  1 +
> >   include/drm/drm_color_mgmt.h               |  7 +--
> >   include/drm/drm_crtc.h                     | 11 ++++
> >   6 files changed, 89 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index bc3487964fb5e..5feb2ad0209c3 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -929,6 +929,62 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >   }
> >   EXPORT_SYMBOL(drm_atomic_helper_check_planes);
> >
> > +/**
> > + * drm_atomic_helper_check_crtcs - validate state object for CRTC changes
> > + * @state: the driver state object
> > + *
> > + * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
> > + * state holds them.
> > + *
> > + * RETURNS:
> > + * Zero for success or -errno
> > + */
> > +int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state)
> > +{
> > +     struct drm_crtc *crtc;
> > +     struct drm_crtc_state *new_crtc_state;
> > +     int i;
> > +
> > +     for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> > +             if (new_crtc_state->color_mgmt_changed &&
> > +                 new_crtc_state->gamma_lut) {
> > +                     uint64_t supported_lut_size = crtc->gamma_lut_size;
> > +                     uint32_t supported_legacy_lut_size = crtc->gamma_size;
> > +                     uint32_t new_state_lut_size =
> > +                             drm_color_lut_size(new_crtc_state->gamma_lut);
> > +
> > +                     if (new_state_lut_size != supported_lut_size &&
> > +                         new_state_lut_size != supported_legacy_lut_size) {
> > +                             drm_dbg_state(
> > +                                     state->dev,
> > +                                     "Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> > +                                     supported_lut_size,
> > +                                     supported_legacy_lut_size,
> > +                                     new_state_lut_size);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +
> > +             if (new_crtc_state->color_mgmt_changed &&
> > +                 new_crtc_state->degamma_lut) {
> > +                     uint32_t new_state_lut_size =
> > +                             drm_color_lut_size(new_crtc_state->degamma_lut);
> > +                     uint64_t supported_lut_size = crtc->degamma_lut_size;
> > +
> > +                     if (new_state_lut_size != supported_lut_size) {
> > +                             drm_dbg_state(
> > +                                     state->dev,
> > +                                     "Invalid Degamma LUT size. Should be %u but got %u.\n",
> > +                                     supported_lut_size, new_state_lut_size);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_check_crtcs);
> > +
> >   /**
> >    * drm_atomic_helper_check - validate state object
> >    * @dev: DRM device
> > @@ -974,6 +1030,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = drm_atomic_helper_check_crtcs(state);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (state->legacy_cursor_update)
> >               state->async_update = !drm_atomic_helper_async_check(dev, state);
> >
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index bb14f488c8f6c..e5b820ce823bf 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >       struct drm_mode_config *config = &dev->mode_config;
> >
> >       if (degamma_lut_size) {
> > +             crtc->degamma_lut_size = degamma_lut_size;
> >               drm_object_attach_property(&crtc->base,
> >                                          config->degamma_lut_property, 0);
> >               drm_object_attach_property(&crtc->base,
> > @@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >                                          config->ctm_property, 0);
> >
> >       if (gamma_lut_size) {
> > +             crtc->gamma_lut_size = gamma_lut_size;
> >               drm_object_attach_property(&crtc->base,
> >                                          config->gamma_lut_property, 0);
> >               drm_object_attach_property(&crtc->base,
> > @@ -585,17 +587,17 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
> >   EXPORT_SYMBOL(drm_plane_create_color_properties);
> >
> >   /**
> > - * drm_color_lut_check - check validity of lookup table
> > + * drm_color_lut_channels_check - check validity of the channels in the lookup table
> >    * @lut: property blob containing LUT to check
> >    * @tests: bitmask of tests to run
> >    *
> > - * Helper to check whether a userspace-provided lookup table is valid and
> > - * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
> > - * the tests in &drm_color_lut_tests should be performed.
> > + * Helper to check whether each color channel of userspace-provided lookup table is valid and
> > + * satisfies hardware requirements. Drivers pass a bitmask indicating which of in
> > + * &drm_color_lut_channels_tests should be performed.
> >    *
> >    * Returns 0 on success, -EINVAL on failure.
> >    */
> > -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
> > +int drm_color_lut_channels_check(const struct drm_property_blob *lut, u32 tests)
> >   {
> >       const struct drm_color_lut *entry;
> >       int i;
> > @@ -625,4 +627,4 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
> >
> >       return 0;
> >   }
> > -EXPORT_SYMBOL(drm_color_lut_check);
> > +EXPORT_SYMBOL(drm_color_lut_channels_check);
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> > index dab892d2251ba..a308fe52746ac 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -1285,7 +1285,7 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
> >       const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
> >       const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
> >       int gamma_length, degamma_length;
> > -     u32 gamma_tests, degamma_tests;
> > +     u32 gamma_channels_tests, degamma_channels_tests;
> >
> >       /* Always allow legacy gamma LUT with no further checking. */
> >       if (crtc_state_is_legacy_gamma(crtc_state))
> > @@ -1300,15 +1300,11 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
> >
> >       degamma_length = INTEL_INFO(dev_priv)->color.degamma_lut_size;
> >       gamma_length = INTEL_INFO(dev_priv)->color.gamma_lut_size;
> > -     degamma_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> > -     gamma_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
> > +     degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> > +     gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
> >
> > -     if (check_lut_size(degamma_lut, degamma_length) ||
> > -         check_lut_size(gamma_lut, gamma_length))
> > -             return -EINVAL;
> > -
> > -     if (drm_color_lut_check(degamma_lut, degamma_tests) ||
> > -         drm_color_lut_check(gamma_lut, gamma_tests))
> > +     if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
> > +         drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
> >               return -EINVAL;
> >
> >       return 0;
> > diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> > index 4045e2507e11c..a22d32a7a8719 100644
> > --- a/include/drm/drm_atomic_helper.h
> > +++ b/include/drm/drm_atomic_helper.h
> > @@ -38,6 +38,7 @@ struct drm_atomic_state;
> >   struct drm_private_obj;
> >   struct drm_private_state;
> >
> > +int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state);
> >   int drm_atomic_helper_check_modeset(struct drm_device *dev,
> >                               struct drm_atomic_state *state);
> >   int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> > diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> > index 81c298488b0c8..cb1bf361ad3e3 100644
> > --- a/include/drm/drm_color_mgmt.h
> > +++ b/include/drm/drm_color_mgmt.h
> > @@ -94,12 +94,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
> >                                     enum drm_color_range default_range);
> >
> >   /**
> > - * enum drm_color_lut_tests - hw-specific LUT tests to perform
> > + * enum drm_color_lut_channels_tests - hw-specific LUT tests to perform
> >    *
> >    * The drm_color_lut_check() function takes a bitmask of the values here to
> >    * determine which tests to apply to a userspace-provided LUT.
> >    */
> > -enum drm_color_lut_tests {
> > +enum drm_color_lut_channels_tests {
> >       /**
> >        * @DRM_COLOR_LUT_EQUAL_CHANNELS:
> >        *
> > @@ -119,5 +119,6 @@ enum drm_color_lut_tests {
> >       DRM_COLOR_LUT_NON_DECREASING = BIT(1),
> >   };
> >
> > -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
> > +int drm_color_lut_channels_check(const struct drm_property_blob *lut,
> > +                              u32 tests);
> >   #endif
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 2deb15d7e1610..cabd3ef1a6e32 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -1072,6 +1072,17 @@ struct drm_crtc {
> >       /** @funcs: CRTC control functions */
> >       const struct drm_crtc_funcs *funcs;
> >
> > +     /**
> > +      * @degamma_lut_size: Size of degamma LUT.
> > +      */
> > +     uint32_t degamma_lut_size;
> > +
> > +     /**
> > +      * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
> > +      * X, which doesn't support large lut sizes.
> > +      */
> > +     uint32_t gamma_lut_size;
> > +
> >       /**
> >        * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> >        * by calling drm_mode_crtc_set_gamma_size().
> >
>
> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul
