Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA648D34C5
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C5D10E67D;
	Wed, 29 May 2024 10:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="np0pjepo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FF010E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:44:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 187D9CE1792;
 Wed, 29 May 2024 10:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07607C32781;
 Wed, 29 May 2024 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716979475;
 bh=w2NUtcqQzhKZrCNj5AHZJLY6Ii4aW3hyDn3AwcSEkNk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=np0pjepoSGg+tfmnkzQQQpy493Qf1VV2AL6xy/dHgphxXVYYYXe0eAHbGZmRs0wN+
 R1pG03TKfT13mCgnEfGR0W9D+abVpRhZNwJ/ebD3x6wMuoW4xNDqXVVVOgv04v4Ly8
 g6Gm7sxj+ao6znk0JoniHcRG9K6XWfNe8N6ri85nFajDUxVb1Y30g9c6M6tJlCPm5n
 bvLn2Dol8agheHA5c/GhNvm+F7X73Rwh5BXpHONBEWMzM4HZ2Qm8xa0Iz9AfAlOady
 y/vvIn/OGYic0xYR3CpV/3e0ZCgkKK+oxOoqxGtjD4Q7WsKdTrBkuEhg2TZHzLiR/z
 OAqoUUfGI46gA==
Date: Wed, 29 May 2024 05:44:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Anup Patel <apatel@ventanamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Guo Ren <guoren@kernel.org>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Maxime Ripard <mripard@kernel.org>, Lee Jones <lee@kernel.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-renesas-soc@vger.kernel.org, 
 Herve Codina <herve.codina@bootlin.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Rich Felker <dalias@libc.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 linux-clk@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Sam Ravnborg <sam@ravnborg.org>, 
 linux-fbdev@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Stephen Boyd <sboyd@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, linux-serial@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, linux-ide@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sh@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Chris Morgan <macromorgan@hotmail.com>, linux-pci@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Baoquan He <bhe@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Helge Deller <deller@gmx.de>
In-Reply-To: <2fb214e148e74fb0acc202543dca8dd8a170a6e6.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <2fb214e148e74fb0acc202543dca8dd8a170a6e6.1716965617.git.ysato@users.sourceforge.jp>
Message-Id: <171697947326.1106773.218175911484134371.robh@kernel.org>
Subject: Re: [DO NOT MERGE v8 22/36] dt-bindings: display: smi,sm501: SMI
 SM501 binding json-schema
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


On Wed, 29 May 2024 17:01:08 +0900, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/display/smi,sm501.yaml           | 443 ++++++++++++++++++
>  1 file changed, 443 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/smi,sm501.yaml: crt: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/smi,sm501.yaml: panel: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2fb214e148e74fb0acc202543dca8dd8a170a6e6.1716965617.git.ysato@users.sourceforge.jp

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

