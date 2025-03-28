Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA9BA748CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 11:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA44210E9E0;
	Fri, 28 Mar 2025 10:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b9TDsGYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B010E0F3;
 Fri, 28 Mar 2025 10:59:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2088FA416E8;
 Fri, 28 Mar 2025 10:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0744CC4CEEA;
 Fri, 28 Mar 2025 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743159545;
 bh=M80BwyeI/5FhFXlfX1oHfEYhuopM64H98lTBJqDtmUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9TDsGYnRmR2NTB+cMFv3V7o4VGVVAeWJz4o/XS8VEzMYhfz1f/tpnAbCoB4D/WLH
 K+rWsdPhTZplESNX/zBQwfJQj4Izc47Z130tirzVE1hXbyuhL1q39lSBC6rAmMXyTX
 Kgvf9GvWT7Qbi+XybKYWg3AHJkQ1gJJRam2FHvOA6xBwdwBSwwu0fVyjEizpEaHBto
 up7QGzu7JRaSNPdOK6KjJ7Bl8mcx4aE6zenTXKAHB9m+I3WdtCDoKRj50PzPFNC0ot
 X4qtrSjQ8uTwT1J70iilAWU9mG7V/oZT5MRUC3dLroa7uxpundunvmkvKIsD/sFzSB
 3dnDRGVUgrkVQ==
Date: Fri, 28 Mar 2025 11:59:00 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lyude@redhat.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
Message-ID: <Z-aA9LBCtdCK4YYr@pollux>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
 <Z9rSTkXlub-JZAz0@cassiopeiae> <Z-P4epVK8k7tFZ7C@debian.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-P4epVK8k7tFZ7C@debian.local>
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

On Wed, Mar 26, 2025 at 12:52:10PM +0000, Chris Bainbridge wrote:
> Fix an oops in ttm_bo_delayed_delete which results from dererencing a
> dangling pointer:
> 
> Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP
> CPU: 4 UID: 0 PID: 1082 Comm: kworker/u65:2 Not tainted 6.14.0-rc4-00267-g505460b44513-dirty #216
> Hardware name: LENOVO 82N6/LNVNB161216, BIOS GKCN65WW 01/16/2024
> Workqueue: ttm ttm_bo_delayed_delete [ttm]
> RIP: 0010:dma_resv_iter_first_unlocked+0x55/0x290
> Code: 31 f6 48 c7 c7 00 2b fa aa e8 97 bd 52 ff e8 a2 c1 53 00 5a 85 c0 74 48 e9 88 01 00 00 4c 89 63 20 4d 85 e4 0f 84 30 01 00 00 <41> 8b 44 24 10 c6 43 2c 01 48 89 df 89 43 28 e8 97 fd ff ff 4c 8b
> RSP: 0018:ffffbf9383473d60 EFLAGS: 00010202
> RAX: 0000000000000001 RBX: ffffbf9383473d88 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffbf9383473d78 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 6b6b6b6b6b6b6b6b
> R13: ffffa003bbf78580 R14: ffffa003a6728040 R15: 00000000000383cc
> FS:  0000000000000000(0000) GS:ffffa00991c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000758348024dd0 CR3: 000000012c259000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? __die_body.cold+0x19/0x26
>  ? die_addr+0x3d/0x70
>  ? exc_general_protection+0x159/0x460
>  ? asm_exc_general_protection+0x27/0x30
>  ? dma_resv_iter_first_unlocked+0x55/0x290
>  dma_resv_wait_timeout+0x56/0x100
>  ttm_bo_delayed_delete+0x69/0xb0 [ttm]
>  process_one_work+0x217/0x5c0
>  worker_thread+0x1c8/0x3d0
>  ? apply_wqattrs_cleanup.part.0+0xc0/0xc0
>  kthread+0x10b/0x240
>  ? kthreads_online_cpu+0x140/0x140
>  ret_from_fork+0x40/0x70
>  ? kthreads_online_cpu+0x140/0x140
>  ret_from_fork_asm+0x11/0x20
>  </TASK>
> 
> The cause of this is:
> 
> - drm_prime_gem_destroy calls dma_buf_put(dma_buf) which releases the
>   reference to the shared dma_buf. The reference count is 0, so the
>   dma_buf is destroyed, which in turn decrements the corresponding
>   amdgpu_bo reference count to 0, and the amdgpu_bo is destroyed -
>   calling drm_gem_object_release then dma_resv_fini (which destroys the
>   reservation object), then finally freeing the amdgpu_bo.
> 
> - nouveau_bo obj->bo.base.resv is now a dangling pointer to the memory
>   formerly allocated to the amdgpu_bo.
> 
> - nouveau_gem_object_del calls ttm_bo_put(&nvbo->bo) which calls
>   ttm_bo_release, which schedules ttm_bo_delayed_delete.
> 
> - ttm_bo_delayed_delete runs and dereferences the dangling resv pointer,
>   resulting in a general protection fault.
> 
> Fix this by moving the drm_prime_gem_destroy call from
> nouveau_gem_object_del to nouveau_bo_del_ttm. This ensures that it will
> be run after ttm_bo_delayed_delete.
> 
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Fixes: 22b33e8ed0e3 ("22b33e8ed0e3nouveau: add PRIME support")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
> Cc: <Stable@vger.kernel.org>

Applied to drm-misc-fixes, thanks!

[ Fixed up the Fixes: tag, where the commit hash is repeated in the commit
subject. ]
