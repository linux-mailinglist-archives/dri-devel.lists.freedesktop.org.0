Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1C445B90
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 22:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494989D67;
	Thu,  4 Nov 2021 21:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB0A7388A;
 Thu,  4 Nov 2021 21:15:55 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id e144so8530351iof.3;
 Thu, 04 Nov 2021 14:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rir9YdN+/psplWSTAq2adWSxInvkdj3Vqnr1G/woK4k=;
 b=cV5d7GKwMiSZ1Ilcuyl4LvRwP30Jt0xzo/lVYWGLYTNS/yR9IAb6WFqXJJEXAP5TgS
 IejiCbJq5b/R8EMeUOwV/aqLvKsZRh3YhqhWsQEFW0DQbhR9w2qxcGPPU4yLfjnZ4fH/
 HsObGBfBfCc3wGv/AOE0H1yv6SRcmd2ZoMeSnUHGgUGixgp/k1wP5m1O4gLPKDsFH0M2
 BhhZ33Nx+VDDFtCc3NN9Pu+s+RBQdolbEsVayUi64pa47UyjbdFkzAgPn35EUReBhZiY
 ChQxEvrtDJB5+TUmla95R1XHj5O7YntwAWFCdNsXXyRZOADZ8O+R9awt2fu4GclwQa62
 nXEg==
X-Gm-Message-State: AOAM531TrVwvtGqgHRdJmoVBSDlxuK9QYKGD0T47rQ+gEZsoCglU5cIK
 xtBMXAgqcNcoxqBg9QSJq31GonT3cMJXTNedFSk=
X-Google-Smtp-Source: ABdhPJzyKH3g3jJOSoda9M2VRJGM2M2jDs7vyspnCIwQ29KrnbEUj6uC5/Ax/jjM4skmQkr2841efbxNq6yddXDO3Bg=
X-Received: by 2002:a02:a311:: with SMTP id q17mr5872111jai.15.1636060554693; 
 Thu, 04 Nov 2021 14:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211104200255.63499-1-markyacoub@chromium.org>
 <20211104200255.63499-2-markyacoub@chromium.org>
