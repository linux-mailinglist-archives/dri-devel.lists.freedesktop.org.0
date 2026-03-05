Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNqfN8E4qWnN3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:03:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0320D16C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F84310EB34;
	Thu,  5 Mar 2026 08:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="O+UIe5Sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F89A10EB34
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=643Vga1WA1LUKIgE+XE9yAihXepBHayWtr8/65csuag=; b=O+UIe5SnVoLIk7i7Uba26342fF
 AnNkRsiN2QFJD6J6a6BeIK3XnaEbwb6sjFBA5XxYMYSwxLiHg8h9nriuFwDtBWMuBQZw8AvGIaNXJ
 DpvQIkfcHcajvyCFc9MYV7ENDENyuZ3bXlgsFnrLV98ppQEDTmMigsyhiTp9jymUVWHi6jh7VtERo
 d3Frmzb1W0gzvRYmeC9dcf18n2xnsD7viF5gpTuATuaa1nnbr//7z1rdwI6L47cQRqijF0F7FFvyo
 FXnQwwenbSAbop91TuRclx2YphR4Wwv6k9qGKCAN3mlXOocMdHlVL9DSvvrInN7MelovkqTkY0OGk
 EjlaU8wQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vy3fm-009GNH-97; Thu, 05 Mar 2026 09:03:06 +0100
Message-ID: <eafac1e7-2c15-4522-8017-7ee8ae1d0034@igalia.com>
Date: Thu, 5 Mar 2026 08:03:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix bo resource use-after-free
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, kernel-dev@igalia.com
References: <20260304-ttm_bo_res_uaf-v1-1-43f20125b67f@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260304-ttm_bo_res_uaf-v1-1-43f20125b67f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 13F0320D16C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cascardo@igalia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action


On 04/03/2026 23:27, Thadeu Lima de Souza Cascardo wrote:
> When allocating a lot of buffers and putting the TTM under memory pressure,
> during swapout, it might crash the system with the stack trace below.
> 
> It turns out that ttm_bo_swapout_cb might replace bo->resource when it
> moves it to system cached.
> 
> When commit c06da4b3573a ("drm/ttm: Tidy usage of local variables a little
> bit") used a local variable for bo->resource, it used the freed resource
> later in the function, leading to a UAF.
> 
> Move back to using bo->resource in all cases in that function instead of a
> local variable.
> 
> [  604.814275] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [  604.814284] #PF: supervisor read access in kernel mode
> [  604.814288] #PF: error_code(0x0000) - not-present page
> [  604.814291] PGD 0 P4D 0
> [  604.814296] Oops: Oops: 0000 [#1] SMP NOPTI
> [  604.814303] CPU: 2 UID: 0 PID: 4408 Comm: vulkan Tainted: G        W           7.0.0-rc2-00001-gc50a051e6aca #21 PREEMPT(full)  aef6eb0c02036a7c8a5e62e0c84a30c2be90688d
> [  604.814309] Tainted: [W]=WARN
> [  604.814311] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0133 08/05/2024
> [  604.814314] RIP: 0010:ttm_resource_move_to_lru_tail+0x100/0x160 [ttm]
> [  604.814329] Code: 5b 5d e9 83 b4 1b cb 48 63 d2 48 c1 e0 04 48 8b 4e 40 48 8d 7e 40 48 8b ac d3 d8 00 00 00 48 89 c3 48 8d 54 05 68 48 8b 46 48 <48> 3b 38 0f 85 b3 3b 00 00 48 3b 79 08 0f 85 a9 3b 00 00 48 89 41
> [  604.814332] RSP: 0018:ffffcfe54e3d7578 EFLAGS: 00010256
> [  604.814336] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff8cf09eced300
> [  604.814339] RDX: 0000000000000068 RSI: ffff8cf1d4c1fc00 RDI: ffff8cf1d4c1fc40
> [  604.814341] RBP: 0000000000000000 R08: ffff8cf09eced300 R09: 0000000000000000
> [  604.814344] R10: 0000000000000000 R11: 0000000000000016 R12: ffff8cf1d4c1fc00
> [  604.814346] R13: 0000000000000400 R14: ffff8cf096289c00 R15: ffff8cf084c8f688
> [  604.814349] FS:  00007f00531b7780(0000) GS:ffff8cf4217a0000(0000) knlGS:0000000000000000
> [  604.814352] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  604.814355] CR2: 0000000000000000 CR3: 000000018e3df000 CR4: 0000000000350ef0
> [  604.814358] Call Trace:
> [  604.814362]  <TASK>
> [  604.814368]  ttm_bo_swapout_cb+0x24c/0x280 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814380]  ttm_lru_walk_for_evict+0xac/0x1d0 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814394]  ttm_bo_swapout+0x5b/0x80 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814405]  ttm_global_swapout+0x63/0x100 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814415]  ttm_tt_populate+0x82/0x130 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814424]  ttm_bo_populate+0x37/0xa0 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814433]  ttm_bo_handle_move_mem+0x157/0x170 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814443]  ttm_bo_validate+0xd9/0x180 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814453]  ttm_bo_init_reserved+0xa0/0x1b0 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.814461]  ? srso_return_thunk+0x5/0x5f
> [  604.814469]  amdgpu_bo_create+0x1f5/0x500 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.814855]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.815182]  amdgpu_bo_create_user+0x3d/0x70 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.815504]  amdgpu_gem_create_ioctl+0x16c/0x3b0 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.815830]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.816155]  ? __pfx_amdgpu_gem_create_ioctl+0x10/0x10 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.816478]  drm_ioctl_kernel+0xae/0x100
> [  604.816486]  drm_ioctl+0x283/0x510
> [  604.816491]  ? __pfx_amdgpu_gem_create_ioctl+0x10/0x10 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.816819]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.817135]  __x64_sys_ioctl+0x96/0xe0
> [  604.817142]  do_syscall_64+0x11b/0x7e0
> [  604.817148]  ? srso_return_thunk+0x5/0x5f
> [  604.817152]  ? srso_return_thunk+0x5/0x5f
> [  604.817156]  ? walk_system_ram_range+0xb0/0x110
> [  604.817161]  ? srso_return_thunk+0x5/0x5f
> [  604.817165]  ? __pte_offset_map+0x1b/0xb0
> [  604.817170]  ? srso_return_thunk+0x5/0x5f
> [  604.817174]  ? pte_offset_map_lock+0x87/0xf0
> [  604.817179]  ? srso_return_thunk+0x5/0x5f
> [  604.817183]  ? insert_pfn+0x9f/0x1f0
> [  604.817188]  ? srso_return_thunk+0x5/0x5f
> [  604.817192]  ? vmf_insert_pfn_prot+0x97/0x190
> [  604.817197]  ? srso_return_thunk+0x5/0x5f
> [  604.817201]  ? ttm_bo_vm_fault_reserved+0x1a6/0x3f0 [ttm a469cf7fcb6737fdcf3fb5cdbcc8b1ca41f3e302]
> [  604.817213]  ? srso_return_thunk+0x5/0x5f
> [  604.817217]  ? amdgpu_gem_fault+0xe2/0x100 [amdgpu 361516226706227f4403914dbfdd3f90996136ca]
> [  604.817542]  ? srso_return_thunk+0x5/0x5f
> [  604.817546]  ? __do_fault+0x33/0x180
> [  604.817550]  ? srso_return_thunk+0x5/0x5f
> [  604.817554]  ? do_fault+0x178/0x610
> [  604.817559]  ? srso_return_thunk+0x5/0x5f
> [  604.817562]  ? __handle_mm_fault+0x9be/0x1120
> [  604.817567]  ? srso_return_thunk+0x5/0x5f
> [  604.817574]  ? srso_return_thunk+0x5/0x5f
> [  604.817578]  ? count_memcg_events+0xc4/0x160
> [  604.817583]  ? srso_return_thunk+0x5/0x5f
> [  604.817587]  ? handle_mm_fault+0x1d7/0x2e0
> [  604.817593]  ? srso_return_thunk+0x5/0x5f
> [  604.817596]  ? do_user_addr_fault+0x173/0x660
> [  604.817602]  ? srso_return_thunk+0x5/0x5f
> [  604.817607]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  604.817612] RIP: 0033:0x7f00532cef4d
> [  604.817617] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> [  604.817620] RSP: 002b:00007ffd69ab0650 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  604.817624] RAX: ffffffffffffffda RBX: 00007ffd69ab07d0 RCX: 00007f00532cef4d
> [  604.817627] RDX: 00007ffd69ab0700 RSI: 00000000c0206440 RDI: 0000000000000005
> [  604.817629] RBP: 00007ffd69ab06a0 R08: 00007f00533a0ac0 R09: 0000000000000000
> [  604.817632] R10: 00007ffd69ab07c0 R11: 0000000000000246 R12: 00007ffd69ab0700
> [  604.817634] R13: 00000000c0206440 R14: 0000000000000005 R15: 0000000000000243
> [  604.817642]  </TASK>
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Fixes: c06da4b3573a ("drm/ttm: Tidy usage of local variables a little bit")

