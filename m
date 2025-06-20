Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438BAE1696
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 10:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320210E213;
	Fri, 20 Jun 2025 08:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="drL2aHv/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZOuTFpL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="drL2aHv/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZOuTFpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22B610E213
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 08:45:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72AD3218CE;
 Fri, 20 Jun 2025 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750409136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eKeGa7VBLRAvBYON3djkPdQ3aaduYpuA7WDUVb/4p/k=;
 b=drL2aHv/1l5jeYHhXkGtjiLQT47aWLx9nGjVsOA/gDetA95c+wk5YzW78KBQG/iDEIA4MT
 +NkFEkQuRzw5u3Ji5E5agan6HfKbPxVIZyIEvYHaeqLl2dUWciobvthV5Rh2nxyE8eSB/j
 5K/UBArOhRs4zqcImujbbk4ot4mX36g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750409136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eKeGa7VBLRAvBYON3djkPdQ3aaduYpuA7WDUVb/4p/k=;
 b=sZOuTFpLskOAy6cxr/8RT03ecZ/LiqD0QPne9u9+CQ6Q851CU1sXMjxfVmsDyGZMp6snA5
 +dXeuB5FCFEfQUCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750409136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eKeGa7VBLRAvBYON3djkPdQ3aaduYpuA7WDUVb/4p/k=;
 b=drL2aHv/1l5jeYHhXkGtjiLQT47aWLx9nGjVsOA/gDetA95c+wk5YzW78KBQG/iDEIA4MT
 +NkFEkQuRzw5u3Ji5E5agan6HfKbPxVIZyIEvYHaeqLl2dUWciobvthV5Rh2nxyE8eSB/j
 5K/UBArOhRs4zqcImujbbk4ot4mX36g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750409136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eKeGa7VBLRAvBYON3djkPdQ3aaduYpuA7WDUVb/4p/k=;
 b=sZOuTFpLskOAy6cxr/8RT03ecZ/LiqD0QPne9u9+CQ6Q851CU1sXMjxfVmsDyGZMp6snA5
 +dXeuB5FCFEfQUCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCC64136BA;
 Fri, 20 Jun 2025 08:45:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /zvKMK8fVWhPZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jun 2025 08:45:35 +0000
Message-ID: <704d2a80-79bb-4247-a2aa-25bd3eb9a7e5@suse.de>
Date: Fri, 20 Jun 2025 10:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] PCI/VGA: Move check for firmware default out of
 VGA arbiter
To: Mario Limonciello <superm1@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250620024943.3415685-1-superm1@kernel.org>
 <20250620024943.3415685-7-superm1@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250620024943.3415685-7-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; TO_DN_ALL(0.00)[]; ARC_NA(0.00)[];
 URIBL_BLOCKED(0.00)[amd.com:email,bootlin.com:url,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,wunner.de,linux.intel.com,kernel.org,infradead.org,8bytes.org,arm.com,redhat.com,perex.cz,suse.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,nvidia.com];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[25];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email, bootlin.com:url,
 imap1.dmz-prg2.suse.org:helo, amd.com:email]
X-Spam-Level: 
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

Hi

Am 20.06.25 um 04:49 schrieb Mario Limonciello:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> The x86 specific check for whether a framebuffer belongs to a device
> works for display devices as well as VGA devices.  Callers to
> video_is_primary_device() can benefit from checking non-VGA display
> devices.
>
> Move the x86 specific check into x86 specific code, and adjust VGA
> arbiter to call that code as well. This allows fbcon to find the
> right PCI device on systems that don't have VGA devices.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   arch/x86/video/video-common.c | 28 +++++++++++++++++++++++++++
>   drivers/pci/vgaarb.c          | 36 ++---------------------------------
>   2 files changed, 30 insertions(+), 34 deletions(-)
>
> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
> index 81fc97a2a837a..718116e35e450 100644
> --- a/arch/x86/video/video-common.c
> +++ b/arch/x86/video/video-common.c
> @@ -9,6 +9,7 @@
>   
>   #include <linux/module.h>
>   #include <linux/pci.h>
> +#include <linux/screen_info.h>
>   #include <linux/vgaarb.h>
>   
>   #include <asm/video.h>
> @@ -27,13 +28,40 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>   
>   bool video_is_primary_device(struct device *dev)

I'm not sure I understand this patch. video_is_primary_device() already 
exists for 3 architectures, including x86. [1] Adding it here should 
produce an error. (?)

[1] https://elixir.bootlin.com/linux/v6.15.2/A/ident/video_is_primary_device

The code on x86 is

