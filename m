Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D278987E4DE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 09:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7F610F481;
	Mon, 18 Mar 2024 08:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SxrBRM8i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vo/fvZMC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1tE7OnNA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SK8WSd8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69F210F481
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:19:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 553A3347CA;
 Mon, 18 Mar 2024 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710749952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PmD/vXhhbIB4W6fQy3iZFyuOYVUSG8TcxCK0mIwJpzY=;
 b=SxrBRM8iPDRhEkiH2DDaF6XaefKRwTfenYvQvv5hAuC57QtyfmJAsQTY7VdojLu9caXf0j
 PeD1YhHZWAlDAqHNTOxHBAMPO3L47b5bWUWJ0ADLXsRWpbH+L+1ORcjLc0ULHoDrFoWB0+
 BCLx/IoaLRiGyOCVMg7pnN4f2dKQOY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710749952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PmD/vXhhbIB4W6fQy3iZFyuOYVUSG8TcxCK0mIwJpzY=;
 b=Vo/fvZMCRgavd4IzcTjFfm+WlXzmgsuEmyemwoEzQOSGIAJiy/I6VcCGLc1K40Ov/p5T5J
 6Nxv8m0RuSxPYBCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710749950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PmD/vXhhbIB4W6fQy3iZFyuOYVUSG8TcxCK0mIwJpzY=;
 b=1tE7OnNAtCg5PPxBFhHRM1QNs/V2PiBnvAFFzjWqwwBnujq2e8L4f78Hcp5uwN6t2NsckK
 IvD7jVRe87pszgzo+cGPn5YOUw+KLl31OZohVR1+A64LbeE+sKNlf6lR8CXBATjyPeqFjT
 xdmj7kJ4+NgxQ+6Z0GVk4HcFsp1Su80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710749950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PmD/vXhhbIB4W6fQy3iZFyuOYVUSG8TcxCK0mIwJpzY=;
 b=SK8WSd8gro2eT8/E5DCcpxNiAjy5YFWRDlwRIQ1oyugjPRrfDRXvxqb39uTHJ8RYZYjatw
 y9RVsif2wHKNYkDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 069781389C;
 Mon, 18 Mar 2024 08:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l05SAP7492XkMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Mar 2024 08:19:10 +0000
Message-ID: <4eea339c-48b0-416e-90a5-87f90ea5bf1d@suse.de>
Date: Mon, 18 Mar 2024 09:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/43] drm/fbdev-generic: Do not set physical framebuffer
 address
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-2-tzimmermann@suse.de>
 <87a5mxgha0.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87a5mxgha0.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[10];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,vmware.com:email,intel.com:email,bootlin.com:url];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
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

Am 17.03.24 um 13:43 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>
>> Framebuffer memory is allocated via vmalloc() from non-contiguous
> It's vmalloc() true, but through vzmalloc() so I would mention that
> function instead in the commit message.

Ok.

>
>> physical pages. The physical framebuffer start address is therefore
>> meaningless. Do not set it.
>>
>> The value is not used within the kernel and only exported to userspace
>> on dedicated ARM configs. No functional change is expected.
>>
> How's that info used? Does user-space assumes that the whole memory range
> is contiguous in physical memory or just cares about the phyisical start
> address ?

I assume that it is supposed to refer to contiguous memory. There's the 
corresponding field smem_len, which refers to the full memory.

>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: a5b44c4adb16 ("drm/fbdev-generic: Always use shadow buffering")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>> Cc: Zack Rusin <zackr@vmware.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: <stable@vger.kernel.org> # v6.4+
>> ---
>>   drivers/gpu/drm/drm_fbdev_generic.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
>> index d647d89764cb9..b4659cd6285ab 100644
>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>> @@ -113,7 +113,6 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>   	/* screen */
>>   	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
>>   	info->screen_buffer = screen_buffer;
>> -	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
>>   	info->fix.smem_len = screen_size;
>>   
> Makes sense:
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> What about drivers/gpu/drm/drm_fb_helper.c btw? Since the memory range
> allocated may not be physically contiguous if a platform uses an IOMMU ?
>
> Asking because I don't really know how these exported values are used...
> I just know that is when the CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is enabled.

The value of smem_start is used in the fbdev code in only two places : 
deferred I/O [1] and devfile I/O [2]. For the former, patch 5 of this 
series adds an additional test. The latter case is only relevant for 
framebuffers in I/O memory space. But that does not affect 
fbdev-generic, which has the shadow buffer in main memory. Some 
driver-internal fbdev code sets smem_length, such as in gma500, but 
these drivers are special anyway.

For what userspace does with this value IDK. But it can't be much, as 
we've had smem_start cleared for years.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.8/source/drivers/video/fbdev/core/fb_defio.c#L34
[2] 
https://elixir.bootlin.com/linux/v6.8/source/drivers/video/fbdev/core/fb_io_fops.c#L143

>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
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

