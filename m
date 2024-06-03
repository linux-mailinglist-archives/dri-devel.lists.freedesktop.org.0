Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3058D834F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB1210E032;
	Mon,  3 Jun 2024 13:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SBFF1QOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108510E032
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:02:53 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-24c9f628e71so2204337fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1717419772; x=1718024572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn3BxidGvifb/uwG8h+RPR/lgOOP8/SV7b4ckYketRs=;
 b=SBFF1QOZcMyvTot0Lr7hSW6bKA/bR5u/+FhKRSGBW8eDua9tsrvo2lMb3qXv3siDuH
 FI8vlQXF9/bN8LT/z9Xgv9J1hZJv+Xt7lOlHjYINL2Np0OCU/vHqaqanfg7KxS8yP8up
 3lMH94NGIPKh0Bx1mc+66dDRkexA7RLR5yMRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717419772; x=1718024572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn3BxidGvifb/uwG8h+RPR/lgOOP8/SV7b4ckYketRs=;
 b=Bd+Q6UaD/2qgKNRRjPHR9OUFGLNWXGUcIeRJxDRyI2IKCkVYV/6kAz7I5j1nugLmkn
 4cZA1frrdZWUa/gmvinOcOI/YL2YluTRBOSV7j0TzUSoqm5+NEH5pLLWAcDwWL70nRaz
 wpHm8vd/nDtb+K4/uRZTRFZwpiWErpcod5exumuMYu3+xRFqyMGTDlvt749cvLWABNBx
 YNG7wmOEhCc4wylceNet0f27+WxbcSiblIBhyuQOBRpa4GbfV7HkZq3BWyCIH+x05kCj
 YIM4JkFg+AYN6qAM2jnNiG0uXHpwiq76aSdxsK92zC1FM1S/0FV3cbnh8CRoomcfAUHF
 yt1Q==
X-Gm-Message-State: AOJu0YxT7MdKsuXD0mj+XK908VXyDC2+MzAEDuKbWsce3rLkNgTwREy1
 1Rk7s4uGqHOULaOaSikcOjguLxj/xe/8IuhI0bnAxj/cHrtLDoKgylW6Xsl0q+oyLZxCCWrqxc9
 3NoCvdmLjXW6D/eqI7rk0kzEu2vkNSKJ6GuN8
X-Google-Smtp-Source: AGHT+IGE9rcGa38TsjMYL2ub0ohmXJ1ai77oREeyyxDoxfnvUrQRfARlhu8yKvuTYiukjWOpWs4wI9vS1zqZjnHCQeI=
X-Received: by 2002:a05:6870:c69b:b0:250:8060:8cd0 with SMTP id
 586e51a60fabf-2508b9efc79mr10754975fac.34.1717419771865; Mon, 03 Jun 2024
 06:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240531203358.26677-1-ian.forbes@broadcom.com>
In-Reply-To: <20240531203358.26677-1-ian.forbes@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 3 Jun 2024 16:02:40 +0300
Message-ID: <CAKLwHdX=cYCyBSTvKHADgkJ9q3TqKuGnByHn_Z3CThQpxfaKmA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Don't destroy Screen Target when CRTC is
 enabled but inactive
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 31, 2024 at 11:34=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.co=
m> wrote:
>
> drm_crtc_helper_funcs::atomic_disable can be called even when the CRTC is
> still enabled. This can occur when the mode changes or the CRTC is set as
> inactive.
>
> In the case where the CRTC is being set as inactive we only want to
> blank the screen. The Screen Target should remain intact as long as the
> mode has not changed and CRTC is enabled.
>
> This fixes a bug with GDM where locking the screen results in a permanent
> black screen because the Screen Target is no longer defined.
>
> Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 2041c4d48daa..d2f523191314 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -414,6 +414,7 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_c=
rtc *crtc,
>  {
>         struct vmw_private *dev_priv;
>         struct vmw_screen_target_display_unit *stdu;
> +       struct drm_crtc_state *new_crtc_state;
>         int ret;
>
>         if (!crtc) {
> @@ -423,6 +424,7 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_c=
rtc *crtc,
>
>         stdu     =3D vmw_crtc_to_stdu(crtc);
>         dev_priv =3D vmw_priv(crtc->dev);
> +       new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>
>         if (dev_priv->vkms_enabled)
>                 drm_crtc_vblank_off(crtc);
> @@ -434,6 +436,14 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_=
crtc *crtc,
>
>                 (void) vmw_stdu_update_st(dev_priv, stdu);
>
> +               /* Don't destroy the Screen Target if we are only setting=
 the
> +                * display as inactive
> +                */
> +               if (new_crtc_state->enable &&
> +                   !new_crtc_state->active &&
> +                   !new_crtc_state->mode_changed)
> +                       return;
> +
>                 ret =3D vmw_stdu_destroy_st(dev_priv, stdu);
>                 if (ret)
>                         DRM_ERROR("Failed to destroy Screen Target\n");
> --
> 2.34.1
>

LGTM!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
