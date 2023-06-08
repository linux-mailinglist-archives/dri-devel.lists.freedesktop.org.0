Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029907287C0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 21:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7053A10E60E;
	Thu,  8 Jun 2023 19:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5F310E112;
 Thu,  8 Jun 2023 19:12:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D414603F6;
 Thu,  8 Jun 2023 19:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29690C433D2;
 Thu,  8 Jun 2023 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686251543;
 bh=BjGgyC3wTO33c1Tdxatub3Rc/d6F/CPXBfd8u1gAIrU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=T+IHeID0iP9vHKnUCZWCJZGQQf3diXJ9+HZsVX4IN+ITJMvEmanSAYv3Yzh8azF0B
 DwTD2hES7OI5X32J985zgUykL/VJC17J9RWkJQocx9kBsAVQUtN7/9qJ1fWYGoetMd
 eBQKXEF35moYax03HHpcg4x4OoiW4apuLCA/DkwSUiABGP3VEVW+25hBWARBeaZRfn
 BiZiRj0VAURoBIfb2OJNL2jBuXv0ll/9QSOt0PcLm9QxuSuC8Mpy9D+ED/455Mv1+8
 xPYuNx2pM23hBbcf1UJIzRvvqqOOaawENsKWeMQoiXDErRHJ6Na0/r3eSuqIymPzgT
 jsqdCdkGNLeqg==
Date: Thu, 8 Jun 2023 14:12:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [Intel-gfx] [PATCH v3 3/4] PCI/VGA: only deal with VGA class
 devices
Message-ID: <20230608191221.GA1209912@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608114322.604887-4-15330273260@189.cn>
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start with verb and capitalize to match ("Deal only with ...")

On Thu, Jun 08, 2023 at 07:43:21PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> vgaarb only deal with the VGA devcie(pdev->class == 0x0300), so replace the
> pci_get_subsys() function with pci_get_class(). Filter the non pci display
> device out. There no need to process the non display PCI device.

s/non pci/non-PCI/
s/non display/non-display/

This is fine, and I'll merge this, but someday I would like to get rid
of the bus_register_notifier() and call vga_arbiter_add_pci_device()
and vga_arbiter_del_pci_device() directly from the PCI core.

Or if you wanted to do that now, that would be even better :)

Bjorn

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 7f0347f4f6fd..b0bf4952a95d 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -756,10 +756,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>  	struct pci_dev *bridge;
>  	u16 cmd;
>  
> -	/* Only deal with VGA class devices */
> -	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
> -		return false;
> -
>  	/* Allocate structure */
>  	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>  	if (vgadev == NULL) {
> @@ -1499,7 +1495,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	bool notify = false;
>  
> -	vgaarb_dbg(dev, "%s\n", __func__);
> +	/* Only deal with VGA class devices */
> +	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
> +		return 0;
>  
>  	/* For now we're only intereted in devices added and removed. I didn't
>  	 * test this thing here, so someone needs to double check for the
> @@ -1509,6 +1507,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  	else if (action == BUS_NOTIFY_DEL_DEVICE)
>  		notify = vga_arbiter_del_pci_device(pdev);
>  
> +	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
> +
>  	if (notify)
>  		vga_arbiter_notify_clients();
>  	return 0;
> @@ -1533,8 +1533,8 @@ static struct miscdevice vga_arb_device = {
>  
>  static int __init vga_arb_device_init(void)
>  {
> +	struct pci_dev *pdev = NULL;
>  	int rc;
> -	struct pci_dev *pdev;
>  
>  	rc = misc_register(&vga_arb_device);
>  	if (rc < 0)
> @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
>  	/* We add all PCI devices satisfying VGA class in the arbiter by
>  	 * default
>  	 */
> -	pdev = NULL;
> -	while ((pdev =
> -		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> -			       PCI_ANY_ID, pdev)) != NULL)
> +	while (1) {
> +		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
> +		if (!pdev)
> +			break;
> +
>  		vga_arbiter_add_pci_device(pdev);
> +	};
>  
>  	pr_info("loaded\n");
>  	return rc;
> -- 
> 2.25.1
> 
