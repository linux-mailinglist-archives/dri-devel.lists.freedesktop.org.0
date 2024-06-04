Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0698FBBFB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 20:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B1B10E5CF;
	Tue,  4 Jun 2024 18:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RripcphE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F0F10E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 18:43:17 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52ba5868965so1153277e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1717526595; x=1718131395;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
 b=RripcphE0LjSpRj7cyS3kMd5yXu7mnlsSl35NDxKo7rIBNt1dltJtU/HAneFXsoCq6
 bFpyozy5LLqo/GLGRpYAFVqsmpEcfs+hdslwiVlkdpXAlbnHxPT8xvjZOKlrty/1xQE3
 whbVJyuaogu8Kc1zEv9dzxGj5Vfe7OtK0QyDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717526595; x=1718131395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
 b=fXPApKGUcNO1awoSDtxRnYQmmIV1lcO3Q2WYwWjkxmkJ3+Q4EYJhNldx9OxFDTjQHo
 dT/inU+wrsYIgSnmZNm/7DF+yY/M04qm/k0OQsSwPwZPCRPGlPiRY1qUBjr5ocKo5M7s
 TpMGM0y6/304b9y4t9IBQRM7doPzostmzirQGfmfxy5jY4J6aLjBfiTze6ava7xf1YZl
 tex6cqKs0L7YQ3RvHaYaA4mLZm9E5dMl/1WzhoL0eWRTmASj0FubC1Gk3bovXpwskWZ1
 esUKRUAuSRlQtHY4WNdrmJx0V08hNXaN+xF52WO+i8Y51aZuB4KKRhCtayEbCQmi2wC+
 N/3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl1LEx9ghEXU7rD5Ee0ZytSyFjHD7T5Jvz0cgPZgi99GYDei2VlH626QYymq3vfuQVbhEE8ogMxWkMpSWzgOS0gtBUxZNjwok9BaXjOHEu
X-Gm-Message-State: AOJu0YxD6Am/6HWlfLEDFfcGYcYLwLBmYPpjtpPKyeOYS8jVbTbJwgQl
 7KbhkIvXSy6CTpu9w1VBHkUW2nHh6ZajD4wdNH8ZR4Gdxz9A8HCfwf7u9rlc1fgmrHz7HKGqylD
 IK2FuQA==
X-Google-Smtp-Source: AGHT+IHJdpz28e3IZpJBir66V3j9pKE7Xeq9p78FfiaIHA9wgVdB1QrVYq0hiOsQycH2bi4RU5w+DQ==
X-Received: by 2002:a05:6512:6e:b0:52b:4f30:9cac with SMTP id
 2adb3069b0e04-52bab4fb68bmr199096e87.56.1717526595379; 
 Tue, 04 Jun 2024 11:43:15 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31c9c0f1sm7896688a12.80.2024.06.04.11.43.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 11:43:15 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so4867121f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 11:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVmJ68OCi7EQR5/RWL0eeNFnxVjjPviZvoGwrwXzS6v4vmiVWl9ga3lDz3DrgKyfB5Ss+RtercgTacpM8Je+rcw+2NQ3YzZlESjZu4SYMAs
X-Received: by 2002:a17:906:54b:b0:a62:2cae:c02 with SMTP id
 a640c23a62f3a-a69a024ce40mr20818866b.61.1717526574326; Tue, 04 Jun 2024
 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
 <Zl9b_Wh_Lx7Aln1q@intel.com>
In-Reply-To: <Zl9b_Wh_Lx7Aln1q@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Jun 2024 11:42:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
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
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Stanley Chang <stanley_chang@realtek.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Abdel Alkuor <abdelalkuor@geotab.com>, 
 Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>,
 Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
 Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, qat-linux@intel.com, 
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
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
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Hu Ziji <huziji@marvell.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Kalle Valo <kvalo@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 JC Kuo <jckuo@nvidia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
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
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Jun 2024 18:59:17 +0000
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

On Tue, 4 Jun 2024 at 11:25, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> (I believe that the new _match_string(str1, size, str2) deserves a better name,
> but since I'm bad with naming stuff, I don't have any good suggestion)

I hated the enormous cc list, so I didn't reply to all. But clearly
everybody else is just doing so.

Anyway, here's my NAK for this patch with explanation:

    https://lore.kernel.org/all/CAHk-=wg5F99-GZPETsasJd0JB0JGcdmmPeHRxCtT4_i83h8avg@mail.gmail.com/

and part of it was the naming, but there were other oddities there too.

           Linus
