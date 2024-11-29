Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DDE9DED4B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 23:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CF510E35B;
	Fri, 29 Nov 2024 22:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dK8dou+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3FB10E35B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 22:59:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0335E5C5DFC;
 Fri, 29 Nov 2024 22:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690E6C4CECF;
 Fri, 29 Nov 2024 22:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732921157;
 bh=q1TWZVrg/UMgVm7zYPshXBZlNriYQjfT4GvqK0WC0Bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dK8dou+OxupcEH44yLuqARJx1IRjLB/cWjCq2zEdoiDncVzmVWDvIpV/qif8RrEm+
 9WcFHLzV0N5IyONK278+0iz88gRQbNQfJpl+pMaG7kZ/s1jqydKvWt5Ny21piXMWxN
 ub6q75f4o0uA+sXXYK4G5zRVzQuxOKxhn7UnSDbn176kDSh0I7v4vyxcAGFWcey3M6
 THGTM2WLDYgMB60Xojqo2TrStmkfDFm2RloO6pvmRR+f0XKPCamtwg/298o72NdUvu
 I1HmiOM3NxkvIuqYL5q4Zyb5tNlLAiwbUJoUKbeMagnq4/5yiZYXrgZZtsug4Yb5JD
 baHQeCd527ZHA==
Date: Fri, 29 Nov 2024 17:59:15 -0500
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm fixes for 6.13-rc1
Message-ID: <Z0pHQ-Uxgj2snWvm@sashalap>
References: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
 <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
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

On Fri, Nov 29, 2024 at 01:31:37PM -0800, Linus Torvalds wrote:
>Sasha - it would help if your warning stack dumps had line numbers
>(using decode_stacktrace.sh, which you should be familiar with, since
>you wrote it...)
>
>I realize that requires some debug info, which might slow down builds
>etc, but it would be really nice.

I don't actually do any of the testing myself: my scripts just try to
race you, pulling trees and feeding them to KernelCI/LKFT for testing.

I'm constrained by what I get out of the testing infrastructure, and
from what I see in KernelCI the kernel builds are done without debug
info (a trade-off to allow more builds/tests?).

I should be able to reuse their config and just add debug info, no?
This is what I get as output for the 32-bit issue:

[    4.495349] UBSAN: shift-out-of-bounds in include/linux/log2.h:57:13
[    4.501876] shift exponent 32 is too large for 32-bit type 'long unsigned int'
[    4.509101] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0 #1
[    4.510096] Hardware name: Google Shuboz/Shuboz, BIOS Google_Shuboz.13434.780.2022_10_13_1418 09/12/2022
[    4.510096] Call Trace:
[    4.510096] dump_stack_lvl (lib/dump_stack.c:108)
[    4.510096] dump_stack (lib/dump_stack.c:114)
[    4.510096] __ubsan_handle_shift_out_of_bounds (lib/ubsan.c:133 lib/ubsan.c:373)
[    4.510096] amdgpu_vm_adjust_size.cold (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2083 (discriminator 1))
[    4.510096] ? __lock_release.isra.0 (kernel/locking/lockdep.c:5429)
[    4.510096] ? amdgpu_device_skip_hw_access.part.0 (drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:380)
[    4.510096] ? gmc_v9_0_init_mem_ranges (include/linux/device.h:861 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1994)
[    4.510096] gmc_v9_0_sw_init (drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:2167)
[    4.510096] ? nbio_v7_0_vcn_doorbell_range (drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c:103)
[    4.510096] ? gmc_v9_0_init_mem_ranges (include/linux/device.h:861 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1994)
[    4.510096] amdgpu_device_ip_init (drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2319 (discriminator 1))
[    4.510096] amdgpu_device_init (drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3906)
[    4.510096] amdgpu_driver_load_kms (drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:148)
[    4.510096] amdgpu_pci_probe (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2151 (discriminator 1))
[    4.510096] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:95 (discriminator 1) include/linux/spinlock_api_smp.h:152 (discriminator 1) kernel/locking/spinlock.c:194 (discriminator 1))
[    4.510096] pci_device_probe (drivers/pci/pci-driver.c:324 drivers/pci/pci-driver.c:392 drivers/pci/pci-driver.c:417 drivers/pci/pci-driver.c:460)
[    4.510096] ? sysfs_create_link (fs/sysfs/symlink.c:93)
[    4.510096] really_probe (drivers/base/dd.c:652 (discriminator 1))
[    4.510096] ? _raw_spin_unlock_irq (include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202)
[    4.510096] ? pm_runtime_barrier (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-arch-fallback.h:2433 include/linux/atomic/atomic-instrumented.h:1508 include/linux/pm_runtime.h:140 drivers/base/power/runtime.c:1424)
[    4.510096] __driver_probe_device (drivers/base/dd.c:800)
[    4.510096] ? __driver_attach (include/linux/device.h:992 drivers/base/dd.c:1095 drivers/base/dd.c:1215 drivers/base/dd.c:1156)
[    4.510096] driver_probe_device (drivers/base/dd.c:831)
[    4.510096] __driver_attach (include/linux/device.h:992 drivers/base/dd.c:1095 drivers/base/dd.c:1215 drivers/base/dd.c:1156)
[    4.510096] ? __device_attach_driver (include/linux/list.h:154 include/linux/list.h:183 drivers/base/dd.c:140 drivers/base/dd.c:132 drivers/base/dd.c:935)
[    4.510096] bus_for_each_dev (drivers/base/bus.c:326 drivers/base/bus.c:369)
[    4.510096] driver_attach (drivers/base/dd.c:1234)
[    4.510096] ? __device_attach_driver (include/linux/list.h:154 include/linux/list.h:183 drivers/base/dd.c:140 drivers/base/dd.c:132 drivers/base/dd.c:935)
[    4.510096] bus_add_driver (drivers/base/bus.c:673)
[    4.510096] driver_register (drivers/base/driver.c:240)
[    4.510096] ? drm_sched_fence_slab_init (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2894)
[    4.510096] __pci_register_driver (drivers/pci/pci-driver.c:1459)
[    4.510096] amdgpu_init (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2905)
[    4.510096] do_one_initcall (arch/x86/include/asm/bitops.h:228 arch/x86/include/asm/bitops.h:240 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/cpumask.h:504 include/linux/cpumask.h:1082 include/trace/events/initcall.h:27 init/main.c:1237)
[    4.510096] ? rdinit_setup (init/main.c:601 (discriminator 1))
[    4.510096] ? parse_args (kernel/params.c:191 (discriminator 1))
[    4.510096] do_initcalls (init/main.c:1299 init/main.c:1316)
[    4.510096] ? rdinit_setup (init/main.c:601 (discriminator 1))
[    4.510096] kernel_init_freeable (init/main.c:1546)
[    4.510096] ? kernel_init (init/main.c:1445)
[    4.510096] ? rest_init (include/linux/rcupdate.h:787 (discriminator 5) init/main.c:703 (discriminator 5))
[    4.510096] kernel_init (init/main.c:1445)
[    4.510096] ? schedule_tail (kernel/sched/core.c:5317)
[    4.510096] ret_from_fork (arch/x86/kernel/process.c:153)
[    4.510096] ? rest_init (include/linux/rcupdate.h:787 (discriminator 5) init/main.c:703 (discriminator 5))
[    4.510096] ret_from_fork_asm (arch/x86/entry/entry_64.S:291)
[    4.510096] entry_INT80_32+0x108/0x108

...which looks reasonable?

-- 
Thanks,
Sasha
