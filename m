Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B0B2420A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 08:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5365B10E4B8;
	Wed, 13 Aug 2025 06:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iYdGijN4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dZCqAIiW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HolqXZsv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uC5+KL8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3FA10E4B8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:58:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCEC01F44E;
 Wed, 13 Aug 2025 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755068304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UspunLv3FkkyLv0czdt44BmClGErZ0lmiLlCAjRESl4=;
 b=iYdGijN4ha4oP3fl09VcptKjmnIMbtdv0tM9bAhO9xEW7YE7xpE9wGHJq8p1Y5bwC87MqW
 zr3hfwmNKkTfA0nPtnCV82wiWz5FW5ILcIHQPcyQU4DKwMqZ0kYb+AuPKAaLfKxmiyh3Mr
 Sg+7IMgCdluNcuF0t6xORc5ktNahBas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755068304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UspunLv3FkkyLv0czdt44BmClGErZ0lmiLlCAjRESl4=;
 b=dZCqAIiWKYT4+rtf9eVBzHsa4QuXaWeDkTPkSkpoWTe1Efxg1pZGIyh0RiuM59fsynd8PB
 hGp+K2R+IP1VlTDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755068303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UspunLv3FkkyLv0czdt44BmClGErZ0lmiLlCAjRESl4=;
 b=HolqXZsvSZB2teTgOuq7zTiBr1bh/afV4G9Z/RonhjUeKM/0BwMohOqpzyoVlnCQHXFWxW
 xf6JHNXPAQfTp27nuLKXtwlQSaJ4cO+YbAYc8VJRpMjnShMdi7KfxF3jFGaJOUPbRc47zK
 CR0NwdRz5yEDDofatJljFpxkgJdQr1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755068303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UspunLv3FkkyLv0czdt44BmClGErZ0lmiLlCAjRESl4=;
 b=uC5+KL8dJ+VP8Dq5BBGuC0PLoNFzzi9aw4nYpWMkB45lMtyN1H+YeurktifoRFzfrFQ/Tt
 Ixmr8pKUuyBhWfCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F22613479;
 Wed, 13 Aug 2025 06:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ugLsJI83nGi+bwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Aug 2025 06:58:23 +0000
Message-ID: <8e1f2b36-58b8-41fb-b514-e39c4d5081b9@suse.de>
Date: Wed, 13 Aug 2025 08:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
To: =?UTF-8?B?R2FyeSBDaHUo5qWa5YWJ5bqGKQ==?= <chuguangqing@inspur.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <5863c61a424545119df8ccb28dc1dbf8@inspur.com>
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
In-Reply-To: <5863c61a424545119df8ccb28dc1dbf8@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[inspur.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
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

Am 13.08.25 um 03:38 schrieb Gary Chu(楚光庆):
> Hi Thomas
>
> This is what I've done in the yhgch_drm driver.
> See the link below:
> https://lore.kernel.org/all/20250808053508.52202-1-chuguangqing@inspur.com/T/#t

I see. I thought it was for an existing driver. In new drivers, please 
don't use VRAM helpers any longer. VRAM helpers are based on TTM and new 
drivers should use TTM directly. If you integrate the code from VRAM 
helpers into your driver, you should be good.

Note that for reliably using TTM, your hardware requires at least 3 
times the memory as the largest resolution+depth requires. The driver 
says 1920*1200@32bpp, which amounts to ~9 MiB of VRAM. For TTM usage, 
your device requires at least 32 MiB of VRAM available.

If your devices have smaller VRAM, rather use GEM SHMEM helpers instead.

Best regards
Thomas

>
> In fact, through modifications in Patch v2, it allows only the selection of
> DRM_VRAM_HELPER in the driver.
> See the link below:
> https://lore.kernel.org/all/20250729060728.82402-1-chuguangqing@inspur.com/T/#m3e33f8e155275ea548223c21777c191ecd392159
>
> Best regards
> Chuguangqing
>
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> To:chuguangqing <chuguangqing@inspur.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
>>
>> Hi
>>
>> Am 29.07.25 um 08:07 schrieb chuguangqing:
>>> We encountered the following errors while compiling drm_vram_helper.ko
>>>
>>> ERROR: modpost: "drm_gem_ttm_print_info"
>> [drivers/gpu/drm/drm_vram_helper.ko] undefined!
>>> ERROR: modpost: "drm_gem_ttm_mmap"
>> [drivers/gpu/drm/drm_vram_helper.ko] undefined!
>>> The functions drm_gem_ttm_mmap and drm_gem_ttm_print_info are
>> defined in drm_gem_ttm_helper.c. This patch adds drm_gem_ttm_helper.o to
>> DRM_VRAM_HELPER to resolve the undefined symbol errors.
>>
>> You need to select DRM_TTM_HELPER for your driver.
>>
>> Best regards
>> Thomas
>>
>>> Signed-off-by: chuguangqing <chuguangqing@inspur.com>
>>> ---
>>>    drivers/gpu/drm/Makefile | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile index
>>> 4dafbdc8f86a..abbe32ddf6d0 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -125,7 +125,7 @@ drm_suballoc_helper-y := drm_suballoc.o
>>>    obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
>>>
>>>    drm_vram_helper-y := drm_gem_vram_helper.o
>>> -obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>>> +obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>>> +drm_gem_ttm_helper.o
>>>
>>>    drm_ttm_helper-y := drm_gem_ttm_helper.o
>>>    drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) +=
>> drm_fbdev_ttm.o
>>
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB
>> 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


