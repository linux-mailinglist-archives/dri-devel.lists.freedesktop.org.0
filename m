Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640948476A3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 18:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CA210EBC8;
	Fri,  2 Feb 2024 17:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="uRazlhx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192AA10EBC8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 17:50:11 +0000 (UTC)
Message-ID: <2bbaab9a-3b4c-4c70-b1b2-09bc265d0476@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706896209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=glz+Whkt9eR1IOU+DpFpEwRTsaEbA18tocKSIn5mkyQ=;
 b=uRazlhx5PRpyrK7j2RFoJmbPznTNczDUf8E2m8ARPEQ9tZRay7lAXwD/R0B7S766xt1Uub
 LlyfdqTgXjN8CPSUVg6b4zxAa2TseQT0OIHcZi86BDI0MpU2TSSRBRpqa4cu50MYwZ9Xsk
 W2PvXo1wQo4uXEPZn5zNvu1+y8g3r+g=
Date: Sat, 3 Feb 2024 01:50:01 +0800
MIME-Version: 1.0
Subject: Re: [v2, 5/8] firmware/sysfb: Create firmware device only for enabled
 PCI devices
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-6-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240202120140.3517-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

HI,


On 2024/2/2 19:58, Thomas Zimmermann wrote:
> Test if the firmware framebuffer's parent PCI device, if any, has
> been enabled. If not, the firmware framebuffer is most likely not
> working. Hence, do not create a device for the firmware framebuffer
> on disabled PCI devices.
>
> So far, efifb tracked the status of the PCI parent device internally
> and did not bind if it was disabled. This patch implements the
> functionality for all firmware framebuffers.


For *all* ?

I think the functionality this patch implemented is only target for the
PCIe device firmware framebuffers, the framebuffer consumed by the simplefb
driver (fbdev/simplefb.c) is also a kind of firmware framebuffer, but it is
target for the platform device only.

So, the correct description would be: "this patch implements the functionality
for the PCIe firmware framebuffers".

> v2:
> 	* rework sysfb_pci_dev_is_enabled() (Javier)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/firmware/sysfb.c | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index d02945b0d8ea1..ab5cbc0326f6d 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -70,13 +70,39 @@ void sysfb_disable(void)
>   }
>   EXPORT_SYMBOL_GPL(sysfb_disable);
>   
> +#if defined(CONFIG_PCI)
> +static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
> +{
> +	/*
> +	 * TODO: Try to integrate this code into the PCI subsystem
> +	 */
> +	int ret;
> +	u16 command;
> +
> +	ret = pci_read_config_word(pdev, PCI_COMMAND, &command);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return false;
> +	if (!(command & PCI_COMMAND_MEMORY))
> +		return false;
> +	return true;
> +}
> +#else
> +static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
> +{
> +	return false;
> +}
> +#endif
> +
>   static __init struct device *sysfb_parent_dev(const struct screen_info *si)
>   {
>   	struct pci_dev *pdev;
>   
>   	pdev = screen_info_pci_dev(si);
> -	if (pdev)
> +	if (pdev) {
> +		if (!sysfb_pci_dev_is_enabled(pdev))
> +			return ERR_PTR(-ENODEV);


Is it better to move the call of sysfb_pci_dev_is_enabled() out of sysfb_parent_dev() ?
Because then we don't need check the returned value by calling the IS_ERR() inthe sysfb_init() function.


>   		return &pdev->dev;
> +	}
>   
>   	return NULL;
>   }
> @@ -97,6 +123,8 @@ static __init int sysfb_init(void)
>   	sysfb_apply_efi_quirks();
>   
>   	parent = sysfb_parent_dev(si);
> +	if (IS_ERR(parent))
> +		goto unlock_mutex;

	if (!sysfb_pci_dev_is_enabled(parent))
		goto unlock_mutex;

>   
>   	/* try to create a simple-framebuffer device */
>   	compatible = sysfb_parse_mode(si, &mode);
