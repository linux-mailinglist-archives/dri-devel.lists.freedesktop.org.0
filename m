Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778385EB94
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 23:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB710E367;
	Wed, 21 Feb 2024 22:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i2iJeKYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292BC10E367
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 22:07:23 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6083cabc2f9so38854427b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708553242; x=1709158042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
 b=i2iJeKYYkO81W419DzJ27x3VCHR8BtFz7ltGI2qhPi6jOyn5cmYKVkE2fS2jLbe53S
 QcD4jtmbavJB8KZOeB5Ey14tDZkcpy/Mpao7MMo6giWRAL1UT8z3DGwhbfD6vdGOgGB5
 2BQE+WwBM3rGcmXs7wkvV2h1CCwra+P936tACA9/TpwPmcgssSk4334c3/+myY4a9b8A
 WElpw/8QoUK4GU5oBDkS94u7GHDi27bdHKMM9UKkQDx4TffhbhH/cZldGG217cXsidsg
 laqQsuGcLO0+pN9/uP4p4cPJq0YhO8kztz/Ea7/01Lr++UvjD1MmkY7EFxW7A/pPgZcc
 kEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708553242; x=1709158042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
 b=lmH6JFrnsBmbweMdKb5JwA5ZDNOFBAvda3bPkiF4rKr0UIizIr0a3DoNm5vECoaNiy
 A3Gi8Ya4X5HRGNCEHOCGsqoR2iGBR4Fva/Fd/UR/TZ9/MAlMCcyoZzaghOcPQACKkVbg
 5/gIkTq5QkJJUNs7sOdZGk1gObVPiNC9O7o41XKJa8lHlONspkDOF8kUzzPJvkWmyANB
 +jU+haDcQH0sRUlSsGO2IRA71tCK9lkRPqXZU8+1YgwUCV/gocUR1xq+LYqFtA+r0FOR
 RO0BS/thexYSmHBpv/BCmp34bukGQgSGj06LoyB8xnblY1lgtNfLIuiw5Juh6ztdjgh/
 UaOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0bf8rTc+YV/pVHguOeVKvcYv7wgRdFQLnCg1xejorDa7PKe6yuUBdzX5jS1vl1g1A988+Z1UiT4uC0jpJSwAijESn2oLktf+0Dv7v3de1
X-Gm-Message-State: AOJu0Ywoi4maYUkht4JxHumS53C7pXhX2jCM4Qw+hElpvL7QU9H5i7Nl
 L3RyaewKH54DmUL098KFNat8SJTmHdyXsx4QgNzyidfEFQa1eDgBbjAhHy7MDGc0inCc0wpjOG9
 ZLpyX2ITsPnVPEBAaxYbMsX3m4ixnjnaZP1kKMQ==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Sat, Feb 17, 2024 at 10:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
(...)
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
