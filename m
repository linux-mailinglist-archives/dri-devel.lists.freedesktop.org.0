Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE608CB4432
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 00:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701AD10E04E;
	Wed, 10 Dec 2025 23:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FsEF4YN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6642C10E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 23:32:26 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b73161849e1so96518366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 15:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1765409543; x=1766014343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfV6GAK5rnJX5U9OTlFbVcrhKFZzW2nDysDuwsdDTuE=;
 b=FsEF4YN8NqALgqVoFfMEJW+lVRhkM5QqJiykSvnYC4u6aYLPSOF7YCZ4ea4OdeeLym
 Fe+Oe0V2YoGfuDIaPxwSMexCFrO7/X84XK300PluRf6Iknka8/ZQu4Myyf6BfA/JVqJG
 08CqymvnHxNs/62ojV90BE6ow94RPW1LsG/24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765409543; x=1766014343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rfV6GAK5rnJX5U9OTlFbVcrhKFZzW2nDysDuwsdDTuE=;
 b=Goq1+odADDK9B+CLAXO6kP2JEbeUGa3sSTU7MLz+PwXSUyIjXxwtZagMguIAyy7v9t
 odanPN+j0kDIExk7iOENtUDvICFtepkPhR4PoxOsL2Cc6HJfI5yS2wp4MMMIP2Q1iwXs
 ruQQfFkOi0RUj7us3Okh/KjS99yC99rC+JUeFubQWoDB2RmGG7Cfoh2qFBuoECuyi52Q
 H1s9dUU3xPzJYkRr9cdwBfTiMVfbJxJt62ocTeDFcVjYsNTvMTCPNq+sQJeN1XKV3MzQ
 9504dipfZbxdFk2L7iDkX5SvFguLSZGYsqNVjUeyLYmXe5TnwpFaTgZT3bSb37kuQRtW
 WAJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxJI48xjCcHDOF4/2WLJcNAekNeRdsUK6GWgPDxEQwKm9JDoIf5+9bQuidTz1ICzvgdHHTw3yCLaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdKsLF6lhG8X/yyOHMcSmG431NRY9PAkdQ6viEH3npUaGi9Pe/
 SgEde16TZMhTDdBlZt6e6172Goy8f3E9o1nHfIhDB+JxLOJZM670lhN+14VbpZTmR2EbO0bHwaX
 YjkHKyQ==
X-Gm-Gg: ASbGncuIicjLNHLf1Ctf4vUU9DzkXacWLcLJqE65QsAq+0/WCm6XLz/Mqo1kwFU/jNP
 mQes58GdFhuU20WyacNmzQW0z7uiJ3kLChUbZ24BMmhhPk3NRB/7727eQ3Quh2+tL+ZS/GwpIDt
 jDaQ4/VVf379Cpjm+pV2Y2Xg6Agqmj/t9o2zD4wl9dFAtA+0o6XZt1p48n+Vf1eRCWxwIOrn2qN
 rOA8qDhM/65KNhfmHyCBjcJNzl+jC4zzO1GaAXlXUNmvBYGUR/2M7Z4RfPbj0UNa0h+CQnwgSvN
 9j8onubXRFZ+RgtVorlwe3Kqmcukxiu5Dqeekn2wVFlKJh4nU6I9zzJ6R0EzYWZZhNGoeWTPtQx
 jFwEM2xjhWCpDBhOJt9/HcxTRXth0uQwuRm+4y36wB5WNjUvOG+xeIxPNTBRC7J873eUedR9ycO
 1NbhAgOudHtIzyUPpVztlQV4DLPMGDJXVb3+G5VGi8F7fG90rXbA==
X-Google-Smtp-Source: AGHT+IESBKHow6RcvfSXxim81k8UZqTVTutrXBm5oJEnEg0iabu8fHkTsgTM3N2fmPAOwvvRD/ZpaQ==
X-Received: by 2002:a17:906:c105:b0:b79:e4db:2e9 with SMTP id
 a640c23a62f3a-b7ce84c0ab1mr469961866b.60.1765409542988; 
 Wed, 10 Dec 2025 15:32:22 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm84627766b.67.2025.12.10.15.32.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 15:32:21 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42e2b80ab25so101931f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 15:32:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVA/zCnx6v18ik72eRTAkUFhTCNMtnH64Y6Sct4vFa5pXBP2gtbj/dTWJfY8CQzeNQZHrkuIqB23ps=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2dc6:b0:42f:9faf:4170 with SMTP id
 ffacd0b85a97d-42fa3af8948mr4247172f8f.31.1765409541286; Wed, 10 Dec 2025
 15:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20251204082659.84387-1-amin.gattout@gmail.com>
In-Reply-To: <20251204082659.84387-1-amin.gattout@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Dec 2025 15:32:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4WVHY_1kuXu9V+8j7aLUisFp5kxDjpxkEG=u-_T4zvA@mail.gmail.com>
X-Gm-Features: AQt7F2p3cSzdgl3XOnh_tfKhwmtIlFwnEvlRkFr9yLlqXsoZoJxMrmXfUXquVFw
Message-ID: <CAD=FV=X4WVHY_1kuXu9V+8j7aLUisFp5kxDjpxkEG=u-_T4zvA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: otm8009a: Switch to mipi_dsi_multi_context
 helpers
To: Amin GATTOUT <amin.gattout@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Hi,

On Thu, Dec 4, 2025 at 12:27=E2=80=AFAM Amin GATTOUT <amin.gattout@gmail.co=
m> wrote:
>
> Update the driver to use the non-deprecated mipi_dsi_*_multi()
> helpers, as recommended in Documentation/gpu/todo.rst. The multi
> variants provide proper error accumulation and handle the required
> DCS NOP insertions, which suits the OTM8009A command sequences.
>
> The init and disable paths now return dsi_ctx.accum_err, ensuring
> errors are propagated to callers.
>
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>  .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 56 ++++++-------------
>  1 file changed, 17 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/g=
pu/drm/panel/panel-orisetech-otm8009a.c
> index a0f58c3b73f6..fe31f508efd6 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -113,9 +113,9 @@ static void otm8009a_dcs_write_buf(struct otm8009a *c=
tx, const void *data,
>                                    size_t len)
>  {
>         struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
> -       if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
> -               dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
> +       mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, data, len);
>  }

IMO, otm8009a_dcs_write_buf() should be changed to take in the "struct
mipi_dsi_multi_context". Then it should be passed in all the way from
calliers. So dcs_write_seq() and dcs_write_cmd_at() should also take
the "struct mipi_dsi_multi_context" instead of a "struct otm8009a".

Once you do this, you'll also want to change more of the mdelay()
calls to mipi_dsi_msleep() or mipi_dsi_usleep_range().

-Doug
