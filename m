Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC78BF1D4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009AB1126D4;
	Tue,  7 May 2024 23:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="F8tlP1cM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7147110F8AE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 23:35:57 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3c974a0647bso1287574b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 16:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715124956; x=1715729756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/ZrICv95N59yamAuqq9jxVRDu2Fdzxj2JJ/JZTWUpg=;
 b=F8tlP1cME9rIS/BAiaAOMwUs+HIqX9kP/3SGKCx3yjDFOBfIGU8vBqBC8zdKt2l/Wn
 DaaFDw9Q5Vkzdqvv1zjcI1v6IShYHrwTM+oqAcxfo7eEXmSfzbp4LYKxYtfEUZj9rrHq
 rOUP/fH/gg/cCecUt0PT2CqAiIvxIZBdcs1XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715124956; x=1715729756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/ZrICv95N59yamAuqq9jxVRDu2Fdzxj2JJ/JZTWUpg=;
 b=H8oPjgR+R58ywdOh5b33/lUXU1cyX0cgFhMYVKsgzJ8amkglhZwULPGX9mkuhkbfbb
 I5+3quVmmTgzIvCjmyGfJUgi/wjVmzLT10CAYhwJQj6OKDnJ0lxRLTQYQTL451DOv3mo
 /aVxY5tWXYQ8hdhaHk4o2HYJvQ3MSXDJdye3j7ds+9LGAfI9C4T6HJdTrlyJ6CByXDeS
 6lJsF4EDJ1uCclBF2SOUO4OSvBpgctroTF9iDImbiBpuTSdDaXADPKag1YKokCrR49yw
 P6D2jII3y1i6UspJEr+mt4I5m+vhCEiZWAcuqNkLdhzaJRLmvXmhdZlonqzIa32G9YJ7
 DspA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFVTZUXTGuYoh4bfPrCOY61TM9agO/GyQlfi9d3ocWtTs4sBZOEnywD3+dt01/XMcPv1x1xPP3wQ/7cgwNNKr+TlLtXXtV2yx6Nz/vFBiE
X-Gm-Message-State: AOJu0YwBdWycrRx0ISSsDpPZnF6pCuXElw0w4oME1P5Hi9UknxOiKau3
 9ExNDbF8T6hmXElN6FcxxIPAnW1YlmuBD/wbm6U/zJwg9+EJLk0AGidxmWoUNo2KvxwNYFc65HQ
 =
X-Google-Smtp-Source: AGHT+IEZzLXKpj713RkUBz+y9dyui90dMjqbIWosv+qlHZgRS335B2mNnn3Y1LRFtGAPM6L5SOvRBw==
X-Received: by 2002:a05:6808:4384:b0:3c8:4228:f9af with SMTP id
 5614622812f47-3c9852b65d4mr992252b6e.16.1715124955950; 
 Tue, 07 May 2024 16:35:55 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05621402a700b006a1478b5650sm982067qvv.90.2024.05.07.16.35.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 16:35:43 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-43d55133609so66731cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 16:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFuXGWLWcc97ONcN2at4CL2/NheGpMaT8EqEril2/eL0zDRbgvjlNQ+48tPo0PJqA98QMtd1w+YW6REzvsDB3ZQ9SOY4YGDrreugF4qBtj
X-Received: by 2002:a05:622a:1b22:b0:43a:b186:634d with SMTP id
 d75a77b69052e-43dc2daf777mr1046151cf.10.1715124939463; Tue, 07 May 2024
 16:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-6-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240507135234.1356855-6-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 May 2024 16:35:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WR0o1Z4c4+GjrZw8mTJPZnP8uB_gWhX1QuOxxm4qhroA@mail.gmail.com>
