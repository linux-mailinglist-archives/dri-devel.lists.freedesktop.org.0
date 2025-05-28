Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C893AC748F
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 01:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D0410E0F9;
	Wed, 28 May 2025 23:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E8QW9T4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB5210E0F9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 23:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748475909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QjcO9ZcJ+6/zyGrAXWz4QqNpNmDNm9FhYOt01gFfm14=;
 b=E8QW9T4C9xtilWogae/+5TWE7EYZ7BpTqRx6ystuGK1SNlyrRb578QV4BjzPeQ6Ir3CX3c
 J15w9qOoqIKfFBYN2FxW0tEh4TdWn8DADTs+zQ7N2dQSRhMNaBx5Y84fexl0nO6l5iwMt8
 a/cZ5FMUiVtPGVWUOL/3c8idP5jwDEM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-hdtdKEYnOwKp3fFdeXiEzw-1; Wed, 28 May 2025 19:45:07 -0400
X-MC-Unique: hdtdKEYnOwKp3fFdeXiEzw-1
X-Mimecast-MFC-AGG-ID: hdtdKEYnOwKp3fFdeXiEzw_1748475906
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-70e2d495194so5826407b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748475906; x=1749080706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QjcO9ZcJ+6/zyGrAXWz4QqNpNmDNm9FhYOt01gFfm14=;
 b=iKLkDaJpjRdtc2mK958Hu7wtD+Pzo+vhzjFKTK3oly928Oyv6Av5saESRDOrZV6Ivt
 A9YJI2FX5Z0TiD+ceR8mkEAJl59k0CWhwCDNWPwsNYXFsKL0jqvTRq+TD3fEq3uZb1YX
 AS+3wwowlGEWhg9fosW6EOUwNTyopzlAFhWvwvIrL0mgQnG1VyN7sSl2+5YzFFz49QEq
 GuUQ13D1B9DiAWHuOaICy4027yYIKd/niLrheyN1LNwOMJa2vMa8QZF//+d/oXRHr2SK
 gZTYBlnlw+AyyYVBozwt3RqQbzTIbZUqlUUaN/p0NfnCAJVIzeyaHdexZtBfFpiwDcJz
 hbkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvzXRVMLQmwiIwykMF6qOlQ+LBUY19RevsCNzgmMWBIKd49DeJFy49t/rP31hnBVttvmoA7LgdVug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF3C4AM7ZTaciAJrWIknjdKP1PG9JNqt0xiouu4f7DtAGqcz6l
 /5oGtWvAgKG489gC0dMy/KTZpqF3zbXmKS9YYrKED0bwrYAueMP88La8+a63ZLNz1+qVZ0t9uGk
 r3LjK/Ch9qxNSzkFbOlIQIAw0tE1WRIMFyXjC/7R6RgO+AoiRwq18SbpOErU8z2jBaKeE/40mFN
 gmKXcXfaUlwf/ZOLTQJBGi+Y6tml9++wK8r6peGyqowR3q
X-Gm-Gg: ASbGncvvh5uMHQEIvNAjY+SBV9I5rmGIKVmBmU3NepWfMWz32diN/tiEN1KVV0DwxPR
 i/svg4KLJYh3GI8nNbsN4zAFCKkIgpcQ5iCxQhffoB67Sv7qsC9A4A9eU9tCU0KmBnaQ=
X-Received: by 2002:a05:690c:4c01:b0:70e:326:6aeb with SMTP id
 00721157ae682-70f8b506cd2mr3520087b3.10.1748475906527; 
 Wed, 28 May 2025 16:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsok6/AsdKTvRajwRYIiZPsG1LQnvvgTQG0G1fTLgRh98YkTHe3ZEEPsOyO4WJ/Jt57sc5QMbbFc9ov7Pr9k=
X-Received: by 2002:a05:690c:4c01:b0:70e:326:6aeb with SMTP id
 00721157ae682-70f8b506cd2mr3519837b3.10.1748475906107; Wed, 28 May 2025
 16:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-1-7e356fd58ba5@bootlin.com>
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-1-7e356fd58ba5@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 28 May 2025 18:41:28 -0400
X-Gm-Features: AX0GCFuR1Zj3-VyXi4YDmSYrL27olyB4mGZGJf-XwpZmL7rlVD5bjFPkX_KXJUw
Message-ID: <CAN9Xe3Shv_CuVB+8YpfGksQozYoBmP9WffZvQ48hAJEiE9ebmg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] drm/tests: bridge: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R-yTsDVGVQD1Wn9DokEbHVEia65rJmF5E2G5j_HgnsM_1748475906
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000048405a06363ac5f1"
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

