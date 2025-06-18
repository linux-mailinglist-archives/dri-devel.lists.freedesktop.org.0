Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B7ADF291
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 18:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C45010E04B;
	Wed, 18 Jun 2025 16:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i2YP11jx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ppZ1Jkdi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pxu8+MkP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X3/Yy5aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3917210E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 16:26:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD19C2121A;
 Wed, 18 Jun 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750263959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMghSRssADmI6VJbe5WsDXlCoC88hAvQn4te1wgp3cg=;
 b=i2YP11jxG4HbZO1EiNkivtkk/KVHoKh96pELuQG0QmLL8jhT00T+KgJzPX2E8nIak8iGsW
 rm8J/zsWBWsRYjrns4/8qkovxVWuWh+q5+NrwxeU2bM7fXQxzv6LwFDhr97y3K1LfL6q03
 7XmqSi/YzfHHKakajb21/713rdTtSGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750263959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMghSRssADmI6VJbe5WsDXlCoC88hAvQn4te1wgp3cg=;
 b=ppZ1JkdiuTxf9HxeyvEkmOTJF89Mvy5ndkJgDQO5WxOln3+a/HmDPQDgwW9yt5dBK2KTOb
 s31E8L0KtTimXHCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750263958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMghSRssADmI6VJbe5WsDXlCoC88hAvQn4te1wgp3cg=;
 b=pxu8+MkP0zTG95IHH9h+hJsCBy6kXPUmhYlFaWZOeMpYY2PcZicVBtiITwTIAcUaHLSIC4
 5J1/q5WsvqRG9FlQfK7lGm5/h1G8jlFKTM4DDIxSw+Y9XYAzQiSi0Aox1kuSJUncy2CLWL
 1pzVqZEV9VJZoZmYLPr8trbBHb1rvdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750263958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMghSRssADmI6VJbe5WsDXlCoC88hAvQn4te1wgp3cg=;
 b=X3/Yy5aBU80UoQNNHYm5aFfzTnmlVxa9kXFSwHSBrPotZhpKzkS73y6nhM8qaLlbhd7bXo
 Jqlotz/1f8TzKZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A530813721;
 Wed, 18 Jun 2025 16:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3sF3JpboUmgOJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 16:25:58 +0000
Message-ID: <17d14458-a035-4793-8f19-38f4405e02a3@suse.de>
Date: Wed, 18 Jun 2025 18:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [report] DMA-API: platform vgem: mapping sg segment longer than
 device claims to support [len=1048576] [max=65536]
To: Zenghui Yu <zenghui.yu@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev>
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
In-Reply-To: <6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url]
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

Am 18.06.25 um 18:03 schrieb Zenghui Yu:
> Hi all,
>
> Running the dmabuf-heap test [*] on mainline kernel triggers the
> following splat:
>
>   ------------[ cut here ]------------
>   DMA-API: platform vgem: mapping sg segment longer than device claims to
> support [len=1048576] [max=65536]

Thanks for the bug report. We have a possible fix in the latest 
drm-misc-next tree. Does it work if use replace DRM_GEM_SHMEM_DRIVER_OPS 
with DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT at [1]?

[1] 
https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/gpu/drm/vgem/vgem_drv.c#L118

Best regards
Thomas

>   WARNING: CPU: 7 PID: 1126 at kernel/dma/debug.c:1174
> debug_dma_map_sg+0x348/0x3e4
>   Modules linked in: vgem drm_shmem_helper drm_kms_helper rfkill drm fuse
> backlight sha3_ce sha512_ce ipv6
>   CPU: 7 UID: 0 PID: 1126 Comm: dmabuf-heap Kdump: loaded Not tainted
> 6.16.0-rc2-00024-g9afe652958c3-dirty PREEMPT
>   Hardware name: QEMU QEMU Virtual Machine, BIOS
> edk2-stable202408-prebuilt.qemu.org 08/13/2024
>   pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>   pc : debug_dma_map_sg+0x348/0x3e4
>   lr : debug_dma_map_sg+0x348/0x3e4
>   sp : ffff800084313a50
>   x29: ffff800084313a50 x28: ffff0000c0a62480 x27: 0000000000000001
>   x26: ffffffffffffffff x25: 0000000000000000 x24: ffff0000c0985f20
>   x23: ffff8000815ab058 x22: 0000000000000001 x21: 0000000000000001
>   x20: 0000000000000000 x19: ffff0000c2797010 x18: 0000000000000020
>   x17: 0000000000000000 x16: 0000000000000000 x15: 00000000ffffffff
>   x14: ffff8000815c6390 x13: 00000000000005bb x12: 00000000000001e9
>   x11: fffffffffffe8360 x10: ffff80008161e390 x9 : 00000000fffff000
>   x8 : ffff8000815c6390 x7 : ffff80008161e390 x6 : 0000000000000000
>   x5 : ffff0001fee21308 x4 : 0000000000000001 x3 : 0000000000000000
>   x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c5ea4600
>   Call trace:
>    debug_dma_map_sg+0x348/0x3e4 (P)
>    __dma_map_sg_attrs+0xbc/0x118
>    dma_map_sgtable+0x28/0x44
>    system_heap_map_dma_buf+0x2c/0x64
>    dma_buf_map_attachment+0x60/0x184
>    dma_buf_map_attachment_unlocked+0x3c/0x7c
>    drm_gem_prime_import_dev.part.0+0x58/0x130 [drm]
>    drm_gem_prime_import+0x48/0xc4 [drm]
>    drm_gem_prime_fd_to_handle+0x180/0x220 [drm]
>    drm_prime_fd_to_handle_ioctl+0x38/0x44 [drm]
>    drm_ioctl_kernel+0xb8/0x12c [drm]
>    drm_ioctl+0x204/0x4ec [drm]
>    __arm64_sys_ioctl+0xac/0x104
>    invoke_syscall+0x48/0x110
>    el0_svc_common.constprop.0+0x40/0xe0
>    do_el0_svc+0x1c/0x28
>    el0_svc+0x34/0x108
>    el0t_64_sync_handler+0xc8/0xcc
>    el0t_64_sync+0x198/0x19c
>   ---[ end trace 0000000000000000 ]---
>
> The kernel is built with arm64's virtconfig and
>
> +CONFIG_DMABUF_HEAPS=y
> +CONFIG_DMABUF_HEAPS_SYSTEM=y
> +CONFIG_DRM_VGEM=m
> +CONFIG_DMA_API_DEBUG=y
>
> [*] linux/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
>
> Thanks,
> Zenghui

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

