Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49304207642
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358F6EB86;
	Wed, 24 Jun 2020 15:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 929B46E095
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:00:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED351FB;
 Wed, 24 Jun 2020 08:00:37 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B28F73F73C;
 Wed, 24 Jun 2020 08:00:34 -0700 (PDT)
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
To: Mark Brown <broonie@kernel.org>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
 <20200624132714.GD5472@sirena.org.uk>
 <CAHp75Ve9V1Vyxe3bEeHJ9H2J900wUXHMmXFJt-dn9sO5OMejHA@mail.gmail.com>
 <20200624140207.GE5472@sirena.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6373a4eb-2f1b-b56f-48a8-ae97b4e4476a@arm.com>
Date: Wed, 24 Jun 2020 16:00:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624140207.GE5472@sirena.org.uk>
Content-Language: en-GB
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-24 15:02, Mark Brown wrote:
> On Wed, Jun 24, 2020 at 04:45:28PM +0300, Andy Shevchenko wrote:
>> On Wed, Jun 24, 2020 at 4:27 PM Mark Brown <broonie@kernel.org> wrote:
> 
>>> As I said down the thread that's not a great pattern since it means that
>>> probe deferral errors never get displayed and users have a hard time
>>> figuring out why their driver isn't instantiating.
> 
>> Don't we have a file in the debugfs to list deferred drivers?
> 
> Part of what this patch series aims to solve is that that list is not
> very useful since it doesn't provide any information on how things got
> deferred which means it's of no use in trying to figure out any
> problems.
> 
>> In the case of deferred probes the errors out of it makes users more
>> miserable in order to look through tons of spam and lose really useful
>> data in the logs.
> 
> I seem to never manage to end up using any of the systems which generate
> excessive deferrals.

Be thankful... And count me in as one of those miserable users; here's one
of mine being bad enough without even printing any specific messages about
deferring ;)

Robin.

-----

[robin@weasel-cheese ~]$ dmesg | grep dwmmc
[    3.046297] dwmmc_rockchip ff0c0000.mmc: IDMAC supports 32-bit address mode.
[    3.054312] dwmmc_rockchip ff0c0000.mmc: Using internal DMA controller.
[    3.061774] dwmmc_rockchip ff0c0000.mmc: Version ID is 270a
[    3.068101] dwmmc_rockchip ff0c0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo
[    3.079638] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[    3.087678] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[    3.095134] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[    3.101480] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    3.113071] dwmmc_rockchip ff0f0000.mmc: IDMAC supports 32-bit address mode.
[    3.121110] dwmmc_rockchip ff0f0000.mmc: Using internal DMA controller.
[    3.128565] dwmmc_rockchip ff0f0000.mmc: Version ID is 270a
[    3.134886] dwmmc_rockchip ff0f0000.mmc: DW MMC controller at irq 32,32 bit host data width,256 deep fifo
[    3.948510] dwmmc_rockchip ff0c0000.mmc: IDMAC supports 32-bit address mode.
[    3.956475] dwmmc_rockchip ff0c0000.mmc: Using internal DMA controller.
[    3.963884] dwmmc_rockchip ff0c0000.mmc: Version ID is 270a
[    3.970133] dwmmc_rockchip ff0c0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo
[    4.141231] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[    4.149178] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[    4.156582] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[    4.162823] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    4.175606] dwmmc_rockchip ff0f0000.mmc: IDMAC supports 32-bit address mode.
[    4.183540] dwmmc_rockchip ff0f0000.mmc: Using internal DMA controller.
[    4.190946] dwmmc_rockchip ff0f0000.mmc: Version ID is 270a
[    4.197196] dwmmc_rockchip ff0f0000.mmc: DW MMC controller at irq 32,32 bit host data width,256 deep fifo
[    4.250758] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[    4.258688] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[    4.266104] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[    4.272358] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    4.285390] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[    4.293333] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[    4.300750] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[    4.307005] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    4.971373] dwmmc_rockchip ff0f0000.mmc: Successfully tuned phase to 134
[    5.027225] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[    5.035339] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[    5.042769] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[    5.049050] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[   24.727583] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[   24.745541] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[   24.753003] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[   24.763289] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[   25.589620] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[   25.603066] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[   25.615283] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[   25.627911] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[   25.643469] dwmmc_rockchip ff0d0000.mmc: IDMAC supports 32-bit address mode.
[   25.651532] dwmmc_rockchip ff0d0000.mmc: Using internal DMA controller.
[   25.658960] dwmmc_rockchip ff0d0000.mmc: Version ID is 270a
[   25.665246] dwmmc_rockchip ff0d0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[   25.677154] dwmmc_rockchip ff0d0000.mmc: allocated mmc-pwrseq
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
