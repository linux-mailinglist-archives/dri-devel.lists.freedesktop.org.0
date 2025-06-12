Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC900AD7BF7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D010E182;
	Thu, 12 Jun 2025 20:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gtm8mHtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A3A10E182
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 20:10:40 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b2fc93728b2so1099787a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749759040; x=1750363840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ACQzSKiLB081J7RKsan9TDO2EOdfGESNIDhEKLy5me8=;
 b=gtm8mHtjXpphf6Rcuq1kXSU2rJUwYzOsxaD2xBzyPIECzNsCU9vVpURvz7hkTOqJ6I
 z8P533bGW6+ZQizUYqb6JC1KPml1MqrRI5CnZOjfvchyAJ5ccirkTMI/LYVgR2oUB2aK
 W02MbWVheS1vSUHH1t4+Ie9WyGiHkO4wbqFBRzk0dGEjUQn/7CZFok1LWqZmKzgKbXw6
 QwiaBI2ncP5UJhpkmC7LL/GvXBXEDVmcT+JuzsqcN+fHEGGm5Yb0w4ANRjQUDdJg+WHD
 KKhowu2luch0s2Wpv4/njNOCL36kXD+e1FyRnaGDWvOzpAG4+m2r58/yIUD0lsK8m4fk
 1rdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749759040; x=1750363840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACQzSKiLB081J7RKsan9TDO2EOdfGESNIDhEKLy5me8=;
 b=VKIHmIYr00ZzyBSfgu4zANK1Q89yqRX70l/goJuSenDzOtgHg/sFlZUTmOdw0eMZ/v
 aYuUXqo3juZG1drWlB4TEwxWvC2p7OfJPTZOtFnLQ+DzCW/4NoO46C51OvTJ4Uf7jKB6
 JSo2XlsUb82N5sOHkOWjHBfC01igIRqsQ+XoE7H0myWDqB59vjEYPVfPdZ4sHyIUQS4p
 BN+ascTdRkPpgN9d7AoodjWCUlmlx6dItf0SZ7Sshr20ly0i7IVdq5YXQzu18XxwsP0H
 Wya0Cw2Yuknzj3hkabRjQLi+IbpQcHxol5LkHt4WUQRHnjUPpJNxZiqzyJdj5LAXj/yW
 NSNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnxDe6b2O4ObSsYpBfnnvGXb5E3024Krh2XWwiWFPFTAoF+ywD0PF4YjRWrM6JJQRPdkMCTvIiSHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLBv3SW9KIIHMgnkjjSoRCEzffqC6caoUxzHBJqMPb4h03Iwgy
 ywMn9FfsjaU6bsVyQlGeNWud3RBfGy5yavZ+4WQ6JupF+BMG6Zbg9kOs
X-Gm-Gg: ASbGncuZg48Q6OG2kY9SZEfhXUWSlgOIE2YcRLTQ/bhNfSuJPsCj620+6xeHhXEexPW
 Ir/EGeoQL8ecEWPo80Fnawb0vcrBDjwtnkKywnd4EmfyIYQRIOYf8VFPyQIUFtm4RhonMbOvMM8
 E5Qx+X8CqRPomjLOFDmAKB0TraMMlZh8hskDPN0JUAGjH4nglMz6y1SLXVyaYClEjjh0AbIwrgj
 /tBdIOmRz6F21tI71jNa6UDc3qoBLfiCITkZ3oNi7dSUlmFWEWOQzmvCigLnVWz63tnZQmhtvs9
 Dt81n6DMAGywvqBuVBaJknAgaGd5sOF4Khyd9rCOvhr9V8UH8Fx4bdSn95OuMQ==
X-Google-Smtp-Source: AGHT+IG8TocKyZo9LiHYpgmcLhk97cCKpOT9D/IFBCoE4AePraGyNKa1PzBXNuqHoDVO+xHoWj80Yg==
X-Received: by 2002:a05:6a21:8dc4:b0:1f5:6c94:2cd7 with SMTP id
 adf61e73a8af0-21fad11efd4mr288514637.42.1749759040324; 
 Thu, 12 Jun 2025 13:10:40 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1691d7fsm150701a12.69.2025.06.12.13.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 13:10:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:10:37 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Message-ID: <aEs0PVkwFN9uRgU0@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <20250612124415.3399e26b@kernel.org>
 <22744779.EfDdHjke4D@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22744779.EfDdHjke4D@workhorse>
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

On Thu, Jun 12, 2025 at 09:50:12PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 12 June 2025 21:44:15 Central European Summer Time Jakub Kicinski wrote:
> > On Thu, 12 Jun 2025 20:56:03 +0200 Nicolas Frattaroli wrote:
> > > Hardware of various vendors, but very notably Rockchip, often uses
> > > 32-bit registers where the upper 16-bit half of the register is a
> > > write-enable mask for the lower half.
> > 
> > Please limit the spread of this weirdness to a rockchip or "hiword"
> > specific header. To a normal reader of bitfield.h these macros will
> > be equally confusing and useless.
> > 
> 
> That is how this change started out, and then a different maintainer told
> me that this is a commonly used thing (see: the sunplus patch), and
> Rockchip just happens to have a lot of these with consistent naming.

That other maintainer was me, and the macro is indeed not used by rockchip
weirdness solely:

$ git grep HIWORD | grep -v rockchip | wc -l
326

I don't think that that having HWORD_UPDATE() in bitfield.h is a wrong
thing. Jakub, if you do, we can just create a new header for it.

Thanks,
Yury
