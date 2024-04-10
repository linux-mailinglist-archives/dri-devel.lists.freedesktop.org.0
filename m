Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C066189F1CB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD92F10E772;
	Wed, 10 Apr 2024 12:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kOMDK3vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B8210E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:13:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E66E86143F;
 Wed, 10 Apr 2024 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEC7C433F1;
 Wed, 10 Apr 2024 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712751179;
 bh=I+uJ1g7ySn5pqQmYvDmMibVK1q6lbK+Bix95dorw6lU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kOMDK3vFckM481hPOtZFhyKikOF3E4sh/IDM/dHw7maAVbf24YzaX16PZz1lHCKkE
 yQLUyvsY6KbqzOEajn838MLjoKGk82wWjSvTJ8KpF6qo31BiVsd7vOlWQKWIAYW0/N
 rFTo6GtFKmziqfgF56pI5TdOhpbR74Wt8t3ypDAHgm2fXuorpLjpdyB7IH9cesq7ro
 BUlOqMHrA3Xf8jFiYJEZg59QKGILaQ7SKd0Rtp4sbANhYFtFjgDpGbLMb74tZINAfK
 SSVUaBALP0ZpgOIfCNghzgGmu/7SJ9TtQgJL63wk1Epjv1PzciMgOzGbRQ4hicMWO5
 ceWsnnaXb0l3A==
Date: Wed, 10 Apr 2024 07:12:57 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-ide@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-pci@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Herve Codina <herve.codina@bootlin.com>,
 Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Stephen Boyd <sboyd@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Damien Le Moal <dlemoal@kernel.org>, Rich Felker <dalias@libc.org>,
 Sebastian Reichel <sre@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 dri-devel@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>, Guo Ren <guoren@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-sh@vger.kernel.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org
Subject: Re: [RESEND v7 09/37] dt-binding: Add compatible SH7750 SoC
Message-ID: <171275117279.4069088.5374906172942938203.robh@kernel.org>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <4ac65d0f311e890c1ca92bf057c70954ec7ac351.1712207606.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ac65d0f311e890c1ca92bf057c70954ec7ac351.1712207606.git.ysato@users.sourceforge.jp>
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


On Thu, 04 Apr 2024 14:14:20 +0900, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

