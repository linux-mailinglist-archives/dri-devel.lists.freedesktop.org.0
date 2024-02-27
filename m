Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D618868BF9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43F10F2C9;
	Tue, 27 Feb 2024 09:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CbOSFvWg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1RT6XTdd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CbOSFvWg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1RT6XTdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CE610F2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:16:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C37E722778;
 Tue, 27 Feb 2024 09:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709025364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ez2gI77bo+IW7JBK4/7ysD9/7pLOSxiVBQlhAMqDm10=;
 b=CbOSFvWgkk4T8jKTKZAct6UORm+Y+SMSimguCpRI/c6J3+VadYWMAtnoqnmanFIM+aHA8W
 +EzJ9fh0kxnIR0ztY1j01BtkHiHm/Bq5UUh3uxocqKg1bJJO8xd9BY1k4vy6yJ/h0pMz7Z
 gKklvfr4XmyTIr8Hh4U1o+xHLRfloo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709025364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ez2gI77bo+IW7JBK4/7ysD9/7pLOSxiVBQlhAMqDm10=;
 b=1RT6XTddpxKXSfBlA/wdt1AdDFv4NKWdodJGaslkPV7yqP7vSsDM1MjR2DXfRdkFreby4p
 XxKAezHxLWdxLMAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709025364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ez2gI77bo+IW7JBK4/7ysD9/7pLOSxiVBQlhAMqDm10=;
 b=CbOSFvWgkk4T8jKTKZAct6UORm+Y+SMSimguCpRI/c6J3+VadYWMAtnoqnmanFIM+aHA8W
 +EzJ9fh0kxnIR0ztY1j01BtkHiHm/Bq5UUh3uxocqKg1bJJO8xd9BY1k4vy6yJ/h0pMz7Z
 gKklvfr4XmyTIr8Hh4U1o+xHLRfloo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709025364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ez2gI77bo+IW7JBK4/7ysD9/7pLOSxiVBQlhAMqDm10=;
 b=1RT6XTddpxKXSfBlA/wdt1AdDFv4NKWdodJGaslkPV7yqP7vSsDM1MjR2DXfRdkFreby4p
 XxKAezHxLWdxLMAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 766FE13419;
 Tue, 27 Feb 2024 09:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id tjNPG1So3WXZLgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 09:16:04 +0000
Message-ID: <587d60ae-221b-4c02-9891-17dc608009d3@suse.de>
Date: Tue, 27 Feb 2024 10:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Fixes for omapdrm console
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20240225064700.48035-1-tony@atomide.com>
 <43fc93f1-d602-47ae-98e5-ee6be4ea5192@ideasonboard.com>
 <42255362-4720-414e-b442-f98355e92968@ideasonboard.com>
 <ab0b8471-97a6-479a-88aa-9bb25e91fb8a@suse.de>
 <20240226112549.GU5299@atomide.com> <20240227070624.GB52537@atomide.com>
 <7d98a0cd-e6d5-460d-8b91-35fa340736dd@suse.de>
 <20240227080146.GW5299@atomide.com>
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
In-Reply-To: <20240227080146.GW5299@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CbOSFvWg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1RT6XTdd
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-8.00 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[11];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[ideasonboard.com,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,gmx.de,redhat.com,ravnborg.org];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -8.00
X-Rspamd-Queue-Id: C37E722778
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

Am 27.02.24 um 09:01 schrieb Tony Lindgren:
> * Thomas Zimmermann <tzimmermann@suse.de> [240227 07:56]:
>> Am 27.02.24 um 08:06 schrieb Tony Lindgren:
>>> * Tony Lindgren <tony@atomide.com> [240226 13:26]:
>>>> * Thomas Zimmermann <tzimmermann@suse.de> [240226 09:10]:
>>>>> Am 26.02.24 um 10:01 schrieb Tomi Valkeinen:
>>>>>> On 26/02/2024 10:26, Tomi Valkeinen wrote:
>>>>>>> How is it broken? I don't usually use the console (or fbdev) but
>>>>>>> enabling it now, it seems to work fine for me, on DRA76 EVM with
>>>>>>> HDMI output.
>>>>> Omapdrm implements drm_framebuffer_funcs.dirty withomap_framebuffer_dirty().
>>>>> AFAIK DRM semantics requires to run the dirty helper after writing to the
>>>>> framebuffer's memory. Userspace does this via the DIRTYFB ioctl. [1] But (at
>>>>> least) for correctness the console needs to do the same.
>>>>>
>>>>> [1] https://elixir.bootlin.com/linux/v6.7.6/source/drivers/gpu/drm/drm_ioctl.c#L679
>>>> Yes I noticed console not updating and bisected it down to the two
>>>> commits listed. I did the bisect on a droid4 though with command mode
>>>> LCD. I did not test with HDMI, will give that a try too.
>>> I can reproduce the cache issue with Tomi's omapfb-tests [2] below:
>>>
>>> while true;
>>>         do dd if=/dev/urandom of=/dev/fb0
>>>         ~/src/omapfb-tests/test
>>>         sleep 1
>>> done
>>>
>>> That produces short random data stripes on the test image.
>>>
>>>>>> After applying your patches, I see a lot of cache-related artifacts on
>>>>>> the screen when updating the fb.
>>>>> I guess we might need a dma-specific mmap helper to make this work
>>>>> correctly.
>>> Comparing the difference between drm_gem_mmap_obj() and
>>> fb_deferred_io_mmap(), the following test patch makes the cache issue
>>> go away for me. Not sure if this can be set based on some flag, or if
>>> we need a separate fb_deferred_io_wc_mmap() or something like that?
>>>
>>> [2] https://github.com/tomba/omapfb-tests
>>>
>>> 8< --------------------
>>> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
>>> --- a/drivers/video/fbdev/core/fb_defio.c
>>> +++ b/drivers/video/fbdev/core/fb_defio.c
>>> @@ -224,6 +224,7 @@ static const struct address_space_operations fb_deferred_io_aops = {
>>>    int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
>>>    {
>>>    	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>> +	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>> Great, that's exactly what I had in mind!
> OK :)
>
>> My proposal is to add this mmap function directly to omapdrm. I'll later
>> take care of integrating this into the overall framework. I have a few other
>> ideas in mind that are related to this issue. Ok?
> OK that sounds good to me, I'll post v3 set of patches.

I just realized the fb_deferred_io_mmap() is already exported. So please 
use it instead of duplicating the code in omapdrm.

[1] 
https://elixir.bootlin.com/linux/v6.7/source/drivers/video/fbdev/core/fb_defio.c#L237

I also noticed that omapdrm does not yet select the correct Kconfig 
symbols. That can be fixed by

  1) creating Kconfig FB_DMAMEM_HELPERS_DEFERRED that are similar to 
their SYSMEM equivalent at [2]. The tokens should look like this

configFB_DMAMEM_HELPERS_DEFERRED  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS_DEFERRED>
bool
depends onFB_CORE  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_CORE>
selectFB_DEFERRED_IO  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_DEFERRED_IO>
selectFB_DMAMEM_HELPERS  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS>


   2) and selecting it instead of FB_DMAMEM_HELPERS under omapdrm's 
Kconfig symbol.

[2] 
https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/Kconfig#L147

Best regards
Thomas

>
> Regards,
>
> Tony
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

