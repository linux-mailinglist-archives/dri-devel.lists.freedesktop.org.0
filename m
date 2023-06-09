Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64B72A1A4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13110E165;
	Fri,  9 Jun 2023 17:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F45910E165;
 Fri,  9 Jun 2023 17:52:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D933265A4A;
 Fri,  9 Jun 2023 17:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB2EC433D2;
 Fri,  9 Jun 2023 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686333123;
 bh=hgWiWkryxacoHHEBtfErD81DDhTgMv1CiCtR2KT1+fk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=H5t+R0xrJcTEX4Oc3TbNIlAXuyp46jL+ufcQ4Z4KG6HSdzP3tnexZh/K0OEHZ2j2w
 aMV/sItKYqtLFjhd8xHIdpFmjwRMDbzVY2QTUBqm6EVut4W1gRCF4jSGpbsEpLJh7P
 Bvkn7SilgTCb5MCvwn9hDguee6a4S04hcyv85fdtIA0rJ6Obeoi8fnB/OTfQLoiT/N
 nLLm66IwsLqNvD1ZJAmCwNUX6KXUUaHjg3CD3Xdbz2cOYP74617g9qJUDVy15FcB5U
 /1LjxTH+00dLuZjZ6nWv8lHXUelO2ZCGDrLIUbq1kKJtaifVjlsvKGr7ky1l4MK06+
 u6LWn7kWW50mA==
Date: Fri, 9 Jun 2023 12:52:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v8 6/8] drm/etnaviv: add driver support for the PCI devices
Message-ID: <20230609175201.GA1253027@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec178d79-f96b-072e-aa1b-dd2bf7c9cdd0@loongson.cn>
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

On Fri, Jun 09, 2023 at 09:37:02AM +0800, Sui Jingfeng wrote:
> On 2023/6/9 01:32, Bjorn Helgaas wrote:
> > On Wed, Jun 07, 2023 at 06:55:49PM +0800, Sui Jingfeng wrote:
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > 
> > > This patch adds PCI driver support on top of what we already have. Take
> > > the GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device
> > > driver. There is only one GPU core for the GC1000 in the LS7A1000 and
> > > LS2K1000. Therefore, component frameworks can be avoided.

> > > +	{PCI_VENDOR_ID_LOONGSON, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> > > +	{PCI_VENDOR_ID_LOONGSON, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> >
> > PCI_VDEVICE()
> 
> This make it impossible to hook device-specific data in the future.
> 
> But currently there no device specific data associated with the
> 0x7a05 and 0x7a15,
> 
> so it's acceptable for now. Thanks.

Haha, ISTR having this conversation before, sorry for repeating it.

Indeed, it's fine as-is.  But PCI_VDEVICE() actually *does* allow for
vendor-specific data because it doesn't include the data element,
which defaults to zero if you don't specify it.

So for example, drivers/net/ethernet/realtek/r8169_main.c has this:

  { PCI_VDEVICE(REALTEK, 0x8129) },
  { PCI_VDEVICE(REALTEK, 0x8136), RTL_CFG_NO_GBIT },

where 0x8129 has no driver_data (it defaults to zero), but 0x8136
does.

Bjorn
