Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A94B9530B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404910E052;
	Tue, 23 Sep 2025 09:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lw1qCvoz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B9t3eNvN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lw1qCvoz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B9t3eNvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45410E052
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:15:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5821A1F800;
 Tue, 23 Sep 2025 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758618950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0+WNlR17O+ydArHfxPeHqdZLzNQQ1UWqsD42H/DcBR0=;
 b=lw1qCvozTkuJxo7/VH13aKURnEO1sabB65zc/FHuuEW41Y8f1UcUQGt0y3IYkIblZMCd80
 8SAa3zijpmAMFosozK190tx8Oe5M5/fxO8UTj4hDDFySKI+xGVZndJSmjXX6anQy6SW9GK
 RalT9MDjTrA9iSbxSnYe93gM2diOpBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758618950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0+WNlR17O+ydArHfxPeHqdZLzNQQ1UWqsD42H/DcBR0=;
 b=B9t3eNvNH/V+VkK8y2MMKT6AZoP0phTQ1SngR3GNH763LQ1FsHom9WWpQFu1wCfPppWwYK
 zPg85UGGyE1F1zBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758618950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0+WNlR17O+ydArHfxPeHqdZLzNQQ1UWqsD42H/DcBR0=;
 b=lw1qCvozTkuJxo7/VH13aKURnEO1sabB65zc/FHuuEW41Y8f1UcUQGt0y3IYkIblZMCd80
 8SAa3zijpmAMFosozK190tx8Oe5M5/fxO8UTj4hDDFySKI+xGVZndJSmjXX6anQy6SW9GK
 RalT9MDjTrA9iSbxSnYe93gM2diOpBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758618950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0+WNlR17O+ydArHfxPeHqdZLzNQQ1UWqsD42H/DcBR0=;
 b=B9t3eNvNH/V+VkK8y2MMKT6AZoP0phTQ1SngR3GNH763LQ1FsHom9WWpQFu1wCfPppWwYK
 zPg85UGGyE1F1zBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ECF91388C;
 Tue, 23 Sep 2025 09:15:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JM5lCUZl0mifUgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Sep 2025 09:15:50 +0000
Message-ID: <bfb9cf60-decd-44c8-aee7-061fb64d5041@suse.de>
Date: Tue, 23 Sep 2025 11:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ast "WARN_ON(!__ast_dp_wait_enable("ast, enabled)) on reboot
To: Nirmoy Das <nirmoyd@nvidia.com>,
 KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: dri-devel@lists.freedesktop.org, Carol Soto <csoto@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>
References: <d81cc339-43c9-4529-ace5-29a687378b0d@nvidia.com>
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
In-Reply-To: <d81cc339-43c9-4529-ace5-29a687378b0d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.28 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.18)[-0.914]; MIME_GOOD(-0.10)[text/plain];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 SUBJECT_HAS_EXCLAIM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.28
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

Am 23.09.25 um 10:34 schrieb Nirmoy Das:
>
> Hi Thomas and KuoHsiang
>
>
> (Not sure if there is separate portal to report AST issues. Let me 
> know if there is one)
>
> We are observing the following trace on every reboot. I tried 
> increasing the timeout value but that did not resolve the issue.
>
> I tried to read AST_IO_VGACRI(0xdf) and AST_IO_VGACRI(0xe3) which  
> returns a value of 0xff. I wonder if
>
> the device is accessible at pci_device_shutdown().
>
> I have attached the lspci output for your review.  Please let me know 
> if you have some ideas how to debug/fix this.
>

Is that a new problem? I occasionally refactor parts of the driver. It 
could happen that an older version works?

Best regards
Thomas