Message-ID: <CAD=FV=WR0o1Z4c4+GjrZw8mTJPZnP8uB_gWhX1QuOxxm4qhroA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panel: himax-hx83102: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Tue, May 7, 2024 at 6:53=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> +static int boe_nv110wum_init(struct hx83102 *ctx)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +       msleep(60);
> +
> +       hx83102_enable_extended_cmds(ctx, true);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0x=
af, 0xaf, 0x2b, 0xeb, 0x42,
> +                                        0xe1, 0x4d, 0x36, 0x36, 0x36, 0x=
36, 0x1a, 0x8b, 0x11, 0x65, 0x00,
> +                                        0x88, 0xfa, 0xff, 0xff, 0x8f, 0x=
ff, 0x08, 0x9a, 0x33);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x4=
7, 0xb0, 0x80, 0x00, 0x12,
> +                                        0x71, 0x3c, 0xa3, 0x11, 0x00, 0x=
00, 0x00, 0x88, 0xf5, 0x22, 0x8f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x49, 0x49=
, 0x32, 0x32, 0x14, 0x32,
> +                                        0x84, 0x6e, 0x84, 0x6e, 0x01, 0x=
9c);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04=
);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x8=
4);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x36, 0x3=
6, 0x22, 0x00, 0x00, 0xa0,
> +                                        0x61, 0x08, 0xf5, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e=
, 0x30, 0xd4, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x=
13, 0x07, 0x00, 0x0f, 0x34);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x=
03, 0x44);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, 0x=
06, 0x00, 0x02, 0x04, 0x0c, 0xff);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x1f, =
0x11, 0x1f, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x0=
0, 0x00, 0x00, 0x00, 0x04,
> +                                        0x08, 0x04, 0x08, 0x37, 0x37, 0x=
64, 0x4b, 0x11, 0x11, 0x03, 0x03, 0x32,
> +                                        0x10, 0x0e, 0x00, 0x0e, 0x32, 0x=
10, 0x0a, 0x00, 0x0a, 0x32, 0x17, 0x98,
> +                                        0x07, 0x98, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x1=
8, 0x18, 0x18, 0x1e, 0x1e,
> +                                        0x1e, 0x1e, 0x1f, 0x1f, 0x1f, 0x=
1f, 0x24, 0x24, 0x24, 0x24, 0x07, 0x06,
> +                                        0x07, 0x06, 0x05, 0x04, 0x05, 0x=
04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00,
> +                                        0x01, 0x00, 0x21, 0x20, 0x21, 0x=
20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +                                        0x18, 0x18);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaf, 0xa=
a, 0xaa, 0xaa, 0xaa, 0xa0,
> +                                        0xaf, 0xaa, 0xaa, 0xaa, 0xaa, 0x=
a0);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x05=
, 0x0d, 0x14, 0x1b, 0x2c,
> +                                        0x44, 0x49, 0x51, 0x4c, 0x67, 0x=
6c, 0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0,
> +                                        0xa0, 0x4f, 0x58, 0x64, 0x73, 0x=
00, 0x05, 0x0d, 0x14, 0x1b, 0x2c, 0x44,
> +                                        0x49, 0x51, 0x4c, 0x67, 0x6c, 0x=
71, 0x80, 0x7d, 0x84, 0x8d, 0xa0, 0xa0,
> +                                        0x4f, 0x58, 0x64, 0x73);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x10=
, 0x10, 0x1a, 0x26, 0x9e,
> +                                        0x00, 0x53, 0x9b, 0x14, 0x14);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x11, =
0x00, 0x00, 0x89, 0x30, 0x80,
> +                                        0x07, 0x80, 0x02, 0x58, 0x00, 0x=
14, 0x02, 0x58, 0x02, 0x58, 0x02, 0x00,
> +                                        0x02, 0x2c, 0x00, 0x20, 0x02, 0x=
02, 0x00, 0x08, 0x00, 0x0c, 0x05, 0x0e,
> +                                        0x04, 0x94, 0x18, 0x00, 0x10, 0x=
f0, 0x03, 0x0c, 0x20, 0x00, 0x06, 0x0b,
> +                                        0x0b, 0x33, 0x0e);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xf=
f, 0xff, 0xff, 0xfa, 0xa0,
> +                                        0xff, 0xff, 0xff, 0xff, 0xfa, 0x=
a0);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x=
bf, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x96);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc9);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x84);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd1);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0xf6, =
0x2b, 0x34, 0x2b, 0x74, 0x3b,
> +                                        0x74, 0x6b, 0x74);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00=
, 0x2b, 0x01, 0x7e, 0x0f,
> +                                        0x7e, 0x10, 0xa0, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x02, 0x00=
, 0xbb, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xa=
f, 0xff, 0xff, 0xfa, 0xa0,
> +                                        0xff, 0xaf, 0xff, 0xff, 0xfa, 0x=
a0);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01=
, 0xfe, 0x01, 0xfe, 0x01,
> +                                        0x00, 0x00, 0x00, 0x23, 0x00, 0x=
23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x65,
> +                                        0x02, 0x01, 0x00, 0x00, 0x00, 0x=
00, 0x00, 0x00, 0x01, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xa=
f, 0xaa, 0xaa, 0xa0, 0x00,
> +                                        0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x=
00, 0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00,
> +                                        0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x=
00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff=
, 0xf8);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +       hx83102_enable_extended_cmds(ctx, false);

It's not super important, but in panel drivers I converted to the
mipi_dsi_dcs_write_seq_multi() I checked the "accum_err" and did an
early return right before any mdelay() calls. This means that if any
of the above failed then we didn't waste time with the mdelay().

> +
> +       msleep(50);
> +
> +       return dsi_ctx.accum_err;
> +};
