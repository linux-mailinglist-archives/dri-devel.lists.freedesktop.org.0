Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3BA205AC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 09:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C30010E3D1;
	Tue, 28 Jan 2025 08:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4TphOHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91EE10E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737984329; x=1769520329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RjFj+btLOrA1I0c/0XDEPot6dd9rNyckywxmgkJzq3o=;
 b=c4TphOHnOc6wrt2+smoGshV7o6p9F15alON/EAq8PJ9nPfbZ03eYHLE0
 LYEzkqP7sUu1f+2XxTk/YsB9lnpxeEF47VM6CUyO+9OW3IMs1Kawc/NFa
 8YAxQTeA2bfAwhdxu5fS0sAmFL+70H5LHFcLwKMXCMm3q0wo3f2YM+rnS
 2smR6qVdZbEekuIHYXyn7CVaFjL+tPhRIxEiurTqCD/obnKOS6wOFFwuK
 7xAaPlJ2FXdQNs3dbJNsiLAgc8fy/HnuvaSw+ixLvP6ElLLr0i77w2/ZQ
 qZ9uCGjnqRBmH8v/E0VyKAgUV2U7XeG6qaZBDUUPhEZPxf2/dU1HrgRoi Q==;
X-CSE-ConnectionGUID: sy+2kzW9QcO9eEmywQQ4UQ==
X-CSE-MsgGUID: s8DfOOfVQPezTidfn36mJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42105388"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="42105388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 05:25:22 -0800
X-CSE-ConnectionGUID: oOw//HyuRH2sXbDiVD3/cA==
X-CSE-MsgGUID: F7vXYkyrSx2N1gt4t3xT9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131730368"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 05:25:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1tcP6l-00000005jpm-3fIe; Mon, 27 Jan 2025 15:24:55 +0200
Date: Mon, 27 Jan 2025 15:24:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Vinod Koul <vkoul@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Markuss Broks <markuss.broks@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Kalle Valo <kvalo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 Alex Elder <elder@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Jacky Huang <ychuang3@nuvoton.com>, Helge Deller <deller@gmx.de>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 iommu@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-kbuild@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/34] address all -Wunused-const warnings
Message-ID: <Z5eJJ199QwL0HVJT@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 28 Jan 2025 08:09:25 +0000
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

On Wed, Apr 03, 2024 at 10:06:18AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> In W=1 builds, we get warnings only static const variables in C
> files, but not in headers, which is a good compromise, but this still
> produces warning output in at least 30 files. These warnings are
> almost all harmless, but also trivial to fix, and there is no
> good reason to warn only about the non-const variables being unused.
> 
> I've gone through all the files that I found using randconfig and
> allmodconfig builds and created patches to avoid these warnings,
> with the goal of retaining a clean build once the option is enabled
> by default.
> 
> Unfortunately, there is one fairly large patch ("drivers: remove
> incorrect of_match_ptr/ACPI_PTR annotations") that touches
> 34 individual drivers that all need the same one-line change.
> If necessary, I can split it up by driver or by subsystem,
> but at least for reviewing I would keep it as one piece for
> the moment.
> 
> Please merge the individual patches through subsystem trees.
> I expect that some of these will have to go through multiple
> revisions before they are picked up, so anything that gets
> applied early saves me from resending.

Arnd, can you refresh this one? It seems some misses still...
I have got 3+ 0-day reports against one of the mux drivers.

https://lore.kernel.org/all/?q=adg792a.c

-- 
With Best Regards,
Andy Shevchenko


