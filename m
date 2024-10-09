Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD40996038
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A705A10E244;
	Wed,  9 Oct 2024 06:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JhFvVYby";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zaUzGD0g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JhFvVYby";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zaUzGD0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703D710E244
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:59:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B811F1FE7E;
 Wed,  9 Oct 2024 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728457169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I+lFLtWf1MH4RRpZZztgnudE99y3j5Thz4AgOSN5VPw=;
 b=JhFvVYbyrAIB9FKlbjuOvXWe7hzhsNgRbzpYjnXmwRViz9dDR/crr6GS+oyPF/SvIkBpaA
 MN9uun6fsznP4PpHa+bIkPJF9vezF+NtijlooYl0FeDVsgNyLzWQflIh6dxHeao8PGE3kh
 b3fsd8KW12gRrWCQSVU78PcuOrdCJmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728457169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I+lFLtWf1MH4RRpZZztgnudE99y3j5Thz4AgOSN5VPw=;
 b=zaUzGD0goOzbmt3FvgS6cQVdL1l+8nvLF5zEHsrzjpG9aQ2LRs/UAuQD5lq2bU9uDc/om5
 MDpKxzCYjIwN5bAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728457169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I+lFLtWf1MH4RRpZZztgnudE99y3j5Thz4AgOSN5VPw=;
 b=JhFvVYbyrAIB9FKlbjuOvXWe7hzhsNgRbzpYjnXmwRViz9dDR/crr6GS+oyPF/SvIkBpaA
 MN9uun6fsznP4PpHa+bIkPJF9vezF+NtijlooYl0FeDVsgNyLzWQflIh6dxHeao8PGE3kh
 b3fsd8KW12gRrWCQSVU78PcuOrdCJmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728457169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I+lFLtWf1MH4RRpZZztgnudE99y3j5Thz4AgOSN5VPw=;
 b=zaUzGD0goOzbmt3FvgS6cQVdL1l+8nvLF5zEHsrzjpG9aQ2LRs/UAuQD5lq2bU9uDc/om5
 MDpKxzCYjIwN5bAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E186136BA;
 Wed,  9 Oct 2024 06:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hOJeHdEpBmfzMAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Oct 2024 06:59:29 +0000
Message-ID: <164f5bd6-c240-42af-aef4-37db7e2041cc@suse.de>
Date: Wed, 9 Oct 2024 08:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: Set `fbdev_probe` in `struct vc5_drm_driver`
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241009004332.1901833-1-mcanal@igalia.com>
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
In-Reply-To: <20241009004332.1901833-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -4.30
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

