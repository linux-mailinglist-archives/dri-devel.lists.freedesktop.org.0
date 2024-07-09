Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2992AD1C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 02:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC4410E1E8;
	Tue,  9 Jul 2024 00:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="meIKFhgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BD110E1E8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 00:28:08 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6b5e6eded83so24052466d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 17:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720484885; x=1721089685;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYM3zw5Ilnu3cOqCw9QUJr0rFrT7FZCvEIIlOa+MUGg=;
 b=meIKFhgH5GeXIs1joVRZdj5Td0tHEWFccBh+Mcx7fTBZAOMqL08PKPJWa0clRlJkMj
 CUFGC3kq1hHTvV4O7EB+WX1pJaD7PZhtPhRXX1OYbRtVVyEnFjqSqyoWChQE+jy56awf
 iIU4StelOnbJq9yvYfrtECIN2uVvUgBxcXjO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720484885; x=1721089685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYM3zw5Ilnu3cOqCw9QUJr0rFrT7FZCvEIIlOa+MUGg=;
 b=tkLdk/yhjgZzmjlguxQ+Gby184WQ1yPmZVSOnnHxpXx54uvsyXgWfDc5l3jmDEOxk8
 xBMY0bI6/VnCPCf/rN7cJAO+uemDiW3PWbLgEkutalGqdKCH0Om/IWpfQNprSN6oPLRw
 XBPPHCo1sv5ONtZ8CIFanRZZCLz9P63e4E7RCt+x9PMrcr3fTrstSq0B4US0/sLK9u+q
 gbLZIxtuCowDSqgDkkNh5n9skYDvQAEgK0WXc3F4m8yxdLrtdhirUXlHIdcclg8vn9g/
 /6ePr1nVtSKOI2RZHJ6ld1NnYNPv/b6hr+zOOEKWZfg2ivLugQxE6I/TovJhx2pzWoT+
 kZXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURBda0y+MUPkXRRuZOECxYTF31oV8c+63rejj3vvfsAwRbg7P8sGgJ2Izs7aG84rjyrG1PSBCrzOJHI54BzSCcnuZDdkpJalP0xmptxHnN
X-Gm-Message-State: AOJu0YyXpEWDEcqrrjgRJrulU8SIYAtzTBDgYkW5QVM1wuFU280GZUNT
 GgLdAa0AP55n+gttezkvx7R1Ya74ybGoz/5LGGlUgKa7hYBCUgM9v89TA6n2DcDwVH99lBzbv6w
 ACiB5
X-Google-Smtp-Source: AGHT+IHwlp3AuPg/XjmXltlvdsZsmb9jQ+DhtK2nUC9LYzoEWOhgIPayHCp8X8xGXPIYSakf36owNA==
X-Received: by 2002:a05:6214:c61:b0:6b5:2f57:1a5c with SMTP id
 6a1803df08f44-6b61c1f508emr15514176d6.59.1720484884886; 
 Mon, 08 Jul 2024 17:28:04 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61ba1587asm4170786d6.70.2024.07.08.17.28.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 17:28:04 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-44664ad946eso62731cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 17:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWADEhd1zGF04scOBk2tmmPCMUVDDNwXDDOrfjcl/Fz1bkrMSY1STGsRywSsmNupPX0yrC9A1YWt3vusa7iY+wS+yQowdB+6O2aeqaExM+p
X-Received: by 2002:ac8:7a83:0:b0:447:ed90:7396 with SMTP id
 d75a77b69052e-447fba65e4cmr1638641cf.24.1720484883356; Mon, 08 Jul 2024
 17:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240628182428.171031-1-tejasvipin76@gmail.com>
 <20240628182428.171031-3-tejasvipin76@gmail.com>
In-Reply-To: <20240628182428.171031-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 17:27:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=YJu-QS9qck-Q89UxwEEfitJHyk6-gGX7zCGNz9xF0w@mail.gmail.com>
Message-ID: <CAD=FV=U=YJu-QS9qck-Q89UxwEEfitJHyk6-gGX7zCGNz9xF0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: startek-kd070fhfid015: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Jun 28, 2024 at 11:25=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> @@ -52,92 +52,63 @@ static inline struct stk_panel *to_stk_panel(struct d=
rm_panel *panel)
>  static int stk_panel_init(struct stk_panel *stk)
>  {
>         struct mipi_dsi_device *dsi =3D stk->dsi;
> -       struct device *dev =3D &stk->dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D {.dsi =3D dsi};
>
> -       ret =3D mipi_dsi_dcs_soft_reset(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", r=
et);
> -               return ret;
> -       }
> -       mdelay(5);
> +       mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
> -               return ret;
> -       }
> -       msleep(120);
> +       if (!dsi_ctx.accum_err)
> +               mdelay(5);

I'm curious: why isn't the above just "mipi_dsi_msleep(5)" and get rid
of the "if" test?


> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>
> -       mipi_dsi_generic_write_seq(dsi, DSI_REG_MCAP, 0x04);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_MCAP, 0x04);
>
>         /* Interface setting, video mode */
> -       mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x2=
2, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, DSI_REG_IIS, 0x0C, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, DSI_REG_CTRL, 0x3A, 0xD3);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IS, 0x14, 0x08=
, 0x00, 0x22, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IIS, 0x0C, 0x0=
0);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_CTRL, 0x3A, 0x=
D3);

nit: While touching these lines, it'd be nice to transition them to
lower case hex (3a vs 3A).


> -       ret =3D mipi_dsi_dcs_set_display_brightness(dsi, 0x77);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to write display brightness: %d\n", =
ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x77);
>
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> -                              MIPI_DCS_WRITE_MEMORY_START);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DIS=
PLAY,
> +                                    MIPI_DCS_WRITE_MEMORY_START);
>
> -       ret =3D mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set pixel format: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
>
> -       ret =3D mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdispl=
ay - 1);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set column address: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, stk->mode->hdi=
splay - 1);
>
> -       ret =3D mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay=
 - 1);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set page address: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, stk->mode->vdisp=
lay - 1);

Nice to get rid of all of these special case "if" tests and error handling!=
 :-)

optional nit: it feels like there are two many blank lines separating
single line statements. Maybe get rid of a few of the blank lines?

>
> -       return 0;
> +       return dsi_ctx.accum_err;
>  }
>
>  static int stk_panel_on(struct stk_panel *stk)
>  {
>         struct mipi_dsi_device *dsi =3D stk->dsi;
> -       struct device *dev =3D &stk->dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D {.dsi =3D dsi};
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0)
> -               dev_err(dev, "failed to set display on: %d\n", ret);
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>
> -       mdelay(20);
> +       if (!dsi_ctx.accum_err)
> +               mdelay(20);

Like above, not sure why this isn't mipi_dsi_msleep(20).


-Doug
