Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJeOD70lnWlBNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:14:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2F181966
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9810E169;
	Tue, 24 Feb 2026 04:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB710E169
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:14:48 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 583C83F01D;
 Tue, 24 Feb 2026 05:14:19 +0100 (CET)
Message-ID: <6223f3cb-693f-42e7-9147-30f659f08563@hogyros.de>
Date: Tue, 24 Feb 2026 13:14:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Shawn Lin <shawn.lin@rock-chips.com>, Bjorn Helgaas
 <bhelgaas@google.com>, "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
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
 Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach
 <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Srujana Challa <schalla@marvell.com>, Bharat Bhushan
 <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>,
 Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 Mark Brown <broonie@kernel.org>, Nirmal Patel
 <nirmal.patel@linux.intel.com>, Kurt Schwemmer
 <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
 dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 netdev@vger.kernel.org, nic_swsd@realtek.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
 mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[hogyros.de];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:bhelgaas@google.com,m:vaibhaavram.tl@microchip.com,m:kumaravel.thiagarajan@microchip.com,m:even.xu@intel.com,m:xinpeng.sun@intel.com,m:srinivas.pandruvada@linux.intel.com,m:jikos@kernel.org,m:alexandre.belloni@bootlin.com,m:wangzhou1@hisilicon.com,m:liulongfang@huawei.com,m:vkoul@kernel.org,m:lee@kernel.org,m:shaojijie@huawei.com,m:shenjian15@huawei.com,m:sgoutham@marvell.com,m:andrew+netdev@lunn.ch,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:andreas.noever@gmail.com,m:westeri@kernel.org,m:tjeznach@rivosinc.com,m:will@kernel.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:dave@stgolabs.net,m:jonathan.cameron@huawei.com,m:schalla@marvell.com,m:bbhushan2@marvell.com,m:atenart@kernel.org,m:herbert@gondor.apana.org.au,m:raag.jadav@intel.com,m:hansg@kernel.org,m:greg
 kh@linuxfoundation.org,m:jirislaby@kernel.org,m:andy@kernel.org,m:mani@kernel.org,m:mika.westerberg@linux.intel.com,m:andi.shyti@kernel.org,m:rric@kernel.org,m:broonie@kernel.org,m:nirmal.patel@linux.intel.com,m:kurt.schwemmer@microsemi.com,m:logang@deltatee.com,m:linusw@kernel.org,m:brgl@kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:ulf.hansson@linaro.org,m:arnd@arndb.de,m:bentiss@kernel.org,m:linux-input@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:dmaengine@vger.kernel.org,m:phasta@kernel.org,m:netdev@vger.kernel.org,m:nic_swsd@realtek.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-cxl@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mhi@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:jsd@semihalf.com,m:linux-i2c@vger.kernel.org,m:daniel@zonque.org,m:haojian.zhu
 ang@gmail.com,m:linux-spi@vger.kernel.org,m:jonathan.derrick@linux.dev,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[rock-chips.com,google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,gmail.com,ffwll.ch,linux.intel.com,semihalf.com,zonque.org,linux.dev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[87];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hogyros.de:mid]
X-Rspamd-Queue-Id: 8CB2F181966
X-Rspamd-Action: no action

Hi,

On 2/24/26 12:29 AM, Shawn Lin wrote:

> When such a driver also uses `pcim_enable_device()`, the devres framework may
> attempt to free the IRQ vectors a second time upon device release, leading to
> a double-free. Analysis of the tree shows this hazardous pattern exists widely,
> while 35 other drivers correctly rely solely on the implicit cleanup.

Would it make sense to have a function pcim_free_irq_vectors(), to allow 
explicit freeing even if the device is otherwise managed, analogous to 
pcim_iounmap()?

    Simon
