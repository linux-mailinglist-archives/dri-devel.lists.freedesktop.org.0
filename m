Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A3724BFF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0876D10E14B;
	Tue,  6 Jun 2023 19:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6AB10E14B;
 Tue,  6 Jun 2023 19:01:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 811956133A;
 Tue,  6 Jun 2023 19:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB594C433EF;
 Tue,  6 Jun 2023 19:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686078063;
 bh=8VSP6X5HdznLbwQMYErzABqaXfaxZIW755OS+DXUrX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Jc5KjSXvQdpp345q2PX36NiZZ/vb4vcpz8ysOTPRNM4mjZFJ+oos/O2ps7jrZTvBP
 jSAA9yYobIgs5OmhViLvRkVIjz8izi3zcTYQmRpPjXq0doKpN/v8x+3BsmgyVluN3+
 EQgXHGed04Uqq1hXXJxrtwG4B/Z1i4OoECdfdZJwDePA/m0k6UfKk9BKcv4YhNzO3T
 DTp2/96VG1pKXwRvWVfOzey0hlwagGlcRRCmloZY5/g2HyVZ0cNHQy9VouEHgYhW1H
 nJS+P0Nn89MlC8i/xA73J/6+toJBfuuL8Wgs9ZHartLOISG4nVRblkmQtEjKMSVJaJ
 CnqJT76hZA9YA==
Date: Tue, 6 Jun 2023 14:01:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v7 7/7] drm/etnaviv: add support for the dma coherent
 device
Message-ID: <20230606190102.GA1134540@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <234586a0-995c-b4c4-3b7b-35afeea1a797@loongson.cn>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 02:43:27AM +0800, Sui Jingfeng wrote:
> On 2023/6/7 00:56, Bjorn Helgaas wrote:
> > On Sat, Jun 03, 2023 at 06:59:43PM +0800, Sui Jingfeng wrote:
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > 
> > > Loongson CPUs maintain cache coherency by hardware, which means that the
> > > data in the CPU cache is identical to the data in main system memory. As
> > > for the peripheral device, most of Loongson chips chose to define the
> > > peripherals as DMA coherent by default, device drivers do not need to
> > > maintain the coherency between a processor and an I/O device manually.
> > ...

> > I guess the only way to discover this coherency attribute is via the
> > DT "vivante,gc" property?  Seems a little weird but I'm really not a
> > DT person.
> 
> I'm not sure it is *only*, but it is very convenient to achieve such a thing
> with DT.

I don't know if this is a property of the PCI device, or a property of
the system as a whole.  I asked because PCI devices should be
self-describing (the Device/Vendor ID should be enough to identify the
correct driver, and the driver should know how to learn anything else
it needs to know about the device from PCI config space) and should
not require extra DT properties. 

But if this is a CPU or system property, you probably have to use a
firmware interface like DT or ACPI.

> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/delay.h>
> > >   #include <linux/dma-fence.h>
> > >   #include <linux/dma-mapping.h>
> > > +#include <linux/dma-map-ops.h>
> >
> > It looks like this #include might not be needed?
> 
> No, the dev_is_dma_coherent() function is declared and defined in
> dma-map-ops.h.  if remove it, gcc will complain:
> 
> drivers/gpu/drm/etnaviv/etnaviv_drv.c: In function
> ‘etnaviv_is_dma_coherent’:
> drivers/gpu/drm/etnaviv/etnaviv_drv.c:56:14: error: implicit declaration of
> function ‘dev_is_dma_coherent’; did you mean ‘etnaviv_is_dma_coherent’?
> [-Werror=implicit-function-declaration]
>    56 |   coherent = dev_is_dma_coherent(dev);
>       |              ^~~~~~~~~~~~~~~~~~~

Of course, but that warning is for etnaviv_drv.c, not for
etnaviv_gpu.c.  So etnaviv_drv.c needs to include dma-map-ops.h, but I
don't think etnaviv_gpu.c does.  I removed this #include from
etnaviv_gpu.c and it still built without errors.

> > You're only adding a
> > new reference to priv->dma_coherent, which looks like it was added to
> > etnaviv_drv.h.
