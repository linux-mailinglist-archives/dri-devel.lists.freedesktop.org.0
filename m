Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B767A11C96
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01E810E4EB;
	Wed, 15 Jan 2025 08:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bXVbBqQv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rKD+AQTU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bXVbBqQv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rKD+AQTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CA10E4EB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:58:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4F25211FE;
 Wed, 15 Jan 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736931462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EMCMl2NdWdLpUzCjFouuoK5M31G6eERHHjCrpxDNqDA=;
 b=bXVbBqQvTHoyS2IffJWHZK1ks7kssd1RCGAkET06cAczFGOOrb61opDPODkQYbLDjWwYs6
 PRA3RVWubxXcjLN/KS3MKYKnumwVzEWGDzjkG95EEJ59Jfaxi5WCaHxQxVHTnPZOfIJlgi
 gXh9J/+8k0r2oCkR+aiIQoeonrr365s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736931462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EMCMl2NdWdLpUzCjFouuoK5M31G6eERHHjCrpxDNqDA=;
 b=rKD+AQTUnecCiFTNOkPzHkxBrDc0C6JB2bA2V4INXgSzc6CDkTwtFKiX51VoH0Jk13chHD
 5KxBfwhCUGP0csDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736931462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EMCMl2NdWdLpUzCjFouuoK5M31G6eERHHjCrpxDNqDA=;
 b=bXVbBqQvTHoyS2IffJWHZK1ks7kssd1RCGAkET06cAczFGOOrb61opDPODkQYbLDjWwYs6
 PRA3RVWubxXcjLN/KS3MKYKnumwVzEWGDzjkG95EEJ59Jfaxi5WCaHxQxVHTnPZOfIJlgi
 gXh9J/+8k0r2oCkR+aiIQoeonrr365s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736931462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EMCMl2NdWdLpUzCjFouuoK5M31G6eERHHjCrpxDNqDA=;
 b=rKD+AQTUnecCiFTNOkPzHkxBrDc0C6JB2bA2V4INXgSzc6CDkTwtFKiX51VoH0Jk13chHD
 5KxBfwhCUGP0csDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C17813A6F;
 Wed, 15 Jan 2025 08:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zdJDFYZ4h2dcDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jan 2025 08:57:42 +0000
