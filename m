Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC98ACB9C03
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 21:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18ED10E95B;
	Fri, 12 Dec 2025 20:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SCQuO5U0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EEF10E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:18:51 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so253422066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1765570730; x=1766175530;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCv54qW0KKcBepyPWtlLT0Q9L88xUQ1t9xIHiEE0Kyk=;
 b=SCQuO5U0EACKQm4+z1ACrNLxm3n9fe/p6JAaddPDKO1CIJ+lapsCziCCTFSY+flfuO
 O03luTSlJw7uwMPi8IKwYJvbmbnlesfsW1ff1b58iDWJDObi5Ha6fdnOYwtngT7ThMv9
 pbS/34aQEFDSuqXjytnyl5eQ62tV4h8MGYXmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765570730; x=1766175530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wCv54qW0KKcBepyPWtlLT0Q9L88xUQ1t9xIHiEE0Kyk=;
 b=Ks3s12UMvJTK+/ZuXoaQuSVxHlzt3lCDX4nJ/PFvpQbtKAYD2e9tonsOnUntWOssXg
 mdH5z5EXU8oPDBPFauz/2H7WJqMGMMCCqQt0dVII7T2L57pYjQOqh05qB0zfWJ8RHSpB
 HWABE8cr20saiGPREIohmaHAOGNqqhqbqmKgrv6EUCZZLk5DjQsHiwTcALbhkAdkiqSV
 8iNpBlhf4nBTNe/Ch0/iZJOvEbLJykIX2F4wD7Zta2jAovPT/nkELra4GFh4nZvHkOr9
 G3hKaYmmXNOWeCLZZwpdFmCJ9oXP3JGtDbr8SUlC62l9jLhb2T3dYaUVP261nom90NDk
 RQfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkVWxpL6SePx1UFaf+TAcPQBtyreU2pm1AnSPcudIxiWpfqP0pa/KWIxpze5C0UNF3yMdAvZrht5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCN2T54/JNC4n+OYmoCMXNCSGpMj6faS3Ys6Tj3BlAhknd0YwZ
 P1Nvo2bWWv61OjxeFY+owagEAjicYiP/0YKW6nxCJiqF5jB2cjpFXtpBdfLCrZYyKJKTYHQduOG
 CyuWHyA==
X-Gm-Gg: AY/fxX6qxIn5WrUXPFkNoDk1Og20zIU7onnwH+c/w/cV895qmUF47hDaMvtw9sMuhmP
 NkDvxkQBIbcHOHungP8whhSkmWc6MHm8EWGuRuEb/KTaT+VCOMke9pSZ7wNdvO/XB7oS7nrJCTV
 TE9WtiGQLGrcF5NbiIuAfhrLyEimtnDEA1epturTTWy38hHEtTtGRl0XoqQzKWnqqda6BroXSQF
 AhG47eGFxxGBVe05vj+s6wQPep0QjPVhYKg62kMGL8H2fUS/RWbU4S78XK2b+7/bpSzOb66HpjN
 BwOroZG8R1OBzIvn75LCXTI6y3cvefbrygYlHll46QFQois64BVyHNImYFY6WyU3Ybsno/MoN21
 VE2ZtrkKOZWGgcGMkbxwhtFIAS5m0phHEYAqV8AzYiAmfZ0wa/HA6rJW4wSZV+2dXrOssTjXE5B
 ZPQu808A0mXEDt9mGIyPjaFQHJi/BrJovaghIbe6TB5mscoZLfMMLipkrHeHzf
X-Google-Smtp-Source: AGHT+IFBjJ1R425FRNGhTayiPKBPPlqeG+mDDmf62f819Uv/Tbzr3Df6I4MrHgNegVhp5yXsnoSAdg==
X-Received: by 2002:a17:906:c110:b0:b72:77c7:d8ad with SMTP id
 a640c23a62f3a-b7d238cefa7mr324429366b.35.1765570729860; 
 Fri, 12 Dec 2025 12:18:49 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa57192bsm655885966b.53.2025.12.12.12.18.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 12:18:47 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b770f4accc0so279503166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:18:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWyDg+JU7vAAH0UeCYNtjudm9ZUcjeR1v2jyYjulZBx2r7kVcqvP48etq0q01niYNMs076xioJIpCM=@lists.freedesktop.org
