Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B298BE9D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 15:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEB310E31E;
	Tue,  1 Oct 2024 13:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="A3en3WM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Tue, 01 Oct 2024 13:57:12 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810D110E31E;
 Tue,  1 Oct 2024 13:57:12 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id D2188209EE;
 Tue,  1 Oct 2024 13:51:04 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id CCDC120059;
 Tue,  1 Oct 2024 13:51:01 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id A986620339;
 Tue,  1 Oct 2024 13:50:59 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf1.mymailcheap.com (Postfix) with ESMTPSA id 6405B4075D;
 Tue,  1 Oct 2024 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1727790658; bh=K2oGFnjBusu+IAsS1nLdwcDpHeuDRPAKwUyoJzMBDCA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A3en3WM9Zkkbinn2TJr5Gyw19UylvEpu73AjC6mPk/KIwfnwqvy4USl7DEROI87xm
 UlNXqUbxROE58IEn2Y1G594HjbpY1emfbq2jts5wQdonGpqADia2iXhe90Bc3iPqgb
 bwUpSg140Sa6PGEY/RrQ32+E2+U8M6D9jDd+g7kQ=
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 9BFD041538;
 Tue,  1 Oct 2024 13:50:58 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Oct 2024 21:50:58 +0800
From: Mingcong Bai <jeffbai@aosc.io>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex
 Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Pan@freedesktop.org, Xinhui
 <Xinhui.Pan@amd.com>, Huacai Chen <chenhuacai@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 cherokee_legend_04@foxmail.com
Subject: Re: [PATCH] Revert "drm/radeon: use GEM references instead of TTMs"
In-Reply-To: <20240929075058.3542013-1-chenhuacai@loongson.cn>
References: <20240929075058.3542013-1-chenhuacai@loongson.cn>
Message-ID: <c48100d6f22ebd4b99bcc2b3f068581b@aosc.io>
X-Sender: jeffbai@aosc.io
Organization: Anthon Open Source Community
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 6405B4075D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 10.00]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; ARC_NA(0.00)[];
 RCVD_COUNT_ONE(0.00)[1];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; HAS_ORG_HEADER(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,freedesktop.org,kernel.org,lists.freedesktop.org,foxmail.com];
 FREEMAIL_ENVRCPT(0.00)[foxmail.com,gmail.com];
 MISSING_XM_UA(0.00)[]
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

Hi Huacai,

