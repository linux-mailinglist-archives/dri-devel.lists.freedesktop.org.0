Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F0E5B167A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEBC10E807;
	Thu,  8 Sep 2022 08:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D7410E997
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:10:41 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gb36so36166961ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=j4bs3PwCf8LAGt65QBrJwkN23+x5pcdlnIufUSNJIIQ=;
 b=XlFrs6f1Ru6mfmrDHSloR2yePiVJ+BuOhZJkeSnSJ/SOiEPgkH7fc5Qh53N1oKwQvH
 +OoAiOMDe47PpbvHsnBhm6aYdjqjrlxYnSo7yiZbqsAzABr7z6IbsSFiYRJdU8C2FmM8
 5DH3vl93eI862Lj3YGNPcem5IKwqOFLfYUBV/2qlp66cAcJz+GK/kSoE2Nn6RNzXIdZ9
 oJUIG5tDSXTW/MSaMC7qK7mdrhaTxlGrLwOPowZ4WpaBUKmm7LiCFjVvj0ZXOF9c8KIJ
 SNp39mJEoQxBFUzec2wJzhGoK5rRNZ4WQVIZ8FGwGa0dLMi1y1WJKYonoLdQWd7mN1KK
 y6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=j4bs3PwCf8LAGt65QBrJwkN23+x5pcdlnIufUSNJIIQ=;
 b=pwVKiuAKLvzsDMvvKoMcXd6b27MGiuvHZSrh6ufs9YS9H46qFSPTzbMLLWxwHvxnY9
 TpFvYlYokcWOXgktu0nCJJUW2HdZUboqewKsZ7SLZHmOkHcdP9IGkbiFPnvZxFtZ1lMe
 JrySFps2i+QsYRT+WGu9V7GBmvAumB41Hn5s9nS8n3lgt6YyAHPi9+gK6HpluZpDF8+r
 CMcNBTMF4MX8kxZFqQ9Ha2IGjFFJMvdWjwM6dv2wxfhjI8HilShrqVIWzWeL57F4QCNJ
 dutgxyH1jSe62ugRLNscu7sqb6sb68WvjRmIfB62iBX1DKzJ4yslUgqCR2yXtDJkPQJR
 9YnA==
X-Gm-Message-State: ACgBeo17+M/c6McMt7H/gSFsjYBYRXmzgpAuj9ljRei72Cox8xNCfKK2
 jTskZXXY3KsOWh2thGJvhqN5qr6hNs816ayPNHIw8g==
X-Google-Smtp-Source: AA6agR5SiTp1RzXd7QfGvIaagW9XneozTUfgGg71dHg/7zkzwgHHmEoyMH3isqJfBMUwPz7K/i/VjO5b2+tszIQ2lUg=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr5269882ejc.208.1662624640469; Thu, 08
 Sep 2022 01:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:10:29 +0200
Message-ID: <CACRpkdakswdcFTgEGX-+2fgOHZ+VsDsRe+yj8hnExKuugnO9xQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] regulator: bd71815: switch to using
 devm_fwnode_gpiod_get()
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

> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