In-Reply-To: <20211104200255.63499-2-markyacoub@chromium.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 4 Nov 2021 17:15:43 -0400
Message-ID: <CAKb7UvhEH4bwhGr=82zBT5dnHRFsK+pFafHWoS+j+PAE3a9x4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm: Add Gamma and Degamma LUT sizes props to
 drm_crtc to validate.
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: pmenzel@molgen.mpg.de, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 4, 2021 at 4:03 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> [Why]
> 1. drm_atomic_helper_check doesn't check for the LUT sizes of either Gamma
> or Degamma props in the new CRTC state, allowing any invalid size to
> be passed on.
> 2. Each driver has its own LUT size, which could also be different for
> legacy users.
>
> [How]
> 1. Create |degamma_lut_size| and |gamma_lut_size| to save the LUT sizes
> assigned by the driver when it's initializing its color and CTM
> management.
> 2. Create drm_atomic_helper_check_crtc which is called by
> drm_atomic_helper_check to check the LUT sizes saved in drm_crtc that
> they match the sizes in the new CRTC state.
> 3. As the LUT size check now happens in drm_atomic_helper_check, remove
> the lut check in intel_color.c
>
> Resolves: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
> Tested on Zork (amdgpu) and Jacuzzi (mediatek), volteer (TGL)
>
> v3:
> 1. Check for lut pointer inside drm_check_lut_size.
>
> v2:
> 1. Remove the rename to a parent commit.
> 2. Create a drm drm_check_lut_size instead of intel only function.
>
> v1:
> 1. Fix typos
> 2. Remove the LUT size check from intel driver
> 3. Rename old LUT check to indicate it's a channel change
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c        | 52 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_color_mgmt.c           | 19 ++++++++
>  drivers/gpu/drm/i915/display/intel_color.c | 32 ++++++-------
>  include/drm/drm_atomic_helper.h            |  1 +
>  include/drm/drm_color_mgmt.h               |  3 ++
>  include/drm/drm_crtc.h                     | 11 +++++
>  6 files changed, 99 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index bc3487964fb5e..548e5d8221fb4 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -929,6 +929,54 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_check_planes);
>
> +/**
> + * drm_atomic_helper_check_crtcs - validate state object for CRTC changes
> + * @state: the driver state object
> + *
> + * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
> + * state holds them.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state)
> +{
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +       int i;
> +
> +       for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> +               if (!new_crtc_state->color_mgmt_changed)
> +                       continue;
> +
> +               if (drm_check_lut_size(new_crtc_state->gamma_lut,
> +                                      crtc->gamma_lut_size) ||
> +                   drm_check_lut_size(new_crtc_state->gamma_lut,
> +                                      crtc->gamma_size)) {
> +                       drm_dbg_state(
> +                               state->dev,
> +                               "Invalid Gamma LUT size. Expected %u/%u, got %u.\n",
> +                               crtc->gamma_lut_size, crtc->gamma_size,
> +                               drm_color_lut_size(new_crtc_state->gamma_lut));
> +                       return -EINVAL;
> +               }
> +
> +               if (drm_check_lut_size(new_crtc_state->degamma_lut,
> +                                      crtc->degamma_lut_size)) {
> +                       drm_dbg_state(
> +                               state->dev,
> +                               "Invalid Degamma LUT size. Expected %u, got %u.\n",
> +                               crtc->degamma_lut_size,
> +                               drm_color_lut_size(
> +                                       new_crtc_state->degamma_lut));
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_check_crtcs);
> +
>  /**
>   * drm_atomic_helper_check - validate state object
>   * @dev: DRM device
> @@ -974,6 +1022,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
>         if (ret)
>                 return ret;
>
> +       ret = drm_atomic_helper_check_crtcs(state);
> +       if (ret)
> +               return ret;
> +
>         if (state->legacy_cursor_update)
>                 state->async_update = !drm_atomic_helper_async_check(dev, state);
>
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 16a07f84948f3..c85094223b535 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>         struct drm_mode_config *config = &dev->mode_config;
>
>         if (degamma_lut_size) {
> +               crtc->degamma_lut_size = degamma_lut_size;
>                 drm_object_attach_property(&crtc->base,
>                                            config->degamma_lut_property, 0);
>                 drm_object_attach_property(&crtc->base,
> @@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>                                            config->ctm_property, 0);
>
>         if (gamma_lut_size) {
> +               crtc->gamma_lut_size = gamma_lut_size;
>                 drm_object_attach_property(&crtc->base,
>                                            config->gamma_lut_property, 0);
>                 drm_object_attach_property(&crtc->base,
> @@ -506,6 +508,23 @@ const char *drm_get_color_range_name(enum drm_color_range range)
>         return color_range_name[range];
>  }
>
> +/**
> + * drm_check_lut_size - Checks if LUT size matches the driver expected size.
> + * @lut: blob containing the LUT
> + * @expected_size: driver expected LUT size
> + *
> + * Returns -EINVAL on mismatch, 0 on match.
> + */
> +int drm_check_lut_size(const struct drm_property_blob *lut,
> +                      uint32_t expected_size)
> +{
> +       if (!lut)
> +               return 0;
> +
> +       return drm_color_lut_size(lut) != expected_size ? -EINVAL : 0;
> +}
> +EXPORT_SYMBOL(drm_check_lut_size);
> +
>  /**
>   * drm_plane_create_color_properties - color encoding related plane properties
>   * @plane: plane object
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 1469871d21ff9..0fe4b2359812a 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1262,23 +1262,6 @@ intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
>         return 0;
>  }
>
> -static int check_lut_size(const struct drm_property_blob *lut, int expected)
> -{
> -       int len;
> -
> -       if (!lut)
> -               return 0;
> -
> -       len = drm_color_lut_size(lut);
> -       if (len != expected) {
> -               DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> -                             len, expected);
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
>  static int test_luts(const struct drm_property_blob *lut, u32 tests)
>  {
>         const struct drm_color_lut *entry;
> @@ -1336,9 +1319,20 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>         degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
>         gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>
> -       if (check_lut_size(degamma_lut, degamma_length) ||
> -           check_lut_size(gamma_lut, gamma_length))
> +       if (drm_check_lut_size(degamma_lut, degamma_length)) {
> +               drm_dbg_state(
> +                       &dev_priv->drm,
> +                       "Invalid Degamma LUT size. Expected %u, got %u.\n",
> +                       degamma_length, drm_color_lut_size(degamma_lut));
>                 return -EINVAL;
> +       }
> +
> +       if (drm_check_lut_size(gamma_lut, gamma_length)) {
> +               drm_dbg_state(&dev_priv->drm,
> +                             "Invalid Gamma LUT size. Expected %u, got %u.\n",
> +                             degamma_length, drm_color_lut_size(gamma_lut));
> +               return -EINVAL;
> +       }
>
>         if (test_luts(degamma_lut, degamma_channels_tests) ||
>             test_luts(gamma_lut, gamma_channels_tests))
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 4045e2507e11c..a22d32a7a8719 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -38,6 +38,7 @@ struct drm_atomic_state;
>  struct drm_private_obj;
>  struct drm_private_state;
>
> +int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state);
>  int drm_atomic_helper_check_modeset(struct drm_device *dev,
>                                 struct drm_atomic_state *state);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 3537f3eeb3872..cb2d74719f2d5 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -74,6 +74,9 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
>         return blob->length / sizeof(struct drm_color_lut);
>  }
>
> +int drm_check_lut_size(const struct drm_property_blob *lut,
> +                      uint32_t expected_size);
> +
>  enum drm_color_encoding {
>         DRM_COLOR_YCBCR_BT601,
>         DRM_COLOR_YCBCR_BT709,
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 2deb15d7e1610..4fd1c9a4bbba8 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1072,6 +1072,17 @@ struct drm_crtc {
>         /** @funcs: CRTC control functions */
>         const struct drm_crtc_funcs *funcs;
>
> +       /**
> +        * @degamma_lut_size: Size of degamma LUT.
> +        */
> +       size_t degamma_lut_size;
> +
> +       /**
> +        * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
> +        * X, which doesn't support large lut sizes.
> +        */
> +       size_t gamma_lut_size;
> +

On NVIDIA hardware, multiple LUT sizes are supported. We do this check in e.g.

drivers/gpu/drm/nouveau/dispnv50/base907c.c:base907c_ilut

So I don't think a single sizes at the CRTC level makes sense.

Cheers,

  -ilia

>         /**
>          * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
>          * by calling drm_mode_crtc_set_gamma_size().
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>