在 2024-09-29 15:50，Huacai Chen 写道：
> This reverts commit fd69ef05029f9beb7b031ef96e7a36970806a670.
> 
> The original patch causes NULL pointer references:
> 
> [   21.620856] CPU 3 Unable to handle kernel paging request at virtual 
> address 0000000000000000, era == 9000000004bf61d8, ra == 
> 9000000004bf61d4
> [   21.717958] Oops[#1]:
> [   21.803205] CPU: 3 UID: 0 PID: 706 Comm: Xorg Not tainted 6.11.0+ 
> #1708
> [   21.894451] Hardware name: Loongson 
> Loongson-3A5000-7A1000-1w-CRB/Loongson-LS3A5000-7A1000-1w-CRB, BIOS 
> vUDK2018-LoongArch-V2.0.0-prebeta9 10/21/2022
> [   21.996576] pc 9000000004bf61d8 ra 9000000004bf61d4 tp 
> 9000000110560000 sp 9000000110563d40
> [   22.094731] a0 000000000000002d a1 9000000000580788 a2 
> 9000000000584d78 a3 9000000005678f40
> [   22.193513] a4 9000000005678f38 a5 9000000110563b70 a6 
> 0000000000000001 a7 0000000000000001
> [   22.291993] t0 0000000000000000 t1 78315f0d31fceafb t2 
> 0000000000000000 t3 00000000000003c4
> [   22.389868] t4 9000000101d65840 t5 0000000000000003 t6 
> 0000000000000003 t7 ffffffffffffffff
> [   22.488326] t8 0000000000000001 u0 9000000120c31e20 s9 
> 9000000110563ec0 s0 90000001107e0868
> [   22.587345] s1 ffff80000230c000 s2 9000000120c31e48 s3 
> 9000000120c31e00 s4 90000001063b0000
> [   22.685908] s5 9000000120c31e20 s6 0000000000000122 s7 
> 0000000000000100 s8 000055555c079570
> [   22.785169]    ra: 9000000004bf61d4 drm_gem_object_free+0x24/0x70
> [   22.881896]   ERA: 9000000004bf61d8 drm_gem_object_free+0x28/0x70
> [   22.978212]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
> [   23.076423]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> [   23.153679] [drm] amdgpu kernel modesetting enabled.
> [   23.173074]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> [   23.365633]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
> [   23.459680] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
> [   23.554473]  BADV: 0000000000000000
> [   23.646222]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> [   23.740356] Modules linked in: amdgpu rfkill nft_fib_inet 
> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 
> nf_reject_ipv6 nft_reject nft_ct drm_exec amdxcps
> [   23.973584] Process Xorg (pid: 706, threadinfo=000000005fc343eb, 
> task=000000007bdfdf49)
> [   24.080528] Stack : 9000000120d86000 ffff8000021bb1c0 
> 0000000000000000 ffff8000022a6bcc
> [   24.188191]         0000000000000122 9000000120c31d08 
> 900000010e04a400 9000000120c31e00
> [   24.295420]         90000001063b0008 9000000120c31c00 
> 90000001063b0000 ffff80000219c54c
> [   24.402622]         00000000000000b4 90000001063b0170 
> 90000001063b0008 9000000120c31c00
> [   24.509242]         9000000120c31ce0 90000000043966f8 
> 000055555c0922c0 000055555c082ac0
> [   24.615887]         000055555597b000 0000000000000000 
> 90000001034af840 90000001063f7928
> [   24.723086]         90000001063b00d0 9000000120c31c00 
> 90000001063b0008 9000000004396844
> [   24.830582]         90000001017901a0 90000001017901a0 
> 900000010e7e6718 00000000000a001b
> [   24.937455]         90000001228b86c0 9000000003ad5904 
> 000055555c082da0 0000000000000000
> [   25.043806]         000055555c082ac0 90000001228b86c0 
> 0000000000000000 9000000003acfb58
> [   25.149701]         ...
> [   25.248708] Call Trace:
> [   25.248710] [<9000000004bf61d8>] drm_gem_object_free+0x28/0x70
> [   25.447554] [<ffff8000021bb1bc>] radeon_bo_unref+0x3c/0x60 [radeon]
> [   25.549201] [<ffff8000022a6bc8>] radeon_vm_fini+0x188/0x2c0 [radeon]
> [   25.650751] [<ffff80000219c548>] 
> radeon_driver_postclose_kms+0x188/0x1e0 [radeon]
> [   25.753856] [<90000000043966f4>] drm_file_free+0x214/0x2a0
> [   25.854893] [<9000000004396840>] drm_release+0xc0/0x160
> [   25.954337] [<9000000003ad5900>] __fput+0x100/0x340
> [   26.052437] [<9000000003acfb54>] sys_close+0x34/0xa0
> [   26.148701] [<9000000004c04170>] do_syscall+0xb0/0x160
> 

This appears to be a non-LoongArch specific issue as I was able to 
reproduce this on my Intel platform (H310 chipset, Pentium Gold G5620) 
with an AMD Radeon R7 240 (Oland) connected via HDMI.

Happy to provide more testing results if needed, but below is the log 
where the crash occurred:

kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: PGD 0 P4D 0
kernel: Oops: Oops: 0000 [#1] PREEMPT SMP PTI
kernel: CPU: 3 UID: 0 PID: 952 Comm: ddcutil Not tainted 
6.11.0-aosc-main-11993-g3efc57369a0c #1
kernel: Hardware name: System manufacturer System Product Name/PRIME 
H310M-F R2.0, BIOS 1401 03/31/2020
kernel: RIP: 0010:drm_gem_object_free+0x10/0x30
kernel: Code: 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 
90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 87 40 01 00 00 
<48> 8b 00 48 85 c0 74 06 ff e0 cc 66 90 cc 0f 0b 31 >
kernel: RSP: 0018:ffffb0f300b23de8 EFLAGS: 00010246
kernel: RAX: 0000000000000000 RBX: ffff918b0487a000 RCX: 
000000000000000c
kernel: RDX: 0000000000000001 RSI: 0000000000000000 RDI: 
ffff918b1eee2468
kernel: RBP: ffff918b197d9000 R08: 0000000000000000 R09: 
0000000000000000
kernel: R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff918b179cc000
kernel: R13: ffff918b03ee0800 R14: ffff918b197d9048 R15: 
ffff918b197d92e0
kernel: FS:  00007ffb58033b80(0000) GS:ffff918b32d80000(0000) 
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000000000000000 CR3: 000000011eda4005 CR4: 
00000000003706f0
kernel: Call Trace:
kernel:  <TASK>
kernel:  ? __die+0x23/0x80
kernel:  ? page_fault_oops+0x14f/0x560
kernel:  ? exc_page_fault+0x84/0x1c0
kernel:  ? asm_exc_page_fault+0x26/0x30
kernel:  ? drm_gem_object_free+0x10/0x30
kernel:  radeon_bo_unref+0x64/0x80 [radeon]
kernel:  radeon_vm_fini+0x1d0/0x260 [radeon]
kernel:  radeon_driver_postclose_kms+0x164/0x190 [radeon]
kernel:  drm_file_free+0x1f3/0x250
kernel:  drm_release+0xaa/0x120
kernel:  __fput+0xdc/0x2a0
kernel:  __x64_sys_close+0x3c/0x80
kernel:  do_syscall_64+0x64/0x150
kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
kernel: RIP: 0033:0x7ffb57ef9430
kernel: Code: 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 
00 00 0f 1f 44 00 00 80 3d 39 8f 11 00 00 74 17 b8 03 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 >
kernel: RSP: 002b:00007ffd59048868 EFLAGS: 00000202 ORIG_RAX: 
0000000000000003
kernel: RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 
00007ffb57ef9430
kernel: RDX: 000000055c96b7fe RSI: 0000000000000001 RDI: 
0000000000000003
kernel: RBP: 0000000000000001 R08: 0000000000000007 R09: 
000055c96b7fe430
kernel: R10: a563eae46f2f347c R11: 0000000000000202 R12: 
0000000000000000
kernel: R13: 000055c9634e44b8 R14: 0000000000000010 R15: 
000055c96347e698
kernel:  </TASK>
kernel: Modules linked in: joydev mousedev input_leds snd_soc_avs 
snd_soc_hda_codec snd_hda_ext_core intel_rapl_msr iTCO_wdt 
intel_rapl_common intel_pmc_bxt intel_uncore_frequency snd_soc_core >
kernel:  drm_ttm_helper ttm video wmi hid_logitech_dj hid_generic sunrpc 
coretemp i2c_dev
kernel: CR2: 0000000000000000
kernel: ---[ end trace 0000000000000000 ]---
kernel: RIP: 0010:drm_gem_object_free+0x10/0x30
kernel: Code: 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 
90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 87 40 01 00 00 
<48> 8b 00 48 85 c0 74 06 ff e0 cc 66 90 cc 0f 0b 31 >
kernel: RSP: 0018:ffffb0f300b23de8 EFLAGS: 00010246
kernel: RAX: 0000000000000000 RBX: ffff918b0487a000 RCX: 
000000000000000c
kernel: RDX: 0000000000000001 RSI: 0000000000000000 RDI: 
ffff918b1eee2468
kernel: RBP: ffff918b197d9000 R08: 0000000000000000 R09: 
0000000000000000
kernel: R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff918b179cc000
kernel: R13: ffff918b03ee0800 R14: ffff918b197d9048 R15: 
ffff918b197d92e0
kernel: FS:  00007ffb58033b80(0000) GS:ffff918b32d80000(0000) 
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000000000000000 CR3: 000000011eda4005 CR4: 
00000000003706f0

> The root cause is obj->funcs is NULL in drm_gem_object_free(). Only
> fbdev bo is created by radeon_gem_object_create() and has valid 
> 'funcs'.
> 
> Maybe there is a better way to fix this bug, but since amdgpu driver
> also use ttm helpers in amdgpu_bo_ref()/amdgpu_bo_unref() now, I think
> it is also reasonable to just revert the original commit.
> ---
>  drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.c | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c 
> b/drivers/gpu/drm/radeon/radeon_gem.c
> index 9735f4968b86..210e8d43bb23 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct 
> drm_gem_object *gobj)
> 
>  	if (robj) {
>  		radeon_mn_unregister(robj);
> -		ttm_bo_put(&robj->tbo);
> +		radeon_bo_unref(&robj);
>  	}
>  }
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c 
> b/drivers/gpu/drm/radeon/radeon_object.c
> index d0e4b43d155c..450ff7daa46c 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -256,15 +256,18 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo 
> *bo)
>  	if (bo == NULL)
>  		return NULL;
> 
> -	drm_gem_object_get(&bo->tbo.base);
> +	ttm_bo_get(&bo->tbo);
>  	return bo;
>  }
> 
>  void radeon_bo_unref(struct radeon_bo **bo)
>  {
> +	struct ttm_buffer_object *tbo;
> +
>  	if ((*bo) == NULL)
>  		return;
> -	drm_gem_object_put(&(*bo)->tbo.base);
> +	tbo = &((*bo)->tbo);
> +	ttm_bo_put(tbo);
>  	*bo = NULL;
>  }

Best Regards,
Mingcong Bai