--00000000000048405a06363ac5f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:48=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootl=
in.com>
wrote:

> Use the new DRM bridge allocation API, which is the only supported now, f=
or
> the kunit tests.
>
> This change is more massive than for the typical DRM bridge driver becaus=
e
> struct drm_bridge_init_priv currently embeds a struct drm_bridge, which i=
s
> not supported anymore. We new have to use devm_drm_bridge_alloc() to
>
                                            typo ^^^s/new/now.

Thanks,
Anusha

dynamically allocate a "private driver struct", which is a bit awkward here
> because there is no real bridge driver. Thus let's add a "dummy" DRM brid=
ge
> struct to represent it.
>
> As a nice cleanup we can now move the enable_count and disable_count
> members, which are counting bridge-specific events, into the new "private
> driver struct" (and avoid adding new unnecessary indirections).
>
> Also add a trivial bridge_to_dummy_bridge() just like many drivers do.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> This patch was added in v8.
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 95
> +++++++++++++++++++--------------
>  1 file changed, 55 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c
> b/drivers/gpu/drm/tests/drm_bridge_test.c
> index
> ff88ec2e911c9cc9a718483f09d4c764f45f991a..f3a625c536f610dc8560b56531056df=
7c613f564
> 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -10,31 +10,45 @@
>
>  #include <kunit/test.h>
>
> +/*
> + * Mimick the typical struct defined by a bridge driver, which embeds a
> + * bridge plus other fields.
> + *
> + * Having at least one member before @bridge ensures we test non-zero
> + * @bridge offset.
> + */
> +struct dummy_drm_bridge {
> +       unsigned int enable_count;
> +       unsigned int disable_count;
> +       struct drm_bridge bridge;
> +};
> +
>  struct drm_bridge_init_priv {
>         struct drm_device drm;
>         struct drm_plane *plane;
>         struct drm_crtc *crtc;
>         struct drm_encoder encoder;
> -       struct drm_bridge bridge;
> +       struct dummy_drm_bridge *test_bridge;
>         struct drm_connector *connector;
> -       unsigned int enable_count;
> -       unsigned int disable_count;
>  };
>
> +static struct dummy_drm_bridge *bridge_to_dummy_bridge(struct drm_bridge
> *bridge)
> +{
> +       return container_of(bridge, struct dummy_drm_bridge, bridge);
> +}
> +
>  static void drm_test_bridge_enable(struct drm_bridge *bridge)
>  {
> -       struct drm_bridge_init_priv *priv =3D
> -               container_of(bridge, struct drm_bridge_init_priv, bridge)=
;
> +       struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(brid=
ge);
>
> -       priv->enable_count++;
> +       dummy_br->enable_count++;
>  }
>
>  static void drm_test_bridge_disable(struct drm_bridge *bridge)
>  {
> -       struct drm_bridge_init_priv *priv =3D
> -               container_of(bridge, struct drm_bridge_init_priv, bridge)=
;
> +       struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(brid=
ge);
>
> -       priv->disable_count++;
> +       dummy_br->disable_count++;
>  }
>
>  static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs =3D {
> @@ -45,19 +59,17 @@ static const struct drm_bridge_funcs
> drm_test_bridge_legacy_funcs =3D {
>  static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,
>                                           struct drm_atomic_state *state)
>  {
> -       struct drm_bridge_init_priv *priv =3D
> -               container_of(bridge, struct drm_bridge_init_priv, bridge)=
;
> +       struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(brid=
ge);
>
> -       priv->enable_count++;
> +       dummy_br->enable_count++;
>  }
>
>  static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,
>                                            struct drm_atomic_state *state=
)
>  {
> -       struct drm_bridge_init_priv *priv =3D
> -               container_of(bridge, struct drm_bridge_init_priv, bridge)=
;
> +       struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(brid=
ge);
>
> -       priv->disable_count++;
> +       dummy_br->disable_count++;
>  }
>
>  static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs =3D {
> @@ -102,6 +114,10 @@ drm_test_bridge_init(struct kunit *test, const struc=
t
> drm_bridge_funcs *funcs)
>         if (IS_ERR(priv))
>                 return ERR_CAST(priv);
>
> +       priv->test_bridge =3D devm_drm_bridge_alloc(dev, struct
> dummy_drm_bridge, bridge, funcs);
> +       if (IS_ERR(priv->test_bridge))
> +               return ERR_CAST(priv->test_bridge);
> +
>         drm =3D &priv->drm;
>         priv->plane =3D drm_kunit_helper_create_primary_plane(test, drm,
>                                                             NULL,
> @@ -125,9 +141,8 @@ drm_test_bridge_init(struct kunit *test, const struct
> drm_bridge_funcs *funcs)
>
>         enc->possible_crtcs =3D drm_crtc_mask(priv->crtc);
>
> -       bridge =3D &priv->bridge;
> +       bridge =3D &priv->test_bridge->bridge;
>         bridge->type =3D DRM_MODE_CONNECTOR_VIRTUAL;
> -       bridge->funcs =3D funcs;
>
>         ret =3D drm_kunit_bridge_add(test, bridge);
>         if (ret)
> @@ -173,7 +188,7 @@ static void
> drm_test_drm_bridge_get_current_state_atomic(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>
>  retry_commit:
> -       bridge =3D &priv->bridge;
> +       bridge =3D &priv->test_bridge->bridge;
>         bridge_state =3D drm_atomic_get_bridge_state(state, bridge);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bridge_state);
>
> @@ -228,7 +243,7 @@ static void
> drm_test_drm_bridge_get_current_state_legacy(struct kunit *test)
>          * locking. The function would return NULL in all cases anyway,
>          * so we don't really have any concurrency to worry about.
>          */
> -       bridge =3D &priv->bridge;
> +       bridge =3D &priv->test_bridge->bridge;
>         KUNIT_EXPECT_NULL(test, drm_bridge_get_current_state(bridge));
>  }
>
> @@ -253,7 +268,7 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_atomic(struct kunit *test)
>         struct drm_modeset_acquire_ctx ctx;
>         struct drm_bridge_init_priv *priv;
>         struct drm_display_mode *mode;
> -       struct drm_bridge *bridge;
> +       struct dummy_drm_bridge *dummy_br;
>         int ret;
>
>         priv =3D drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs=
);
> @@ -279,14 +294,14 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_atomic(struct kunit *test)
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>
> -       bridge =3D &priv->bridge;
> -       KUNIT_ASSERT_EQ(test, priv->enable_count, 1);
> -       KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
> +       dummy_br =3D priv->test_bridge;
> +       KUNIT_ASSERT_EQ(test, dummy_br->enable_count, 1);
> +       KUNIT_ASSERT_EQ(test, dummy_br->disable_count, 0);
>
>         drm_modeset_acquire_init(&ctx, 0);
>
>  retry_reset:
> -       ret =3D drm_bridge_helper_reset_crtc(bridge, &ctx);
> +       ret =3D drm_bridge_helper_reset_crtc(&dummy_br->bridge, &ctx);
>         if (ret =3D=3D -EDEADLK) {
>                 drm_modeset_backoff(&ctx);
>                 goto retry_reset;
> @@ -296,8 +311,8 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_atomic(struct kunit *test)
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>
> -       KUNIT_EXPECT_EQ(test, priv->enable_count, 2);
> -       KUNIT_EXPECT_EQ(test, priv->disable_count, 1);
> +       KUNIT_EXPECT_EQ(test, dummy_br->enable_count, 2);
> +       KUNIT_EXPECT_EQ(test, dummy_br->disable_count, 1);
>  }
>
>  /*
> @@ -309,7 +324,7 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_atomic_disabled(struct kunit *
>         struct drm_modeset_acquire_ctx ctx;
>         struct drm_bridge_init_priv *priv;
>         struct drm_display_mode *mode;
> -       struct drm_bridge *bridge;
> +       struct dummy_drm_bridge *dummy_br;
>         int ret;
>
>         priv =3D drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs=
);
> @@ -318,14 +333,14 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_atomic_disabled(struct kunit *
>         mode =3D drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16=
);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
>
> -       bridge =3D &priv->bridge;
> -       KUNIT_ASSERT_EQ(test, priv->enable_count, 0);
> -       KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
> +       dummy_br =3D priv->test_bridge;
> +       KUNIT_ASSERT_EQ(test, dummy_br->enable_count, 0);
> +       KUNIT_ASSERT_EQ(test, dummy_br->disable_count, 0);
>
>         drm_modeset_acquire_init(&ctx, 0);
>
>  retry_reset:
> -       ret =3D drm_bridge_helper_reset_crtc(bridge, &ctx);
> +       ret =3D drm_bridge_helper_reset_crtc(&dummy_br->bridge, &ctx);
>         if (ret =3D=3D -EDEADLK) {
>                 drm_modeset_backoff(&ctx);
>                 goto retry_reset;
> @@ -335,8 +350,8 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_atomic_disabled(struct kunit *
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>
> -       KUNIT_EXPECT_EQ(test, priv->enable_count, 0);
> -       KUNIT_EXPECT_EQ(test, priv->disable_count, 0);
> +       KUNIT_EXPECT_EQ(test, dummy_br->enable_count, 0);
> +       KUNIT_EXPECT_EQ(test, dummy_br->disable_count, 0);
>  }
>
>  /*
> @@ -348,7 +363,7 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
>         struct drm_modeset_acquire_ctx ctx;
>         struct drm_bridge_init_priv *priv;
>         struct drm_display_mode *mode;
> -       struct drm_bridge *bridge;
> +       struct dummy_drm_bridge *dummy_br;
>         int ret;
>
>         priv =3D drm_test_bridge_init(test, &drm_test_bridge_legacy_funcs=
);
> @@ -374,14 +389,14 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>
> -       bridge =3D &priv->bridge;
> -       KUNIT_ASSERT_EQ(test, priv->enable_count, 1);
> -       KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
> +       dummy_br =3D priv->test_bridge;
> +       KUNIT_ASSERT_EQ(test, dummy_br->enable_count, 1);
> +       KUNIT_ASSERT_EQ(test, dummy_br->disable_count, 0);
>
>         drm_modeset_acquire_init(&ctx, 0);
>
>  retry_reset:
> -       ret =3D drm_bridge_helper_reset_crtc(bridge, &ctx);
> +       ret =3D drm_bridge_helper_reset_crtc(&dummy_br->bridge, &ctx);
>         if (ret =3D=3D -EDEADLK) {
>                 drm_modeset_backoff(&ctx);
>                 goto retry_reset;
> @@ -391,8 +406,8 @@ static void
> drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>
> -       KUNIT_EXPECT_EQ(test, priv->enable_count, 2);
> -       KUNIT_EXPECT_EQ(test, priv->disable_count, 1);
> +       KUNIT_EXPECT_EQ(test, dummy_br->enable_count, 2);
> +       KUNIT_EXPECT_EQ(test, dummy_br->disable_count, 1);
>  }
>
>  static struct kunit_case drm_bridge_helper_reset_crtc_tests[] =3D {
>
> --
> 2.49.0
>
>

--00000000000048405a06363ac5f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 16,=
 2025 at 12:48=E2=80=AFPM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli=
@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Use the new DRM bridge allocation AP=
I, which is the only supported now, for<br>
the kunit tests.<br>
<br>
This change is more massive than for the typical DRM bridge driver because<=
br>
struct drm_bridge_init_priv currently embeds a struct drm_bridge, which is<=
br>
not supported anymore. We new have to use devm_drm_bridge_alloc() to<br></b=
lockquote><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 typo ^^^s/new/now.</div><div><br></div><div>Thanks,</d=
iv><div>Anusha</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
dynamically allocate a &quot;private driver struct&quot;, which is a bit aw=
kward here<br>
because there is no real bridge driver. Thus let&#39;s add a &quot;dummy&qu=
ot; DRM bridge<br>
struct to represent it.<br>
<br>
As a nice cleanup we can now move the enable_count and disable_count<br>
members, which are counting bridge-specific events, into the new &quot;priv=
ate<br>
driver struct&quot; (and avoid adding new unnecessary indirections).<br>
<br>
Also add a trivial bridge_to_dummy_bridge() just like many drivers do.<br>
<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
---<br>
<br>
This patch was added in v8.<br>
---<br>
=C2=A0drivers/gpu/drm/tests/drm_bridge_test.c | 95 +++++++++++++++++++-----=
---------<br>
=C2=A01 file changed, 55 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/test=
s/drm_bridge_test.c<br>
index ff88ec2e911c9cc9a718483f09d4c764f45f991a..f3a625c536f610dc8560b565310=
56df7c613f564 100644<br>
--- a/drivers/gpu/drm/tests/drm_bridge_test.c<br>
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c<br>
@@ -10,31 +10,45 @@<br>
<br>
=C2=A0#include &lt;kunit/test.h&gt;<br>
<br>
+/*<br>
+ * Mimick the typical struct defined by a bridge driver, which embeds a<br=
>
+ * bridge plus other fields.<br>
+ *<br>
+ * Having at least one member before @bridge ensures we test non-zero<br>
+ * @bridge offset.<br>
+ */<br>
+struct dummy_drm_bridge {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int enable_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int disable_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge bridge;<br>
+};<br>
+<br>
=C2=A0struct drm_bridge_init_priv {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_device drm;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_plane *plane;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc *crtc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_encoder encoder;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *test_bridge;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_connector *connector;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int enable_count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int disable_count;<br>
=C2=A0};<br>
<br>
+static struct dummy_drm_bridge *bridge_to_dummy_bridge(struct drm_bridge *=
bridge)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(bridge, struct dummy_drm_br=
idge, bridge);<br>
+}<br>
+<br>
=C2=A0static void drm_test_bridge_enable(struct drm_bridge *bridge)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge_init_priv *priv =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(bridge=
, struct drm_bridge_init_priv, bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br =3D bridge_to=
_dummy_bridge(bridge);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;enable_count++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br-&gt;enable_count++;<br>
=C2=A0}<br>
<br>
=C2=A0static void drm_test_bridge_disable(struct drm_bridge *bridge)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge_init_priv *priv =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(bridge=
, struct drm_bridge_init_priv, bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br =3D bridge_to=
_dummy_bridge(bridge);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;disable_count++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br-&gt;disable_count++;<br>
=C2=A0}<br>
<br>
=C2=A0static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs =3D=
 {<br>
@@ -45,19 +59,17 @@ static const struct drm_bridge_funcs drm_test_bridge_le=
gacy_funcs =3D {<br>
=C2=A0static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct drm_atomic_state *state)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge_init_priv *priv =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(bridge=
, struct drm_bridge_init_priv, bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br =3D bridge_to=
_dummy_bridge(bridge);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;enable_count++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br-&gt;enable_count++;<br>
=C2=A0}<br>
<br>
=C2=A0static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct drm_atomic_state *state)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge_init_priv *priv =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(bridge=
, struct drm_bridge_init_priv, bridge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br =3D bridge_to=
_dummy_bridge(bridge);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;disable_count++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br-&gt;disable_count++;<br>
=C2=A0}<br>
<br>
=C2=A0static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs =3D=
 {<br>
@@ -102,6 +114,10 @@ drm_test_bridge_init(struct kunit *test, const struct =
drm_bridge_funcs *funcs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(priv))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_CAST(pri=
v);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;test_bridge =3D devm_drm_bridge_alloc(=
dev, struct dummy_drm_bridge, bridge, funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;test_bridge))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_CAST(pri=
v-&gt;test_bridge);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm =3D &amp;priv-&gt;drm;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;plane =3D drm_kunit_helper_create_prim=
ary_plane(test, drm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
@@ -125,9 +141,8 @@ drm_test_bridge_init(struct kunit *test, const struct d=
rm_bridge_funcs *funcs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enc-&gt;possible_crtcs =3D drm_crtc_mask(priv-&=
gt;crtc);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;test_bridge-&gt;bridge=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge-&gt;type =3D DRM_MODE_CONNECTOR_VIRTUAL;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge-&gt;funcs =3D funcs;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D drm_kunit_bridge_add(test, bridge);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
@@ -173,7 +188,7 @@ static void drm_test_drm_bridge_get_current_state_atomi=
c(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);<br>
<br>
=C2=A0retry_commit:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;test_bridge-&gt;bridge=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge_state =3D drm_atomic_get_bridge_state(st=
ate, bridge);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bridge_state=
);<br>
<br>
@@ -228,7 +243,7 @@ static void drm_test_drm_bridge_get_current_state_legac=
y(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* locking. The function would return NULL=
 in all cases anyway,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so we don&#39;t really have any concurr=
ency to worry about.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;test_bridge-&gt;bridge=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_EXPECT_NULL(test, drm_bridge_get_current_=
state(bridge));<br>
=C2=A0}<br>
<br>
@@ -253,7 +268,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomi=
c(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_modeset_acquire_ctx ctx;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_init_priv *priv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *mode;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge *bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D drm_test_bridge_init(test, &amp;drm_te=
st_bridge_atomic_funcs);<br>
@@ -279,14 +294,14 @@ static void drm_test_drm_bridge_helper_reset_crtc_ato=
mic(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_drop_locks(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_fini(&amp;ctx);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;bridge;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, priv-&gt;enable_count, 1)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, priv-&gt;disable_count, 0=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br =3D priv-&gt;test_bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, dummy_br-&gt;enable_count=
, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, dummy_br-&gt;disable_coun=
t, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_init(&amp;ctx, 0);<br>
<br>
=C2=A0retry_reset:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_bridge_helper_reset_crtc(bridge, &a=
mp;ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_bridge_helper_reset_crtc(&amp;dummy=
_br-&gt;bridge, &amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -EDEADLK) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_backoff=
(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto retry_reset;<b=
r>
@@ -296,8 +311,8 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomi=
c(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_drop_locks(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_fini(&amp;ctx);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, priv-&gt;enable_count, 2)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, priv-&gt;disable_count, 1=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, dummy_br-&gt;enable_count=
, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, dummy_br-&gt;disable_coun=
t, 1);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -309,7 +324,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomi=
c_disabled(struct kunit *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_modeset_acquire_ctx ctx;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_init_priv *priv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *mode;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge *bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D drm_test_bridge_init(test, &amp;drm_te=
st_bridge_atomic_funcs);<br>
@@ -318,14 +333,14 @@ static void drm_test_drm_bridge_helper_reset_crtc_ato=
mic_disabled(struct kunit *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D drm_kunit_display_mode_from_cea_vic(te=
st, &amp;priv-&gt;drm, 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;bridge;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, priv-&gt;enable_count, 0)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, priv-&gt;disable_count, 0=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br =3D priv-&gt;test_bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, dummy_br-&gt;enable_count=
, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, dummy_br-&gt;disable_coun=
t, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_init(&amp;ctx, 0);<br>
<br>
=C2=A0retry_reset:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_bridge_helper_reset_crtc(bridge, &a=
mp;ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_bridge_helper_reset_crtc(&amp;dummy=
_br-&gt;bridge, &amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -EDEADLK) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_backoff=
(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto retry_reset;<b=
r>
@@ -335,8 +350,8 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomi=
c_disabled(struct kunit *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_drop_locks(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_fini(&amp;ctx);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, priv-&gt;enable_count, 0)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, priv-&gt;disable_count, 0=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, dummy_br-&gt;enable_count=
, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, dummy_br-&gt;disable_coun=
t, 0);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -348,7 +363,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_legac=
y(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_modeset_acquire_ctx ctx;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge_init_priv *priv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *mode;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge *bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dummy_drm_bridge *dummy_br;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D drm_test_bridge_init(test, &amp;drm_te=
st_bridge_legacy_funcs);<br>
@@ -374,14 +389,14 @@ static void drm_test_drm_bridge_helper_reset_crtc_leg=
acy(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_drop_locks(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_fini(&amp;ctx);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &amp;priv-&gt;bridge;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, priv-&gt;enable_count, 1)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, priv-&gt;disable_count, 0=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_br =3D priv-&gt;test_bridge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, dummy_br-&gt;enable_count=
, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_EQ(test, dummy_br-&gt;disable_coun=
t, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_init(&amp;ctx, 0);<br>
<br>
=C2=A0retry_reset:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_bridge_helper_reset_crtc(bridge, &a=
mp;ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_bridge_helper_reset_crtc(&amp;dummy=
_br-&gt;bridge, &amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -EDEADLK) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_backoff=
(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto retry_reset;<b=
r>
@@ -391,8 +406,8 @@ static void drm_test_drm_bridge_helper_reset_crtc_legac=
y(struct kunit *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_drop_locks(&amp;ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_acquire_fini(&amp;ctx);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, priv-&gt;enable_count, 2)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, priv-&gt;disable_count, 1=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, dummy_br-&gt;enable_count=
, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, dummy_br-&gt;disable_coun=
t, 1);<br>
=C2=A0}<br>
<br>
=C2=A0static struct kunit_case drm_bridge_helper_reset_crtc_tests[] =3D {<b=
r>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000048405a06363ac5f1--

