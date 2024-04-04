Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4230898267
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 09:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077D2112D16;
	Thu,  4 Apr 2024 07:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahmcg0O/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CC0112D0D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 07:45:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D890D61616;
 Thu,  4 Apr 2024 07:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5535EC433F1;
 Thu,  4 Apr 2024 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712216752;
 bh=vcETtOrVy9bTRvDJ6u7ogSjCKNt7NXEhds5NARQGbPY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ahmcg0O/wVgUSHDmaLqFtCVQppeFQLHTQcwLUR3ZoemzEiydJLq5n65V+ZZF4U3Z/
 iZTZ2dGWs5n/xGsr2C9Ro8bxdpCo0mryC+/NJ293dDVVrTasGOJjky78rF1l0Vh5Cj
 ewN+vdhM+Vk7MvaEXrP9a5f9hvvIhXjlvvkp5fjW6hQf8tlH5S2zNXD299vhN6PNvh
 Y5zEUTiauyseC4AumRqKYaxCMkjyr8HU9RPqz7Q7M32OkZevScqGC8ldR1pXRVNnPN
 lCtMqbIda7OLCc5vYYCtjdUg0R4nqeFderQtkQlFlCIFJl63TPR9JxYni0ko+ATY12
 3JVV8cyIjyi9Q==
Date: Thu, 04 Apr 2024 02:45:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-ide@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 devicetree@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 Anup Patel <apatel@ventanamicro.com>, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 David Rientjes <rientjes@google.com>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rich Felker <dalias@libc.org>, 
 linux-fbdev@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-serial@vger.kernel.org, 
 linux-pci@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Guo Ren <guoren@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
 linux-clk@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Herve Codina <herve.codina@bootlin.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Baoquan He <bhe@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <8d8dec2d75890f3a14632c9606c332fb11d89a95.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <8d8dec2d75890f3a14632c9606c332fb11d89a95.1712207606.git.ysato@users.sourceforge.jp>
Message-Id: <171221675032.1570606.17195739558800384053.robh@kernel.org>
Subject: Re: [RESEND v7 19/37] dt-bindings: interrupt-controller:
 renesas,sh7751-irl-ext: Add json-schema
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


On Thu, 04 Apr 2024 14:14:30 +0900, Yoshinori Sato wrote:
> Renesas SH7751 external interrupt encoder json-schema.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../renesas,sh7751-irl-ext.yaml               | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.example.dtb: interrupt-controller@a4000000: #interrupt-cells:0:0: 2 was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,sh7751-irl-ext.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/8d8dec2d75890f3a14632c9606c332fb11d89a95.1712207606.git.ysato@users.sourceforge.jp

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

