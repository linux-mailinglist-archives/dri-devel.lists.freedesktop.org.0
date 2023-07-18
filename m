Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD77588F7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 01:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A6310E3DD;
	Tue, 18 Jul 2023 23:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB3C10E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 23:14:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7948961309;
 Tue, 18 Jul 2023 23:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24CC433C7;
 Tue, 18 Jul 2023 23:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689722041;
 bh=x62sPsPSG9UGK/a1ZxJcAjLq/hq7yucYXFTCdWov/mw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=aIuBbCaJRNzn3F1bUV8rMwSOURV5dTifC/CmXi3msF1UXrtKwiaHKbvlCsAAAEH0x
 yqCKGbluq3oe/YSoJr7le0qKBIllhGIIJOG9vJrnyPxvHoxJq2873vxFmlG2aNXBCQ
 FaNWmFJLIT49Cs3J2aGKSZd1qbSLT2BtusdXlt4TgpQShFypSbC6eNvU0/uVRunPUg
 cn+fSAdAn8d/6oc7rHNhx2d9Ihh48toT5lEwLvJRuoaVb0zLPBnq0t6yApoVPuSEfs
 TSBwpxL8vjfq7s8aeVy5DMbcxs8/osgIHtIYqVckEf/IYPQ1/jrA6eldteJeLIap2M
 umdTsbOT8laSg==
Date: Tue, 18 Jul 2023 18:14:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 2/4] PCI/VGA: Deal only with PCI VGA class devices
Message-ID: <20230718231400.GA496927@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630101731.134375-2-sui.jingfeng@linux.dev>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 06:17:29PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> VGAARB should only care about PCI VGA class devices (pdev->class == 0x0300)
> since only those devices might have VGA routed to them.

This is not actually a question of whether VGA addresses (mem
0xa0000-0xbffff and io 0x3b0-0x3bb, 0x3c0-0x3df) might be *routed* to
the device because that routing is controlled by the bridge VGA Enable
bit, not by a device Class Code.

I think the important question here is what devices will *respond* to
those VGA addresses.  The VGA arbiter works by managing bridge VGA
Enable bits, so if we know a device doesn't respond to the VGA
addresses, there's no point in adding a vga_device for it.

> PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_OTHER are used to annotate the
> render-only GPU. Render-only GPUs shouldn't decode the fixed VGA address.
> For example, nvidia render-only GPU typically has 0x0380 as its PCI class.
> 
> A render-only GPU cannot be used to display something on the screen.
> Hence, it should not be the default boot device in normal cases.

Can you make the commit log say specifically what changes with this
patch?  Is the idea that we previously added GPUs with Class Codes
like 0x0380, and after this patch we will only add GPUs that exactly
match 0x0300?

It doesn't *look* like that's the case because
vga_arbiter_add_pci_device() previously had:

  if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
    return false;

This ignores the programming interface (the low byte) but still
matches only base class 0x03 and subclass 0x00, so it shouldn't add a
0x0380 GPU.

This patch matches the entire 24-bit dev->class (base class, subclass,
and programming interface) against PCI_CLASS_DISPLAY_VGA << 8, so I
*think* this only accepts programming interface 0x00.

That might be OK, since the "PCI Code and ID Assignment" spec, r1.15,
sec 1.4, only mentions 0x0300 programming interface 0x00 as decoding
the legacy VGA addresses.  But it is something the commit log should
be clear about.

> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index c1bc6c983932..22a505e877dc 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
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
> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	bool notify = false;
>  
> -	vgaarb_dbg(dev, "%s\n", __func__);
> +	/* Only deal with VGA class devices */
> +	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
> +		return 0;
>  
>  	/* For now we're only intereted in devices added and removed. I didn't
>  	 * test this thing here, so someone needs to double check for the
> @@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  	else if (action == BUS_NOTIFY_DEL_DEVICE)
>  		notify = vga_arbiter_del_pci_device(pdev);
>  
> +	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
> +
>  	if (notify)
>  		vga_arbiter_notify_clients();
>  	return 0;
> @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
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
>  
>  	/* We add all PCI devices satisfying VGA class in the arbiter by
>  	 * default */
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
> +	}
>  
>  	pr_info("loaded\n");
>  	return rc;
> -- 
> 2.25.1
> 
