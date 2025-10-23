Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06802C0230E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 17:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2147810E91C;
	Thu, 23 Oct 2025 15:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="azP1Mi9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095610E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:42:26 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7a265a02477so773861b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761234146; x=1761838946; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
 b=azP1Mi9Z9dklWs0tvLUd62tfH+6RQAEx4meuYYbmYjjBeksAYHwSBN7appoNqySho/
 2rstjoFsGOkNKQbRGX1iKIAxQkcCi5neK0kauhXaZMrBKLaOW8JiA5x+sDtxfe4qLLdb
 2y4/NWRjL+6geTqUIKp93TcxMxafGajLj9Z8o9yZ9ZZdn2KfhBGcB+LIwX9ldBvY7skf
 PH7/HvoxvLlJZXoS535us19y3CONL4ztSbBmuYkB12INRV+1FLSSgumTH/b/75HHUGYE
 3fPBbEXHcTP72YPvIFYo8iDCgSnJK+bt+c3cIR1b8+632f4gvjEYs4Yumkx3Dqas6DKt
 uPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761234146; x=1761838946;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
 b=BSKT5eimZ8KauQF+kqUsM9wKxyz1JVH+rKjD3W7g5K0+VPHsIfUUdJj+ZpIw5cAyR9
 e0DHSVSoJnHIcKgVkKW11QWYfn8keriSthuOjWavibubNpKfHLS9dQnb3pxtexzaMVC/
 Ad994riF38A6/lunvhyjKWpkFmjULu9rymsO3dHk+VpRxdPYOBQUxny3ETCSLzvXDjOQ
 mKNCkLL9DfxO93Nu5U/UU0bg7SikTTzH0kA0pUfaVb7AKH1gjeKGNiqN9FNfTXVgMUvD
 k0jCmi8rggek7HCtT3i6O0VYJ2maZSweROE0+tgeKe6pUd+qEMvCf0W6fgrdVzZceMqw
 lolw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTbf58cEnwyo8q+9WFpCy2O46eUQ9G1mz1XqMx6KNROYSjCLjtAfcsAZT2MKGZrrHKEdZGrs/c874=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYgkn15Dfo3p0gRuMA3LsQiIu7ts3vtqaMMBjfaAwLg1zWHlaY
 OF7I4TEMP3E4+G0PUD7AoKrHgbHJZfr9KC5tgni+P9xKl7KZNnQIxtki
X-Gm-Gg: ASbGncvQaycYwlTCVLl7UM3lEu1qllwkGAKKNf/OtVGz4Ogx9BNKceGAYWKnUGyMJkR
 Gi3HrrTEwglsiHiVBlPQTDkhhD3+OfdgikkdX5H0XbL7r3Lpz3t0lE87uXtBdZCwkOzsUAKyYbc
 fjzdDkYO/Ui/D9X6TwAZKnt53EhAujBTp8ivI1s+JVrFS9x1uWfgHf9ulIKFFx2Gi239lDQKWyK
 O1FajCNCN062mhdLyRjHf0cuUU2oKzYUz1JGsRJgtw+9tmCyH4ZoUZ9tUOw7/6UdyMc0iHfA1l9
 fSUsg/iL6z6zXDwsgY78EJEsKOHdfgLB0ds12b2EN7tEZUN7UjGa4S/gEUCgLvVuxcVkCtyxiO5
 QWbecP7yYKn/lRRjmyljP2/O1ncWn6ZVjsg3Ln7IbvJ0vO1P6gEBR/VaGOr9Pp6iibZrhtQ3eNr
 ZrPfihNe8Fg/Sx
X-Google-Smtp-Source: AGHT+IFivLiKbkP0y2KMH2ZNEJ7GlEhOb9t2a5oI0W2mRRwwxItjHXvAd1GZTuvYOgULd0RdTXOLyw==
X-Received: by 2002:a17:903:1746:b0:290:9ebf:211b with SMTP id
 d9443c01a7336-290cb07d223mr295078455ad.40.1761234145718; 
 Thu, 23 Oct 2025 08:42:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946dda72ddsm27825615ad.6.2025.10.23.08.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 08:42:24 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:42:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <0d01d218-15df-4553-8e84-fef84fde211e@roeck-us.net>
References: <20251023143957.2899600-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
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

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>
