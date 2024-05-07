Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A68BF1D2
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAFA10F8AC;
	Tue,  7 May 2024 23:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BlJ2sObs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90E810F8AC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 23:35:44 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-de59daab3f3so3937726276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715124939; x=1715729739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqTzibYiVMH3+7a4PfBn8xbaOrudxt3kbfsLVjNZMAo=;
 b=BlJ2sObsEOQ5vRex+I36F1RM9Z/GIqjvZSm6U+E0YmaqXWPYqxr3SFAH11AV/JlClO
 Po8q5MBqRYWaNy0X7SG5h9HiHPkwKb1i1upkciQKZSPZWCc7CPgOrhWOyUfra9hJAI2i
 8+KtNzAGjhjGClD7kohHSZohH4NtosB+lrnRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715124939; x=1715729739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqTzibYiVMH3+7a4PfBn8xbaOrudxt3kbfsLVjNZMAo=;
 b=jrqqAwgCa4BlydWZcHadFgsmHy59mfaUifo6D9la0YdwAAry2Ghxl/f+zTGpEJzphv
 wttxn77R2d9rRV/FY23gLmqBoLNGLjquls9XFU2AXnUKVwf1cMAh5S/WEUxSE+owwoSG
 OZvcThHKYzGOTpkg3EKeKhk3leTj+uj6CvkRf/XfDlsR8rx6NePiP3KaK077AtrLLmJK
 QULW3teZ6IWIpIrdPigoJ73yS6CC0LolsJio9Jj3qUmgVrmILuWU/QEr04pcG/6eYZAt
 N27lRi6mrHJZqk083iZ94MQS8EDqCs1SUSP3UbSS5wuIJ/bTnAYpItdsVTc/Kxm0L4dV
 StiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQVv5P51l/syGJLbn0wEzBfxiLdESiWU0K6zMTd3f6Y1NKvHbo4AjlLqk4OhcPNl6lc/+ZN7Qn2eAZpxZVGLWH0fFEv0mZNaInfenGCLWs
X-Gm-Message-State: AOJu0YwZTms1LFWTER5/mnngnR6wjNtnqc7B/x+OvIEJNZxm+9xluJG+
 W6fQXRmG8YLOC9s2UYIJoDE19qDR+Dc/rDD1ma5GQeOSs+0LNGRtAGPiCfhMh4AabK9f+/LB4Go
 =
X-Google-Smtp-Source: AGHT+IGsX4+FCdANdbCZr2SwAIbvA0mq4uDPgPUry2XQGtTvZHA4Ul7eLCByStwRn7CZWvW4Bqo1gw==
X-Received: by 2002:a25:dc01:0:b0:dc7:acb7:af14 with SMTP id
 3f1490d57ef6-debb9d20ef1mr1361002276.5.1715124938783; 
 Tue, 07 May 2024 16:35:38 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 ey9-20020a05622a4c0900b00434d86fb403sm3926046qtb.86.2024.05.07.16.35.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 16:35:37 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-43d55133609so66691cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 16:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Ebt7DjNWJtYHnbMKWEzzceOCRQnMEA90gH5Jje7Nfxi79gp5NwrBrSCrtIJH3QkIl/IMRX9ME1g6XyN8qD17xvk6Wn9VnDkLPpE2a8Ac
X-Received: by 2002:a05:622a:191b:b0:43a:c166:4d7e with SMTP id
 d75a77b69052e-43dc3180484mr1013991cf.28.1715124936576; Tue, 07 May 2024
 16:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240507135234.1356855-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 May 2024 16:35:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wj5WKcVbNGHQ_BbZa_fsVJkpYb2C8TE8bjhvJvx+N_hw@mail.gmail.com>
Message-ID: <CAD=FV=Wj5WKcVbNGHQ_BbZa_fsVJkpYb2C8TE8bjhvJvx+N_hw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
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
> +static int hx83102_enable_extended_cmds(struct hx83102 *ctx, bool enable=
)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +       if (enable)
> +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC, 0=
x83, 0x10, 0x21, 0x55, 0x00);
> +       else
> +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC, 0=
x00, 0x00, 0x00);
> +
> +       return 0;

You're throwing away the error codes returned by the
mipi_dsi_dcs_write_seq_multi(), which you shouldn't do. You have two
options:

Option #1: return dsi_ctx.accum_err here and then check the return
value in callers.

Option #2: instead of having this function take "struct hx83102 *ctx",
just have it take "struct mipi_dsi_multi_context *dsi_ctx". Then it
can return void and everything will be fine.

I'd prefer option #2 but either is OK w/ me.


> +static int starry_himax83102_j02_init(struct hx83102 *ctx)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +       hx83102_enable_extended_cmds(ctx, true);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0x=
b5, 0xb5, 0x31, 0xf1,
> +                                        0x31, 0xd7, 0x2f, 0x36, 0x36, 0x=
36, 0x36, 0x1a, 0x8b, 0x11,
> +                                        0x65, 0x00, 0x88, 0xfa, 0xff, 0x=
ff, 0x8f, 0xff, 0x08, 0x74,
> +                                        0x33);

The indentation is still off here. You have 5 tabs followed by a
space. To make things line up with the opening brace I think it should
be 4 tabs followed by 5 spaces.


> +static int hx83102_enable(struct drm_panel *panel)
> +{
> +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
> +       ret =3D ctx->desc->init(ctx);
> +       if (ret)
> +               return ret;

You're still changing behavior here. In the old boe-tv101wum-nl6
driver the init() function was invoked at the end of prepare(). Now
you've got it at the beginning of enable(). If this change is
important it should be in a separate commit and explained.


> +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +       if (ret) {
> +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +               return ret;
> +       }
> +
> +       msleep(120);
> +
> +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +       if (ret) {
> +               dev_err(dev, "Failed to turn on the display: %d\n", ret);
> +       }

The old boe-tv101wum-nl6 driver didn't call
mipi_dsi_dcs_exit_sleep_mode() nor mipi_dsi_dcs_set_display_on() in
its enable routine, did it? If this change is important please put it
in a separate change and justify it.


-Doug
