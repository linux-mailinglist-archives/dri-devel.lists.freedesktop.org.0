Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DDD95B985
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 17:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA2E10EB27;
	Thu, 22 Aug 2024 15:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="y1jsbxlb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YOjS9iFl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JiPLEqk5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ix5qUQdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490D210EB27;
 Thu, 22 Aug 2024 15:12:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9597F21C36;
 Thu, 22 Aug 2024 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724339551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6MQZLpH8eQtdv70WxvNyxywfe3uyuFLeaB2Dv0NwMkg=;
 b=y1jsbxlb/hBLGXTqYmWXBF286muWXTf4Dj9Q+8Rdf4Fq12X3FJP4/8qNyFZcLG75NBJT3x
 cVX/LEHpkTaDney1focXrvYZGXf4SWhhQ19oGMBh8OwpTInbs3YbsHQoBpcL4Cf6Y3xBWg
 k4ki/7dFwX9gHHXcq5TmkpVeANQC26w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724339551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6MQZLpH8eQtdv70WxvNyxywfe3uyuFLeaB2Dv0NwMkg=;
 b=YOjS9iFlYR8FMZW6TcBmD+IMCagDBzDodE5Y3p4MMEUNoywdChXdqGP5FBwWXMpEDWO70y
 ma4jj5EKQYl1LzBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724339550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6MQZLpH8eQtdv70WxvNyxywfe3uyuFLeaB2Dv0NwMkg=;
 b=JiPLEqk5Lh9nDCPeHiKRNCy3nvQGnPvBgL6WfqaXi3Jca2gtagXlVQIsf811+E3UQLQWTl
 Fj3xdHn8+syJQUmKM0fxN4dDhnCV5cV7Bvu04vuH5vrIQfGqval5ieiijuc5WCg2LZ6Ki7
 9Mle4HeneDNgMFidScwIMknMRAd/N50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724339550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6MQZLpH8eQtdv70WxvNyxywfe3uyuFLeaB2Dv0NwMkg=;
 b=ix5qUQdVb78+pUrFF/1DZOIB1UkOZgPhVp36g9Y0brpNib9jg0aDFzxs2+85w96o9tfPhe
 KmCAH8KT4JXqOoCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5554C13297;
 Thu, 22 Aug 2024 15:12:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JwEiE15Vx2aRcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Aug 2024 15:12:30 +0000
Message-ID: <f9461a7c-f2ea-44e1-91bb-e4767517f6f2@suse.de>
Date: Thu, 22 Aug 2024 17:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] video/aperture: optionally match the device in
 sysfb_disable()
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
References: <20240821191135.829765-1-alexander.deucher@amd.com>
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
In-Reply-To: <20240821191135.829765-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,redhat.com,gmx.de,ravnborg.org,ffwll.ch,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email, gmx.de:email, suse.de:mid,
 suse.de:email, ffwll.ch:email, ravnborg.org:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
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