X-Received: by 2002:a17:907:7fa4:b0:b76:d734:d459 with SMTP id
 a640c23a62f3a-b7d23aa5743mr379959366b.57.1765570724535; Fri, 12 Dec 2025
 12:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20251204082659.84387-1-amin.gattout@gmail.com>
 <20251212183726.103480-1-amin.gattout@gmail.com>
In-Reply-To: <20251212183726.103480-1-amin.gattout@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 Dec 2025 12:18:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ub2xYsLcOzL2_AQ+JreWVVd2F1n+meL1NH7ztC1=jZmw@mail.gmail.com>
X-Gm-Features: AQt7F2o0BZH8hEkOsJpzZduTOzO-2RdS9mIbIiL4AN6AC_C2h_PLuxjjCZHpdPo
Message-ID: <CAD=FV=Ub2xYsLcOzL2_AQ+JreWVVd2F1n+meL1NH7ztC1=jZmw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: otm8009a: Switch to mipi_dsi_multi_context
 helpers
To: Amin GATTOUT <amin.gattout@gmail.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
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

On Fri, Dec 12, 2025 at 10:37=E2=80=AFAM Amin GATTOUT <amin.gattout@gmail.c=
om> wrote:
>
> Update the driver to use the non-deprecated mipi_dsi_*_multi()
> helpers, as recommended in Documentation/gpu/todo.rst. The multi
> variants provide proper error accumulation and handle the required
> DCS NOP insertions, which suits the OTM8009A command sequences.
>
> Refactor otm8009a_dcs_write_buf() and the dcs_write_seq/dcs_write_cmd_at
> macros to take a mipi_dsi_multi_context pointer, passing it through
> from callers. This ensures consistent error handling throughout the
> driver.
>
> Replace all mdelay() and msleep() calls within DSI command sequences
> with mipi_dsi_msleep() for proper error accumulation.
>
> The init, disable, and backlight update paths now return dsi_ctx.accum_er=
r,
> ensuring errors are propagated to callers.
>
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>  .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 171 ++++++++----------
>  1 file changed, 74 insertions(+), 97 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/g=
pu/drm/panel/panel-orisetech-otm8009a.c
> index a0f58c3b73f6..1388e292fb60 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -109,13 +109,10 @@ static inline struct otm8009a *panel_to_otm8009a(st=
ruct drm_panel *panel)
>         return container_of(panel, struct otm8009a, panel);
>  }
>
> -static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *dat=
a,
> +static void otm8009a_dcs_write_buf(struct mipi_dsi_multi_context *dsi_ct=
x, const void *data,
>                                    size_t len)
>  {
> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -
> -       if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
> -               dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, data, len);
>  }

This looks really good now, though a nit. The function
otm8009a_dcs_write_buf() provides no value now. Delete it and have
callers just call mipi_dsi_dcs_write_buffer_multi() directly.

Oh, and I guess dcs_write_seq() also becomes pointless and can be
removed? dcs_write_cmd_at() would just become this, I think:

#define dcs_write_cmd_at(ctx, cmd, seq...) \
({ \
  mipi_dsi_dcs_write_seq_multi(ctx, MCS_ADRSFT, (cmd) & 0xFF); \
  mipi_dsi_dcs_write_seq_multi(ctx, (cmd) >> 8, seq); \
})

-Doug

