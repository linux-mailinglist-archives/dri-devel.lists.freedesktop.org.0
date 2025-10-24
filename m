Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8080C04DF6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A14110E9F8;
	Fri, 24 Oct 2025 07:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gUs1rIgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5156E10E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:56:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57bd482dfd2so1887521e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761292579; x=1761897379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
 b=gUs1rIgT0gj1dIzkmsuDTAIXyQz7JCJCvVg6qJ2YmGJ8c73vk/SII1t/+T7n47TzTp
 iWGhAXKE5+oXJpTo7RsJu4azrqZ65y1GBgpZmuCGfYsJxP3hsN9bCrS34VGvcD48I95l
 wNWX7CO7OMW2xRaZhEXJZdPx+v6m+GcJ6V6BB+sBFadw3cP8od7rZU4ipCFtZqstg9FR
 hkSRHlLk9HWRd/u0fDsXE0hPVtiWGuGp8iQ4UT7pD3m4Hba7bcNsJHtoGGOkhFIMmZcd
 vp65gVmpxqkfrCuOiigUVYUvXUeq/WOcwcGfjFzkLPdzmoVQBsaUwZRVJdHbmZV/BfM8
 z1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761292579; x=1761897379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
 b=OqT835t8QV/6NNOY/1DSf7TsFt7E+RYAQGny/k/NZTM82zKz/IcLgcSXTkdk3q1Hm7
 uryvSSLZx7a3Crurz1SnCbRneequ8GLTd3bExYuNOX/psCMdAoJLi3lhtEwkGBEOEgnJ
 veMS8b12CTAdx/Xmyncs9IOZuwH83dzUuxlEaxyjPnih8PyVwnLf2GfTIeFNXb+wxByQ
 EOrVMWwlE36tRnMPJW9bLE94ra61EU+yYqk71z9arkFZCe1F/7ZrRVls+1QW8mPnfz3b
 WI5O08cvSe370HGgnS+aQwNsc5yU9scWM0BHijHdm1XmmMDkhhImRmds+3QG5vmRKIhp
 kw1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpGw3T9PJptDE6yuzUVSxa/494kipUgIUjz054t+VoZ/pUaYqaYTf3wiMzI+bw2YN3WBMh1gCNkAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGp0kGx4p3lIWdakbRdpsU8CPZOObs83WsgS4IrpVa/iNbfZzU
 Yx6cUW1gP+IT6Jqnkh61egLn4/W0QtoV7w50OtQ/E7SzvwluLiOrjB0z3ETveKAoP8Yakip7K8J
 pSwEMes0tvaw0BycsY4D9UyXAYr3zaJ3kTd/8MeQRLA==
X-Gm-Gg: ASbGncuBYTW2GK3eSzEOc8ep53NLRhlUK0+JGlNlPJSbaw9VGp59uULKp7R8/t/iwYi
 iNIaZlrefDWG4Y0eL02QQv+uyn4hizxv6zTF5zMr0UoN4r/Brt+ZFNAYSfXXJBohYI+cU6MK8/K
 FzWVeelgkkSrQYbiwJ29JwDLJkSenbKC5n423SOk99O8TyV7WRMQ+WmUfOMl3vwt8ORwmga2/DW
 teJFANQiXXLvRUjaZL3v6sdvliRcTDT5ht9ZoDdG61oMnrZF56aHSJBBakQ6RRBhc5z4K8nrTRK
 DnSguvv+TIaB7aA=
X-Google-Smtp-Source: AGHT+IHSnXZ/gyOux7cXwXN4jLtleYFyXBIE1/V6t/jovl+yJ4b+HMb04wimJ5i7xVzENgmv7b2GUJ2i/5ONH7mEpKM=
X-Received: by 2002:a05:6512:130c:b0:586:83e2:2295 with SMTP id
 2adb3069b0e04-591d85525f5mr9376212e87.45.1761292578695; Fri, 24 Oct 2025
 00:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251023143957.2899600-1-robh@kernel.org>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:56:07 +0200
X-Gm-Features: AS18NWBwXS6t25LKJEi_UKqvj6YhljrcGI4AFOhItyKPndeRwhvu3EmnTJe9vDc
Message-ID: <CAMRc=MdE=1cPDPQwPQA6mdBkbXF2pG=oQ_oR_YuasGzaPDsKtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-usb@vger.kernel.org
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

On Thu, Oct 23, 2025 at 4:40=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
