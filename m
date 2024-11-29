Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F89DE9F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A310E030;
	Fri, 29 Nov 2024 15:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tI9l5WHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCCD10E4E8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:51:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC2645C31EC;
 Fri, 29 Nov 2024 15:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD52C4CED2;
 Fri, 29 Nov 2024 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732895515;
 bh=cC7g//YZlXZQLesdTIo2E8ORnvcod1v2gyyt9pbt9GI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tI9l5WHNh32qQkQlGnT+MRouJUqKewiydJhKPvKs9hzCuwprZVcEePaemkrJy29sN
 tfu34qL8yCn4lvZX39NzUVxIWtL10x64A2Z/H/rgenV5SD75hD35jC2coftvOLv2VT
 9mvdHV7sJtJgPZfyNYSmrgaxBRLZJsSP+v5jK/f7I/JiJNjyqj56Gl0i4dWcHZDqNx
 8F/+N1O/5sG+WF65EmuzdHZegSFvRsC6ylhHSy0jMdd5Ngbl4OIbPijbtQPcmoUf6W
 XekDlM7rY527ojn/INbtZI16ICg6HuoAcdldGtAi21QvfG/m9IQuXiWJnghhrtSkV+
 YdKcCdQY/7ksw==
Date: Fri, 29 Nov 2024 10:51:54 -0500
From: Sasha Levin <sashal@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm fixes for 6.13-rc1
Message-ID: <Z0njGuEof47TzpMc@sashalap>
References: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
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

On Fri, Nov 29, 2024 at 06:42:18AM +1000, Dave Airlie wrote:
>Hi Linus,
>
>Merge window fixes, mostly amdgpu and xe, with a few other minor ones,
>all looks fairly normal,

Hi folks,

I've also started seeing the following warning after the merge into
linus-next:

[    4.495349] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
[    4.501876] shift exponent 32 is too large for 32-bit type 'long unsigned int'
[    4.509101] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0 #1
[    4.510096] Hardware name: Google Shuboz/Shuboz, BIOS Google_Shuboz.13434.780.2022_10_13_1418 09/12/2022
[    4.510096] Call Trace:
[    4.510096]  dump_stack_lvl+0x94/0xa4
[    4.510096]  dump_stack+0x12/0x18
[    4.510096]  __ubsan_handle_shift_out_of_bounds+0x156/0x320
[    4.510096]  amdgpu_vm_adjust_size.cold+0x64/0x6c
[    4.510096]  ? __lock_release.isra.0+0x5d/0x170
[    4.510096]  ? amdgpu_device_skip_hw_access.part.0+0x6a/0x70
[    4.510096]  ? gmc_v9_0_init_mem_ranges+0x14c/0x14c
[    4.510096]  gmc_v9_0_sw_init+0x436/0x7c0
[    4.510096]  ? nbio_v7_0_vcn_doorbell_range+0x74/0x74
[    4.510096]  ? gmc_v9_0_init_mem_ranges+0x14c/0x14c
[    4.510096]  amdgpu_device_ip_init+0xd4/0xa74
[    4.510096]  amdgpu_device_init+0xc4a/0x1458
[    4.510096]  amdgpu_driver_load_kms+0x19/0x9c
[    4.510096]  amdgpu_pci_probe+0x153/0x570
[    4.510096]  ? _raw_spin_unlock_irqrestore+0x2f/0x58
[    4.510096]  pci_device_probe+0x8c/0x118
[    4.510096]  ? sysfs_create_link+0x1d/0x38
[    4.510096]  really_probe+0xc2/0x2ac
[    4.510096]  ? _raw_spin_unlock_irq+0x1d/0x38
[    4.510096]  ? pm_runtime_barrier+0x52/0x90
[    4.510096]  __driver_probe_device+0x7a/0x180
[    4.510096]  ? __driver_attach+0x8e/0x188
[    4.510096]  driver_probe_device+0x23/0x108
[    4.510096]  __driver_attach+0x97/0x188
[    4.510096]  ? __device_attach_driver+0x120/0x120
[    4.510096]  bus_for_each_dev+0x71/0xc0
[    4.510096]  driver_attach+0x19/0x20
[    4.510096]  ? __device_attach_driver+0x120/0x120
[    4.510096]  bus_add_driver+0xc9/0x208
[    4.510096]  driver_register+0x52/0x10c
[    4.510096]  ? drm_sched_fence_slab_init+0x80/0x80
[    4.510096]  __pci_register_driver+0x5f/0x68
[    4.510096]  amdgpu_init+0x62/0xb0
[    4.510096]  do_one_initcall+0x63/0x2a8
[    4.510096]  ? rdinit_setup+0x40/0x40
[    4.510096]  ? parse_args+0x14b/0x3f4
[    4.510096]  do_initcalls+0xbc/0x148
[    4.510096]  ? rdinit_setup+0x40/0x40
[    4.510096]  kernel_init_freeable+0x15b/0x1fc
[    4.510096]  ? kernel_init+0x18/0x1f4
[    4.510096]  ? rest_init+0x1cc/0x1cc
[    4.510096]  kernel_init+0x18/0x1f4
[    4.510096]  ? schedule_tail+0x50/0x60
[    4.510096]  ret_from_fork+0x38/0x44
[    4.510096]  ? rest_init+0x1cc/0x1cc
[    4.510096]  ret_from_fork_asm+0x12/0x18
[    4.510096]  entry_INT80_32+0x108/0x108

-- 
Thanks,
Sasha
