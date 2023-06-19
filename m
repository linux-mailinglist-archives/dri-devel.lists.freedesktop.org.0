Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F5734A7D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 05:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8912410E196;
	Mon, 19 Jun 2023 03:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 525 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jun 2023 03:11:37 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
 by gabe.freedesktop.org (Postfix) with ESMTP id E92A810E18B;
 Mon, 19 Jun 2023 03:11:37 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id BF25592009C; Mon, 19 Jun 2023 05:02:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id B0C1092009B;
 Mon, 19 Jun 2023 04:02:48 +0100 (BST)
Date: Mon, 19 Jun 2023 04:02:48 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v7 2/8] PCI/VGA: Deal only with VGA class devices
In-Reply-To: <20230613030151.216625-3-15330273260@189.cn>
Message-ID: <alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk>
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-3-15330273260@189.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023, Sui Jingfeng wrote:

> Deal only with the VGA devcie(pdev->class == 0x0300), so replace the

 Typo here: s/devcie/device/.

> pci_get_subsys() function with pci_get_class(). Filter the non-PCI display
> device(pdev->class != 0x0300) out. There no need to process the non-display
> PCI device.

 I've only come across this patch series now.  Without diving into what 
this code actually does I have just one question as a matter of interest.

> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index c1bc6c983932..22a505e877dc 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	bool notify = false;
>  
> -	vgaarb_dbg(dev, "%s\n", __func__);
> +	/* Only deal with VGA class devices */
> +	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
> +		return 0;

 Hmm, shouldn't this also handle PCI_CLASS_NOT_DEFINED_VGA?  As far as I 
know it is the equivalent of PCI_CLASS_DISPLAY_VGA for PCI <= 2.0 devices 
that were implemented before the idea of PCI device classes has developed 
into its current form.  I may have such a VGA device somewhere.

  Maciej
