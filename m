Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FCBA897E5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D995110E378;
	Tue, 15 Apr 2025 09:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MclyyKc9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G8qSjAWg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DP1fJkH+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VXjuhFRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F48510E378
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:26:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D734C1F38F;
 Tue, 15 Apr 2025 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744709218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PHSzGDi9GEX/qqRonn+hoFV+Y9gAeqC6c3ks9OtqJDk=;
 b=MclyyKc9/x9XiiTuHDKSl1fUomVNc6l0cROBtqjHFz1y/lIe/36gqxcgJhAPOFQckzWVwQ
 8YIafGYOs2fjzF+dL43KCbxPkJa2OonMSnIrPnksKIK5ZFkup3kA2WyPsumkLdlxDYgV0P
 KI1kowT8jroJsTZwZes1Kmu6i9CJwvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744709218;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PHSzGDi9GEX/qqRonn+hoFV+Y9gAeqC6c3ks9OtqJDk=;
 b=G8qSjAWgnyYCe3rI/LfHBoXKW9FyFe29OateEIK62o3ruEf61BntHN6P7zHy6NCKsf8M+m
 aTf2k3uU6AKqijAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744709217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PHSzGDi9GEX/qqRonn+hoFV+Y9gAeqC6c3ks9OtqJDk=;
 b=DP1fJkH+gyzXwCHHI2LRajqb2JVv6foh4PKw/njd9g7g9Iwx1ZuDbuDZV8W2FvfhE5Olm2
 cyRJhyvXN55C2PnAdXQoSUCC2G2o8FIHheSlZy5z8r7y8/3omS0bggdWGFHSGZ1eNhbh2g
 HBgZTumuJ06UPSbDkKO+HKsaNC3/GDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744709217;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PHSzGDi9GEX/qqRonn+hoFV+Y9gAeqC6c3ks9OtqJDk=;
 b=VXjuhFRgtyAex5SpT9ozJDL2djmNZb8cfeOxOp8N++1VXaEAS633wmiyMfUjlYu/fX8wyu
 S2P8cm2wBjTC4LAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F864137A5;
 Tue, 15 Apr 2025 09:26:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fU6uJmAm/mdnVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 09:26:56 +0000
Message-ID: <d6e97d99-43a7-4121-b631-f8a9df7d0ce1@suse.de>
Date: Tue, 15 Apr 2025 11:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/rockchip: Test for imported buffers with
 drm_gem_is_imported()
To: Andy Yan <andyshrk@163.com>
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
References: <20250414134821.568225-5-tzimmermann@suse.de>
 <38d09d34.4354.196379aa560.Coremail.andyshrk@163.com>
 <c870c700-23f2-4d33-81ba-15af0797c0b7@suse.de>
 <13940fa8.67c1.196384d547f.Coremail.andyshrk@163.com>
 <4ed85ac2-481d-45e7-b8e6-b977dcbf8ef4@suse.de>
 <6d4c5335.8908.19638a09312.Coremail.andyshrk@163.com>
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
In-Reply-To: <6d4c5335.8908.19638a09312.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_TO(0.00)[163.com];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,linux.intel.com,lists.freedesktop.org,rock-chips.com,sntech.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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

