Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965677CB98
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 13:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584B10E0BE;
	Tue, 15 Aug 2023 11:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDF310E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 11:20:43 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-56d6dfa8b52so3675989eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1692098443; x=1692703243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t1fPPGhMFSRY8Q8tBm7egl5l9lB/3unjPvJck26oQtk=;
 b=AvwT7ZluQ7oICkceeFm2KC1ja9tvHCS5DqnhZHE1v5BDVFTiCczuDNWNVRigHVBf6p
 bCpE37w9913bqMWfNY0qc1q2j23E7kelBdTOLaLbAFvJ9VnkPMnTK15+HW/i9iYEqg8B
 9w9s0EiadMdqA7rIDxRlmH2ErpORsEboUQyZNzhgDgha0WDTc6CuJSBg9h0K7iO0Es9j
 PlDDcHnUujN9iW/T28xyTxQT9AfjmOCm7VW2fW15+cLIq+V4L70NA9DeKLsCPqhPdlIT
 +0B+WqL2rLwVxT7Xm5PXVb6B06ReSfQsq6bAqZ+Vpw9RvaNonJLWkMmsBl84bVr6gSE+
 SheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692098443; x=1692703243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1fPPGhMFSRY8Q8tBm7egl5l9lB/3unjPvJck26oQtk=;
 b=U+6M+zoPc6fRvKodjr6cxQtHE3VvYibVUEbS4bzXJ0w1BNu70kUnEqxpoSnPThs0FM
 22xeuDZOGzkOluQN0A9Q8K1jhWOPUKP6lqLYvprzXYSiVNIfEE7l4hXvzWeXk8v619sD
 Iib+gG9TBw3pOLzTlgiQVz3jsir9dkM3S1DbuJjKyLvH+bf6TYizNlDvza/vptvexYec
 IenaEVx74AZdvVS1RZFVJQEWF71kNmpYmOQAQJL1j4F/o/hWB9yfv8dW/YdXP/IMAxHD
 YmaXs5VQJhhYjNF3Y5ysAf4Eugr/An7f5/qpPRubqmTDeaew7BiVz2AyFpGhYJI3Qx6x
 vnJA==
X-Gm-Message-State: AOJu0YxZTe/9sZ5Umd5spsz+fvKIrP/raYq8AATYp+qHscK1GIe9Ml9n
 PTkmkMbiT5yJAT7NFFB4HSeQVd39bdxC4hEn5knNWg==
X-Google-Smtp-Source: AGHT+IFbQ455OiMaGWcExJpnJ+FCJ2GmC1mYXX6M1igUl3Y3bx6JPM1xU+Fs+N3nq51f4NSMx/nDhSQhi3RNAKXtikA=
X-Received: by 2002:a05:6358:c11:b0:13a:319f:a56b with SMTP id
 f17-20020a0563580c1100b0013a319fa56bmr12302657rwj.20.1692098441958; Tue, 15
 Aug 2023 04:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
 <20230814-kms-hdmi-connector-state-v1-10-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-10-048054df3654@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Aug 2023 12:20:26 +0100
