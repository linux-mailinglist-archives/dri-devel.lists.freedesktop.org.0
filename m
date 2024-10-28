Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137339B2A87
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0337110E350;
	Mon, 28 Oct 2024 08:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TvrHSu8t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ybbSQBAX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TvrHSu8t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ybbSQBAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0B810E350
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:41:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E7C221A13;
 Mon, 28 Oct 2024 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730104902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yr53c/MFjdSKRr/Jfx2Bg6Mbb0SvpvoT07TaDQjMKxo=;
 b=TvrHSu8tk1XkVQShmhOLiT7LO8+MYAS16On8fY5A9vvAUl5vojnpeja0upOXpBOvjZBpHN
 bGM8oidB8NwEgYRjf9d0NyTOwjtRJ+xiicCL/ZKzs2Mut8aaOKfHxnFEPjQnAnh2ursLV1
 s0EKQN3BA51lcDb1P4S6IwI+RX0cEM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730104902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yr53c/MFjdSKRr/Jfx2Bg6Mbb0SvpvoT07TaDQjMKxo=;
 b=ybbSQBAX7kRcXEpyHnUnk6XC0ynJgxRwk9L01sYLrlbZ1hd785S3RDi5yn+ujtUa6ymrf6
 X3pg+CY+lTM4ztCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730104902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yr53c/MFjdSKRr/Jfx2Bg6Mbb0SvpvoT07TaDQjMKxo=;
 b=TvrHSu8tk1XkVQShmhOLiT7LO8+MYAS16On8fY5A9vvAUl5vojnpeja0upOXpBOvjZBpHN
 bGM8oidB8NwEgYRjf9d0NyTOwjtRJ+xiicCL/ZKzs2Mut8aaOKfHxnFEPjQnAnh2ursLV1
 s0EKQN3BA51lcDb1P4S6IwI+RX0cEM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730104902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yr53c/MFjdSKRr/Jfx2Bg6Mbb0SvpvoT07TaDQjMKxo=;
 b=ybbSQBAX7kRcXEpyHnUnk6XC0ynJgxRwk9L01sYLrlbZ1hd785S3RDi5yn+ujtUa6ymrf6
 X3pg+CY+lTM4ztCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DE1B136DC;
 Mon, 28 Oct 2024 08:41:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4fb4BUZOH2d/FwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Oct 2024 08:41:42 +0000
Message-ID: <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
Date: Mon, 28 Oct 2024 09:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Helge Deller <deller@gmx.de>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
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
In-Reply-To: <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmx.de,gmail.com,vger.kernel.org,lists.freedesktop.org];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
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

Hi Helge

Am 25.10.24 um 17:37 schrieb Helge Deller:
> On 10/25/24 11:25, Gonzalo Silvalde Blanco wrote:
>> The fb_udl driver currently depends on CONFIG_FB_DEVICE to create sysfs
>> entries and access framebuffer device information. This patch wraps the
>> relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the 
>> driver to
>> be built and used even if CONFIG_FB_DEVICE is not selected.
>>
>> The sysfs setting only controls access to certain framebuffer attributes
>> and is not required for the basic display functionality to work 
>> correctly.
>> (For information on DisplayLink devices and their Linux support, see:
>> https://wiki.archlinux.org/title/DisplayLink).
>>
>> Tested by building with and without CONFIG_FB_DEVICE, both of which
>> compiled and ran without issues.
>
> Gonzalo, I don't like this patch very much.
>
> It adds lots of #ifdefs around functions like dev_dbg().
> Instead of ifdefs, aren't there other possibilities, e.g.
> using fb_dbg() if appropriate?
> Or using any other generic dbg() info or simply dropping the line?

I talked Gonzalo into sending this patch. I think dev_dbg() calls should 
be replaced with fb_dbg(), same for _info() and _err(). That's probably 
worth doing anyway.

>
> But more important:
> This is a fbdev driver and currently depends on CONFIG_FB_DEVICE.
> If I'm right, the only reason to disable CONFIG_FB_DEVICE is if
> you want fbdev output at bootup, but otherwise just want to use DRM.

It's unrelated to booting. CONFIG_FB_DEVICE enables/disables userspace 
interfaces (/dev/fb*, /sys/graphics/fb*). Even without, there's still 
fbcon that runs on top of the fbdev driver.

> But then, doesn't there exist a native DRM driver for this graphics
> card which can be used instead?
> If so, I suggest to not change this fbdev driver at all.

Or can we talk about removing udlfb entirely? I tried before, but there 
was one person still using it. [1] He had concerns about udl's (the DRM 
driver) stability. I think DRM's udl has matured enough and is in better 
shape than udlfb. Maybe we can try again.

