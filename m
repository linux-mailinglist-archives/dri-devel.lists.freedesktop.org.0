Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED159EE03C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 08:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D137B10E0E7;
	Thu, 12 Dec 2024 07:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dJVdo7z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3410E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 07:29:37 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so1609443e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733988576; x=1734593376;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUsFBs9SgSTwKf+euhdAY/mle8iwODWJW4g1nHNMk9c=;
 b=dJVdo7z8+BUUYZM54C2n8g7EBKNIi2XHyKMiAXXOQZt7/BMBPLsIbu1Y+8KKQeCA4C
 Cl+oKYbqLhdxvc6mPHPViG5Nk7WgCoNBTp7zkaphlpryGJh2jlNtwKJx7Mzni8WcVih8
 vEgrZQJeAfUyd+w/UTDn5DUPhCA6BEgUoIwk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733988576; x=1734593376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUsFBs9SgSTwKf+euhdAY/mle8iwODWJW4g1nHNMk9c=;
 b=dbUfaPCpA9m9ccc3o5YTD1S3G36IZxGohFU9xOiJNMt/avY79MyjpLtpPMedOi0aQ1
 tHyMjn1PZfCWCjlKrJMDMrnQDCtvr3Jer/L1OG+NECezwWBfp0a/FFxlHxE+lsHmyVr5
 /sciwzXCOGc5EZHAmbxNZc7F+9bvCLg7Gyc7yTylryBT+qothZgZZsZiYWPKf21HqAkJ
 d4X8JAL46z5K6zntDRJuBf17LepN2lZtWFrlXhC6ufUplagktX/s2quu7tF6t6F7bFCj
 gEd9XQT6v7tRzW6sPz5qnkTAGVhfMw47NXDL0d4HdB9oTiS0D+VK4kas3cBZ4TmWSog/
 TObw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFTI6VFFWO4xhPeL3pHTUhPfQFsztskmJ+WuubqIfAiW09Wia1WLgG84oSaonwVXONTIQ54iq24r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweFhUV/610qVhE5m2ikSvU39CvAGgY2kk/VfExYw9rEU/jbsTW
 3mMGANEfhnYcrI9dDN0HSV6oMJj1k36RPDWl61Mnataiv1eAwx0ma08W3w4mQN9X5N3MNxaOsqu
 LbhwgRo1yVyPVrceIFnti2SOfOGqVY3Ww0bw8
X-Gm-Gg: ASbGncv/MbC+FzPJ+ag5eKsRRMAWvH3XXQyJll8ffUX1u5i4eS0WBBWZ9FOJ75W/HWw
 dHRLJFcRgEmHWYeOCKufG8BrNiISX+qGSf8zGaoUQy8tMq8qhR8Svtx6XZfltL0fe2w==
X-Google-Smtp-Source: AGHT+IGUfV18odEMnZdd40vklSttluOoWFDdHf+m8pFREqeQLEQ0rE9DZYkQWg+goJ0kE03UC7Ud2rvX2aZz+ThhYWA=
X-Received: by 2002:a05:6512:3d8a:b0:540:2add:c1f1 with SMTP id
 2adb3069b0e04-54032d5611dmr89184e87.18.1733988576033; Wed, 11 Dec 2024
 23:29:36 -0800 (PST)
MIME-Version: 1.0
References: <20241212055110.1862487-1-xji@analogixsemi.com>
In-Reply-To: <20241212055110.1862487-1-xji@analogixsemi.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Dec 2024 15:29:25 +0800
Message-ID: <CAGXv+5FDTqGhE3kZ=b5Mkp4gzuKtMfcdG_63MewDGvJEb-QyaQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@google.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Dec 12, 2024 at 1:51=E2=80=AFPM Xin Ji <xji@analogixsemi.com> wrote=
:
>
> When user enabled HDCP feature, userspace will set HDCP content
> to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> support HDCP feature.
>
> However once HDCP content turn to DRM_MODE_CONTENT_PROTECTION_ENABLED
> userspace will not update the HDCP content to
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.
>
> So, anx7625 driver move hdcp content value checking from bridge
> interface .atomic_check() to .atomic_enable(), then update hdcp content
> according from currently HDCP status. And also disabled HDCP in bridge
> interface .atomic_disable().
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---

