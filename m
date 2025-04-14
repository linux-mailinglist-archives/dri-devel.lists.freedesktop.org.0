Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A819A88C35
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 21:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836410E2DC;
	Mon, 14 Apr 2025 19:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EoEQDZuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3831510E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 19:21:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A714A43B87;
 Mon, 14 Apr 2025 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744658487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5GTu46taMVNxHpTDe1teTJEFAE0ftANyUse/UH9TgI=;
 b=EoEQDZuWm/YFxLogtslK/wvSP90b71yi6k3yAgSkFaq1eyiOvFAO0AZwteNO1jxBIiH14c
 6ywnyjrkBdxEvcYxzdL2AaC2O9tBOis7LvxlYJfB9mmYPcYnO8jjJQHwuC+M1IVe6s9OmN
 mlqsJs1U1o2UPUFWZj3rvzZEYD+BCNsC+Ed07UrTm05B4xG795lHfg+EKAfd0oGvYE5V1S
 5HV77zJHOhECQ05uuRvl7yoHfXPkYWHB5kW5xFyKEnNUlHf4WRifcNmQ1Cf3EcXxlk/Cqg
 plpAtDX9I+vTjiFP8y8iHcYMybhC51TFA36OCqQiCQvNwo7ACUHu/lDclcV3FA==
Date: Mon, 14 Apr 2025 21:21:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Christoph Hellwig <hch@infradead.org>, Bastien Curutchet
 <bastien.curutchet@bootlin.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <20250414212125.4b3e6f33@windsurf>
In-Reply-To: <8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org> <20250414102455.03331c0f@windsurf>
 <Z_zwZYBO5Txz6lDF@infradead.org> <20250414134831.20b04c77@windsurf>
 <8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddufeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohephhgthhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
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

Hello Andrew,

On Mon, 14 Apr 2025 12:08:44 -0500
Andrew Davis <afd@ti.com> wrote:

> "UIO is a broken legacy mess, so let's add more broken things
> to it as broken + broken => still broken, so no harm done", am I
> getting that right?

Who says UIO is a "broken legacy mess"? Only you says so. I don't see
any indication anywhere in the kernel tree suggesting that UIO is
considered a broken legacy mess.

Keep in mind that when you're running code as root, you can load a
kernel module, which can do anything on the system security-wise. So
letting UIO expose MMIO registers of devices to userspace applications
running as root is not any worse than that.

> If your FPGA IP can do DMA then you should not be using UIO in
> the first place, see UIO docs:
> 
> > Please note that UIO is not an universal driver interface. Devices that
> > are already handled well by other kernel subsystems (like networking or
> > serial or USB) are no candidates for an UIO driver.  
> 
> The DMA subsystem already handles DMA devices, so write a DMA driver.

My FPGA IP block is not a DMA controller that would fit the dmaengine
kernel subsystem. It's a weird custom device that doesn't fit in any
existing subsystem, and that happens to do "peripheral DMA" (i.e the IP
block is DMA-capable itself, without relying on a separate DMA
controller). So this (very valid) recommendation from the UIO
documentation doesn't apply to my device.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