Am 09.10.24 um 02:40 schrieb Maíra Canal:
> Currently, when booting the RPi 4B, we get a NULL pointer dereference:
>
> [    7.642883] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> [    7.642926] Mem abort info:
> [    7.642938]   ESR = 0x0000000096000044
> [    7.642951]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    7.642968]   SET = 0, FnV = 0
> [    7.642981]   EA = 0, S1PTW = 0
> [    7.642993]   FSC = 0x04: level 0 translation fault
> [    7.643007] Data abort info:
> [    7.643017]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> [    7.643032]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [    7.643046]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    7.643063] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107487000
> [    7.643081] [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
> [    7.643113] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> [    7.643131] Modules linked in: snd_bcm2835(C)  [...] vc4 v3d [...]
> drm_shmem_helper drm_dma_helper drm_kms_helper drm [...] ipv6
> [    7.643377] CPU: 1 UID: 0 PID: 48 Comm: kworker/u16:2 Tainted: G         C         6.12.0-rc1-00310-g2c34a5464007 #185
> [    7.643407] Tainted: [C]=CRAP
> [    7.643419] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
> [    7.643438] Workqueue: events_unbound deferred_probe_work_func
> [    7.643477] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    7.643499] pc : __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [drm_kms_helper]
> [    7.643616] lr : __drm_fb_helper_initial_config_and_unlock+0x374/0x588 [drm_kms_helper]
> [    7.643710] sp : ffff8000806c3900
> [    7.643724] x29: ffff8000806c3950 x28: ffff431b01a3ec14 x27: 0000000000000010
> [    7.643758] x26: ffff431b0369f000 x25: 0000000036314752 x24: ffff431b003b6200
> [    7.643790] x23: ffff431b0369f000 x22: 00000000000002d0 x21: ffff431b003b6030
> [    7.643821] x20: ffff431b003b6030 x19: ffff431b003b6000 x18: ffff431b002e6e48
> [    7.643852] x17: 0000000000000001 x16: ffffb19c2f10614c x15: 0000000000000000
> [    7.643882] x14: 0000000000000000 x13: ffff431b003b62f0 x12: 0000000000000500
> [    7.643913] x11: 0000000000000000 x10: 0000000000000000 x9 : 005d6e6f6362665b
> [    7.643945] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000000003f
> [    7.643975] x5 : ffffb19bcb45c59c x4 : 0000000000001e00 x3 : ffffb19bcb420c20
> [    7.644005] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff431b003b6000
> [    7.644036] Call trace:
> [    7.644049]  __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [drm_kms_helper]
> [    7.644149]  drm_fb_helper_initial_config+0x34/0x4c [drm_kms_helper]
> [    7.644240]  drm_fbdev_client_hotplug+0x74/0xc8 [drm_kms_helper]
> [    7.644331]  drm_client_register+0x58/0xa0 [drm]
> [    7.644571]  drm_fbdev_client_setup+0xc4/0x17c [drm_kms_helper]
> [    7.644664]  drm_client_setup_with_fourcc+0x28/0x60 [drm_kms_helper]
> [    7.644755]  vc4_drm_bind+0x218/0x264 [vc4]
> [    7.644855]  try_to_bring_up_aggregate_device+0x168/0x1b4
> [    7.644884]  __component_add+0xb8/0x158
> [    7.644905]  component_add+0x14/0x20
> [    7.644925]  vc4_hvs_dev_probe+0x1c/0x28 [vc4]
> [    7.645019]  platform_probe+0xa8/0xd0
> [    7.645045]  really_probe+0x128/0x2c8
> [    7.645065]  __driver_probe_device+0xa0/0x128
> [    7.645086]  driver_probe_device+0x3c/0x1f8
> [    7.645106]  __device_attach_driver+0x118/0x140
> [    7.645127]  bus_for_each_drv+0xf4/0x14c
> [    7.645145]  __device_attach+0xfc/0x194
> [    7.645164]  device_initial_probe+0x14/0x20
> [    7.645184]  bus_probe_device+0x94/0x100
> [    7.645202]  deferred_probe_work_func+0x88/0xc4
> [    7.645223]  process_scheduled_works+0x194/0x2c4
> [    7.645246]  worker_thread+0x290/0x39c
> [    7.645265]  kthread+0xfc/0x184
> [    7.645289]  ret_from_fork+0x10/0x20
> [    7.645317] Code: f2ac6c49 aa1303e0 f2cdcde9 f2e00ba9 (f9001d09)
> [    7.645338] ---[ end trace 0000000000000000 ]---
>
> This happens because commit 45903624e9fc ("drm/vc4: Run DRM default client
> setup") only added DRM_FBDEV_DMA_DRIVER_OPS to `struct vc4_drm_driver`
> and didn't add it to `struct vc5_drm_driver`. The `struct vc4_drm_driver`
> is used in RPi 0-3, as VC4 is also a render node in those RPis. But RPi 4
> and 5 use V3D as the render node and VC4 as modeset node and therefore,
> use `struct vc5_drm_driver`.
>
> This commit adds DRM_FBDEV_DMA_DRIVER_OPS to `struct vc5_drm_driver`,
> ensuring that `fbdev_probe` exists for all VC4 generations.
>
> Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Sorry for forgetting about this.

Best regards
Thomas

> ---
>   drivers/gpu/drm/vc4/vc4_drv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 13a1ecddbca3..a238f76a6073 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -238,6 +238,7 @@ const struct drm_driver vc5_drm_driver = {
>   #endif
>   
>   	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>   
>   	.fops = &vc4_drm_fops,
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

