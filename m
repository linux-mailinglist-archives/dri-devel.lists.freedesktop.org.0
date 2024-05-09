Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38098C1330
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 18:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F2710E0A5;
	Thu,  9 May 2024 16:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nb400ptX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45CA10E0A5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 16:42:45 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-43ae9962c17so4787541cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715272963; x=1715877763;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44yq6LGi2PMD0vBMyVyyqYe6nZFMsvuGg5VBgAwJGFo=;
 b=nb400ptXcxboTjEbnGU0TtrAWAdH61qGQa5CKjjQJVfYXpHkxWUXVEmOG/ihjaCdyE
 0ijDmrTA849Oo1aDLvkS6QqIMdudKYm+cMAzKrYsqpOXcmo6MAd6gDdMxu2/O9PV6vhB
 5zig7ppsOecAdf1uF3fHmt63qRcTobcRfPpIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715272963; x=1715877763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44yq6LGi2PMD0vBMyVyyqYe6nZFMsvuGg5VBgAwJGFo=;
 b=f2UH13NzrOBk9gVd47UEvQvU/6lbhz7+QdGxAgsFQrVjYvcsc3QRmQZO3mWHmueUCR
 2gbzZX95tLsT1TDtqq2oD1rCSmuqX7JGWOy73FPwf98GXR5zN97rdRlxJLYvsAQh84Yr
 eNdk9bvnsg9c8+BYM+z2yn5LH+hZOyUBwBWuBzqgSLk9/J8RGjviA4IpW2Qq32kt8bjX
 LA1czwNIZwMAQc3HQhZBNcdFuKcsnnBp1AMCDDej4bjLa9N2xqQgmkJTKfTUxBXQK1Rt
 X+ZpB0oKL0aLrejdMBu7TBWxuoERnV+FmNMxfFYzNzQ1XXXJB+iAhiUlAQ+eV3ePcNbk
 DOJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUikMhki9C9YWcm1Vl2tEl5NdY2CekgEaXAHvKalQsBB0xgZZ2/rQCH8XB0XM/wJwhNiRbytx8dWPLrrWJwAG+Qbx8PSaEICJQuvLt3JyrM
X-Gm-Message-State: AOJu0YwbOFpBQsbxkQDIGgBURUdftKheTZ5bFFF8hHBoTjV0dnZUWSJW
 TLRIOqPrYtTCk701jCv3JDCMppfN3uqrTvPhfwpLHGkYSM/zSW+WDgtFvnL7OTZ1DZHWdQttIF9
 dwcr3
X-Google-Smtp-Source: AGHT+IEBubMubTWhVpFSzIaQeyfWrzeI64+jC0PeYhkFG1gsTfaCyhgIKcLUbhJp4TFqW/A8/7lojw==
X-Received: by 2002:ac8:5946:0:b0:43d:d984:1b9d with SMTP id
 d75a77b69052e-43dd9841e26mr50673551cf.37.1715272962787; 
 Thu, 09 May 2024 09:42:42 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54da2d3sm10001241cf.27.2024.05.09.09.42.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 09:42:41 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso5221cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 09:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVDyM46cH7+KR3vV8eD0IeaBsCZzED4TayA9Ce8m5kt9hUhw463lNhaHU8k+BLEBhHTmmV9JJQten6fB7cKMxgobznTTu6aYwoxCMPOk1sC
X-Received: by 2002:a05:622a:5185:b0:43c:553b:1bd6 with SMTP id
 d75a77b69052e-43df3b1ce3fmr3110661cf.12.1715272961287; Thu, 09 May 2024
 09:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
 <20240509015207.3271370-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240509015207.3271370-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 May 2024 09:42:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaTj_ojJvc2T22e49MhB-zp1+Z_tp9uULS0r8MesUd2Q@mail.gmail.com>
Message-ID: <CAD=FV=UaTj_ojJvc2T22e49MhB-zp1+Z_tp9uULS0r8MesUd2Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/panel: himax-hx83102: Break out as separate
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

On Wed, May 8, 2024 at 6:53=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> +static int hx83102_enable(struct drm_panel *panel)
> +{
> +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
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
> +               return ret;
> +       }

FWIW, I think that the mipi_dsi_dcs_exit_sleep_mode(), msleep(120),
and mipi_dsi_dcs_set_display_on() should also be in the prepare() to
match how they were in the boe-tv101wum-nl6.c driver, right? Then the
enable() would be left with just the simple "msleep(130)".

I know it doesn't make much difference and it probably doesn't matter
and maybe I'm just being a little nitpicky, but given that the
prepare() and enable() functions are unique phases I'd rather be
explicit if we've moving something from one phase to the other.


-Doug
