Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A7598CD99
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 09:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5781610E1E9;
	Wed,  2 Oct 2024 07:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K5VWj2Cp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yqJuveSR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K5VWj2Cp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yqJuveSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A9910E1E9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 07:06:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9D521F83C;
 Wed,  2 Oct 2024 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727852763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/vyTz01Ax/Lm8Vst3X78ud0XhC/IdrP4FLgKAcWu4U=;
 b=K5VWj2Cp0ktht12UMAuzvHh+0XuiehGR4DfXrliPk7wGcvlWEmC0r0kAmaQLnrDLaMkImD
 3hc5zwTtw00rjHrg9PYcKHMhhkCQ//uuOkRF+op+sxHcMv/uzenIGcOA9kOJP0A5npq7Y9
 RrDxUyLbDVIY7GgrZEaLXrvXpizb1tM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727852763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/vyTz01Ax/Lm8Vst3X78ud0XhC/IdrP4FLgKAcWu4U=;
 b=yqJuveSRn+D2EOfrh1Flx5U9KDnhsdpd1PZ2vIYMGXWA6xl58pDlKB+VLPgShtiEmjw/SL
 bhjL3NI3N6WIwZAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727852763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/vyTz01Ax/Lm8Vst3X78ud0XhC/IdrP4FLgKAcWu4U=;
 b=K5VWj2Cp0ktht12UMAuzvHh+0XuiehGR4DfXrliPk7wGcvlWEmC0r0kAmaQLnrDLaMkImD
 3hc5zwTtw00rjHrg9PYcKHMhhkCQ//uuOkRF+op+sxHcMv/uzenIGcOA9kOJP0A5npq7Y9
 RrDxUyLbDVIY7GgrZEaLXrvXpizb1tM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727852763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/vyTz01Ax/Lm8Vst3X78ud0XhC/IdrP4FLgKAcWu4U=;
 b=yqJuveSRn+D2EOfrh1Flx5U9KDnhsdpd1PZ2vIYMGXWA6xl58pDlKB+VLPgShtiEmjw/SL
 bhjL3NI3N6WIwZAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 963CB13A6E;
 Wed,  2 Oct 2024 07:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id B2FyI9vw/GbqIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Oct 2024 07:06:03 +0000
Message-ID: <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
Date: Wed, 2 Oct 2024 09:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
To: Tony Luck <tony.luck@intel.com>
Cc: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
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
In-Reply-To: <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[]
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

Am 02.10.24 um 00:41 schrieb Tony Luck:
> My system threw out a bunch of stack traces while booting
> v6.12-rc1 and hung.

Thanks for the bug report. Can you provide the output of 'sudo lspci 
-vvv' for the graphics device?

Best regards
Thomas

