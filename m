Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980309108E1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4FE10E26D;
	Thu, 20 Jun 2024 14:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SDlC6dVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F410E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:48:36 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6f9a7120d9dso512507a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718894914; x=1719499714;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udPUwwxJTUp+1+518tML1rd5QFoFHAkCj7rsrE7xC+c=;
 b=SDlC6dVT9sX48/jNDQyfltpxUrS5/Pq0+IgFj4stquoNuxkuNKEdKGmzOuCBoUYl3C
 PPDhCn0BOcQJoqndxOxwfe7x0aZvxdpIS8QxPjUlD1JmmcJSGVB6RDEK/7ksAcQ1s3bg
 bHQq+ijpFPRAxDNOs6yVuhK6XimRgXQbd3Vps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718894914; x=1719499714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udPUwwxJTUp+1+518tML1rd5QFoFHAkCj7rsrE7xC+c=;
 b=cJX2APb8SjO8VzJZjnz0lo2SEMbdEOtKFi2FMfHbxPuailQMt+X35m8jyRr4Ay0rMi
 vrxQB6gML1498ERBiN6uAP0dfQXoIX6EByg/G/5NPWs8q1/f50R4r2yygV1NrQjKhUHA
 as/PqnbyYQ5VY2R906m5wHF1pXbv4d/pJJIwQpbABQp0TfhModHxiqgB2T7F0Mc0mz06
 mfRvoVSTN+fZ4IhPAjxRYfTerKOJQ3aBz7qSdRuNE1sWnSPhROPLO6iGTu2KWpZ1gZ8k
 eZvSmH8lgaE4uE79+nbxGWpv6UXsJ5A4MU7kIAb+Ep5qg/CnWUF/bT0dlIoFaPIqA+K1
 F+OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNYM08xpsqIboSqp5apG8GpXkLW6GWcWYtOQPb5bZ0GMvTmn/xc7UKJyFW2+lfnYUQrGnFjZItxbGazYneKbvrLI8OqAcOQpfWdV6+357f
X-Gm-Message-State: AOJu0Yz0Wvq2BiLmq6gby5BUdfyRU0wCKQA9V8y/Zjau7ziftQaKMHUs
 uR8BrZaNiK+i2LHKOKhI6DduhtwWqCq050PljM/zfJS/59X0ypwnnnSojPTm8+MOunwi0yi+YvM
 =
X-Google-Smtp-Source: AGHT+IGd2yry29DQLRxdXWtYlq9EWvtzyU2cawfLX35AoqBpZUavs6CM0CXnQsgxo0DdbSiXGmnPnA==
X-Received: by 2002:a9d:68d5:0:b0:700:535a:ffd with SMTP id
 46e09a7af769-70075498c5bmr6008479a34.23.1718894913904; 
 Thu, 20 Jun 2024 07:48:33 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c1ff4fsm88955276d6.47.2024.06.20.07.48.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 07:48:33 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-443586c2091so872821cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5aQquxrQjBBTR8dQSwNFwKasoGwhVbBLYvUlSHE76NI+y3TGygSV2opBeiuNeVdZTc3v5IMydLvOpzdHGXzssaklKFaiqWB1hWHmMzHXv
X-Received: by 2002:a05:622a:4e0e:b0:444:ba78:c32c with SMTP id
 d75a77b69052e-444ba78c41fmr1825571cf.11.1718894912548; Thu, 20 Jun 2024
 07:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240619033351.230929-1-tejasvipin76@gmail.com>
In-Reply-To: <20240619033351.230929-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2024 07:48:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtL-Dq1gfdhmmHVJhWijE8pusKzf-x5TRe9a2KkXCcwg@mail.gmail.com>
Message-ID: <CAD=FV=WtL-Dq1gfdhmmHVJhWijE8pusKzf-x5TRe9a2KkXCcwg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
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

On Tue, Jun 18, 2024 at 8:34=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> raydium rm692e5 panel.

It should be noted in the patch notes that as part of this patch there
is a small functionality change which is arguably a bugfix.
Specifically if some of the initialization commands in
rm692e5_prepare() fail we'll now properly power the panel back off.

IMO it's not a big enough deal to add a "Fixes" line since it's
unlikely anyone is actually hitting this. If you want to add a Fixes
tag (or someone else feels strongly that there should be one), the
right way would probably to make this a 2-patch series and have _just_
the bugfix first and then have the conversion be a no-op.


> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Change rm692e5_on to return void and take mipi_dsi_multi_context
>       as an argument.
>     - Remove unnecessary warnings.
>     - More efficient error handling in rm692e5_prepare
>
> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gmail=
.com/
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 237 ++++++++----------
>  1 file changed, 99 insertions(+), 138 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/=
drm/panel/panel-raydium-rm692e5.c
> index 21d97f6b8a2f..9936bda61af2 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> @@ -40,176 +40,137 @@ static void rm692e5_reset(struct rm692e5_panel *ctx=
)
>         usleep_range(10000, 11000);
>  }
>
> -static int rm692e5_on(struct rm692e5_panel *ctx)
> +static void rm692e5_on(struct mipi_dsi_multi_context *dsi_ctx)
>  {
> -       struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       dsi_ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x41);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd6, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x16);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x8a, 0x87);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x71);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x82, 0x01);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc6, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc7, 0x2c);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc8, 0x64);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc9, 0x3c);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xca, 0x80);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xcb, 0x02);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xcc, 0x02);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x38);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0x13);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xf4);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x00, 0xff);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x01, 0xff);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x02, 0xcf);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x03, 0xbc);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x04, 0xb9);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x05, 0x99);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x06, 0x02);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x07, 0x0a);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x08, 0xe0);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x09, 0x4c);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0a, 0xeb);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0b, 0xe8);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0c, 0x32);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0x07);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xf4);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0xc0);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0e, 0xff);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0f, 0xff);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x10, 0x33);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x6f);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x12, 0x6e);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x13, 0xa6);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x14, 0x80);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x15, 0x02);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x16, 0x38);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x17, 0xd3);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0x3a);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x19, 0xba);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1a, 0xcc);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1b, 0x01);
> +
> +       mipi_dsi_dcs_nop_multi(dsi_ctx);
> +
> +       mipi_dsi_msleep(dsi_ctx, 32);
> +
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x38);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0x13);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xd1);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd3, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd0, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd2, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd4, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xb4, 0x01);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xf9);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x00, 0xaf);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1d, 0x37);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x44, 0x0a, 0x7b);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfa, 0x01);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc2, 0x08);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x35, 0x00);
> +       mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x51, 0x05, 0x42);
> +
> +       mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +       mipi_dsi_msleep(dsi_ctx, 100);
> +       mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
>

nit: Delete the extra blank line above so there's not a blank like
before the closing brace of the function.

Hopefully you can post a v3 with the blank line removed and adjust the
commit message. Then feel free to add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