> [ 196.248014] ast 0008:02:00.0: [drm] 
> drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled)) [ 196.248045] 
> WARNING: CPU: 76 PID: 1 at drivers/gpu/drm/ast/ast_dp.c:282 
> ast_dp_set_enable+0x124/0x158 [ast] [ 196.277550] Modules linked in: 
> bcache qrtr cfg80211 binfmt_misc cdc_subset ast dax_hmem 
> drm_shmem_helper cxl_acpi drm_client_lib cxl_port i2c_algo_bit 
> cxl_core ipmi_ssif drm_kms_helper uio_pdrv_genirq uio coresight_trbe 
> arm_spe_pmu arm_cspmu_module arm_smmuv3_pmu spi_nor mtd 
> coresight_funnel acpi_power_meter acpi_ipmi coresight_etm4x coresight 
> ipmi_msghandler dm_multipath efi_pstore drm nfnetlink ip_tables 
> x_tables autofs4 overlay isofs nls_iso8859_1 raid10 raid456 
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor 
> xor_neon raid6_pq raid1 raid0 linear mlx5_ib ib_uverbs ib_core 
> mlx5_core ghash_ce sm4_ce_cipher sm4 sm3_ce mlxfw sha3_ce psample 
> i2c_smbus sha512_ce nvme tls sha1_ce arm_smccc_trng nvme_core 
> pci_hyperv_intf spi_tegra210_quad dax_pmem i2c_tegra cdc_ether usbnet 
> aes_neon_bs aes_neon_blk aes_ce_blk aes_ce_cipher [last unloaded: 
> ipmi_devintf] [ 196.355667] CPU: 76 UID: 0 PID: 1 Comm: shutdown 
> Tainted: G W 6.16.4-dev-main-nvidia-pset-linux-6-generic #16+f4490439 
> PREEMPT(none) [ 196.369453] Tainted: [W]=WARN [ 196.372481] Hardware 
> name: NVIDIA Grace CPU P5041/P3880, BIOS FF.04.00 20250422 [ 
> 196.379955] pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS 
> BTYPE=--) [ 196.387073] pc : ast_dp_set_enable+0x124/0x158 [ast] [ 
> 196.392148] lr : ast_dp_set_enable+0x124/0x158 [ast] [ 196.397221] sp 
> : ffff80008049b930 [ 196.400604] x29: ffff80008049b930 x28: 
> ffffa507dbec1b98 x27: ffff0000acb337b8 [ 196.407901] x26: 
> 0000000000000000 x25: ffff1003985d2e00 x24: ffffa507dbdc45b8 [ 
> 196.415197] x23: 0000000000000000 x22: 0000000000418958 x21: 
> 00000000ffffffdf [ 196.422495] x20: ffff100008bac0c8 x19: 
> 0000000000000000 x18: 000000000000004c [ 196.429790] x17: 
> ffff100008b5f200 x16: ffffa508522b5ce8 x15: 0000000000000000 [ 
> 196.437087] x14: 0000000000000000 x13: 2d2d2d2d2d2d2d2d x12: 
> 2d2d2d2d5d206572 [ 196.444384] x11: 656820747563205b x10: 
> 0000000000000020 x9 : ffffa508523621cc [ 196.451681] x8 : 
> 00000000ffffffff x7 : 0000000000000030 x6 : 0000000005000000 [ 
> 196.458976] x5 : 000000000000004d x4 : 00000000000000c0 x3 : 
> 0000000000000003 [ 196.466271] x2 : 0000000000000000 x1 : 
> 0000000000000000 x0 : ffff000081356040 [ 196.473566] Call trace: [ 
> 196.476061] ast_dp_set_enable+0x124/0x158 [ast] (P) [ 196.481135] 
> ast_astdp_encoder_helper_atomic_disable+0x28/0x90 [ast] [ 196.487630] 
> disable_outputs+0x11c/0x3c8 [drm_kms_helper] [ 196.493160] 
> drm_atomic_helper_commit_tail+0x2c/0xb0 [drm_kms_helper] [ 196.499753] 
> ast_mode_config_helper_atomic_commit_tail+0x34/0x58 [ast] [ 
> 196.506427] commit_tail+0xd8/0x220 [drm_kms_helper] [ 196.511503] 
> drm_atomic_helper_commit+0x174/0x190 [drm_kms_helper] [ 196.517824] 
> drm_atomic_commit+0x94/0xe0 [drm] [ 196.522392] 
> drm_atomic_helper_disable_all+0x204/0x220 [drm_kms_helper] [ 
> 196.529158] drm_atomic_helper_shutdown+0x90/0x158 [drm_kms_helper] [ 
> 196.535567] ast_pci_shutdown+0x1c/0x30 [ast] [ 196.540020] 
> pci_device_shutdown+0x3c/0xa8 [ 196.544216] 
> device_shutdown+0x140/0x2b0 [ 196.548229] kernel_restart+0x4c/0xb8 [ 
> 196.551974] __do_sys_reboot+0x148/0x260 [ 196.555979] 
> __arm64_sys_reboot+0x2c/0x40 [ 196.560074] invoke_syscall+0x70/0x100 [ 
> 196.563907] el0_svc_common.constprop.0+0x48/0xf8 [ 196.568712] 
> do_el0_svc+0x28/0x40 [ 196.572097] el0_svc+0x34/0xd8 [ 196.575220] 
> el0t_64_sync_handler+0x144/0x168 [ 196.579670] 
> el0t_64_sync+0x1b0/0x1b8 [ 196.583411] ---[ end trace 0000000000000000 
> ]--- [ 196.656701] reboot: Restarting system
>
> lspci:
>
> 0008:03:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI 
> Bridge (rev 06) (prog-if 00 [Normal decode]) Subsystem: ASPEED 
> Technology, Inc. AST1150 PCI-to-PCI Bridge Physical Slot: 2-1 Flags: 
> bus master, fast devsel, latency 0, NUMA node 0, IOMMU group 24 Bus: 
> primary=03, secondary=04, subordinate=04, sec-latency=0 I/O behind 
> bridge: 40000-40fff [size=4K] [16-bit] Memory behind bridge: 
> 40000000-410fffff [size=17M] [32-bit] Prefetchable memory behind 
> bridge: [disabled] [64-bit] Capabilities: [40] Power Management 
> version 3 Capabilities: [68] Express PCI-Express to PCI/PCI-X Bridge, 
> MSI 00 Capabilities: [b0] Subsystem: ASPEED Technology, Inc. AST1150 
> PCI-to-PCI Bridge Capabilities: [e0] Vendor Specific Information: 
> Len=20 <?> Capabilities: [100] Device Serial Number 
> 00-80-5e-00-00-10-0b-b0 Capabilities: [10c] Secondary PCI Express 
> Capabilities: [150] Virtual Channel Capabilities: [1e0] Vendor 
> Specific Information: ID=0001 Rev=2 Len=010 <?> Capabilities: [1f0] 
> Advanced Error Reporting 0008:04:00.0 VGA compatible controller: 
> ASPEED Technology, Inc. ASPEED Graphics Family (rev 52) (prog-if 00 
> [VGA controller]) DeviceName: Embedded Video Controller Subsystem: 
> ASPEED Technology, Inc. ASPEED Graphics Family !!! Unknown header type 
> 7f Memory at 650040000000 (32-bit, non-prefetchable) [size=16M] Memory 
> at 650041000000 (32-bit, non-prefetchable) [size=256K] I/O ports at 
> 40000 [size=128] Kernel driver in use: ast Kernel modules: ast
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