>
> First of these looks like this:
>
> [   33.639799] fbcon: mgag200drmfb (fb0) is primary device
> [   33.651573] ixgbe 0000:03:00.0: Intel(R) 10 Gigabit Network Connection
> [   33.652092] ixgbe 0000:03:00.1: enabling device (0100 -> 0102)
> [   33.818328] ------------[ cut here ]------------
> [   33.818362] [CRTC:34:crtc-0] vblank wait timed out
> [   33.818422] WARNING: CPU: 44 PID: 1815 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x245/0x250 [drm_kms_helper]
> [   33.818447] Modules linked in: crct10dif_pclmul mgag200(+) crc32_pclmul i2c_algo_bit crc32c_intel drm_shmem_helper ghash_clmulni_intel sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 ixgbe(+) mpt3sas mdio drm raid_class dca scsi_transport_sas wmi fuse
> [   33.818475] CPU: 44 PID: 1815 Comm: systemd-udevd Not tainted 6.10.0-rc1+ #168
> [   33.818478] Hardware name: Intel Corporation BRICKLAND/BRICKLAND, BIOS BRBDXSD1.86B.0338.V01.1603162127 03/16/2016
> [   33.818481] RIP: 0010:drm_atomic_helper_wait_for_vblanks.part.0+0x245/0x250 [drm_kms_helper]
> [   33.818490] Code: 00 48 8d 7b 08 e8 2b 7e 61 da 45 85 ff 0f 85 d3 fe ff ff 49 8b 56 20 41 8b b6 d8 00 00 00 48 c7 c7 38 52 ba c0 e8 8b 53 59 da <0f> 0b e9 b5 fe ff ff 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90
> [   33.818493] RSP: 0018:ffffbf61a3faf690 EFLAGS: 00010282
> [   33.818496] RAX: 0000000000000026 RBX: ffff99be04ad3028 RCX: 0000000000000000
> [   33.818499] RDX: 0000000000000002 RSI: ffffffff9c9fd7c8 RDI: 00000000ffffffff
> [   33.818501] RBP: ffff99be08a76c00 R08: 0000000000000001 R09: 0000000000000000
> [   33.818503] R10: 0000000000000001 R11: ffff99f1011fffe8 R12: 0000000000000000
> [   33.818504] R13: 0000000000000000 R14: ffff99be0bcf93f8 R15: 0000000000000000
> [   33.818506] FS:  00007fbe18e7db40(0000) GS:ffff99ca61c00000(0000) knlGS:0000000000000000
> [   33.818509] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   33.818510] CR2: 000055b77636c1f8 CR3: 000000000e486004 CR4: 00000000003706f0
> [   33.818513] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   33.818514] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   33.818516] Call Trace:
> [   33.818519]  <TASK>
> [   33.818521]  ? __warn+0x8b/0x190
> [   33.818535]  ? drm_atomic_helper_wait_for_vblanks.part.0+0x245/0x250 [drm_kms_helper]
> [   33.818545]  ? report_bug+0x1c3/0x1d0
> [   33.818559]  ? handle_bug+0x42/0x70
> [   33.818571]  ? exc_invalid_op+0x14/0x70
> [   33.818575]  ? asm_exc_invalid_op+0x16/0x20
> [   33.818589]  ? drm_atomic_helper_wait_for_vblanks.part.0+0x245/0x250 [drm_kms_helper]
> [   33.818602]  ? __pfx_autoremove_wake_function+0x10/0x10
> [   33.818614]  drm_atomic_helper_commit_tail+0x71/0x80 [drm_kms_helper]
> [   33.818625]  mgag200_mode_config_helper_atomic_commit_tail+0x28/0x40 [mgag200]
> [   33.818633]  commit_tail+0x94/0x130 [drm_kms_helper]
> [   33.818644]  drm_atomic_helper_commit+0x13e/0x170 [drm_kms_helper]
> [   33.818655]  drm_atomic_commit+0x97/0xb0 [drm]
> [   33.818717]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [   33.818750]  drm_client_modeset_commit_atomic+0x207/0x250 [drm]
> [   33.818783]  drm_client_modeset_commit_locked+0x5b/0x190 [drm]
> [   33.818807]  drm_client_modeset_commit+0x24/0x50 [drm]
> [   33.818829]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x92/0xc0 [drm_kms_helper]
> [   33.818841]  drm_fb_helper_set_par+0x2e/0x40 [drm_kms_helper]
> [   33.818850]  fbcon_init+0x2a8/0x560
> [   33.818860]  visual_init+0xc4/0x120
> [   33.818867]  do_bind_con_driver.isra.0+0x1a1/0x3d0
> [   33.818875]  do_take_over_console+0x10b/0x1a0
> [   33.818880]  do_fbcon_takeover+0x5c/0xc0
> [   33.818883]  fbcon_fb_registered+0x49/0x70
> [   33.818886]  register_framebuffer+0x190/0x250
> [   33.818896]  __drm_fb_helper_initial_config_and_unlock+0x345/0x590 [drm_kms_helper]
> [   33.818906]  ? drm_client_register+0x33/0xc0 [drm]
> [   33.818934]  drm_fbdev_shmem_client_hotplug+0x6c/0xc0 [drm_shmem_helper]
> [   33.818939]  drm_client_register+0x7b/0xc0 [drm]
> [   33.818963]  mgag200_pci_probe+0x90/0x180 [mgag200]
> [   33.818970]  local_pci_probe+0x46/0xa0
> [   33.818978]  pci_device_probe+0xb5/0x230
> [   33.818986]  really_probe+0xd9/0x380
> [   33.818993]  __driver_probe_device+0x78/0x150
> [   33.818997]  driver_probe_device+0x1e/0x90
> [   33.819000]  __driver_attach+0xd6/0x1d0
> [   33.819003]  ? __pfx___driver_attach+0x10/0x10
> [   33.819005]  bus_for_each_dev+0x66/0xa0
> [   33.819012]  bus_add_driver+0x111/0x240
> [   33.819018]  driver_register+0x5c/0x120
> [   33.819021]  ? __pfx_mgag200_pci_driver_init+0x10/0x10 [mgag200]
> [   33.819026]  do_one_initcall+0x62/0x3a0
> [   33.819035]  ? kmalloc_trace_noprof+0x2a0/0x340
> [   33.819048]  do_init_module+0x64/0x240
> [   33.819058]  init_module_from_file+0x7a/0xa0
> [   33.819072]  idempotent_init_module+0x15a/0x210
> [   33.819079]  ? __startup_64+0x70/0x3f0
> [   33.819086]  __x64_sys_finit_module+0x5a/0xb0
> [   33.819092]  do_syscall_64+0x73/0x190
> [   33.819098]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> I peeked at changes to this driver between v6.11 and v6.12-rc1 and saw
> this set:
>
> $ git log --oneline linus ^v6.11 -- drivers/gpu/drm/mgag200
> 219b45d023ed drm/mgag200: Remove BMC output
> 0f9ff361ad82 drm/mgag200: vga-bmc: Control BMC scanout from encoder
> 9d09cac47de5 drm/mgag200: vga-bmc: Control CRTC VIDRST flag from encoder
> dc06efbb7934 drm/mgag200: vga-bmc: Transparently handle BMC
> f5510726608f drm/mgag200: Add VGA-BMC output
> 6c9e14ee9f51 drm/mgag200: Fix VBLANK interrupt handling
> d5070c9b2944 drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp
> 89c6ea2006e2 drm/mgag200: Add vblank support
> 5cd522b5331b drm/mgag200: Add dedicted variable for <linecomp> field
> d6460bd52c27 drm/mgag200: Add dedicated variables for blanking fields
> e8f834b55962 drm/mgag200: Use adjusted mode values for CRTCs
> b345b3542d66 drm/mgag200: Align register field names with documentation
> 754c9129b949 drm/mgag200: Use hexadecimal register indeces
> 3ac9384061b2 drm/mgag200: Rename BMC vidrst names
> 7bb97cf91588 drm/mgag200: Remove vidrst callbacks from struct mgag200_device_funcs
> cd3a2e8b0a03 drm/mgag200: Only set VIDRST bits in CRTC modesetting
>
> I tried a mini-bisct across these changes and found the system boots
> normally with:
>
> 5cd522b5331b drm/mgag200: Add dedicted variable for <linecomp> field
>
> and fails with:
>
> 89c6ea2006e2 drm/mgag200: Add vblank support
>
> I do see that there is a subsequent "Fix VBLANK" patch, but it appears
> that whatever it fixed didn't help on my system.
>
> -Tony

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

