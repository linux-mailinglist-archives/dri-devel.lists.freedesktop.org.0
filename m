Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9BB8C6D96
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E689B10E123;
	Wed, 15 May 2024 21:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="juoV4qdw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8DA10E123
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:13:37 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6a0b4622ea0so23803596d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715807614; x=1716412414;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=renabCQBjnKbuD0E1htsmVXRz+sXl0GAkDLoNZkXQSo=;
 b=juoV4qdwk9LolgmTsmiTq3BHeoqYlgHab3vWbV1Tr3BsE56DICpppK/N1cJSk64TYD
 XEs2mavv0jUYN95yGuldkizSqXb/ILSwUkUqhfYkEpRJ7GsnYhN6yVbfy7n3TJWnf58g
 UQ8kS8R9/rI7V6qgCuaT35ZpH4k0pvvDVXy+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807614; x=1716412414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=renabCQBjnKbuD0E1htsmVXRz+sXl0GAkDLoNZkXQSo=;
 b=YgMhESz8SEVisiiPW1hP7iPvr69FRAToDec+r/g8dvY9DyHkEEKhEsEP0+WxzJrKQ1
 3GHBsTmj4WFqWc24fiZxb869dB1BAwV1aCCn8GS0PAPieHFIb0TSGu/Qb3vIEYlK7ux7
 sN0GBDR1uim8eix6OtRc7Mpge4MrMRKwmuKfm5ZrlxjaSmK30ELIg38KGDJ4BYjxNJkD
 FhF6x+bTjq18jgy9mcGJeOhj0YiC0j/U5g8SWh+6pHafbHtyvOV8bx1uO1phd7V9dM3a
 1js8/LNLQWHCXG8TYcmB2nZDNXSAZv57cX0O489JKHHAsVukngDzHJlW2PS1dk/rp/G9
 UpJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp3tPXOgXLzruKwtBx9Z8mN+LM0RG7z6NgTSopEXp2Sw1HF9/qCSBG1OCBhg9Q2qv5zVPwjm8+gIKTYwWp6jsDww/osLyrpdmB8rlqcxDs
X-Gm-Message-State: AOJu0Yx1ahJEn69mhZDvwoDi8QIZsYO6jaCsHoZfdlHQn7noPZPtII/e
 NQyZPtVI0Go8ef+iWgZQCSzW94IYQEFMJTNknvY8gLM87Mpg+6s3zFkEIt9f5IVYsGDiTX7E6BA
 =
X-Google-Smtp-Source: AGHT+IH1L9V88D8d7QW4n++iJ4ZPsSldqptKheT8hgDzsIKZOG94kWZ5QOXaq3lj/PnGgpwTRfd9Hg==
X-Received: by 2002:ad4:5802:0:b0:69b:4c1a:83ca with SMTP id
 6a1803df08f44-6a328adcfcamr136719996d6.26.1715807614336; 
 Wed, 15 May 2024 14:13:34 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f185151sm68959616d6.33.2024.05.15.14.13.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:13:34 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso2215551cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWG8biYWXjkLsrERT9L+9j7A05ivQSqyMhA9Modzs5k5qqwRVYAn/LBE7ih3eFFlWB0r6iZrIRb6tLc7FDrz8ejP/SxPYEP+dduG4w5zeWD
X-Received: by 2002:a05:622a:58c3:b0:43e:3ac1:c80 with SMTP id
 d75a77b69052e-43e3ac11131mr1505941cf.18.1715807608625; Wed, 15 May 2024
 14:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240515014643.2715010-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 May 2024 14:13:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wqiw2gi8MNnsYZkmM7H5XK1PUtxH-wqhbC-3m7Z0ur+g@mail.gmail.com>
Message-ID: <CAD=FV=Wqiw2gi8MNnsYZkmM7H5XK1PUtxH-wqhbC-3m7Z0ur+g@mail.gmail.com>
Subject: Re: [v7 2/7] drm/panel: himax-hx83102: Break out as separate driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

On Tue, May 14, 2024 at 6:47=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> +static int hx83102_prepare(struct drm_panel *panel)
> +{
> +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +       usleep_range(1000, 1500);
> +
> +       ret =3D regulator_enable(ctx->pp1800);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(3000, 5000);
> +
> +       ret =3D regulator_enable(ctx->avdd);
> +       if (ret < 0)
> +               goto poweroff1v8;
> +       ret =3D regulator_enable(ctx->avee);
> +       if (ret < 0)
> +               goto poweroffavdd;
> +
> +       usleep_range(10000, 11000);
> +
> +       mipi_dsi_dcs_nop(ctx->dsi);
> +       usleep_range(1000, 2000);
> +
> +       gpiod_set_value(ctx->enable_gpio, 1);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ctx->enable_gpio, 1);
> +       usleep_range(6000, 10000);
> +
> +       ret =3D ctx->desc->init(ctx);
> +       if (ret < 0)
> +               goto poweroff;
> +
> +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +       if (ret) {
> +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +               return ret;
> +       }

The above "return ret" should be "goto poweroff". Please send a v8.

-Doug
