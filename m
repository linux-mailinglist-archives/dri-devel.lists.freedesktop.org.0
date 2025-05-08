Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42922AAF835
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 12:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FFC10E0B1;
	Thu,  8 May 2025 10:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9E5010E0B1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 10:42:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08547106F;
 Thu,  8 May 2025 03:42:39 -0700 (PDT)
Received: from [10.1.38.30] (e122027.cambridge.arm.com [10.1.38.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901BE3F5A1;
 Thu,  8 May 2025 03:42:47 -0700 (PDT)
Message-ID: <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
Date: Thu, 8 May 2025 11:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: show device-wide list of DRM GEM
 objects over DebugFS
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
 <20250507160713.1363985-4-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250507160713.1363985-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 07/05/2025 17:07, Adrián Larumbe wrote:
> This change is essentially a Panfrost port of commit a3707f53eb3f
> ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS").
> 
> The DebugFS file is almost the same as in Panthor, minus the GEM object
> usage flags, since Panfrost has no kernel-only BO's.
> 
> Two additional GEM state flags which are displayed but aren't relevant
> to Panthor are 'Purged' and 'Purgeable', since Panfrost implements an
> explicit shrinker and a madvise ioctl to flag objects as reclaimable.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Minor point, but you've used "ptdev" rather than "pfdev" several times 
in this patch - it would be good to avoid this.

I'm also seeing a splat when running this, see below. I haven't got my 
head around how this is happening, but I see it when glmark quits at the 
end of the test.

Steve

[  399.505066] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
[  399.515519] [00000004] *pgd=00000000
[  399.519541] Internal error: Oops: 805 [#1] SMP ARM
[  399.524896] Modules linked in: panfrost gpu_sched drm_shmem_helper
[  399.531817] CPU: 1 UID: 1000 PID: 316 Comm: glmark2-es2-drm Not tainted 6.15.0-rc5-00731-g9cc5b4d7da27 #1 NONE 
[  399.543098] Hardware name: Rockchip (Device Tree)
[  399.548350] PC is at panfrost_gem_free_object+0x8c/0x160 [panfrost]
[  399.555371] LR is at trace_contention_end+0x4c/0xfc
[  399.560822] pc : [<bf01a384>]    lr : [<c03d0170>]    psr: 60010013
[  399.567823] sp : f22b1df8  ip : c2163e00  fp : c4b15800
[  399.573658] r10: 00000009  r9 : c5f94c40  r8 : c4b15850
[  399.579492] r7 : c4b15884  r6 : c7813614  r5 : c5f94f30  r4 : c7813400
[  399.586784] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : c5f94f30
[  399.594075] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  399.602048] Control: 10c5387d  Table: 06c6c06a  DAC: 00000051
[  399.608465] Register r0 information: slab kmalloc-1k start c5f94c00 pointer offset 816 size 1024
[  399.618296] Register r1 information: NULL pointer
[  399.623551] Register r2 information: NULL pointer
[  399.628804] Register r3 information: NULL pointer
[  399.634057] Register r4 information: slab kmalloc-1k start c7813400 pointer offset 0 size 1024
[  399.643690] Register r5 information: slab kmalloc-1k start c5f94c00 pointer offset 816 size 1024
[  399.653517] Register r6 information: slab kmalloc-1k start c7813400 pointer offset 532 size 1024
[  399.663344] Register r7 information: slab kmalloc-1k start c4b15800 pointer offset 132 size 1024
[  399.673171] Register r8 information: slab kmalloc-1k start c4b15800 pointer offset 80 size 1024
[  399.682901] Register r9 information: slab kmalloc-1k start c5f94c00 pointer offset 64 size 1024
[  399.692631] Register r10 information: non-paged memory
[  399.698370] Register r11 information: slab kmalloc-1k start c4b15800 pointer offset 0 size 1024
[  399.708101] Register r12 information: non-slab/vmalloc memory
[  399.714521] Process glmark2-es2-drm (pid: 316, stack limit = 0x178bc4ea)
[  399.722009] Stack: (0xf22b1df8 to 0xf22b2000)
[  399.726874] 1de0:                                                       00000000 c4b15884
[  399.736012] 1e00: c7813400 c4b15800 00000007 c4b15884 c4b15850 c6815000 00000009 c0bb3824
[  399.745150] 1e20: 00000000 40086409 c7860800 c15fd008 00000008 c0bb588c c6815630 0000013c
[  399.754288] 1e40: 0000e280 00000000 c1b35650 b235e000 f22b1f5c 00000008 f22b1e74 bec37550
[  399.763426] 1e60: c6815630 c694ea00 c0bb47cc 00000051 00000000 00000007 00000000 00000000
[  399.772564] 1e80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  399.781701] 1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  399.790839] 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  399.799977] 1ee0: 00000000 00000000 00000000 00000000 00000000 356cc46f 00000000 40086409
[  399.809115] 1f00: c694ea00 c03000c0 bec37550 c694ea00 c6815000 00000006 c4bf9b70 c058d694
[  399.818253] 1f20: b2b47000 f22b1f50 00000001 c03002f0 00000000 c5f60900 00000000 b235e000
[  399.827391] 1f40: 007e9000 c053d874 f22b1f50 00000001 f22b1f50 f22b1f50 004e0b14 c5f60940
[  399.836528] 1f60: b235e000 b2b46fff c4abec0c b09e3000 b2bcffff 00000000 00000000 356cc46f
[  399.845666] 1f80: 00000003 004e6b40 bec37550 40086409 00000036 c03002f0 c6815000 00000036
[  399.854805] 1fa0: 01cb32a0 c03000c0 004e6b40 bec37550 00000006 40086409 bec37550 00000007
[  399.863943] 1fc0: 004e6b40 bec37550 40086409 00000036 00000000 00000000 01cb2da0 01cb32a0
[  399.873080] 1fe0: b6e4b08c bec37534 b6e3442f b6bb8f98 60010030 00000006 00000000 00000000
[  399.882216] Call trace: 
[  399.882222]  panfrost_gem_free_object [panfrost] from drm_gem_handle_delete+0x84/0xb0
[  399.893813]  drm_gem_handle_delete from drm_ioctl+0x2b8/0x4f4
[  399.900237]  drm_ioctl from sys_ioctl+0x428/0xe30
[  399.905496]  sys_ioctl from ret_fast_syscall+0x0/0x1c
[  399.911141] Exception stack(0xf22b1fa8 to 0xf22b1ff0)
[  399.916783] 1fa0:                   004e6b40 bec37550 00000006 40086409 bec37550 00000007
[  399.925922] 1fc0: 004e6b40 bec37550 40086409 00000036 00000000 00000000 01cb2da0 01cb32a0
[  399.935058] 1fe0: b6e4b08c bec37534 b6e3442f b6bb8f98
[  399.940702] Code: eb0018fa e5943218 e5942214 e1a00005 (e5823004) 
[  399.947532] ---[ end trace 0000000000000000 ]---