bool 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/bool>video_is_primary_device 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/video_is_primary_device>(structdevice 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/device>*dev) { 
structpci_dev 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/pci_dev>*pdev; 
if(!dev_is_pci 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/dev_is_pci>(dev)) 
returnfalse <https://elixir.bootlin.com/linux/v6.15.2/C/ident/false>; 
pdev=to_pci_dev 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/to_pci_dev>(dev); 
return(pdev==vga_default_device 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/vga_default_device>()); }

I was thinking about extending it to test for additional properties, 
like this

bool 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/bool>video_is_primary_device 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/video_is_primary_device>(structdevice 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/device>*dev) { 
structpci_dev 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/pci_dev>*pdev; 
if(!dev_is_pci 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/dev_is_pci>(dev)) 
returnfalse <https://elixir.bootlin.com/linux/v6.15.2/C/ident/false>; 
pdev=to_pci_dev 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/to_pci_dev>(dev); 
if(pdev==vga_default_device 
<https://elixir.bootlin.com/linux/v6.15.2/C/ident/vga_default_device>()) 
return true for_each_pci_dev() { // test if display and could be 
primary. } return false; // nothing found }


This would then be called from per-device sysfs code that export a 
property similar to boot_vga (such as boot_display).


The issue is currently just an x86 problem, but I can imagine something 
similar happening on ARM. There we'd have to go through the DT tree to 
figure out the primary device. That's a problem for a later patch set, 
but we should keep this in mind.

>   {
> +	u64 base = screen_info.lfb_base;
> +	u64 size = screen_info.lfb_size;
>   	struct pci_dev *pdev;
> +	struct resource *r;
> +	u64 limit;
>   
>   	if (!dev_is_pci(dev))
>   		return false;
>   
>   	pdev = to_pci_dev(dev);
>   
> +	if (!pci_is_display(pdev))
> +		return false;
> +
> +	/* Select the device owning the boot framebuffer if there is one */
> +	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		base |= (u64)screen_info.ext_lfb_base << 32;
> +
> +	limit = base + size;
> +
> +	/* Does firmware framebuffer belong to us? */
> +	pci_dev_for_each_resource(pdev, r) {
> +		if (resource_type(r) != IORESOURCE_MEM)
> +			continue;
> +
> +		if (!r->start || !r->end)
> +			continue;
> +
> +		if (base < r->start || limit >= r->end)
> +			continue;
> +
> +		return true;
> +	}
> +

You can drop all this code and call screen_info_pci_dev() instead. I 
simply never got to update vgaarb to use it.

[2] 
https://elixir.bootlin.com/linux/v6.15.2/source/drivers/video/screen_info_pci.c#L109

>   	return (pdev == vga_default_device());
>   }
>   EXPORT_SYMBOL(video_is_primary_device);
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dbae..15ab58c70b016 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -26,12 +26,12 @@
>   #include <linux/poll.h>
>   #include <linux/miscdevice.h>
>   #include <linux/slab.h>
> -#include <linux/screen_info.h>
>   #include <linux/vt.h>
>   #include <linux/console.h>
>   #include <linux/acpi.h>
>   #include <linux/uaccess.h>
>   #include <linux/vgaarb.h>
> +#include <asm/video.h>
>   
>   static void vga_arbiter_notify_clients(void);
>   
> @@ -554,38 +554,6 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
>   }
>   EXPORT_SYMBOL(vga_put);
>   
> -static bool vga_is_firmware_default(struct pci_dev *pdev)
> -{
> -#if defined(CONFIG_X86)
> -	u64 base = screen_info.lfb_base;
> -	u64 size = screen_info.lfb_size;
> -	struct resource *r;
> -	u64 limit;
> -
> -	/* Select the device owning the boot framebuffer if there is one */
> -
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		base |= (u64)screen_info.ext_lfb_base << 32;
> -
> -	limit = base + size;
> -
> -	/* Does firmware framebuffer belong to us? */
> -	pci_dev_for_each_resource(pdev, r) {
> -		if (resource_type(r) != IORESOURCE_MEM)
> -			continue;
> -
> -		if (!r->start || !r->end)
> -			continue;
> -
> -		if (base < r->start || limit >= r->end)
> -			continue;
> -
> -		return true;
> -	}
> -#endif
> -	return false;
> -}
> -
>   static bool vga_arb_integrated_gpu(struct device *dev)
>   {
>   #if defined(CONFIG_ACPI)
> @@ -623,7 +591,7 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>   	if (boot_vga && boot_vga->is_firmware_default)
>   		return false;
>   
> -	if (vga_is_firmware_default(pdev)) {
> +	if (video_is_primary_device(&pdev->dev)) {

Maybe not change this because you don't want to end up with non-VGA 
devices here.

Best regards
Thomas

>   		vgadev->is_firmware_default = true;
>   		return true;
>   	}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

