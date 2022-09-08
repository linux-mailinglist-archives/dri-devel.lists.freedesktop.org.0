Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D6F5B1699
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA7C10E9A7;
	Thu,  8 Sep 2022 08:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FD010E9A3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:13:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b35so5150567edf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=XWkSveJnRzdKknQVJvingAQ78zNNLel+FWq5VV07OlE=;
 b=jRLi85+fXwo43KQrU4myTG9XTPSquksWe/XvRX7TYb7GraJKW8IJtYfovgGkczWfO1
 bYwJMLLFG6PNudKjBUQzz73STtBFd6V4x5FD4C8WkgDYNMvtc+1Bl0Kja840zmydb7Dk
 R1f+8EAh9SdZYshHDAY4euPG9fH7mHOJQvVccAuIrdg0ZDbUqPHo8WyX9mHuYCGimM24
 YP3WQ6HmoChixUzx1paI/lXVpo3wZrRWlGGVbaMD9oe607cEm80TQq9udOFb7fMoKVdH
 qENdLT4lSWItLbHHuJ2dWiNS4MMdyM1rMc/BVCp3BIYXfVem88Ot/yq4n9Crmzb5y308
 lUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XWkSveJnRzdKknQVJvingAQ78zNNLel+FWq5VV07OlE=;
 b=nVKrOMD1c4cLlt6iloM7DPm9Gd3BvNU7sZDqm10NvwF2RrKV5zGTTdPmyH7EljwY91
 pmii7iFhKocyrdiKxOJYtub9sU4KyHraR59v55h32WMDJfjEu598w7TxzL17X0uvPajF
 zw3qY2QpluWMiywvnw1/NhmdvnwOxkkYa1ht81RyVzMYa0236it7eiJxobcJuydHGKsd
 fuUoJUjAPl2ObUCq//dFCoWRIkFnU8NmtodUffuBf8E0gNZmcLycI7u0QNs59kpL75BI
 R94or4PqgKyEXscKF83hhEPMnK5IZ/HkI25BZeBoUah38nU0Zd/GST7gUaTu8ga8eESJ
 atYg==
X-Gm-Message-State: ACgBeo1AHB/dt088nVOWR0xAHJqNXAEkXtgr1anWlKtgNta25L8AxzrU
 3lMwCUgGM2Q2DcWr5kXk0Vj0nIg+L0XMT86cnwYlog==
X-Google-Smtp-Source: AA6agR61mT7tkyrz3ia2WmI9qL8rb9Hia3J00WfiGHtjyrq5l+uSjyAmKJyQgQF5xs6AGHNJPzuPDon8GNuoQIkZGu4=
X-Received: by 2002:a05:6402:51d1:b0:448:bed1:269c with SMTP id
 r17-20020a05640251d100b00448bed1269cmr6168449edd.205.1662624804730; Thu, 08
 Sep 2022 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:13:13 +0200
Message-ID: <CACRpkdasPuDGzGLbeHo5oE-9aakVzhSmtbOUHpfu+KTEAHMCOA@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API. It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