On Fri, Dec 12, 2025 at 10:37=E2=80=AFAM Amin GATTOUT <amin.gattout@gmail.c=
om> wrote:
>
> Update the driver to use the non-deprecated mipi_dsi_*_multi()
> helpers, as recommended in Documentation/gpu/todo.rst. The multi
> variants provide proper error accumulation and handle the required
> DCS NOP insertions, which suits the OTM8009A command sequences.
>
> Refactor otm8009a_dcs_write_buf() and the dcs_write_seq/dcs_write_cmd_at
> macros to take a mipi_dsi_multi_context pointer, passing it through
> from callers. This ensures consistent error handling throughout the
> driver.
>
> Replace all mdelay() and msleep() calls within DSI command sequences
> with mipi_dsi_msleep() for proper error accumulation.
>
> The init, disable, and backlight update paths now return dsi_ctx.accum_er=
r,
> ensuring errors are propagated to callers.
>
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>  .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 171 ++++++++----------
>  1 file changed, 74 insertions(+), 97 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/g=
pu/drm/panel/panel-orisetech-otm8009a.c
> index a0f58c3b73f6..1388e292fb60 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -109,13 +109,10 @@ static inline struct otm8009a *panel_to_otm8009a(st=
ruct drm_panel *panel)
>         return container_of(panel, struct otm8009a, panel);
>  }
>
> -static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *dat=
a,
> +static void otm8009a_dcs_write_buf(struct mipi_dsi_multi_context *dsi_ct=
x, const void *data,
>                                    size_t len)
>  {
> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -
> -       if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
> -               dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, data, len);
>  }
>
>  #define dcs_write_seq(ctx, seq...)                     \
> @@ -133,153 +130,131 @@ static void otm8009a_dcs_write_buf(struct otm8009=
a *ctx, const void *data,
>  static int otm8009a_init_sequence(struct otm8009a *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         /* Enter CMD2 */
> -       dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
>
>         /* Enter Orise Command2 */
> -       dcs_write_cmd_at(ctx, MCS_CMD2_ENA2, 0x80, 0x09);
> -
> -       dcs_write_cmd_at(ctx, MCS_SD_PCH_CTRL, 0x30);
> -       mdelay(10);
> -
> -       dcs_write_cmd_at(ctx, MCS_NO_DOC1, 0x40);
> -       mdelay(10);
> -
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL4 + 1, 0xA9);
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 1, 0x34);
> -       dcs_write_cmd_at(ctx, MCS_P_DRV_M, 0x50);
> -       dcs_write_cmd_at(ctx, MCS_VCOMDC, 0x4E);
> -       dcs_write_cmd_at(ctx, MCS_OSC_ADJ, 0x66); /* 65Hz */
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 2, 0x01);
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 5, 0x34);
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 4, 0x33);
> -       dcs_write_cmd_at(ctx, MCS_GVDDSET, 0x79, 0x79);
> -       dcs_write_cmd_at(ctx, MCS_SD_CTRL + 1, 0x1B);
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL1 + 2, 0x83);
> -       dcs_write_cmd_at(ctx, MCS_SD_PCH_CTRL + 1, 0x83);
> -       dcs_write_cmd_at(ctx, MCS_RGB_VID_SET, 0x0E);
> -       dcs_write_cmd_at(ctx, MCS_PANSET, 0x00, 0x01);
> -
> -       dcs_write_cmd_at(ctx, MCS_GOAVST, 0x85, 0x01, 0x00, 0x84, 0x01, 0=
x00);
> -       dcs_write_cmd_at(ctx, MCS_GOACLKA1, 0x18, 0x04, 0x03, 0x39, 0x00,=
 0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA2, 0x80, 0x09);
> +
> +       dcs_write_cmd_at(&dsi_ctx, MCS_SD_PCH_CTRL, 0x30);
> +       mipi_dsi_msleep(&dsi_ctx, 10);
> +
> +       dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC1, 0x40);
> +       mipi_dsi_msleep(&dsi_ctx, 10);
> +
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL4 + 1, 0xA9);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 1, 0x34);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_P_DRV_M, 0x50);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_VCOMDC, 0x4E);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_OSC_ADJ, 0x66); /* 65Hz */
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 2, 0x01);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 5, 0x34);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 4, 0x33);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GVDDSET, 0x79, 0x79);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_SD_CTRL + 1, 0x1B);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL1 + 2, 0x83);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_SD_PCH_CTRL + 1, 0x83);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_RGB_VID_SET, 0x0E);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANSET, 0x00, 0x01);
> +
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GOAVST, 0x85, 0x01, 0x00, 0x84, 0x=
01, 0x00);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GOACLKA1, 0x18, 0x04, 0x03, 0x39, =
0x00, 0x00,
>                          0x00, 0x18, 0x03, 0x03, 0x3A, 0x00, 0x00, 0x00);
> -       dcs_write_cmd_at(ctx, MCS_GOACLKA3, 0x18, 0x02, 0x03, 0x3B, 0x00,=
 0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GOACLKA3, 0x18, 0x02, 0x03, 0x3B, =
0x00, 0x00,
>                          0x00, 0x18, 0x01, 0x03, 0x3C, 0x00, 0x00, 0x00);
> -       dcs_write_cmd_at(ctx, MCS_GOAECLK, 0x01, 0x01, 0x20, 0x20, 0x00, =
0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GOAECLK, 0x01, 0x01, 0x20, 0x20, 0=
x00, 0x00,
>                          0x01, 0x02, 0x00, 0x00);
>
> -       dcs_write_cmd_at(ctx, MCS_NO_DOC2, 0x00);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC2, 0x00);
>
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET1, 0, 0, 0, 0, 0, 0, 0, 0, 0,=
 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET2, 0, 0, 0, 0, 0, 0, 0, 0, 0,=
 0,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET1, 0, 0, 0, 0, 0, 0, 0, =
