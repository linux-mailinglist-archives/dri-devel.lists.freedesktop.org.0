Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB38D34C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE2810E5AA;
	Wed, 29 May 2024 10:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O9K3lbkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCF710E5AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:44:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAF886283C;
 Wed, 29 May 2024 10:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E84BC4AF09;
 Wed, 29 May 2024 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716979476;
 bh=s8KdvSWO6HOHAGUGJGDqeLCe+B13uuVSOHh4kq7jejg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=O9K3lbklkKB2Jie3QsfACPrRW8c9tFLYnkt2tyMY+RcM+3fncWnIGqA95YTsAs6pq
 0TJ5GwnaVa2sm1Exchz9DLbs1vX7ah6j0w9svRttzVoAy7miEcSpSFwJj+4Eo3NS63
 SSG7q2XZ8fIizkOYQr1q/gRO85p14BNgBY/F0xQ8MXtejL9Qvb3+2Y6DNz9/d7sQUi
 C40NMghnMIyZm5CgFiYpZL5BuEs4I2w/hXqSsFwxgttEkIbNTo0QFTIrPXormX7ptW
 mBOMq4TNRfeYnCXCSNnTOafBydgMPca//J5IUGd3kLly0wh9soHqYlgOkexrkNY+SE
 lqfzyYAot6hjw==
Date: Wed, 29 May 2024 05:44:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Herve Codina <herve.codina@bootlin.com>, linux-clk@vger.kernel.org, 
 Rich Felker <dalias@libc.org>, Jonathan Corbet <corbet@lwn.net>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-ide@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-serial@vger.kernel.org, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Jiri Slaby <jirislaby@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Sebastian Reichel <sre@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jacky Huang <ychuang3@nuvoton.com>, Niklas Cassel <cassel@kernel.org>, 
 linux-fbdev@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Airlie <airlied@gmail.com>, linux-sh@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, linux-pci@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Baoquan He <bhe@redhat.com>, Guo Ren <guoren@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Anup Patel <apatel@ventanamicro.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <d54cb668f3f19221fdbf34a70a9123fb3a6b4004.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <d54cb668f3f19221fdbf34a70a9123fb3a6b4004.1716965617.git.ysato@users.sourceforge.jp>
Message-Id: <171697947401.1106915.1101535794733326128.robh@kernel.org>
Subject: Re: [DO NOT MERGE v8 24/36] dt-binding: sh: cpus: Add SH CPUs
 json-schema
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


On Wed, 29 May 2024 17:01:10 +0900, Yoshinori Sato wrote:
> Renesas SH series and compatible ISA CPUs.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../devicetree/bindings/sh/cpus.yaml          | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sh/cpus.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sh/cpus.example.dtb: cpu@0: 'clock-names', 'dcache-line-size', 'dcache-size', 'icache-line-size', 'icache-size' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sh/cpus.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/d54cb668f3f19221fdbf34a70a9123fb3a6b4004.1716965617.git.ysato@users.sourceforge.jp

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

