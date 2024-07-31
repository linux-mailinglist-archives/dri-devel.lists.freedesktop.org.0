Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAC9437FF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 23:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96EF10E6CF;
	Wed, 31 Jul 2024 21:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i/4/lTUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3D410E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 21:30:19 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b78c980981so32921526d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722461416; x=1723066216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7v5MQa7OcjG2quU7CTmYoYXphTBDWw9No993Vj+T1kA=;
 b=i/4/lTUkbqJ6rfz4jRqbtdDuaUmSRR/NB3BvLXB0tX8HqSZiG/yy0/6d0rmu+J4L7D
 HatZUPF9fi7kUMilYDV+q3E5ehfInzgaCoIp12vaRQddjEKSgdA+lvhLGO7MQyoppp3i
 erW1/9I2ZjQQ4t8SanT825/WoiJ6Ck5giE6HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722461416; x=1723066216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7v5MQa7OcjG2quU7CTmYoYXphTBDWw9No993Vj+T1kA=;
 b=MBsrqdlQLmKUM9jYiHim588R0AocYkpUoyy+BFb8q5s0IF/xC+GPxV17EZ9AFuOTPE
 Oy90UBbagA+G8OiPPdl5JIjaK8SgkaArScYiR7RX1TGC8moeiinZ6vU5FQ+eh2OThYUm
 0XkbP33eucFOWsRfadZS3p4NPzof+B0YFQhEuqBKG+q7PrpvZSAYRbPKete/W7Ht6yN+
 /e0kk8Xy3sNqVYpMFigWYXZx+YED24tVhhCCMfULLBOTjyxlLP/iGcqY0bwgC+MSVEg6
 TXK3GzWbt08DOk1BdlC4I5nhmnjPHk6d8pvi7ohGtKK8IPsHj2BNLK8y+WAcXO+QT3dK
 gUWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsUFhG11Sj1Uo/a+TEd0q7l7yYNRmoxH0Rv8ENEupKS8VVWM2/G6bqOVcKNmjiB8VTyHWW+pUtzC+wbJMpB+A9ZUeAYyxbD2OPuWhDSF2q
X-Gm-Message-State: AOJu0YwOxLpw5cWSr7kvpWyG8dmitkuUmzwrwB2blJj93Gdj9qx+jFwI
 wGFOQZJzYtC6gHvocaFCskb086xyD5TyfC1tvOyPIKWMNn/23c49XQHG61L/dzQs/L3LR5X+5zI
 =
X-Google-Smtp-Source: AGHT+IH+CqlCfnh9hE9dRa/GjUlKwonecH2kpfUc9aR5bzl/3IuCF7KMeiS7hM53Sk6D88+KHP9iaQ==
X-Received: by 2002:a05:6214:3381:b0:6b7:b286:e826 with SMTP id
 6a1803df08f44-6bb8d788e69mr7636306d6.38.1722461415753; 
 Wed, 31 Jul 2024 14:30:15 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f9148aesm77177706d6.62.2024.07.31.14.30.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 14:30:14 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-44fe76fa0b8so475091cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:30:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeucx/IVh8QBH0INPnCRE1svSReudvHDc+3ifQvZMI1V54nYakUBoEYqirmaskkm8mIQrUyb+3FoqkaQ+hX3b1vX1aV+gpltRYaTgaGs0T
X-Received: by 2002:ac8:5f4e:0:b0:447:ec33:f488 with SMTP id
 d75a77b69052e-45180991b4amr131431cf.4.1722461413981; Wed, 31 Jul 2024
 14:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240730060659.455953-1-tejasvipin76@gmail.com>
 <20240730060659.455953-2-tejasvipin76@gmail.com>
In-Reply-To: <20240730060659.455953-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Jul 2024 14:29:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGzQN0LK6SBOY_6P8eF-cAuP4hRwsS+NTZEaik_Os7NA@mail.gmail.com>
Message-ID: <CAD=FV=XGzQN0LK6SBOY_6P8eF-cAuP4hRwsS+NTZEaik_Os7NA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Mon, Jul 29, 2024 at 11:07=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
> +/**
> + * mipi_dsi_dcs_get_display_brightness_multi() - gets the current bright=
ness value
> + *    of the display
> + * @ctx: Context for multiple DSI transactions
> + * @brightness: brightness value
> + *
> + * Like mipi_dsi_dcs_get_display_brightness() but deals with errors in a=
 way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_get_display_brightness_multi(struct mipi_dsi_multi_con=
text *ctx,
> +                                              u16 *brightness)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
> +       if (ctx->accum_err)
> +               return;
> +
> +       ret =3D mipi_dsi_dcs_get_display_brightness(dsi, brightness);
> +       if (ret < 0) {
> +               ctx->accum_err =3D ret;
> +               dev_err(dev, "Failed to get display brightness: %d\n",
> +                       ctx->accum_err);
> +       }
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_multi);

I'd be interested in others' opinions, but this function strikes me as
one that *shouldn't* be converted to _multi.

Specifically the whole point of the _multi abstraction is that you can
fire off a whole pile of initialization commands without needing to
check for errors constantly. You can check for errors once at the end
of a sequence of commands and you can be sure that an error message
was printed for the command that failed and that all of the future
commands didn't do anything.

I have a hard time believing that _get_ brightness would be part of
this pile of initialization commands. ...and looking at how you use it
in the next patch I can see that, indeed, it's a bit awkward using the
_multi variant in the case you're using it.

The one advantage of the _multi functions is that they are also
"chatty" and we don't need to print the error everywhere. However, it
seems like we could just make the existing function print an error
message but still return the error directly. If this automatic
printing an error message is a problem for someone then I guess maybe
we've already reached the "tomorrow" [1] and need to figure out if we
need to keep two variants of the function around instead of marking
one as deprecated.

NOTE: If we don't convert this then the "set" function will still be
_multi but the "get" one won't be. I think that's fine since the "set"
function could plausibly be in a big sequence of commands but the
"get" function not so much...

[1] https://lore.kernel.org/r/CAD=3DFV=3DWbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShs=
ALuEFNhiww@mail.gmail.com
