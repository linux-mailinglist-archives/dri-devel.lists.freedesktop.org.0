Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D972A354
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 21:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47A410E6DB;
	Fri,  9 Jun 2023 19:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF1F10E6D8;
 Fri,  9 Jun 2023 19:46:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C14E65B2E;
 Fri,  9 Jun 2023 19:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B831CC433EF;
 Fri,  9 Jun 2023 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686339984;
 bh=JvHYpswbys1U43XNU3gZS8w1UgfVc1fwneoyXTNvECk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=J78D8Dy1WGHKj+OU1z1AyPk/ILwM0Ky/0tg1+4BmsQVGYRqn4RNHttT3R+k4aZ7jE
 kgbXw3wSFaqQgiTP+C3VCtoXUYD9K07zHs7hYM8DJcWxxssnCXRM4Of8NuDq1DhpeR
 l30RirOHJRX54yqwmIjGKcEOxtgjwaq30xUQWaEZqlgj12UBDJy+FLlBiFNCN3H9f+
 tD5iAFRYcmTKU7Tiz/vaN9L9anrGMkB9ckgoXJ+rreCSbR6j3Nb0ZFACuRnvs7eGu0
 9gaeVILUk0c+/RhstEtifN5mx+AUSsi/8Iu2RXsjAd61fkxkS8sI2qbh2/xfbOE6o4
 f4NdG9LUEQ6Ag==
Date: Fri, 9 Jun 2023 14:46:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v8 6/8] drm/etnaviv: add driver support for the PCI devices
Message-ID: <20230609194621.GA1257228@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e07134-4f89-22dd-5a9c-3c8dfac50bf2@loongson.cn>
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
Cc: Li Yi <liyi@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bjorn Helgaas <bhelgaas@google.com>, Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 10, 2023 at 02:07:58AM +0800, Sui Jingfeng wrote:
> On 2023/6/10 01:52, Bjorn Helgaas wrote:
> > On Fri, Jun 09, 2023 at 09:37:02AM +0800, Sui Jingfeng wrote:
> > > On 2023/6/9 01:32, Bjorn Helgaas wrote:
> > > > On Wed, Jun 07, 2023 at 06:55:49PM +0800, Sui Jingfeng wrote:
> > > > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > 
> > > > > This patch adds PCI driver support on top of what we already have. Take
> > > > > the GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device
> > > > > driver. There is only one GPU core for the GC1000 in the LS7A1000 and
> > > > > LS2K1000. Therefore, component frameworks can be avoided.
> > > > > +	{PCI_VENDOR_ID_LOONGSON, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> > > > > +	{PCI_VENDOR_ID_LOONGSON, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> > > > PCI_VDEVICE()
> > > This make it impossible to hook device-specific data in the future.
> > > 
> > > But currently there no device specific data associated with the
> > > 0x7a05 and 0x7a15,
> > > 
> > > so it's acceptable for now. Thanks.
> > Haha, ISTR having this conversation before, sorry for repeating it.
> > 
> > Indeed, it's fine as-is.  But PCI_VDEVICE() actually *does* allow for
> > vendor-specific data because it doesn't include the data element,
> > which defaults to zero if you don't specify it.
> > 
> > So for example, drivers/net/ethernet/realtek/r8169_main.c has this:
> > 
> >    { PCI_VDEVICE(REALTEK, 0x8129) },
> >    { PCI_VDEVICE(REALTEK, 0x8136), RTL_CFG_NO_GBIT },
> > 
> > where 0x8129 has no driver_data (it defaults to zero), but 0x8136
> > does.
> 
> PCI_VDEVICE macro end with two zero. (I thought it was three)

No worries, I thought the same thing the first five times I read it :)