My bad, let me push this ASAP.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index acb9197db8798659da178186115c2912b84f64e6..0765d69423d2f4028bf2effd21af53e117ee7a29 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1107,8 +1107,7 @@ struct ttm_bo_swapout_walk {
>   static s64
>   ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>   {
> -	struct ttm_resource *res = bo->resource;
> -	struct ttm_place place = { .mem_type = res->mem_type };
> +	struct ttm_place place = { .mem_type = bo->resource->mem_type };
>   	struct ttm_bo_swapout_walk *swapout_walk =
>   		container_of(walk, typeof(*swapout_walk), walk);
>   	struct ttm_operation_ctx *ctx = walk->arg.ctx;
> @@ -1148,7 +1147,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>   	/*
>   	 * Move to system cached
>   	 */
> -	if (res->mem_type != TTM_PL_SYSTEM) {
> +	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
>   		struct ttm_resource *evict_mem;
>   		struct ttm_place hop;
>   
> @@ -1180,15 +1179,15 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>   
>   	if (ttm_tt_is_populated(tt)) {
>   		spin_lock(&bdev->lru_lock);
> -		ttm_resource_del_bulk_move(res, bo);
> +		ttm_resource_del_bulk_move(bo->resource, bo);
>   		spin_unlock(&bdev->lru_lock);
>   
>   		ret = ttm_tt_swapout(bdev, tt, swapout_walk->gfp_flags);
>   
>   		spin_lock(&bdev->lru_lock);
>   		if (ret)
> -			ttm_resource_add_bulk_move(res, bo);
> -		ttm_resource_move_to_lru_tail(res);
> +			ttm_resource_add_bulk_move(bo->resource, bo);
> +		ttm_resource_move_to_lru_tail(bo->resource);
>   		spin_unlock(&bdev->lru_lock);
>   	}
>   
> 
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260304-ttm_bo_res_uaf-f2096356dff5
> 
> Best regards,

