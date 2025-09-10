Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8CB5145A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A446410E8C4;
	Wed, 10 Sep 2025 10:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D423B10E8C4;
 Wed, 10 Sep 2025 10:48:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F8B16F8;
 Wed, 10 Sep 2025 03:48:15 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67B503F66E;
 Wed, 10 Sep 2025 03:48:22 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:48:19 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 <etnaviv@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
Message-ID: <20250910114819.00dfe07a@donnerap>
In-Reply-To: <8192c4d04f1640f140a8f2cb43e694a7476bb0ca.camel@pengutronix.de>
References: <20250904002924.2bc63b73@minigeek.lan>
 <8192c4d04f1640f140a8f2cb43e694a7476bb0ca.camel@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 10 Sep 2025 09:28:19 +0200
Lucas Stach <l.stach@pengutronix.de> wrote:

> Hi Andre,
> 
> Am Donnerstag, dem 04.09.2025 um 00:29 +0100 schrieb Andre Przywara:
> > Hi,
> > 
> > the Allwinner A523/A527/T527 family of SoCs feature a Vivante
> > "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
> > See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, the
> > row labelled "NPU" indicates which model has the IP. We suspect it's
> > all the same die, with the NPU selectively fused off on some packages.
> > 
> > Board vendors seem to use multiple SKUs of the SoC on the same board,
> > so it's hard to say which particular board has the NPU or not. We
> > figured that on unsupported SoCs all the NPU registers read as 0,
> > though, so were wondering if that could be considered as a bail-out
> > check for the driver?
> > At the moment I get this, on a SoC with a disabled NPU:
> > [    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)
> > [    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0
> > [    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
> > [    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
> > [    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0x00000000
> > 
> > Chen-Yu got this on his board featuring the NPU:
> >     etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003
> > 
> > If I get the code correctly, then etnaviv_gpu_init() correctly detects
> > the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
> > etnaviv_drv.c then somewhat ignores this, since it keeps looking for more
> > GPUs, and fails to notice that *none* showed up:
> > /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.
> > 
> > Quick questions:
> > - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
> >   registers) an invalid ID, so we can use that to detect those disabled
> >   NPUs? If not, can any other register used to check this? The whole
> >   block seems to be RAZ/WI when the NPU is disabled.
> >   
> Yes, 0 is not a valid core ID.

Ah, thanks, that helps to identify the situation (see below).

> > - Would it be acceptable to change the logic to error out of the
> >   driver's init or probe routine when no GPU/NPU has been found, at
> >   best with a proper error message? As it stands at the moment, the
> >   driver is loaded, but of course nothing is usable, so it keeps
> >   confusing users.  
> 
> Yes, I think it would be fine to not expose the DRM device at all if no
> usable GPU core has been found.
> 
> However, I think it would still be good if your bootloader would fix up
> the DT to avoid probing the driver at all if possible. It may work on
> your system but access to a disabled GPU MMIO is not RAZ/WI everywhere.

Yes, I agree, Allwinner is "nice" by using RAZ/WI if possible, but indeed
most other platforms SERROR out when touching an address without a device.

> On i.MX8M* we have a similar situation with disabled peripherals. There
> the bootloader can detect which peripherals are active by looking at
> the SoC fuses and fixes up the DT status property accordingly. Not sure
> if you may have something similar on the Allwinner.

We have code for DT patching in U-Boot, and use that already for some
Allwinner boards. I don't know if we can identify the actual fuse used. We
could use the SoC package identifier (first word of the SID eFUSE device,
cf. the second row in here [1]), but that would require maintenance, as new
IDs will show up, and we don't know every single one even now.
Another method would be to just ungate the clock and de-assert the reset,
then read the NPU ID register (0x18?) to see if it's zero or not. Probably
the most robust, but involves a bit more code, as we probably would need
some pseudo-device to fetch those reset/clock details from the DT.

I guess the current situation works as well, for now, but I will look at a
U-Boot patch, just wanted to check if we can avoid that.

Cheers,
Andre