[1] 
https://lore.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse.de/

Best regards
Thomas

>
> Helge
>
>> Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>> ---
>>   drivers/video/fbdev/Kconfig |  1 -
>>   drivers/video/fbdev/udlfb.c | 41 ++++++++++++++++++++++---------------
>>   2 files changed, 24 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> index ea36c6956bf3..9bf6cf74b9cb 100644
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -1588,7 +1588,6 @@ config FB_SMSCUFX
>>   config FB_UDL
>>       tristate "Displaylink USB Framebuffer support"
>>       depends on FB && USB
>> -    depends on FB_DEVICE
>>       select FB_MODE_HELPERS
>>       select FB_SYSMEM_HELPERS_DEFERRED
>>       help
>> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
>> index 71ac9e36f67c..de4800f09dc7 100644
>> --- a/drivers/video/fbdev/udlfb.c
>> +++ b/drivers/video/fbdev/udlfb.c
>> @@ -341,10 +341,10 @@ static int dlfb_ops_mmap(struct fb_info *info, 
>> struct vm_area_struct *vma)
>>           return -EINVAL;
>>
>>       pos = (unsigned long)info->fix.smem_start + offset;
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
>>           pos, size);
>> -
>> +#endif
>>       while (size > 0) {
>>           page = vmalloc_to_pfn((void *)pos);
>>           if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
>> @@ -929,10 +929,10 @@ static int dlfb_ops_open(struct fb_info *info, 
>> int user)
>>           info->fbdefio = fbdefio;
>>           fb_deferred_io_init(info);
>>       }
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev, "open, user=%d fb_info=%p count=%d\n",
>>           user, info, dlfb->fb_count);
>> -
>> +#endif
>>       return 0;
>>   }
>>
>> @@ -982,9 +982,9 @@ static int dlfb_ops_release(struct fb_info *info, 
>> int user)
>>           kfree(info->fbdefio);
>>           info->fbdefio = NULL;
>>       }
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev, "release, user=%d count=%d\n", user, 
>> dlfb->fb_count);
>> -
>> +#endif
>>       return 0;
>>   }
>>
>> @@ -1095,10 +1095,10 @@ static int dlfb_ops_blank(int blank_mode, 
>> struct fb_info *info)
>>       struct dlfb_data *dlfb = info->par;
>>       char *bufptr;
>>       struct urb *urb;
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev, "blank, mode %d --> %d\n",
>>           dlfb->blank_mode, blank_mode);
>> -
>> +#endif
>>       if ((dlfb->blank_mode == FB_BLANK_POWERDOWN) &&
>>           (blank_mode != FB_BLANK_POWERDOWN)) {
>>
>> @@ -1190,7 +1190,9 @@ static int dlfb_realloc_framebuffer(struct 
>> dlfb_data *dlfb, struct fb_info *info
>>            */
>>           new_fb = vmalloc(new_len);
>>           if (!new_fb) {
>> +#ifdef CONFIG_FB_DEVICE
>>               dev_err(info->dev, "Virtual framebuffer alloc failed\n");
>> +#endif
>>               return -ENOMEM;
>>           }
>>           memset(new_fb, 0xff, new_len);
>> @@ -1213,9 +1215,11 @@ static int dlfb_realloc_framebuffer(struct 
>> dlfb_data *dlfb, struct fb_info *info
>>            */
>>           if (shadow)
>>               new_back = vzalloc(new_len);
>> +#ifdef CONFIG_FB_DEVICE
>>           if (!new_back)
>>               dev_info(info->dev,
>>                    "No shadow/backing buffer allocated\n");
>> +#endif
>>           else {
>>               dlfb_deferred_vfree(dlfb, dlfb->backing_buffer);
>>               dlfb->backing_buffer = new_back;
>> @@ -1247,14 +1251,14 @@ static int dlfb_setup_modes(struct dlfb_data 
>> *dlfb,
>>       struct device *dev = info->device;
>>       struct fb_videomode *mode;
>>       const struct fb_videomode *default_vmode = NULL;
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       if (info->dev) {
>>           /* only use mutex if info has been registered */
>>           mutex_lock(&info->lock);
>>           /* parent device is used otherwise */
>>           dev = info->dev;
>>       }
>> -
>> +#endif
>>       edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>>       if (!edid) {
>>           result = -ENOMEM;
>> @@ -1375,10 +1379,10 @@ static int dlfb_setup_modes(struct dlfb_data 
>> *dlfb,
>>   error:
>>       if (edid && (dlfb->edid != edid))
>>           kfree(edid);
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       if (info->dev)
>>           mutex_unlock(&info->lock);
>> -
>> +#endif
>>       return result;
>>   }
>>
>> @@ -1597,8 +1601,10 @@ static int dlfb_parse_vendor_descriptor(struct 
>> dlfb_data *dlfb,
>>   static int dlfb_usb_probe(struct usb_interface *intf,
>>                 const struct usb_device_id *id)
>>   {
>> +#ifdef CONFIG_FB_DEVICE
>>       int i;
>>       const struct device_attribute *attr;
>> +#endif
>>       struct dlfb_data *dlfb;
>>       struct fb_info *info;
>>       int retval;
>> @@ -1701,7 +1707,7 @@ static int dlfb_usb_probe(struct usb_interface 
>> *intf,
>>               retval);
>>           goto error;
>>       }
>> -
>> +#ifdef CONFIG_FB_DEVICE
>>       for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++) {
>>           attr = &fb_device_attrs[i];
>>           retval = device_create_file(info->dev, attr);
>> @@ -1710,17 +1716,16 @@ static int dlfb_usb_probe(struct 
>> usb_interface *intf,
>>                    "failed to create '%s' attribute: %d\n",
>>                    attr->attr.name, retval);
>>       }
>> -
>>       retval = device_create_bin_file(info->dev, &edid_attr);
>>       if (retval)
>>           dev_warn(info->device, "failed to create '%s' attribute: 
>> %d\n",
>>                edid_attr.attr.name, retval);
>> -
>>       dev_info(info->device,
>>            "%s is DisplayLink USB device (%dx%d, %dK framebuffer 
>> memory)\n",
>>            dev_name(info->dev), info->var.xres, info->var.yres,
>>            ((dlfb->backing_buffer) ?
>>            info->fix.smem_len * 2 : info->fix.smem_len) >> 10);
>> +#endif
>>       return 0;
>>
>>   error:
>> @@ -1737,8 +1742,9 @@ static void dlfb_usb_disconnect(struct 
>> usb_interface *intf)
>>   {
>>       struct dlfb_data *dlfb;
>>       struct fb_info *info;
>> +#ifdef CONFIG_FB_DEVICE
>>       int i;
>> -
>> +#endif
>>       dlfb = usb_get_intfdata(intf);
>>       info = dlfb->info;
>>
>> @@ -1754,10 +1760,11 @@ static void dlfb_usb_disconnect(struct 
>> usb_interface *intf)
>>       dlfb_free_urb_list(dlfb);
>>
>>       /* remove udlfb's sysfs interfaces */
>> +#ifdef CONFIG_FB_DEVICE
>>       for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++)
>>           device_remove_file(info->dev, &fb_device_attrs[i]);
>>       device_remove_bin_file(info->dev, &edid_attr);
>> -
>> +#endif
>>       unregister_framebuffer(info);
>>   }
>>
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

