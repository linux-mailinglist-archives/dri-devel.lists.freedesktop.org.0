Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A14984BD5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 21:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC3A10E198;
	Tue, 24 Sep 2024 19:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mULHj3lF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847C10E198
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 19:56:16 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f74e468aa8so63021481fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727207773; x=1727812573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BS2okOwNkGUX7eeFH/iep/BcUjWJ+kRK0nWW0JJdEA8=;
 b=mULHj3lFOVuZ3GUTTBOSfbKNQt+SQedQSsz3sm/b/pakVS5OA1IYVFYOSUUaUJyx8Q
 du4Ed4TKYebGMK/VSKbDMtgp4NPO8sF3ySmtk4QcJ9OCXfiRue9VU2TLoUyLq+fsXF4I
 4ASo0Jpyl08+EshAYr4dnlAxzpxuyPZzNPSS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727207773; x=1727812573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BS2okOwNkGUX7eeFH/iep/BcUjWJ+kRK0nWW0JJdEA8=;
 b=XTwC/33kG57Mp4v2BFkqs2Iyz8GxfVgTPkROCq12PriG3HEoesEG9fzGFjJj/RkCYK
 Nun0XH/UDj5EcUunV4+S0q8cIZQeWFOOm2f3INlDGzdKy7dGMuiefJa2CIV6L9GXhzzs
 IR9dhI9KUBKDGQ1cSmIx8E7DyflzJNYsk3RkbOemnk8kMoihiPhgOKDMbUpnZRfRG2FY
 CVBD+4r+81Fp2SbpuGLGAMxxHjast5ziKHnQILw9h0Ahrq8v57i/HFl981ANZbQvMb8L
 zGkySVTPsvBAUwaiPDQpmsverdJR6DDjHTyIxxMQhLjq+xolINhdCIXz02xFvdpsCHaS
 XErw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzn74pCnCDdkUp+s1ksClC64dulaMTqnglEs/OE5nxerY6xTrIQ7L4xOkUYaxiQOXjQOqpKtNd93A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjOuTYV8E0IDxHyT8MOGQGCl97jS9UTyCpjGTCyjnTkLrmDc2d
 aw3UyrA0N9VEDdiFxcacZbuobHM5ghCeFl44cdshyZhUabv/78JVTbV5ypY0yOL7MIujdAqEaIY
 QcQ==
X-Google-Smtp-Source: AGHT+IH9JmUdPCSDFjORy3WyaiRjLBcl6ZwBGIJ4ScfPib/2z3jqdthf61cbDihKJBZEBEjJlf+FjQ==
X-Received: by 2002:a05:651c:c2:b0:2f3:e2f0:af15 with SMTP id
 38308e7fff4ca-2f91ca6fae1mr2748171fa.30.1727207772889; 
 Tue, 24 Sep 2024 12:56:12 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b760sm3114701fa.104.2024.09.24.12.56.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 12:56:12 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53654e2ed93so6995128e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 12:56:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWF6Ia9UY8qWmRze2KEG27coTg/dI3CrKXP+f+nqRe5nmsT1qh5sf+jNvRFURivlseH7MRPJwN/mVo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b95:b0:52c:adc4:137c with SMTP id
 2adb3069b0e04-53870496b19mr130321e87.20.1727207771379; Tue, 24 Sep 2024
 12:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240923122558.728516-1-tejasvipin76@gmail.com>
In-Reply-To: <20240923122558.728516-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Sep 2024 12:55:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmcyAbzU_M25rCzc3JmNGZ9T0wzMJAfxi-LmdZ6389OQ@mail.gmail.com>
Message-ID: <CAD=FV=WmcyAbzU_M25rCzc3JmNGZ9T0wzMJAfxi-LmdZ6389OQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Mon, Sep 23, 2024 at 5:33=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> -static int kd35t133_init_sequence(struct kd35t133 *ctx)
> +static void kd35t133_init_sequence(struct mipi_dsi_multi_context *dsi_ct=
x)
>  {
> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -       struct device *dev =3D ctx->dev;
> -
>         /*
>          * Init sequence was supplied by the panel vendor with minimal
>          * documentation.
>          */
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
> -                              0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, =
0x56,
> -                              0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
> -                              0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, =
0x34,
> -                              0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x1=
7);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a,=
 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00)=
;
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x=
02);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
> -                              0x20, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
> -                              0xa9, 0x51, 0x2c, 0x82);
> -       mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
> -
> -       dev_dbg(dev, "Panel init sequence done\n");
> -       return 0;
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POSITIVEGAMMA,
> +                                    0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, =
0x3a, 0x56,
> +                                    0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, =
0x0f);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_NEGATIVEGAMMA,
> +                                    0x13, 0x18, 0x01, 0x11, 0x06, 0x38, =
0x34,
> +                                    0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);

It seems like you dropped a few bytes in the above. Was this
intentional? You seem to have dropped the first byte from both of the
continuation lines (0x00 from the first, 0x4d from the second).


> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL1,=
 0x18, 0x17);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL2,=
 0x41);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_VCOMCONTROL, 0=
x00, 0x1a, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, =
0x48);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_PIXEL_FORMAT, =
0x55);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_INTERFACEMODEC=
TRL, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_FRAMERATECTRL,=
 0xa0);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYINVERSI=
ONCTRL, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYFUNCTIO=
NCTRL,
> +                                    0x02);

This used to be the bytes 0x20, 0x02. Now it's just 0x02?


> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_SETIMAGEFUNCTI=
ON, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_ADJUSTCONTROL3=
,
> +                                    0x51, 0x2c, 0x82);

This used to be the bytes 0xa9, 0x51, 0x2c, 0x82. Now it's just 0x51,
0x2c, 0x82?


> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, NULL, 0);

Are you certain that the above is equivalent to the old
"mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);" ?
Where is the "MIPI_DCS_ENTER_INVERT_MODE" constant?

I think the above needs to be:

  mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_ENTER_INVERT_MODE);

I've confirmed that this compiles OK and that there's no need to
actually have any bytes in the sequence.


-Doug
