Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B364C06D76
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6B710EAB3;
	Fri, 24 Oct 2025 15:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zWkaqmbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7DD10EAB3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:01:11 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b6cf07258e3so1708877a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761318071; x=1761922871; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
 b=zWkaqmbzqYarzOc062qAEh7sNdnJvOLLFhN74+8Qtmf/FdCA1R2sK8WF8LvISkNNSO
 iy1l2ujb+qwps44tIT/WCudsG7yTqGZOBoGN5G+d0GsdqVrH93/gB+bioEPToERvHVMs
 opbFyEXLzG+iD9RS1T4nfOzNe4+4oiD9+oaiWTPnXVBw7BGOlXLRCbYREy4RKzenIjuB
 VbdukbRvCCcOZnKlhXqImV9HEn70amR/I4bsfCqAi8I9IcGignWkrKWJ0aeNYK1KMaof
 +qman2LZBsOZOc4hxzOHvFzr4yhC4YyHRkQndjMXKY9RRn6jp+bZTho1+k6XFIQZuu5q
 fuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761318071; x=1761922871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
 b=UnP68N9L8X/jDxXPWGNNjLSakSjS9mzV0e2MVkolcoWIVY3OCdNvXXE4jyWQ4Qly2j
 Nm11XxExELAZxnUUM5KdMYZajSNKkkw7DAHEzh8cJleah5KeTEYoQWx00LIBvo3+fcwd
 u9gYC6nWNxacG6XCXuNx5wfYdpJmmHxyoYZ3pSbpnURL/PEezHil2Mqd0UImhEamEK/x
 TaWhcbIG82Vhe2FV74bCRfsZt+vFUSpOBCELOQbDMQtQjn/6XXSZgYf6C/xQEelLzR2S
 qBNAtUTtDxmMBLhDl+HcKsy0o/qId9tdXSdr3gg+5guAArncABHmPj3lyl4xE8use2yp
 QmgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Yh9K3zTNHe+G4nywbX54ah0daD/dqN2auR3+NQfvw9a5E6xgjtGT1zKPfmooVWk1kYaAEQj3sNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzOmlIOosKvSnkD5oyVwT3/vOSoE1Wj+BuK0RBYZD4iI9re0id
 dHJ8ce6DAczTcRMGkeUxPBSlmiHa40iLgPndnx3OpNJnPprAfFLVC94G8Bwu9EwcZQ8=
X-Gm-Gg: ASbGncvM4ytHz1W+o5XWzVxw+L4KZAgg/BpFdDpKaXfs12yMt615R+/kEM5wAtbXqzx
 pvgC+CRMftJAoww90TXAKL/V8XL+Up03RvN9qCfFZzYoyCytc5KC+2XG9cQD51DRs/lSvWnFXYB
 CekRkeafZT5i9X3uOnB84mgHyU66zGjcL/0Z2R1gTo8xlDjAfKamA1bv2LlEKzOQLoGX/hq46ZN
 6nX+3l+kJjKohhb70mIV+WbX9fCTUJ3svU5HPm1kUyza9zZea5tVTNk9j82ope6TnV71uFjN3xv
 9Rnv1+t3YyO5dGZKWfz2/iyb8AetpmT+OeN1lN5s3wL/WwQ5NZKdyvsnc9myZ19BB8BoFyFCsNl
 P0a0kGLBJ4odR3BtcbPYdkKu/vRu7rihZIF0DgvoVn/p/YunJdHie90/GxllTPaMNsq7RuW8A1s
 5cRZo=
X-Google-Smtp-Source: AGHT+IHuDfyfb1rJHT8ZJBZDENWXEuZEgoATFw7kevTr6Wui6O5rdZfaFJ1o7hmkdy/EeXDSX0H8pg==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id
 d9443c01a7336-290c9c8968cmr381787975ad.7.1761318070419; 
 Fri, 24 Oct 2025 08:01:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c4aa:f655:2dba:5bb5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e0f3794sm59537715ad.88.2025.10.24.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 08:01:09 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:01:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
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
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
Message-ID: <aPuUseub-Z60hrOx@p14s>
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> # remoteproc
