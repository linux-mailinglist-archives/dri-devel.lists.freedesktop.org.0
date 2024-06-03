Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E78D86B3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28410E15C;
	Mon,  3 Jun 2024 15:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TW4lU+On";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2979010E15C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 15:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 255E7CE0B03;
 Mon,  3 Jun 2024 15:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ACBC2BD10;
 Mon,  3 Jun 2024 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717430111;
 bh=ReQXmTcvg08RqCaBOPd0ceRbHCmA79vsnPwpqNQ/OWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TW4lU+OnMLar1IkIptx6eovxmB4sv5QKfLrew2PGPPZ+6BD0EIZZZmfgPtlTXcJtA
 UbSb4lL4Kh4+KTQIRL4yL2m+v4o9lEQ5iHqLr68Ko3fxznlnn+qHpDi3MYmyxEhi4Z
 UFVf3ZGpzDBYi/mI+pDoizSK2aUiFzrF2XrTNLOWkNp2Yc02tBrOe3E7wrHs4joDzs
 Wsre3VN1F+4IQsCowKmGcRC3ke3K+kQrU2by149l+IwTvXMiNfyPwvM5Y+GExAKKFT
 xAL+dlm6hLv7BQAjEN/qVtl1hWLWqoc9J7cNH1urPkOPIW/mFGU1ZZyakOjZIlYU31
 miadAsHe6IvzQ==
Date: Mon, 3 Jun 2024 10:55:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Arnd Bergmann <arnd@arndb.de>, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rich Felker <dalias@libc.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-fbdev@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Baoquan He <bhe@redhat.com>,
 Helge Deller <deller@gmx.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guo Ren <guoren@kernel.org>, linux-pci@vger.kernel.org,
 Anup Patel <apatel@ventanamicro.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Niklas Cassel <cassel@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-ide@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-serial@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, devicetree@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Guenter Roeck <linux@roeck-us.net>, linux-sh@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-clk@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [DO NOT MERGE v8 21/36] dt-bindings: serial: renesas,scif: Add
 scif-sh7751.
Message-ID: <171743010672.507323.12704296584097795619.robh@kernel.org>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <76fffb1383820a701e0c787dcb3a25da52f6e8b7.1716965617.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76fffb1383820a701e0c787dcb3a25da52f6e8b7.1716965617.git.ysato@users.sourceforge.jp>
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


On Wed, 29 May 2024 17:01:07 +0900, Yoshinori Sato wrote:
> Add Renesas SH7751 SCIF.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