Message-ID: <f365c722-c294-4834-8c84-fd6dcd4a9ee9@suse.de>
Date: Wed, 15 Jan 2025 09:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] drm/ls2kbmc: Add Loongson-2K BMC reset function
 support
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, dri-devel@lists.freedesktop.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Chong Qiao <qiaochong@loongson.cn>
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <b0ac8b81fbb8955ed8ada27aba423cff45aad9f6.1735550269.git.zhoubinbin@loongson.cn>
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
In-Reply-To: <b0ac8b81fbb8955ed8ada27aba423cff45aad9f6.1735550269.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[loongson.cn,gmail.com,kernel.org,acm.org,linux.intel.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
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

Hi


Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> Since the display is a sub-function of the Loongson-2K BMC, when the
> BMC reset, the entire BMC PCIe is disconnected, including the display
> which is interrupted.

To me, that's a strong indicator to set up the entire thing from scratch.

>
> Not only do you need to save/restore the relevant PCIe registers
> throughout the reset process, but you also need to re-push the display
> to the monitor at the end.
>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/gpu/drm/tiny/ls2kbmc.c | 284 ++++++++++++++++++++++++++++++++-
>   1 file changed, 283 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/ls2kbmc.c b/drivers/gpu/drm/tiny/ls2kbmc.c
> index 909d6c687193..4b440f20cb4d 100644
> --- a/drivers/gpu/drm/tiny/ls2kbmc.c
> +++ b/drivers/gpu/drm/tiny/ls2kbmc.c

Move all the reset detection into the BMC core driver. When you see a 
reset, remove the display's platform device via 
platform_device_unregister(). This will release the device  and the DRM 
driver on top. We do this for simpledrm/efifb/etc. Hence user-space code 
is able to deal with it. Then set up a new platform device when the new 
framebuffer is available. Your DRM driver will bind to it and user-space 
code will continue with the new DRM device.

Best regards
Thomas

> @@ -8,10 +8,12 @@
>    */
>   
>   #include <linux/aperture.h>
> +#include <linux/delay.h>
>   #include <linux/minmax.h>
>   #include <linux/pci.h>
>   #include <linux/platform_data/simplefb.h>
>   #include <linux/platform_device.h>
> +#include <linux/stop_machine.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_state_helper.h>
> @@ -32,9 +34,27 @@
>   #include <drm/drm_panic.h>
>   #include <drm/drm_probe_helper.h>
>   
> +#define BMC_RESET_DELAY	(60 * HZ)
> +#define BMC_RESET_WAIT	10000
> +
> +static const u32 index[] = { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24,
> +			     0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
> +static const u32 cindex[] = { 0x4, 0x10, 0x3c };
> +
> +struct ls2kbmc_pci_data {
> +	u32 d80c;
> +	u32 d71c;
> +	u32 data[14];
> +	u32 cdata[3];
> +};
> +
>   struct ls2kbmc_pdata {
>   	struct pci_dev *pdev;
> +	struct drm_device *ddev;
> +	struct work_struct bmc_work;
> +	unsigned long reset_time;
>   	struct simplefb_platform_data pd;
> +	struct ls2kbmc_pci_data pci_data;
>   };
>   
>   /*
> @@ -583,6 +603,265 @@ static struct ls2kbmc_device *ls2kbmc_device_create(struct drm_driver *drv,
>   	return sdev;
>   }
>   
> +static bool ls2kbmc_bar0_addr_is_set(struct pci_dev *ppdev)
> +{
> +	u32 addr;
> +
> +	pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
> +	addr &= PCI_BASE_ADDRESS_MEM_MASK;
> +
> +	return addr ? true : false;
> +}
> +
> +static void ls2kbmc_save_pci_data(struct ls2kbmc_pdata *priv)
> +{
> +	struct pci_dev *pdev = priv->pdev;
> +	struct pci_dev *parent = pdev->bus->self;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(index); i++)
> +		pci_read_config_dword(parent, index[i], &priv->pci_data.data[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(cindex); i++)
> +		pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cdata[i]);
> +
> +	pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
> +	priv->pci_data.d80c = (priv->pci_data.d80c & ~(3 << 17)) | (1 << 17);
> +
> +	pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
> +	priv->pci_data.d71c |= 1 << 26;
> +}
> +
> +static bool ls2kbmc_check_pcie_connected(struct pci_dev *parent, struct drm_device *dev)
> +{
> +	void __iomem *mmio;
> +	int sts, timeout = 10000;
> +
> +	mmio = pci_iomap(parent, 0, 0x100);
> +	if (!mmio)
> +		return false;
> +
> +	writel(readl(mmio) | 0x8, mmio);
> +	while (timeout) {
> +		sts = readl(mmio + 0xc);
> +		if ((sts & 0x11) == 0x11)
> +			break;
> +		mdelay(1);
> +		timeout--;
> +	}
> +
> +	pci_iounmap(parent, mmio);
> +
> +	if (!timeout) {
> +		drm_err(dev, "pcie train failed status=0x%x\n", sts);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int ls2kbmc_recove_pci_data(void *data)
> +{
> +	struct ls2kbmc_pdata *priv = data;
> +	struct pci_dev *pdev = priv->pdev;
> +	struct drm_device *dev = priv->ddev;
> +	struct pci_dev *parent = pdev->bus->self;
> +	u32 i, timeout, retry = 0;
> +	bool ready;
> +
> +	pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
> +	pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
> +	pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
> +
> +	timeout = 10000;
> +	while (timeout) {
> +		ready = ls2kbmc_bar0_addr_is_set(parent);
> +		if (!ready)
> +			break;
> +		mdelay(1);
> +		timeout--;
> +	};
> +
> +	if (!timeout)
> +		drm_warn(dev, "bar not clear 0\n");
> +
> +retrain:
> +	for (i = 0; i < ARRAY_SIZE(index); i++)
> +		pci_write_config_dword(parent, index[i], priv->pci_data.data[i]);
> +
> +	pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
> +	pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
> +
> +	/* Check if the pcie is connected */
> +	ready = ls2kbmc_check_pcie_connected(parent, dev);
> +	if (!ready)
> +		return ready;
> +
> +	for (i = 0; i < ARRAY_SIZE(cindex); i++)
> +		pci_write_config_dword(pdev, cindex[i], priv->pci_data.cdata[i]);
> +
> +	drm_info(dev, "pcie recovered done\n");
> +
> +	if (!retry) {
> +		/*wait u-boot ddr config */
> +		mdelay(BMC_RESET_WAIT);
> +		ready = ls2kbmc_bar0_addr_is_set(parent);
> +		if (!ready) {
> +			retry = 1;
> +			goto retrain;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ls2kbmc_push_drm_mode(struct drm_device *dev)
> +{
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(dev);
> +	struct drm_crtc *crtc = &sdev->crtc;
> +	struct drm_plane *plane = crtc->primary;
> +	struct drm_connector *connector = &sdev->connector;
> +	struct drm_framebuffer *fb = NULL;
> +	struct drm_mode_set set;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +	connector->funcs->fill_modes(connector, 4096, 4096);
> +	mutex_unlock(&dev->mode_config.mutex);
> +
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
> +				   DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
> +
> +	if (plane->state)
> +		fb = plane->state->fb;
> +	else
> +		fb = plane->fb;
> +
> +	if (!fb) {
> +		drm_dbg(dev, "CRTC doesn't have current FB\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	drm_framebuffer_get(fb);
> +
> +	set.crtc = crtc;
> +	set.x = 0;
> +	set.y = 0;
> +	set.mode = &sdev->mode;
> +	set.connectors = &connector;
> +	set.num_connectors = 1;
> +	set.fb = fb;
> +
> +	ret = crtc->funcs->set_config(&set, &ctx);
> +
> +out:
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +
> +	return ret;
> +}
> +
> +static void ls2kbmc_events_fn(struct work_struct *work)
> +{
> +	struct ls2kbmc_pdata *priv = container_of(work, struct ls2kbmc_pdata, bmc_work);
> +
> +	/*
> +	 * The pcie is lost when the BMC resets,
> +	 * at which point access to the pcie from other CPUs
> +	 * is suspended to prevent a crash.
> +	 */
> +	stop_machine(ls2kbmc_recove_pci_data, priv, NULL);
> +
> +	drm_info(priv->ddev, "redraw console\n");
> +
> +	/* We need to re-push the display due to previous pcie loss. */
> +	ls2kbmc_push_drm_mode(priv->ddev);
> +}
> +
> +static irqreturn_t ls2kbmc_interrupt(int irq, void *arg)
> +{
> +	struct ls2kbmc_pdata *priv = arg;
> +
> +	if (system_state != SYSTEM_RUNNING)
> +		return IRQ_HANDLED;
> +
> +	/* skip interrupt in BMC_RESET_DELAY */
> +	if (time_after(jiffies, priv->reset_time + BMC_RESET_DELAY))
> +		schedule_work(&priv->bmc_work);
> +
> +	priv->reset_time = jiffies;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +#define BMC_RESET_GPIO			14
> +#define LOONGSON_GPIO_REG_BASE		0x1fe00500
> +#define LOONGSON_GPIO_REG_SIZE		0x18
> +#define LOONGSON_GPIO_OEN		0x0
> +#define LOONGSON_GPIO_FUNC		0x4
> +#define LOONGSON_GPIO_INTPOL		0x10
> +#define LOONGSON_GPIO_INTEN		0x14
> +
> +/* The gpio interrupt is a watchdog interrupt that is triggered when the BMC resets. */
> +static int ls2kbmc_gpio_reset_handler(struct ls2kbmc_pdata *priv)
> +{
> +	int irq, ret = 0;
> +	int gsi = 16 + (BMC_RESET_GPIO & 7);
> +	void __iomem *gpio_base;
> +
> +	/* Since Loongson-3A hardware does not support GPIO interrupt cascade,
> +	 * chip->gpio_to_irq() cannot be implemented,
> +	 * here acpi_register_gsi() is used to get gpio irq.
> +	 */
> +	irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
> +	if (irq < 0)
> +		return irq;
> +
> +	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
> +	if (!gpio_base) {
> +		acpi_unregister_gsi(gsi);
> +		return PTR_ERR(gpio_base);
> +	}
> +
> +	writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_OEN);
> +	writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_FUNC);
> +	writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_INTPOL);
> +	writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_INTEN);
> +
> +	ret = request_irq(irq, ls2kbmc_interrupt, IRQF_SHARED | IRQF_TRIGGER_FALLING,
> +			  "ls2kbmc gpio", priv);
> +
> +	acpi_unregister_gsi(gsi);
> +	iounmap(gpio_base);
> +
> +	return ret;
> +}
> +
> +static int ls2kbmc_pdata_initial(struct platform_device *pdev, struct ls2kbmc_pdata *priv)
> +{
> +	int ret;
> +
> +	priv->pdev = *(struct pci_dev **)dev_get_platdata(&pdev->dev);
> +
> +	ls2kbmc_save_pci_data(priv);
> +
> +	INIT_WORK(&priv->bmc_work, ls2kbmc_events_fn);
> +
> +	ret = request_irq(priv->pdev->irq, ls2kbmc_interrupt,
> +			  IRQF_SHARED | IRQF_TRIGGER_RISING, "ls2kbmc pcie", priv);
> +	if (ret) {
> +		pr_err("request_irq(%d) failed\n", priv->pdev->irq);
> +		return ret;
> +	}
> +
> +	return ls2kbmc_gpio_reset_handler(priv);
> +}
> +
>   /*
>    * Platform driver
>    */
> @@ -598,12 +877,15 @@ static int ls2kbmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv))
>   		return -ENOMEM;
>   
> -	priv->pdev = *(struct pci_dev **)dev_get_platdata(&pdev->dev);
> +	ret = ls2kbmc_pdata_initial(pdev, priv);
> +	if (ret)
> +		return ret;
>   
>   	sdev = ls2kbmc_device_create(&ls2kbmc_driver, pdev, priv);
>   	if (IS_ERR(sdev))
>   		return PTR_ERR(sdev);
>   	dev = &sdev->dev;
> +	priv->ddev = &sdev->dev;
>   
>   	ret = drm_dev_register(dev, 0);
>   	if (ret)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

