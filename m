Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D498FAD2C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 10:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB1510E43C;
	Tue,  4 Jun 2024 08:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cO0txN5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9850010E430
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 07:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E15E561210;
 Tue,  4 Jun 2024 07:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78922C4AF07;
 Tue,  4 Jun 2024 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717487760;
 bh=4r1XIGiIBntxtYgSrLATGn9pzmPHWxwf8DOa6d4i2rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cO0txN5xdNfslfvZE791uexfYpXbRpHRIJ4K3vX7xZgZGMu/BK5fgd4ZTgoFlDPBU
 FCYQx1I4EV5cBO9u0WdQi9XhBFx+P+Xq8cKra5KDDqFlhW9YxOLdsXaSPnapDHDXxZ
 Sn9bXHmXIw6RqiRT3LYxIGzGWvsK9ueuZJjpaN78aCTZ1FV/L1CyJdAP4ozvgA8WV5
 XnvR1z5+4GS1WJqZ/Mwr1fE6xGukYvnhwpjJH69wsci4jbJCOQq4hRQZWUpXOHR8Yf
 krQZ+u74+Go0mge+d7wlxJScR5Dthshf4fStEgV84j5/ECqRXSC1OdnOXqc3QHBAya
 v/ZuT/0z8+Cxg==
Date: Tue, 4 Jun 2024 13:25:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>, Allen Pais <apais@linux.microsoft.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Perry Yuan <perry.yuan@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
 Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Elad Nachman <enachman@marvell.com>,
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Johannes Berg <johannes.berg@intel.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Stanley Chang <stanley_chang@realtek.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Abdel Alkuor <abdelalkuor@geotab.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Eric Biggers <ebiggers@google.com>,
 Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Abel Wu <wuyun.abel@bytedance.com>,
 John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, qat-linux@intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-hardening@vger.kernel.org, cgroups@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Heiko Stuebner <heiko@sntech.de>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Hu Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Kalle Valo <kvalo@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <Zl7IizU68VWtYHsV@matsya>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 04 Jun 2024 08:10:18 +0000
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

On 02-06-24, 18:57, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
> 

..

>  drivers/phy/mediatek/phy-mtk-tphy.c           |  8 ++---
>  drivers/phy/tegra/xusb.c                      |  4 +--

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
