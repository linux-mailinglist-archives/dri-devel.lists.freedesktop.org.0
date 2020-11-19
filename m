Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A422B90D3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373D7884D4;
	Thu, 19 Nov 2020 11:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BF0884D4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 11:19:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so6406194wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XrwDlcI2EzmOzDcn/Tzkd6EB0qAEn/y8FCnhZE0tp7A=;
 b=h9vN3VIw0MCNRMJkCfWq/ExEm1Nz8fBc0Cslh80JpH7dZRwI4EZYO44zX8zHU/QLc1
 1U/4xAGDtgOSFZD1jhSzfXHaIww1S9m0qmzcDW0fhX51qFAa4xrnDdYuLGX8kb3Jw+LO
 m14BW0jflaKCnDXcu7mQncPod6RITmxsXvQjHGdUHhn/gcTziYXbUxTJXONtiMYYwlXv
 EnEQjK7YaPWzN9mffvwmWsOnWbkVDHE/qJBKHm9uDjqNJhdCKD2uU0wIdhnV+1cul9No
 XB8g/AktYFJ7Ijv4JE85uDv0/00mj6I5UqIgPPWINYQBRFx1wfZprXqZPDy0p/iGoAAe
 mEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XrwDlcI2EzmOzDcn/Tzkd6EB0qAEn/y8FCnhZE0tp7A=;
 b=ghBggqEHEgkhG49VFvGDldkYfU9vspgSfcEzPApkcyqZWfaGBIK01UAAqOj7XQ8mFG
 ed/ke6H37qm7eagufmv60iG4BR3TCPMnR0fq2Hib6gU/ioO3E1yVfgrVpwlH/KVM88Wq
 PSyL3eQNCJnpsw5EusnKhGmR8iKxAMF2E/HKPZm5+MSEWsgOA75P16T9jkYjJ/hval3o
 uLZxbZ6uU1+0LXgR683ACOsA/BWXTC1UWF30lJl0GAah04tsoiWJpGzkHoZVVxfLvPwX
 VPB5D7NDDZM9M7cHWOVFJPcSf6KRFdGjKkWBldRMNkFMGNEZNjNgr6s6l2U7I/GtfEA7
 DjXA==
X-Gm-Message-State: AOAM531zNmljiRItFcsmY21aHcZQkumRVILnCq388mMvk1s6H0ubh8Et
 SDzMg3AAzbR0E1tFvAlw5m9zScSBwZ5dQso+FV9DcQ==
X-Google-Smtp-Source: ABdhPJygVy+qc6Ssg9YPWF0Y82vzW2HMzIRsr4ZS6d4nrGxMVX2vzHjq7///sObBVLBaMKEpWK1h59qUYB8uVUpyyec=
X-Received: by 2002:a1c:9804:: with SMTP id a4mr3939825wme.158.1605784786747; 
 Thu, 19 Nov 2020 03:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20201029122522.1917579-1-maxime@cerno.tech>
In-Reply-To: <20201029122522.1917579-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Nov 2020 11:19:27 +0000
Message-ID: <CAPY8ntDdRkNBayrhJX+9Dvvbx8PsnMGTuGPxEPZ2-ULcZg2y=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: hdmi: Make sure our clock rate is within
 limits
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 29 Oct 2020 at 12:25, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI controller cannot go above a certain pixel rate limit depending on
> the generations, but that limit is only enforced in mode_valid at the
> moment, which means that we won't advertise modes that exceed that limit,
> but the userspace is still free to try to setup a mode that would.
>
> Implement atomic_check to make sure we check it in that scenario too.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
> Changes from v1:
>   - Added that patch to resolve a conflict
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index e8f99e290655..3d0338822cd2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -760,6 +760,20 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  {
>  }
>
> +static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +                                        struct drm_crtc_state *crtc_state,
> +                                        struct drm_connector_state *conn_state)
> +{
> +       struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +       unsigned long long pixel_rate = mode->clock * 1000;
> +
> +       if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  static enum drm_mode_status
>  vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
> @@ -773,6 +787,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>  }
>
>  static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
> +       .atomic_check = vc4_hdmi_encoder_atomic_check,
>         .mode_valid = vc4_hdmi_encoder_mode_valid,
>         .disable = vc4_hdmi_encoder_disable,
>         .enable = vc4_hdmi_encoder_enable,
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