Am 21.08.24 um 21:11 schrieb Alex Deucher:
> In aperture_remove_conflicting_pci_devices(), we currently only
> call sysfb_disable() on vga class devices.  This leads to the
> following problem when the pimary device is not VGA compatible:
>
> 1. A PCI device with a non-VGA class is the boot display
> 2. That device is probed first and it is not a VGA device so
>     sysfb_disable() is not called, but the device resources
>     are freed by aperture_detach_platform_device()
> 3. Non-primary GPU has a VGA class and it ends up calling sysfb_disable()
> 4. NULL pointer dereference via sysfb_disable() since the resources
>     have already been freed by aperture_detach_platform_device() when
>     it was called by the other device.
>
> Fix this by passing a device pointer to sysfb_disable() and checking
> the device to determine if we should execute it or not.
>
> v2: Fix build when CONFIG_SCREEN_INFO is not set
> v3: Move device check into the mutex
>      Drop primary variable in aperture_remove_conflicting_pci_devices()
>      Drop __init on pci sysfb_pci_dev_is_enabled()
>
> Fixes: 5ae3716cfdcd ("video/aperture: Only remove sysfb on the default vga pci device")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/firmware/sysfb.c | 19 +++++++++++++------
>   drivers/of/platform.c    |  2 +-
>   drivers/video/aperture.c | 11 +++--------
>   include/linux/sysfb.h    |  4 ++--
>   4 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 880ffcb50088..ac4680dc463f 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -39,6 +39,8 @@ static struct platform_device *pd;
>   static DEFINE_MUTEX(disable_lock);
>   static bool disabled;
>   
> +static struct device *sysfb_parent_dev(const struct screen_info *si);
> +
>   static bool sysfb_unregister(void)
>   {
>   	if (IS_ERR_OR_NULL(pd))
> @@ -52,6 +54,7 @@ static bool sysfb_unregister(void)
>   
>   /**
>    * sysfb_disable() - disable the Generic System Framebuffers support
> + * @dev:	the device to check if non-NULL
>    *
>    * This disables the registration of system framebuffer devices that match the
>    * generic drivers that make use of the system framebuffer set up by firmware.
> @@ -61,17 +64,21 @@ static bool sysfb_unregister(void)
>    * Context: The function can sleep. A @disable_lock mutex is acquired to serialize
>    *          against sysfb_init(), that registers a system framebuffer device.
>    */
> -void sysfb_disable(void)
> +void sysfb_disable(struct device *dev)
>   {
> +	struct screen_info *si = &screen_info;
> +
>   	mutex_lock(&disable_lock);
> -	sysfb_unregister();
> -	disabled = true;
> +	if (!dev || dev == sysfb_parent_dev(si)) {
> +		sysfb_unregister();
> +		disabled = true;
> +	}
>   	mutex_unlock(&disable_lock);
>   }
>   EXPORT_SYMBOL_GPL(sysfb_disable);
>   
>   #if defined(CONFIG_PCI)
> -static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
> +static bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
>   {
>   	/*
>   	 * TODO: Try to integrate this code into the PCI subsystem
> @@ -87,13 +94,13 @@ static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
>   	return true;
>   }
>   #else
> -static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
> +static bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
>   {
>   	return false;
>   }
>   #endif
>   
> -static __init struct device *sysfb_parent_dev(const struct screen_info *si)
> +static struct device *sysfb_parent_dev(const struct screen_info *si)
>   {
>   	struct pci_dev *pdev;
>   
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 389d4ea6bfc1..ef622d41eb5b 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -592,7 +592,7 @@ static int __init of_platform_default_populate_init(void)
>   			 * This can happen for example on DT systems that do EFI
>   			 * booting and may provide a GOP handle to the EFI stub.
>   			 */
> -			sysfb_disable();
> +			sysfb_disable(NULL);
>   			of_platform_device_create(node, NULL, NULL);
>   			of_node_put(node);
>   		}
> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> index 561be8feca96..2b5a1e666e9b 100644
> --- a/drivers/video/aperture.c
> +++ b/drivers/video/aperture.c
> @@ -293,7 +293,7 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
>   	 * ask for this, so let's assume that a real driver for the display
>   	 * was already probed and prevent sysfb to register devices later.
>   	 */
> -	sysfb_disable();
> +	sysfb_disable(NULL);
>   
>   	aperture_detach_devices(base, size);
>   
> @@ -346,15 +346,10 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
>    */
>   int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
>   {
> -	bool primary = false;
>   	resource_size_t base, size;
>   	int bar, ret = 0;
>   
> -	if (pdev == vga_default_device())
> -		primary = true;
> -
> -	if (primary)
> -		sysfb_disable();
> +	sysfb_disable(&pdev->dev);
>   
>   	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
>   		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> @@ -370,7 +365,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
>   	 * that consumes the VGA framebuffer I/O range. Remove this
>   	 * device as well.
>   	 */
> -	if (primary)
> +	if (pdev == vga_default_device())
>   		ret = __aperture_remove_legacy_vga_devices(pdev);
>   
>   	return ret;
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index c9cb657dad08..bef5f06a91de 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -58,11 +58,11 @@ struct efifb_dmi_info {
>   
>   #ifdef CONFIG_SYSFB
>   
> -void sysfb_disable(void);
> +void sysfb_disable(struct device *dev);
>   
>   #else /* CONFIG_SYSFB */
>   
> -static inline void sysfb_disable(void)
> +static inline void sysfb_disable(struct device *dev)
>   {
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

