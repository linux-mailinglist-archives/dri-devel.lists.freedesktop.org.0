Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271389FD1F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 18:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6CB10EBB7;
	Wed, 10 Apr 2024 16:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R1E3obt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446ED113411
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 16:38:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8921061DF8;
 Wed, 10 Apr 2024 16:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBACC433F1;
 Wed, 10 Apr 2024 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712767111;
 bh=iX3oV/OqzRjgmC93miXiwRYAlMbRuyED7tJL1s5mjUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1E3obt2kD4S6U3A41s/x8MeAVa76xSg0hM9zZpclfIcJGjDZd7Z+Z0oYq9MJjeZ4
 mwBHLzTYLuLg32YIyFi4t8HXlKgVkKjrVp9rxxwggjzoxqfaLdenVywR8GgmFSF/nD
 Vbvb/AgS/82DgK2Sxcu9t0GA3TuHZQ2bppmX/BLPI4zdDSn/nywvxiFRXBCLLA3tFb
 t1cPPDYPyzH9e3FbeBPvEotYVc9H71bVUbed6R4mKRqmKAPiVjl98z2F4BZeB6v60q
 htHY38WGEOQju1dBN7aXVO99lAXTd3Jkj5EdTaOHm4i56ebD+dIvmin4tPSylnAF9J
 xPvGnvbDpXI/Q==
Date: Wed, 10 Apr 2024 11:38:28 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: David Rientjes <rientjes@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Helge Deller <deller@gmx.de>,
 linux-pci@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-clk@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Lee Jones <lee@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-ide@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Baoquan He <bhe@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 David Airlie <airlied@gmail.com>, linux-sh@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Rich Felker <dalias@libc.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [RESEND v7 28/37] dt-bindings: soc: renesas: sh: Add SH7751
 based target
Message-ID: <171276710677.411211.12362682268802975581.robh@kernel.org>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <3c2937039026fdb827709b2584528aca263f2668.1712207606.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2937039026fdb827709b2584528aca263f2668.1712207606.git.ysato@users.sourceforge.jp>
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


On Thu, 04 Apr 2024 14:14:39 +0900, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../devicetree/bindings/soc/renesas/sh.yaml   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/sh.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

