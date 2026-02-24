Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BQxGYhrnWnhPwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:12:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9B18453D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2068510E52B;
	Tue, 24 Feb 2026 09:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtrpPclF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C949F10E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771924356; x=1803460356;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sllJU41EvNnfq6cfH0Cm3WpH9/CrTwdLF2yCyQc6C20=;
 b=AtrpPclFM3ja6CqT0ponkDWJQfCaZqg/AKqNMtnvMM4g0D520INZwkFE
 BwUM4mhOvC73ej+nv81e//eLlRiKChPbVQx3noE2qOhI/mCzm98425Cta
 vZnKUgGQvfZ8iMVkomr0nEOgspSGfQHaTlNCLf0TreWMhxqTDEOgBknjp
 e0bliFHyf14EjBwB1TqSwnpDGb/Ptu2xiOEhlaU69gZM891Y5gs/bg4zC
 5zm0a2IAlASDF+LPbBeIz2WwiaRGkRsUIqn2MVm5hlVQsP6D55i7RHqPT
 Vwru51TJtp5MoUFglYbgiBYuiICb+kPzvqQNppwPPEfcp8SfTMm9b0gkA A==;
X-CSE-ConnectionGUID: ZpzJiTSDTYyTkcLihCIQzw==
X-CSE-MsgGUID: 93dGPuiCSaWcaRbgf4Q5Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73039923"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73039923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:12:35 -0800
X-CSE-ConnectionGUID: v4GiDQV6T1ycBQRHOBv6QA==
X-CSE-MsgGUID: yR3Uba70Qr6uzGgc8QUkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219937945"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:12:17 -0800
Date: Tue, 24 Feb 2026 11:12:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: phasta@kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
 Shawn Lin <shawn.lin@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>,
 Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>,
 Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Antoine Tenart <atenart@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Raag Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
 dmaengine@vger.kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
 mhi@lists.linux.dev, Jan Dabros <jsd@semihalf.com>,
 linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
Message-ID: <aZ1rb8zoqmQmakDP@smile.fi.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <6223f3cb-693f-42e7-9147-30f659f08563@hogyros.de>
 <7ca512d133f7a3bcfe00e9b0b2af5fe5f147ad77.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ca512d133f7a3bcfe00e9b0b2af5fe5f147ad77.camel@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[hogyros.de,rock-chips.com,google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com,arndb.de,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,ffwll.ch,semihalf.com,zonque.org,linux.dev];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:Simon.Richter@hogyros.de,m:shawn.lin@rock-chips.com,m:bhelgaas@google.com,m:vaibhaavram.tl@microchip.com,m:kumaravel.thiagarajan@microchip.com,m:even.xu@intel.com,m:xinpeng.sun@intel.com,m:srinivas.pandruvada@linux.intel.com,m:jikos@kernel.org,m:alexandre.belloni@bootlin.com,m:wangzhou1@hisilicon.com,m:liulongfang@huawei.com,m:vkoul@kernel.org,m:lee@kernel.org,m:shaojijie@huawei.com,m:shenjian15@huawei.com,m:sgoutham@marvell.com,m:andrew+netdev@lunn.ch,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:andreas.noever@gmail.com,m:westeri@kernel.org,m:tjeznach@rivosinc.com,m:will@kernel.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:dave@stgolabs.net,m:jonathan.cameron@huawei.com,m:schalla@marvell.com,m:bbhushan2@marvell.com,m:atenart@kernel.org,m:herbert@gondor.apana.org.au,m
 :raag.jadav@intel.com,m:hansg@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:andy@kernel.org,m:mani@kernel.org,m:mika.westerberg@linux.intel.com,m:andi.shyti@kernel.org,m:rric@kernel.org,m:broonie@kernel.org,m:nirmal.patel@linux.intel.com,m:kurt.schwemmer@microsemi.com,m:logang@deltatee.com,m:linusw@kernel.org,m:brgl@kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:ulf.hansson@linaro.org,m:arnd@arndb.de,m:bentiss@kernel.org,m:linux-input@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:dmaengine@vger.kernel.org,m:netdev@vger.kernel.org,m:nic_swsd@realtek.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-cxl@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mhi@lists.linux.dev,m:jsd@semihalf.com,m:linux-i2c@vger.kernel.org,m:daniel@zonque.org,m:haojian.zhuang@gmail
 .com,m:linux-spi@vger.kernel.org,m:jonathan.derrick@linux.dev,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[87];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: C2F9B18453D
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 08:39:43AM +0100, Philipp Stanner wrote:
> On Tue, 2026-02-24 at 13:14 +0900, Simon Richter wrote:
> > On 2/24/26 12:29 AM, Shawn Lin wrote:

> > > When such a driver also uses `pcim_enable_device()`, the devres framework may
> > > attempt to free the IRQ vectors a second time upon device release, leading to
> > > a double-free. Analysis of the tree shows this hazardous pattern exists widely,
> > > while 35 other drivers correctly rely solely on the implicit cleanup.
> > 
> > Would it make sense to have a function pcim_free_irq_vectors(), to allow 
> > explicit freeing even if the device is otherwise managed, analogous to 
> > pcim_iounmap()?
> 
> We used to add those. In part because it is easier to port old users.
> 
> Nowadays I tend to think that those APIs were more on the too-complex
> than too-simple side for a long time. As an expert or as the API
> designer you wouldn't expect it, but there are actually far too many
> users who came to believe they always have to use pcim_iounmap() and
> counter parts.
> 
> If I could design it from scratch I would probably try to tell users to
> use the unmanaged versions instead of revoking the devres consequence.

+many.

> Devres is actually about your consequence always happening whenever the
> driver unloads, for whatever reason.

I believe you meant "unbinds". The device<-->driver link can be broken
without unloading the driver.

-- 
With Best Regards,
Andy Shevchenko