Message-ID: <CAPY8ntCD09emANpfe6+f+NZnVxVoHqd=kn7pFLuLp0rOgAiREw@mail.gmail.com>
Subject: Re: [PATCH RFC 10/13] drm/connector: hdmi: Add Infoframes generation
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 14 Aug 2023 at 14:56, Maxime Ripard <mripard@kernel.org> wrote:
>
> Infoframes in KMS is usually handled by a bunch of low-level helpers
> that require quite some boilerplate for drivers. This leads to
> discrepancies with how drivers generate them, and which are actually
> sent.
>
> Now that we have everything needed to generate them in the HDMI
> connector state, we can generate them in our common logic so that
> drivers can simply reuse what we precomputed.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_hdmi_connector.c | 287 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h          | 100 ++++++++++++
>  2 files changed, 387 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
> index 22c49906dfb5..46cafb17def7 100644
> --- a/drivers/gpu/drm/drm_hdmi_connector.c
> +++ b/drivers/gpu/drm/drm_hdmi_connector.c
> @@ -5,8 +5,10 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_print.h>
> +#include <drm/display/drm_hdmi_helper.h>
>
>  #include <linux/export.h>
>
> @@ -499,6 +501,131 @@ drm_hdmi_connector_compute_config(const struct drm_hdmi_connector *hdmi_connecto
>         return -EINVAL;
>  }
>
> +static int
> +drm_hdmi_connector_generate_avi_infoframe(const struct drm_hdmi_connector *hdmi_connector,
> +                                         struct drm_hdmi_connector_state *hdmi_state)
> +{
> +       const struct drm_connector *connector = &hdmi_connector->base;
> +       const struct drm_connector_state *state = &hdmi_state->base;
> +       const struct drm_display_mode *mode =
> +               connector_state_get_adjusted_mode(state);
> +       struct hdmi_avi_infoframe *frame = &hdmi_state->infoframes.avi;
> +       bool is_lim_range =
> +               drm_atomic_helper_hdmi_connector_is_full_range(hdmi_connector,
> +                                                              hdmi_state);
> +       enum hdmi_quantization_range rgb_quant_range =
> +               is_lim_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
> +       int ret;
> +
> +       ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
> +       if (ret)
> +               return ret;
> +
> +       frame->colorspace = hdmi_state->output_format;
> +
> +       drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
> +       drm_hdmi_avi_infoframe_colorimetry(frame, state);
> +       drm_hdmi_avi_infoframe_bars(frame, state);
> +
> +       return 0;
> +}
> +
> +static int
> +drm_hdmi_connector_generate_spd_infoframe(const struct drm_hdmi_connector *hdmi_connector,
> +                                         struct drm_hdmi_connector_state *hdmi_state)
> +{
> +       struct hdmi_spd_infoframe *frame = &hdmi_state->infoframes.spd;
> +       int ret;
> +
> +       ret = hdmi_spd_infoframe_init(frame,
> +                                     hdmi_connector->vendor,
> +                                     hdmi_connector->product);
> +       if (ret)
> +               return ret;
> +
> +       frame->sdi = HDMI_SPD_SDI_PC;
> +
> +       return 0;
> +}
> +
> +static int
> +drm_hdmi_connector_generate_hdr_infoframe(const struct drm_hdmi_connector *hdmi_connector,
> +                                         struct drm_hdmi_connector_state *hdmi_state)
> +{
> +       const struct drm_connector_state *state = &hdmi_state->base;
> +       struct hdmi_drm_infoframe *frame = &hdmi_state->infoframes.drm;
> +       int ret;
> +
> +       if (hdmi_connector->max_bpc < 10)
> +               return 0;
> +
> +       if (!state->hdr_output_metadata)
> +               return 0;

Minor issue here I think.

If bpc < 10 or hdr_output_metadata isn't defined then the infoframe
will be left at all 0's due to the state's kzalloc. However we will
still call update_infoframe and therefore write_infoframe asking for
the infoframe to be sent, but frame->any.type = 0. It is true that
frame type 0 isn't defined, but what is the driver expected to make of
that?

If frame->any.type is initialised appropriately (or type is passed
directly), then a length of 0 could be reasonably used to signal that
the infoframe should not be sent. Otherwise I don't think we have a
path which can stop sending the HDR infoframe if it has ever been
sent.

On vc4 I think it's also going to trip up as it has a buffer slot per
type, and slot 0 is used for the GCP.

Thanks
  Dave

> +
> +       ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int
> +drm_hdmi_connector_generate_vendor_infoframe(const struct drm_hdmi_connector *hdmi_connector,
> +                                            struct drm_hdmi_connector_state *hdmi_state)
> +{
> +       const struct drm_connector *connector = &hdmi_connector->base;
> +       const struct drm_connector_state *state = &hdmi_state->base;
> +       const struct drm_display_mode *mode =
> +               connector_state_get_adjusted_mode(state);
> +       struct hdmi_vendor_infoframe *frame = &hdmi_state->infoframes.vendor;
> +       int ret;
> +
> +       ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
> +       if (ret == -EINVAL)
> +               return 0;
> +       else
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int
> +drm_hdmi_connector_generate_infoframes(const struct drm_hdmi_connector *hdmi_connector,
> +                                      struct drm_hdmi_connector_state *hdmi_state)
> +{
> +       const struct drm_connector *connector = &hdmi_connector->base;
> +       const struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       ret = drm_hdmi_connector_generate_avi_infoframe(hdmi_connector, hdmi_state);
> +       if (ret)
> +               return ret;
> +
> +       ret = drm_hdmi_connector_generate_spd_infoframe(hdmi_connector, hdmi_state);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Audio Infoframes will be generated by ALSA.
> +        */
> +
> +       ret = drm_hdmi_connector_generate_hdr_infoframe(hdmi_connector, hdmi_state);
> +       if (ret)
> +               return ret;
> +
> +       ret = drm_hdmi_connector_generate_vendor_infoframe(hdmi_connector, hdmi_state);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_hdmi_connector_atomic_check() - Helper to check HDMI connector atomic state
>   * @connector: the parent connector this state refers to
> @@ -536,6 +663,10 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
>         if (ret)
>                 return ret;
>
> +       ret = drm_hdmi_connector_generate_infoframes(hdmi_connector, new_hdmi_state);
> +       if (ret)
> +               return ret;
> +
>         if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb ||
>             old_hdmi_state->output_format != new_hdmi_state->output_format ||
>             old_hdmi_state->output_bpc != new_hdmi_state->output_bpc) {
> @@ -553,6 +684,152 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_atomic_check);
>
> +#define HDMI_MAX_INFOFRAME_SIZE                29
> +
> +static int write_infoframe(struct drm_hdmi_connector *hdmi_connector,
> +                          union hdmi_infoframe *frame)
> +{
> +       const struct drm_hdmi_connector_funcs *funcs = hdmi_connector->funcs;
> +       u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
> +       int len;
> +
> +       if (!funcs || !funcs->write_infoframe)
> +               return -ENOSYS;
> +
> +       len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
> +       if (len < 0)
> +               return len;
> +
> +       return funcs->write_infoframe(hdmi_connector, frame->any.type, buffer, len);
> +}
> +
> +static int update_infoframe(struct drm_hdmi_connector *hdmi_connector,
> +                           union hdmi_infoframe *frame)
> +{
> +       int ret;
> +
> +       ret = write_infoframe(hdmi_connector, frame);
> +       if (ret)
> +               return ret;
> +
> +       switch (frame->any.type) {
> +       case HDMI_INFOFRAME_TYPE_AVI:
> +               memcpy(&hdmi_connector->infoframes.avi, &frame->avi,
> +                      sizeof(hdmi_connector->infoframes.avi));
> +               break;
> +       case HDMI_INFOFRAME_TYPE_DRM:
> +               memcpy(&hdmi_connector->infoframes.drm, &frame->drm,
> +                      sizeof(hdmi_connector->infoframes.drm));
> +               break;
> +       case HDMI_INFOFRAME_TYPE_SPD:
> +               memcpy(&hdmi_connector->infoframes.spd, &frame->spd,
> +                      sizeof(hdmi_connector->infoframes.spd));
> +               break;
> +       case HDMI_INFOFRAME_TYPE_VENDOR:
> +               memcpy(&hdmi_connector->infoframes.vendor, &frame->vendor,
> +                      sizeof(hdmi_connector->infoframes.vendor));
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +#define UPDATE_INFOFRAME(c, i)                                 \
> +       update_infoframe(c, (union hdmi_infoframe *)&(c)->infoframes.i)
> +
> +/**
> + * drm_atomic_helper_hdmi_connector_update_infoframes - Update the Infoframes
> + * @hdmi_connector: A pointer to the HDMI connector
> + * @hdmi_state: The HDMI connector state to generate the infoframe from
> + *
> + * This function is meant for HDMI connector drivers to write their
> + * infoframes. It will typically be used in a
> + * @drm_connector_helper_funcs.atomic_enable implementation.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_atomic_helper_hdmi_connector_update_infoframes(struct drm_hdmi_connector *hdmi_connector,
> +                                                      struct drm_hdmi_connector_state *hdmi_state)
> +{
> +       struct drm_connector *connector = &hdmi_connector->base;
> +       struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       mutex_lock(&hdmi_connector->infoframes.lock);
> +
> +       ret = UPDATE_INFOFRAME(hdmi_connector, avi);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(hdmi_connector, audio);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(hdmi_connector, drm);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(hdmi_connector, spd);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(hdmi_connector, vendor);
> +       if (ret)
> +               goto out;
> +
> +out:
> +       mutex_unlock(&hdmi_connector->infoframes.lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_update_infoframes);
> +
> +#undef UPDATE_INFOFRAME
> +
> +/**
> + * drm_atomic_helper_hdmi_connector_update_audio_infoframe - Update the Audio Infoframe
> + * @hdmi_connector: A pointer to the HDMI connector
> + * @frame: A pointer to the audio infoframe to write
> + *
> + * This function is meant for HDMI connector drivers to update their
> + * audio infoframe. It will typically be used in one of the ALSA hooks
> + * (most likely prepare).
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_hdmi_connector_update_audio_infoframe(struct drm_hdmi_connector *hdmi_connector,
> +                                                       struct hdmi_audio_infoframe *frame)
> +{
> +       struct drm_connector *connector = &hdmi_connector->base;
> +       struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       mutex_lock(&hdmi_connector->infoframes.lock);
> +
> +       ret = update_infoframe(hdmi_connector, (union hdmi_infoframe *)frame);
> +
> +       mutex_unlock(&hdmi_connector->infoframes.lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_update_audio_infoframe);
> +
>  /**
>   * drm_atomic_helper_hdmi_connector_is_full_range() - Checks whether a state uses Full-Range RGB
>   * @hdmi_connector: the HDMI connector this state refers to
> @@ -634,6 +911,8 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
>   * drmm_hdmi_connector_init - Init a preallocated HDMI connector
>   * @dev: DRM device
>   * @hdmi_connector: A pointer to the HDMI connector to init
> + * @vendor: HDMI Controller Vendor name
> + * @product: HDMI Controller Product name
>   * @funcs: callbacks for this connector
>   * @connector_type: user visible type of the connector
>   * @ddc: optional pointer to the associated ddc adapter
> @@ -652,6 +931,7 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
>   */
>  int drmm_hdmi_connector_init(struct drm_device *dev,
>                              struct drm_hdmi_connector *hdmi_connector,
> +                            const char *vendor, const char *product,
>                              const struct drm_connector_funcs *funcs,
>                              const struct drm_hdmi_connector_funcs *hdmi_funcs,
>                              int connector_type,
> @@ -670,6 +950,13 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
>         if (ret)
>                 return ret;
>
> +       strscpy(hdmi_connector->vendor, vendor, sizeof(hdmi_connector->vendor));
> +       strscpy(hdmi_connector->product, product, sizeof(hdmi_connector->product));
> +
> +       ret = drmm_mutex_init(dev, &hdmi_connector->infoframes.lock);
> +       if (ret)
> +               return ret;
> +
>         prop = hdmi_connector->broadcast_rgb_property;
>         if (!prop) {
>                 prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 6e25a16420e4..21da6f428101 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2096,6 +2096,32 @@ struct drm_hdmi_connector_state {
>          * selection value.
>          */
>         enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +
> +       /**
> +        * @infoframes: HDMI Infoframes matching that state
> +        */
> +       struct {
> +               /**
> +                * @avi: AVI Infoframes structure matching our state.
> +                */
> +               struct hdmi_avi_infoframe avi;
> +
> +               /**
> +                * @drm: DRM Infoframes structure matching our state.
> +                */
> +               struct hdmi_drm_infoframe drm;
> +
> +               /**
> +                * @spd: SPD Infoframes structure matching our state.
> +                */
> +               struct hdmi_spd_infoframe spd;
> +
> +               /**
> +                * @vendor: Vendor Infoframes structure matching our
> +                * state.
> +                */
> +               struct hdmi_vendor_infoframe vendor;
> +       } infoframes;
>  };
>
>  #define connector_state_to_hdmi_connector_state(state) \
> @@ -2127,6 +2153,11 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
>  void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
>                                                   const struct drm_connector_state *state);
>
> +int drm_atomic_helper_hdmi_connector_update_infoframes(struct drm_hdmi_connector *hdmi_connector,
> +                                                      struct drm_hdmi_connector_state *hdmi_state);
> +int drm_atomic_helper_hdmi_connector_update_audio_infoframe(struct drm_hdmi_connector *hdmi_connector,
> +                                                           struct hdmi_audio_infoframe *frame);
> +
>  bool
>  drm_atomic_helper_hdmi_connector_is_full_range(const struct drm_hdmi_connector *hdmi_connector,
>                                                const struct drm_hdmi_connector_state *hdmi_state);
> @@ -2153,6 +2184,23 @@ struct drm_hdmi_connector_funcs {
>         (*tmds_char_rate_valid)(const struct drm_hdmi_connector *connector,
>                                 const struct drm_display_mode *mode,
>                                 unsigned long long tmds_rate);
> +
> +       /**
> +        * @write_infoframe:
> +        *
> +        * This callback is invoked through
> +        * @drm_atomic_helper_hdmi_connector_update_infoframes during a
> +        * commit to program the infoframes into the hardware. It will
> +        * be called multiple times, once for every infoframe type.
> +        *
> +        * The @write_infoframe callback is mandatory.
> +        *
> +        * Returns:
> +        * 0 on success, a negative error code otherwise
> +        */
> +       int (*write_infoframe)(struct drm_hdmi_connector *connector,
> +                              enum hdmi_infoframe_type type,
> +                              const u8 *buffer, size_t len);
>  };
>
>  struct drm_hdmi_connector {
> @@ -2161,6 +2209,16 @@ struct drm_hdmi_connector {
>          */
>         struct drm_connector base;
>
> +       /**
> +        * @vendor: HDMI Controller Vendor Name
> +        */
> +       char vendor[8];
> +
> +       /**
> +        * @product: HDMI Controller Product Name
> +        */
> +       char product[16];
> +
>         /**
>          * @funcs: HDMI connector Control Functions
>          */
> @@ -2176,6 +2234,47 @@ struct drm_hdmi_connector {
>          * Broadcast RGB selection to output with.
>          */
>         struct drm_property *broadcast_rgb_property;
> +
> +       /**
> +        * @infoframes: Current Infoframes output by the connector
> +        */
> +       struct {
> +               /**
> +                * @lock: Mutex protecting against concurrent access to
> +                * the infoframes, most notably between KMS and ALSA.
> +                */
> +               struct mutex lock;
> +
> +               /**
> +                * @audio: Current Audio Infoframes structure. Protected
> +                * by @lock.
> +                */
> +               struct hdmi_audio_infoframe audio;
> +
> +               /**
> +                * @avi: Current AVI Infoframes structure. Protected by
> +                * @lock.
> +                */
> +               struct hdmi_avi_infoframe avi;
> +
> +               /**
> +                * @drm: Current DRM Infoframes structure. Protected by
> +                * @lock.
> +                */
> +               struct hdmi_drm_infoframe drm;
> +
> +               /**
> +                * @spd: Current SPD Infoframes structure. Protected by
> +                * @lock.
> +                */
> +               struct hdmi_spd_infoframe spd;
> +
> +               /**
> +                * @vendor: Current Vendor Infoframes structure.
> +                * Protected by @lock.
> +                */
> +               struct hdmi_vendor_infoframe vendor;
> +       } infoframes;
>  };
>
>  #define connector_to_hdmi_connector(connector) \
> @@ -2188,6 +2287,7 @@ drm_hdmi_connector_compute_mode_clock(const struct drm_display_mode *mode,
>
>  int drmm_hdmi_connector_init(struct drm_device *dev,
>                              struct drm_hdmi_connector *hdmi_connector,
> +                            const char *vendor, const char *product,
>                              const struct drm_connector_funcs *funcs,
>                              const struct drm_hdmi_connector_funcs *hdmi_funcs,
>                              int connector_type,
>
> --
> 2.41.0
>