No need to resend, but please provide a changelog under the "---" line
so reviewers know what you changed in this new version.

>  drivers/gpu/drm/bridge/analogix/anx7625.c | 74 ++++++++++++++---------
>  1 file changed, 46 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index a2675b121fe4..f96ce5665e8d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data =
*ctx)
>                                  TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
>  }
>
> +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
> +{
> +       struct device *dev =3D ctx->dev;
> +
> +       if (!ctx->connector)
> +               return;
> +
> +       anx7625_hdcp_disable(ctx);
> +
> +       ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +       drm_hdcp_update_content_protection(ctx->connector,
> +                                          ctx->hdcp_cp);
> +
> +       dev_dbg(dev, "update CP to UNDESIRE\n");
> +}
> +
>  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>  {
>         u8 bcap;
> @@ -2149,34 +2165,6 @@ static int anx7625_connector_atomic_check(struct a=
nx7625_data *ctx,
>         if (cp =3D=3D ctx->hdcp_cp)
>                 return 0;
>
> -       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> -               if (ctx->dp_en) {
> -                       dev_dbg(dev, "enable HDCP\n");
> -                       anx7625_hdcp_enable(ctx);
> -
> -                       queue_delayed_work(ctx->hdcp_workqueue,
> -                                          &ctx->hdcp_work,
> -                                          msecs_to_jiffies(2000));
> -               }
> -       }
> -
> -       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -               if (ctx->hdcp_cp !=3D DRM_MODE_CONTENT_PROTECTION_ENABLED=
) {
> -                       dev_err(dev, "current CP is not ENABLED\n");
> -                       return -EINVAL;
> -               }
> -               anx7625_hdcp_disable(ctx);
> -               ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> -               drm_hdcp_update_content_protection(ctx->connector,
> -                                                  ctx->hdcp_cp);
> -               dev_dbg(dev, "update CP to UNDESIRE\n");
> -       }
> -
> -       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -               dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\=
n");
> -               return -EINVAL;
> -       }
> -
>         return 0;
>  }
>
> @@ -2425,6 +2413,8 @@ static void anx7625_bridge_atomic_enable(struct drm=
_bridge *bridge,
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
>         struct device *dev =3D ctx->dev;
>         struct drm_connector *connector;
> +       struct drm_connector_state *conn_state;
> +       int cp;
>
>         dev_dbg(dev, "drm atomic enable\n");
>
> @@ -2439,6 +2429,32 @@ static void anx7625_bridge_atomic_enable(struct dr=
m_bridge *bridge,
>         _anx7625_hpd_polling(ctx, 5000 * 100);
>
>         anx7625_dp_start(ctx);
> +
> +       conn_state =3D drm_atomic_get_new_connector_state(state->base.sta=
te, connector);
> +
> +       if (WARN_ON(!conn_state))
> +               return;
> +
> +       cp =3D conn_state->content_protection;
> +       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> +               if (ctx->dp_en) {
> +                       dev_dbg(dev, "enable HDCP\n");
> +                       anx7625_hdcp_enable(ctx);
> +
> +                       queue_delayed_work(ctx->hdcp_workqueue,
> +                                          &ctx->hdcp_work,
> +                                          msecs_to_jiffies(2000));
> +               }
> +       }
> +
> +       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +               if (ctx->hdcp_cp !=3D DRM_MODE_CONTENT_PROTECTION_ENABLED=
) {
> +                       dev_err(dev, "current CP is not ENABLED\n");
> +                       return;
> +               }
> +
> +               anx7625_hdcp_disable_and_update_cp(ctx);
> +       }
>  }
>
>  static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> @@ -2449,6 +2465,8 @@ static void anx7625_bridge_atomic_disable(struct dr=
m_bridge *bridge,
>
>         dev_dbg(dev, "drm atomic disable\n");
>
> +       anx7625_hdcp_disable_and_update_cp(ctx);
> +
>         ctx->connector =3D NULL;
>         anx7625_dp_stop(ctx);
>
> --
> 2.25.1
>
