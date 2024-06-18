Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C790C5AC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E76F10E60C;
	Tue, 18 Jun 2024 09:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tdUR6P9u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S65rVk0x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tdUR6P9u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S65rVk0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D710E604
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:59:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FA2A1F449;
 Tue, 18 Jun 2024 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718704780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nqaRJZaf0OfqLwORWmZqrMacSKmFUdWYybiDuskTdz4=;
 b=tdUR6P9uMFpJ3+W0PIclPV18fEAsDRB8MLDdkYkzK3ZWtksG9uQQFDTPDyEvTCH6Oq3duz
 F6jDxWIV6qi7M0FlKcsU8gi7R8vWZ7Oz9kD7830o+pnRlBbXZW8VpovtPDJWjVlRb2g3NJ
 Ljs+537TiyM99NAUj42myuGn5rBLcgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718704780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nqaRJZaf0OfqLwORWmZqrMacSKmFUdWYybiDuskTdz4=;
 b=S65rVk0xIqx9VJJ054VqMQrwnB+PNOjU8ntpMc/sLwlIQxmTmO5w6jndMInX2xW/EfYNp4
 UAtSUac3xaWtQ6Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718704780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nqaRJZaf0OfqLwORWmZqrMacSKmFUdWYybiDuskTdz4=;
 b=tdUR6P9uMFpJ3+W0PIclPV18fEAsDRB8MLDdkYkzK3ZWtksG9uQQFDTPDyEvTCH6Oq3duz
 F6jDxWIV6qi7M0FlKcsU8gi7R8vWZ7Oz9kD7830o+pnRlBbXZW8VpovtPDJWjVlRb2g3NJ
 Ljs+537TiyM99NAUj42myuGn5rBLcgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718704780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nqaRJZaf0OfqLwORWmZqrMacSKmFUdWYybiDuskTdz4=;
 b=S65rVk0xIqx9VJJ054VqMQrwnB+PNOjU8ntpMc/sLwlIQxmTmO5w6jndMInX2xW/EfYNp4
 UAtSUac3xaWtQ6Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDA4513AA0;
 Tue, 18 Jun 2024 09:59:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qHKwOItacWbQIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Jun 2024 09:59:39 +0000
Message-ID: <376af99a-dcf2-4945-8530-994b9d9a7035@suse.de>
Date: Tue, 18 Jun 2024 11:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: Only set smem_start is enable per module
 option
To: Daniel Vetter <daniel@ffwll.ch>
Cc: peng.fan@oss.nxp.com, javierm@redhat.com, dri-devel@lists.freedesktop.org
References: <20240617152843.11886-1-tzimmermann@suse.de>
 <ZnFU1cT8Sa81ynDg@phenom.ffwll.local>
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
In-Reply-To: <ZnFU1cT8Sa81ynDg@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email, suse.de:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Am 18.06.24 um 11:35 schrieb Daniel Vetter:
> On Mon, Jun 17, 2024 at 05:26:37PM +0200, Thomas Zimmermann wrote:
>> Only export struct fb_info.fix.smem_start if that is required by the
>> user and the memory does not come from vmalloc().
>>
>> Setting struct fb_info.fix.smem_start breaks systems where DMA
>> memory is backed by vmalloc address space. An example error is
>> shown below.
>>
>> [    3.536043] ------------[ cut here ]------------
>> [    3.540716] virt_to_phys used for non-linear address: 000000007fc4f540 (0xffff800086001000)
>> [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 __virt_to_phys+0x68/0x98
>> [    3.565455] Modules linked in:
>> [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 6.6.23-06226-g4986cc3e1b75-dirty #250
>> [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
>> [    3.582452] Workqueue: events_unbound deferred_probe_work_func
>> [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    3.595233] pc : __virt_to_phys+0x68/0x98
>> [    3.599246] lr : __virt_to_phys+0x68/0x98
>> [    3.603276] sp : ffff800083603990
>> [    3.677939] Call trace:
>> [    3.680393]  __virt_to_phys+0x68/0x98
>> [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
>> [    3.689214]  __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
>> [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
>> [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
>> [    3.705161]  drm_client_register+0x60/0xb0
>> [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
>>
>> Additionally, DMA memory is assumed to by contiguous in physical
>> address space, which is not guaranteed by vmalloc().
>>
>> Resolve this by checking the module flag drm_leak_fbdev_smem when
>> DRM allocated the instance of struct fb_info. Fbdev-dma then only
>> sets smem_start only if required (via FBINFO_HIDE_SMEM_START). Also
>> guarantee that the framebuffer is not located in vmalloc address
>> space.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: Peng Fan (OSS) <peng.fan@oss.nxp.com>
>> Closes: https://lore.kernel.org/dri-devel/20240604080328.4024838-1-peng.fan@oss.nxp.com/
>> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c | 6 +++---
>>   drivers/gpu/drm/drm_fbdev_dma.c | 5 ++++-
>>   2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index e2e19f49342e1..18565ec684517 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -517,6 +517,9 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>>   	if (!info)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	if (!drm_leak_fbdev_smem)
>> +		info->flags |= FBINFO_HIDE_SMEM_START;
>> +
>>   	ret = fb_alloc_cmap(&info->cmap, 256, 0);
>>   	if (ret)
>>   		goto err_release;
>> @@ -1853,9 +1856,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>>   	info = fb_helper->info;
>>   	info->var.pixclock = 0;
>>   
>> -	if (!drm_leak_fbdev_smem)
>> -		info->flags |= FBINFO_HIDE_SMEM_START;
>> -
>>   	/* Need to drop locks to avoid recursive deadlock in
>>   	 * register_framebuffer. This is ok because the only thing left to do is
>>   	 * register the fbdev emulation instance in kernel_fb_helper_list. */
>> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
>> index 97ef6300d47e0..4b0527ddeb5a7 100644
>> --- a/drivers/gpu/drm/drm_fbdev_dma.c
>> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
>> @@ -137,7 +137,10 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>   		info->flags |= FBINFO_READS_FAST; /* signal caching */
>>   	info->screen_size = sizes->surface_height * fb->pitches[0];
>>   	info->screen_buffer = map.vaddr;
>> -	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
>> +	if (!(info->flags & FBINFO_HIDE_SMEM_START)) {
> I guess since the WARN is conditional on the explicit opt-in with
> drm_leak_fbdev_smem it should be fine.

Yes, that's the intention. If someone enables this flag, it warns if 
that's not supported. By default, smem_start is clear.

>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks

Best regards
Thomas

>
>> +		if (!drm_WARN_ON(dev, is_vmalloc_addr(info->screen_buffer)))
>> +			info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
>> +	}
>>   	info->fix.smem_len = info->screen_size;
>>   
>>   	/* deferred I/O */
>> -- 
>> 2.45.2
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

