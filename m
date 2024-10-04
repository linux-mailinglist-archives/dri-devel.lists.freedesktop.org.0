Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5016798FF4F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4973410E1BE;
	Fri,  4 Oct 2024 09:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0J11UA3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rmU9CoN/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0J11UA3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rmU9CoN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718010E1BE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 09:06:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B614621CFF;
 Fri,  4 Oct 2024 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728032792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JZgVmvQL2JTQezfe4d08s20s5gOOPF3rmb+sz6n55uw=;
 b=0J11UA3q2uREgmRWQoJNslgtDrY02BXrbtGSaqs7nuUfwrxx81lXK4UJ5vIHS85XarGYx9
 EaFzOhYWzl0TXLtc5tj7n6Lboc2JLY7Dv0cFDfsXjXTpB486kGwt5iT03yySau94924v0o
 VJ3E1WHXXVn+oGrFY4bESrimDT77bAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728032792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JZgVmvQL2JTQezfe4d08s20s5gOOPF3rmb+sz6n55uw=;
 b=rmU9CoN/AFHX0ywR1tDGobJIZZNXKnS5tIboDer7DEWx4mm3oLMJZbKe6Ltq31EtMPsy2P
 6D/nSGtsBEY/gIBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728032792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JZgVmvQL2JTQezfe4d08s20s5gOOPF3rmb+sz6n55uw=;
 b=0J11UA3q2uREgmRWQoJNslgtDrY02BXrbtGSaqs7nuUfwrxx81lXK4UJ5vIHS85XarGYx9
 EaFzOhYWzl0TXLtc5tj7n6Lboc2JLY7Dv0cFDfsXjXTpB486kGwt5iT03yySau94924v0o
 VJ3E1WHXXVn+oGrFY4bESrimDT77bAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728032792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JZgVmvQL2JTQezfe4d08s20s5gOOPF3rmb+sz6n55uw=;
 b=rmU9CoN/AFHX0ywR1tDGobJIZZNXKnS5tIboDer7DEWx4mm3oLMJZbKe6Ltq31EtMPsy2P
 6D/nSGtsBEY/gIBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D090013A55;
 Fri,  4 Oct 2024 09:06:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id V2YAKBew/2bbAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Oct 2024 09:06:31 +0000
Message-ID: <1db0e2db-97e0-492f-ba89-0a1f49ca4498@suse.de>
Date: Fri, 4 Oct 2024 11:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Subject: fbdev: sstfb: Make CONFIG_FB_DEVICE optional
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, thomas.zimmermann@suse.de
References: <20241002214517.206657-1-gonzalo.silvalde@gmail.com>
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
In-Reply-To: <20241002214517.206657-1-gonzalo.silvalde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
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

Hi,

thanks for your patch.

 > [PATCH] Subject: fbdev: sstfb: Make CONFIG_FB_DEVICE optional

'Subject:' should not be part of the subject line. Is that an issue with 
your mail setup?

Am 02.10.24 um 23:45 schrieb Gonzalo Silvalde Blanco:
> The sstfb driver currently depends on CONFIG_FB_DEVICE to create sysfs
> entries and access info->dev. This patch wraps the relevant code blocks
> with #ifdef CONFIG_FB_DEVICE, allowing the driver to be built and used
> even if CONFIG_FB_DEVICE is not selected.

You should mention that the sysfs setting only controls VGA pass-through 
state and is not required for the display to work correctly.

(See http://vogonswiki.com/index.php/VGA_passthrough_cable if you don't 
know what that means.)

>
> Tested by building with and without CONFIG_FB_DEVICE, both of which
> compile without issues
An empty lines goes before the tags.
> Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
> ---
>   drivers/video/fbdev/sstfb.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
> index f8ae54ca0cc3..17f39cc721aa 100644
> --- a/drivers/video/fbdev/sstfb.c
> +++ b/drivers/video/fbdev/sstfb.c
> @@ -716,6 +716,7 @@ static void sstfb_setvgapass( struct fb_info *info, int enable )
>   	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
>   }
>   
> +#ifdef CONFIG_FB_DEVICE
>   static ssize_t store_vgapass(struct device *device, struct device_attribute *attr,
>   			const char *buf, size_t count)
>   {
> @@ -736,10 +737,10 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
>   	struct sstfb_par *par = info->par;
>   	return sprintf(buf, "%d\n", par->vgapass);
>   }
> -
>   static struct device_attribute device_attrs[] = {
>   	__ATTR(vgapass, S_IRUGO|S_IWUSR, show_vgapass, store_vgapass)
>   	};
> +#endif
>   
>   static int sstfb_ioctl(struct fb_info *info, unsigned int cmd,
>   			unsigned long arg)
> @@ -1435,10 +1436,10 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	}
>   
>   	sstfb_clear_screen(info);
> -
> +	#ifdef CONFIG_FB_DEVICE
No tab indention for #ifdef and #endif. Here and below.

The patch should be good with the suggested changes. Please send an update.

Best regards
Thomas


>   	if (device_create_file(info->dev, &device_attrs[0]))
>   		printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
> -
> +	#endif
>   
>   	fb_info(info, "%s frame buffer device at 0x%p\n",
>   		fix->id, info->screen_base);
> @@ -1467,8 +1468,9 @@ static void sstfb_remove(struct pci_dev *pdev)
>   
>   	info = pci_get_drvdata(pdev);
>   	par = info->par;
> -
> +	#ifdef CONFIG_FB_DEVICE
>   	device_remove_file(info->dev, &device_attrs[0]);
> +	#endif
>   	sst_shutdown(info);
>   	iounmap(info->screen_base);
>   	iounmap(par->mmio_vbase);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

