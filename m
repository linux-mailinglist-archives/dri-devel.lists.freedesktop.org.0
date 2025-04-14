Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B4A87F90
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C185910E58E;
	Mon, 14 Apr 2025 11:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JgU96GVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3D310E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:48:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFCA14397C;
 Mon, 14 Apr 2025 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744631315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6CpKHYE4RH4SAXoypcVbA2iREoZ4cwFDGsOs3AGUT8=;
 b=JgU96GViuEpr6Ee/o8L3t8o0PE+3idNIeLwwIP+gM42sBs3YvHKEoIHSuMQJflU1fbAdH1
 ohhsDbozYc/YFec+Wa2vCrTZ5qPOMsIE2GUnsbl7j9yBSODLxQO3gHeDgbk/MjMnCPCmtA
 pS8QFNNZBW8OJcCHj+0gUafNDCLuMZCt6K7tqC3J0BoLVmO8hLYcHVWuj8EB/xY63fJiWh
 UO3swrUc/eO+2LWv7BN3t4jI9aj3v8t+shXVgPcMJ4wuo8Xe6OGy3EWgkbX6Fl2mpUcYTH
 vy8dOVkDpKHYl/x1RP4ULFadCcmKe+OjU02KymlZZqHjlrVakzkNrUJpeL2bhQ==
Date: Mon, 14 Apr 2025 13:48:31 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <20250414134831.20b04c77@windsurf>
In-Reply-To: <Z_zwZYBO5Txz6lDF@infradead.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org> <20250414102455.03331c0f@windsurf>
 <Z_zwZYBO5Txz6lDF@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsu
 hhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhgrrhhoqdhmmhdqshhigheslhhishhtshdrlhhinhgrrhhordhorhhg
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

Hello Christoph,

On Mon, 14 Apr 2025 04:24:21 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Mon, Apr 14, 2025 at 10:24:55AM +0200, Thomas Petazzoni wrote:
> > What this patch series is about is to add new user-space interface to
> > extend the existing UIO subsystem.  
> 
> Which as I explained to you is fundamentally broken and unsafe.  If you
> need to do DMA from userspae you need to use vfio/iommufd.

I'm still unclear as to why it is more "broken and unsafe" than UIO
already is. As I already replied in this thread: UIO allows to remap
MMIO registers into a user-space application, which can then do
whatever it wants with the IP block behind those MMIO registers. If
this IP block supports DMA, it already means that _today_ with the
current UIO subsystem as it is, the user-space application can program
a DMA transfer to read/write to any location in memory.

Therefore, providing a way to cleanly allocate DMA buffers and get
their physical address will not make things any better or worse in
terms of safety.

The fact that it is reasonably safe is solely based on access control
to the UIO device, done using usual Unix permissions, and that is
already the case today.

> > I am not sure how this can work in our use-case. We have a very simple
> > set of IP blocks implemented in a FPGA, some of those IP blocks are
> > able to perform DMA operations. The register of those IP blocks are
> > mapped into a user-space application using the existing, accepted
> > upstream, UIO subsystem. Some of those registers allow to program DMA
> > transfers. So far, we can do all what we need, except program those DMA
> > transfers. Lots of people are having the same issue, and zillions of
> > ugly out-of-tree solutions flourish all over, and we're trying to see
> > if we can constructively find a solution that would be acceptable
> > upstream to resolve this use-case. Our platform is an old PowerPC with
> > no IOMMU.  
> 
> Then your driver design can't work and you need to replace it with a
> proper in-kernel driver.

See above: your point is moot because providing capabilities to
allocate a buffer and get its physical address so that a UIO-based
user-space application can do DMA transfer does not make things any
more unsafe than they already are.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
