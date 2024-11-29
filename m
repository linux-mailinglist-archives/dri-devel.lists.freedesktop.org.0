Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F79DBF2B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 06:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1A10EDA1;
	Fri, 29 Nov 2024 05:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPzi2WBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963E10EDA1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:12:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BCF95C290C;
 Fri, 29 Nov 2024 05:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF281C4CECF;
 Fri, 29 Nov 2024 05:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732857118;
 bh=ewKUzNkkmm1F81JQF8takT9WY9ilvobsHvSDTcyENMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPzi2WBftshaB9WMiFLX+iPdQ0VuJs0PIhFyOp9zT7rLpGA1JqmS4Ghb2zaEwc0ku
 YqcNiIlpWbW385cfS47giQKNzBypTyFbAGRybKqoDDk96cwtG+IPYd7rwfTLHGaPDB
 h9wZDcvI56X615xuJjvsU/uCGzA8HVme7Dsm6aDUa3G34UYutlQ3D1q3LKwOjamdk8
 5/V/7QzHRHDRp8p+ReB1xv72XAJ2VHA0pzdkS9WoQGRQRD6lgWqFoRiDBM+HK9IGZI
 UExCvtq4VwLcaIaczkFyJekh9hz5ollXII0nwe4C4gW8/684Q1BPSyA1dUCv5ISfza
 ncNoS1U6a6Big==
Date: Fri, 29 Nov 2024 00:11:57 -0500
From: Sasha Levin <sashal@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, alexander.deucher@amd.com
Subject: Re: [git pull] drm fixes for 6.13-rc1
Message-ID: <Z0lNHdwQ3rODHQ2c@sashalap>
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

[+cc Alex]

On Fri, Nov 29, 2024 at 06:42:18AM +1000, Dave Airlie wrote:
>Alex Deucher (3):
>      drm/amdgpu/jpeg: cancel the jpeg worker

Hi folks,

When merging this PR into linus-next I've started the following warning
triggered by the commit above:

[    4.356975] WARNING: CPU: 1 PID: 1 at kernel/workqueue.c:4192 __flush_work+0x29f/0x2c0
[    4.364893] Modules linked in:
[    4.367954] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0 #1 2142668e2e0d420da59d54376b9563eacab27615
[    4.378035] Hardware name: HP Berknip/Berknip, BIOS Google_Berknip.13434.796.2023_03_03_1148 09/12/2022
[    4.387422] RIP: 0010:__flush_work+0x29f/0x2c0
[    4.391870] Code: 48 8b 15 24 53 70 65 48 89 54 24 58 48 8b 73 40 8b 4b 30 e9 b6 fe ff ff 40 30 f6 4c 8b 26 e9 f2 fd ff ff 0f 0b e9 33 ff ff ff <0f> 0b e9 2c ff ff ff 0f 0b e9 d2 fe ff ff e8 8e 62 26 01 66 66 2e
[    4.410618] RSP: 0018:ffffa38540037b60 EFLAGS: 00010246
[    4.415846] RAX: 0000000000000000 RBX: ffff974c87b3bd08 RCX: 0000000000000000
[    4.422977] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffa38540037bc0
[    4.430108] RBP: ffff974c87b3bd08 R08: ffff974c87b31fa0 R09: ffff974c818ad000
[    4.437238] R10: 0000000000000040 R11: ffffffff9df2fd88 R12: ffff974c87b00000
[    4.444371] R13: ffff974c87b34fe0 R14: ffffa38540037b68 R15: 0000000000000001
[    4.451503] FS:  0000000000000000(0000) GS:ffff974da7080000(0000) knlGS:0000000000000000
[    4.459587] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.465333] CR2: 0000000000000000 CR3: 0000000162c28000 CR4: 00000000003506f0
[    4.472463] Call Trace:
[    4.474916]  <TASK>
[    4.477022]  ? __warn+0x85/0x130
[    4.480256]  ? __flush_work+0x29f/0x2c0
[    4.484098]  ? report_bug+0x160/0x190
[    4.487767]  ? handle_bug+0x53/0x90
[    4.491263]  ? exc_invalid_op+0x13/0x60
[    4.495102]  ? asm_exc_invalid_op+0x16/0x20
[    4.499291]  ? __flush_work+0x29f/0x2c0
[    4.503132]  cancel_delayed_work_sync+0x6e/0x90
[    4.507667]  jpeg_v1_0_ring_begin_use+0x1d/0xb0
[    4.512204]  amdgpu_ring_alloc+0x3f/0x60
[    4.516135]  amdgpu_jpeg_dec_ring_test_ring+0x31/0x180
[    4.521274]  amdgpu_ring_test_helper+0x1c/0x90
[    4.525721]  amdgpu_device_init+0x205f/0x26f0
[    4.530083]  amdgpu_driver_load_kms+0x15/0x80
[    4.534445]  amdgpu_pci_probe+0x17e/0x4f0
[    4.538458]  pci_device_probe+0x98/0x120
[    4.542387]  really_probe+0xd1/0x2b0
[    4.545969]  ? __device_attach_driver+0xc0/0xc0
[    4.550503]  __driver_probe_device+0x73/0x120
[    4.554862]  driver_probe_device+0x1f/0x90
[    4.558962]  __driver_attach+0x84/0x130
[    4.562804]  bus_for_each_dev+0x84/0xd0
[    4.566645]  bus_add_driver+0xe4/0x210
[    4.570400]  driver_register+0x55/0x100
[    4.574240]  ? drm_sched_fence_slab_init+0x90/0x90
[    4.579033]  do_one_initcall+0x57/0x300
[    4.582868]  kernel_init_freeable+0x1be/0x300
[    4.587231]  ? rest_init+0xc0/0xc0
[    4.590638]  kernel_init+0x16/0x1b0
[    4.594129]  ret_from_fork+0x30/0x50
[    4.597711]  ? rest_init+0xc0/0xc0
[    4.601116]  ret_from_fork_asm+0x11/0x20
[    4.605046]  </TASK>


-- 
Thanks,
Sasha