Am 15.04.25 um 10:46 schrieb Andy Yan:
>
> Hi,
>
> 在 2025-04-15 15:51:31，"Thomas Zimmermann" <tzimmermann@suse.de> 写道：
>> Hi
>>
>> Am 15.04.25 um 09:15 schrieb Andy Yan:
>>> Hi Thomas，
>>>
>>> 在 2025-04-15 14:54:21，"Thomas Zimmermann" <tzimmermann@suse.de> 写道：
>>>> Hi
>>>>
>>>> Am 15.04.25 um 06:00 schrieb Andy Yan:
>>>>> Hi Thomas，
>>>>>
>>>>> At 2025-04-14 21:48:12, "Thomas Zimmermann" <tzimmermann@suse.de> wrote:
>>>>>> Instead of testing import_attach for imported GEM buffers, invoke
>>>>>> drm_gem_is_imported() to do the test. The helper tests the dma_buf
>>>>>> itself while import_attach is just an artifact of the import. Prepares
>>>>>> to make import_attach optional.
>>>>>>
>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Cc: Sandy Huang <hjc@rock-chips.com>
>>>>>> Cc: "Heiko Stübner" <heiko@sntech.de>
>>>>>> Cc: Andy Yan <andy.yan@rock-chips.com>
>>>>>> ---
>>>>>> drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 2 +-
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>>>>>> index 6330b883efc3..e44396d46dc1 100644
>>>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>>>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>>>>>> @@ -332,7 +332,7 @@ void rockchip_gem_free_object(struct drm_gem_object *obj)
>>>>>> 	struct rockchip_drm_private *private = drm->dev_private;
>>>>>> 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
>>>>>>
>>>>>> -	if (obj->import_attach) {
>>>>>> +	if (drm_gem_is_imported(obj)) {
>>>>> After applying this patch, when I tested glmark2-es2-wayland under Weston, the weston would freeze.
>>>>> It seems it goto the else path.
>>>>>
>>>>>     I'm still conducting further analysis to figure out the exact cause.
>>>> Thanks for testing. We test if obj->dma_buf is set and refers back to
>>>> obj. One of these fields has likely been cleared already to NULL during
>>>> the object cleanup. Other drivers also call drm_gem_is_imported() in
>>>> their object cleanup and I've not heard about any regressions.
>>>   From my test, it seems that a dumb buffer may export then import:
>>> and the obj->dma_buf will be cleared at drm_mode_destroy_dumb_ioctl-->drm_gem_handle_delete
>>>
>>> then test with   obj->dma_buf && (obj->dma_buf->priv != obj) will be false.
>> Here's a patch for the problem. Could you please test and report back
>> with the results? Thanks a lot.
> Yes,  this patch can make patch 05/11 work right.

Thanks for testing. I've send the fix out for review.

Best regards
Thomas

>
>
>> Best regards
>> Thomas
>>
>>
>>
>>>
>>>
>>>
>>>
>>> [   12.028941] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor 1
>>> [   14.606114] rockchip_gem_dumb_create weston obj: ffff00010149b000 handle: 1
>>> [   14.606170] drm_gem_prime_handle_to_dmabuf weston obj: ffff00010149b000 dma_buf: 0xffff000101454800 handle: 1
>>> [   14.606217] drm_gem_prime_fd_to_handle weston obj: ffff0001023cdc00 dma_buf: 0xffff000101454800 dma_buf->priv ffff00010149b000
>>> [   14.685517] rockchip_gem_dumb_create weston obj: ffff00010149b400 handle: 2
>>> [   14.685569] drm_gem_prime_handle_to_dmabuf weston obj: ffff00010149b400 dma_buf: 0xffff000101454400 handle: 2
>>> [   14.685691] drm_gem_prime_fd_to_handle weston obj: ffff0001023ce600 dma_buf: 0xffff000101454400 dma_buf->priv ffff00010149b400
>>> [   15.255277] rockchip_gem_dumb_create weston obj: ffff00010759f800 handle: 3
>>> [   15.255298] drm_gem_prime_handle_to_dmabuf weston obj: ffff00010759f800 dma_buf: 0xffff0001030cbc00 handle: 3
>>> [   15.255317] drm_gem_prime_fd_to_handle weston obj: ffff0001037a3200 dma_buf: 0xffff0001030cbc00 dma_buf->priv ffff00010759f800
>>> [   15.316336] rockchip_gem_dumb_create weston obj: ffff00010759f000 handle: 4
>>> [   15.316360] drm_gem_prime_handle_to_dmabuf weston obj: ffff00010759f000 dma_buf: 0xffff0001030cba00 handle: 4
>>> [   15.316404] drm_gem_prime_fd_to_handle weston obj: ffff0001037a1000 dma_buf: 0xffff0001030cba00 dma_buf->priv ffff00010759f000
>>> [   20.209006] rockchip_gem_dumb_create weston obj: ffff000106584000 handle: 1
>>> [   20.209031] drm_gem_prime_handle_to_dmabuf weston obj: ffff000106584000 dma_buf: 0xffff0001017a7600 handle: 1
>>> [   20.209049] drm_gem_prime_fd_to_handle weston obj: ffff00010182fc00 dma_buf: 0xffff0001017a7600 dma_buf->priv ffff000106584000
>>> [   20.228008] rockchip_gem_dumb_create weston obj: ffff000106584c00 handle: 2
>>> [   20.228029] drm_gem_prime_handle_to_dmabuf weston obj: ffff000106584c00 dma_buf: 0xffff0001017a7a00 handle: 2
>>> [   20.228081] drm_gem_prime_fd_to_handle weston obj: ffff000105eec000 dma_buf: 0xffff0001017a7a00 dma_buf->priv ffff000106584c00
>>>
>>> [   27.073265] drm_gem_prime_handle_to_dmabuf glmark2-es2-way obj: ffff0001035f0a00 dma_buf: 0xffff00010a24d500 handle: 10
>>> [   27.073377] drm_gem_prime_fd_to_handle weston obj: ffff0001035f0a00 dma_buf: 0xffff00010a24d500 dma_buf->priv ffff0001035f0a00
>>> [   27.073718] drm_gem_prime_fd_to_handle weston obj: ffff00010759e000 dma_buf: 0xffff00010a24d500 dma_buf->priv ffff0001035f0a00
>>>
>>> [   27.075363] drm_gem_handle_delete glmark2-es2-way obj: ffff0001035f0a00 handle: 10
>>> [   27.075718] drm_gem_prime_handle_to_dmabuf glmark2-es2-way obj: ffff00012946e000 dma_buf: 0xffff00010a24d100 handle: 25
>>> [   27.075799] drm_gem_prime_fd_to_handle weston obj: ffff00012946e000 dma_buf: 0xffff00010a24d100 dma_buf->priv ffff00012946e000
>>> [   27.076613] drm_gem_prime_fd_to_handle weston obj: ffff00010759dc00 dma_buf: 0xffff00010a24d100 dma_buf->priv ffff00012946e000
>>> [   27.079195] drm_gem_prime_handle_to_dmabuf glmark2-es2-way obj: ffff00012946e400 dma_buf: 0xffff00010a24d000 handle: 10
>>> [   27.079262] drm_gem_handle_delete weston obj: ffff00010759e000 handle: 5
>>> [   27.079271] CPU: 7 UID: 0 PID: 308 Comm: weston Not tainted 6.15.0-rc1+ #613 PREEMPT
>>> [   27.079276] Hardware name: Radxa ROCK 5B (DT)
>>> [   27.079278] Call trace:
>>> [   27.079280]  show_stack+0x18/0x24 (C)
>>> [   27.079289]  dump_stack_lvl+0x74/0x8c
>>> [   27.079296]  dump_stack+0x18/0x24
>>> [   27.079301]  drm_gem_object_handle_put_unlocked+0x58/0x128
>>> [   27.079309]  drm_gem_handle_delete+0xbc/0x110
>>> [   27.079314]  drm_mode_destroy_dumb_ioctl+0x24/0x3c
>>> [   27.079318]  drm_ioctl_kernel+0xc0/0x12c
>>> [   27.079324]  drm_ioctl+0x25c/0x55c
>>> [   27.079330]  __arm64_sys_ioctl+0xb4/0xe8
>>> [   27.079335]  invoke_syscall+0x48/0x10c
>>> [   27.079340]  el0_svc_common.constprop.0+0x40/0xe0
>>> [   27.079346]  do_el0_svc+0x1c/0x28
>>> [   27.079351]  el0_svc+0x30/0xcc
>>> [   27.079355]  el0t_64_sync_handler+0x10c/0x138
>>> [   27.079358]  el0t_64_sync+0x198/0x19c
>>> [   27.079362] drm_gem_object_exported_dma_buf_free weston obj: ffff00010759e000 dma_buf: 0xffff00010a24d500 dma_buf->priv: ffff0001035f0a00
>>> [   27.085797] rockchip_gem_free_object weston obj: ffff00010759e000 import dma_buf: 0x0000000000000000 dma_buf->priv: 0000000000000000
>>> [   27.086093] drm_gem_handle_delete weston obj: ffff0001035f0a00 handle: 35
>>> [   27.086099] CPU: 7 UID: 0 PID: 308 Comm: weston Not tainted 6.15.0-rc1+ #613 PREEMPT
>>> [   27.086102] Hardware name: Radxa ROCK 5B (DT)
>>>> Best regards
>>>> Thomas
>>>>
>>>>>> 		if (private->domain) {
>>>>>> 			rockchip_gem_iommu_unmap(rk_obj);
>>>>>> 		} else {
>>>>>> -- 
>>>>>> 2.49.0
>>>> -- 
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>>> HRB 36809 (AG Nuernberg)
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