0, 0, 0);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET2, 0, 0, 0, 0, 0, 0, 0, =
0, 0, 0,
>                          0, 0, 0, 0, 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET3, 0, 0, 0, 0, 0, 0, 0, 0, 0,=
 0,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET3, 0, 0, 0, 0, 0, 0, 0, =
0, 0, 0,
>                          0, 0, 0, 0, 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET4, 0, 0, 0, 0, 0, 0, 0, 0, 0,=
 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET5, 0, 4, 4, 4, 4, 4, 0, 0, 0,=
 0,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET4, 0, 0, 0, 0, 0, 0, 0, =
0, 0, 0);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET5, 0, 4, 4, 4, 4, 4, 0, =
0, 0, 0,
>                          0, 0, 0, 0, 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET6, 0, 0, 0, 0, 0, 0, 4, 4, 4,=
 4,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET6, 0, 0, 0, 0, 0, 0, 4, =
4, 4, 4,
>                          4, 0, 0, 0, 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET7, 0, 0, 0, 0, 0, 0, 0, 0, 0,=
 0);
> -       dcs_write_cmd_at(ctx, MCS_PANCTRLSET8, 0xFF, 0xFF, 0xFF, 0xFF, 0x=
FF,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET7, 0, 0, 0, 0, 0, 0, 0, =
0, 0, 0);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET8, 0xFF, 0xFF, 0xFF, 0xF=
F, 0xFF,
>                          0xFF, 0xFF, 0xFF, 0xFF, 0xFF);
>
> -       dcs_write_cmd_at(ctx, MCS_PANU2D1, 0x00, 0x26, 0x09, 0x0B, 0x01, =
0x25,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D1, 0x00, 0x26, 0x09, 0x0B, 0=
x01, 0x25,
>                          0x00, 0x00, 0x00, 0x00);
> -       dcs_write_cmd_at(ctx, MCS_PANU2D2, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D2, 0x00, 0x00, 0x00, 0x00, 0=
x00, 0x00,
>                          0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x0A, 0x0C, =
0x02);
> -       dcs_write_cmd_at(ctx, MCS_PANU2D3, 0x25, 0x00, 0x00, 0x00, 0x00, =
0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D3, 0x25, 0x00, 0x00, 0x00, 0=
x00, 0x00,
>                          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00);
> -       dcs_write_cmd_at(ctx, MCS_PAND2U1, 0x00, 0x25, 0x0C, 0x0A, 0x02, =
0x26,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U1, 0x00, 0x25, 0x0C, 0x0A, 0=
x02, 0x26,
>                          0x00, 0x00, 0x00, 0x00);
> -       dcs_write_cmd_at(ctx, MCS_PAND2U2, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U2, 0x00, 0x00, 0x00, 0x00, 0=
x00, 0x00,
>                          0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x0B, 0x09, =
0x01);
> -       dcs_write_cmd_at(ctx, MCS_PAND2U3, 0x26, 0x00, 0x00, 0x00, 0x00, =
0x00,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U3, 0x26, 0x00, 0x00, 0x00, 0=
x00, 0x00,
>                          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00);
>
> -       dcs_write_cmd_at(ctx, MCS_PWR_CTRL1 + 1, 0x66);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL1 + 1, 0x66);
>
> -       dcs_write_cmd_at(ctx, MCS_NO_DOC3, 0x06);
> +       dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC3, 0x06);
>
> -       dcs_write_cmd_at(ctx, MCS_GMCT2_2P, 0x00, 0x09, 0x0F, 0x0E, 0x07,=
 0x10,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GMCT2_2P, 0x00, 0x09, 0x0F, 0x0E, =
0x07, 0x10,
>                          0x0B, 0x0A, 0x04, 0x07, 0x0B, 0x08, 0x0F, 0x10, =
0x0A,
>                          0x01);
> -       dcs_write_cmd_at(ctx, MCS_GMCT2_2N, 0x00, 0x09, 0x0F, 0x0E, 0x07,=
 0x10,
> +       dcs_write_cmd_at(&dsi_ctx, MCS_GMCT2_2N, 0x00, 0x09, 0x0F, 0x0E, =
0x07, 0x10,
>                          0x0B, 0x0A, 0x04, 0x07, 0x0B, 0x08, 0x0F, 0x10, =
0x0A,
>                          0x01);
>
>         /* Exit CMD2 */
> -       dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
> -
> -       ret =3D mipi_dsi_dcs_nop(dsi);
> -       if (ret)
> -               return ret;
> +       dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_nop_multi(&dsi_ctx);
>
> -       /* Wait for sleep out exit */
> -       mdelay(120);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
>         /* Default portrait 480x800 rgb24 */
> -       dcs_write_seq(ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +       dcs_write_seq(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
>
> -       ret =3D mipi_dsi_dcs_set_column_address(dsi, 0, OTM8009A_HDISPLAY=
 - 1);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, OTM8009A_HDISP=
LAY - 1);
>
> -       ret =3D mipi_dsi_dcs_set_page_address(dsi, 0, OTM8009A_VDISPLAY -=
 1);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, OTM8009A_VDISPLA=
Y - 1);
>
>         /* See otm8009a driver documentation for pixel format description=
s */
> -       ret =3D mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24B=
IT |
> +       mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_=
24BIT |
>                                             MIPI_DCS_PIXEL_FMT_24BIT << 4=
);
> -       if (ret)
> -               return ret;
>
>         /* Disable CABC feature */
> -       dcs_write_seq(ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +       dcs_write_seq(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>
> -       ret =3D mipi_dsi_dcs_nop(dsi);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_nop_multi(&dsi_ctx);
>
>         /* Send Command GRAM memory write (no parameters) */
> -       dcs_write_seq(ctx, MIPI_DCS_WRITE_MEMORY_START);
> +       dcs_write_seq(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
>
>         /* Wait a short while to let the panel be ready before the 1st fr=
ame */
> -       mdelay(10);
> +       mipi_dsi_msleep(&dsi_ctx, 10);
>
> -       return 0;
> +       return dsi_ctx.accum_err;
>  }
>
>  static int otm8009a_disable(struct drm_panel *panel)
>  {
>         struct otm8009a *ctx =3D panel_to_otm8009a(panel);
>         struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         backlight_disable(ctx->bl_dev);
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> -       if (ret)
> -               return ret;
> -
> -       msleep(120);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
> -       return 0;
> +       return dsi_ctx.accum_err;
>  }
>
>  static int otm8009a_unprepare(struct drm_panel *panel)
> @@ -383,6 +358,8 @@ static const struct drm_panel_funcs otm8009a_drm_func=
s =3D {
>  static int otm8009a_backlight_update_status(struct backlight_device *bd)
>  {
>         struct otm8009a *ctx =3D bl_get_data(bd);
> +       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>         u8 data[2];
>
>         if (!ctx->prepared) {
> @@ -397,7 +374,7 @@ static int otm8009a_backlight_update_status(struct ba=
cklight_device *bd)
>                  */
>                 data[0] =3D MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
>                 data[1] =3D bd->props.brightness;
> -               otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
> +               otm8009a_dcs_write_buf(&dsi_ctx, data, ARRAY_SIZE(data));
>
>                 /* set Brightness Control & Backlight on */
>                 data[1] =3D 0x24;
> @@ -409,9 +386,9 @@ static int otm8009a_backlight_update_status(struct ba=
cklight_device *bd)
>
>         /* Update Brightness Control & Backlight */
>         data[0] =3D MIPI_DCS_WRITE_CONTROL_DISPLAY;
> -       otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
> +       otm8009a_dcs_write_buf(&dsi_ctx, data, ARRAY_SIZE(data));
>
> -       return 0;
> +       return dsi_ctx.accum_err;
>  }
>
>  static const struct backlight_ops otm8009a_backlight_ops =3D {
> --
> 2.43.0
>
