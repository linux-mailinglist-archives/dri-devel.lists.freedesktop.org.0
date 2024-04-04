Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C426A898AD5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 17:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DB9112DAF;
	Thu,  4 Apr 2024 15:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 977AB112DAF;
 Thu,  4 Apr 2024 15:16:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4011CFEC;
 Thu,  4 Apr 2024 08:17:07 -0700 (PDT)
Received: from [10.57.17.51] (unknown [10.57.17.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C047D3F64C;
 Thu,  4 Apr 2024 08:16:35 -0700 (PDT)
Message-ID: <2ac758ce-a196-4e89-a397-488ba31014c4@arm.com>
Date: Thu, 4 Apr 2024 16:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: enable W=1 warnings by default across the
 subsystem
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
Content-Language: en-US
From: Aishwarya TCV <aishwarya.tcv@arm.com>
In-Reply-To: <cover.1704908087.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 10/01/2024 17:39, Jani Nikula wrote:
> This is v2 of [1] to enable most W=1 warnings across the drm
> subsystem. Some fixes first, and a CONFIG_DRM_WERROR on top.
> 
> I build tested this for x86 (both gcc and clang), arm and arm64.
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/20231129181219.1237887-1-jani.nikula@intel.com
> 
> 
> 
> 
> Jani Nikula (6):
>   drm/nouveau/acr/ga102: remove unused but set variable
>   drm/nouveau/svm: remove unused but set variables
>   drm/amdgpu: prefer snprintf over sprintf
>   drm/imx: prefer snprintf over sprintf
>   drm: enable (most) W=1 warnings by default across the subsystem
>   drm: Add CONFIG_DRM_WERROR
> 
>  drivers/gpu/drm/Kconfig                       | 18 +++++++++++
>  drivers/gpu/drm/Makefile                      | 30 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  3 +-
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c         | 10 ++-----
>  .../gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c    |  3 +-
>  6 files changed, 55 insertions(+), 11 deletions(-)
> 

Hi Jani,

Observed warning "include/drm/drm_print.h:536:35: warning: '%4.4s'
directive argument is null [-Wformat-overflow=]" when building the
modules with "defconfig+kselftest-ftrace"(
https://github.com/torvalds/linux/blob/master/tools/testing/selftests/ftrace/config
) against next-master(next-20240404) kernel with Arm64 in our CI.

A bisect identified a61ddb4393ad1be61d2ffd92576d42707b05be17 as the
first bad commit. Bisected it on the tag "next-20240326" at repo
"https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".

I understand that you are turning on the warning here, thought worth
mentioning about the observation.

Build log:
---------------
In file included from ../include/drm/drm_mm.h:51,
                 from ../include/drm/drm_vma_manager.h:26,
                 from ../include/drm/drm_gem.h:42,
                 from ../drivers/gpu/drm/msm/msm_drv.h:34,
                 from ../drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:20:
In function '_dpu_plane_set_qos_lut',
    inlined from 'dpu_plane_sspp_update_pipe' at
../drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1078:2:
../include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument
is null [-Wformat-overflow=]
  536 | #define __drm_dbg(cat, fmt, ...)  ___drm_dbg(NULL, cat, fmt,
##__VA_ARGS__)
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:594:2: note: in expansion of macro '__drm_dbg'
  594 |  __drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
      |  ^~~~~~~~~
../drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:30:39: note: in expansion
of macro 'DRM_DEBUG_ATOMIC'
   30 | #define DPU_DEBUG_PLANE(pl, fmt, ...) DRM_DEBUG_ATOMIC("plane%d
" fmt,\
      |                                       ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:290:2: note: in expansion
of macro 'DPU_DEBUG_PLANE'
  290 |  DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u
lut:0x%llx\n",
      |  ^~~~~~~~~~~~~~~
  CC [M]  drivers/net/can/spi/mcp251xfd/mcp251xfd-ethtool.o



Bisect log:
------------
git bisect start
# good: [4cece764965020c22cff7665b18a012006359095] Linux 6.9-rc1
git bisect good 4cece764965020c22cff7665b18a012006359095
# bad: [084c8e315db34b59d38d06e684b1a0dd07d30287] Add linux-next
specific files for 20240326
git bisect bad 084c8e315db34b59d38d06e684b1a0dd07d30287
# good: [1cc931629f2b3de04b7608b8d26692c6f6a52aeb] Merge branch
'nand/next' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good 1cc931629f2b3de04b7608b8d26692c6f6a52aeb
# bad: [4f5a3415aaf8fdf945e4cb67b847254ddda2f583] Merge branch
'drm-xe-next' of https://gitlab.freedesktop.org/drm/xe/kernel
git bisect bad 4f5a3415aaf8fdf945e4cb67b847254ddda2f583
# bad: [a13305486485d0657fbf09cee72fca9553d7d6cd] Merge branch
'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
git bisect bad a13305486485d0657fbf09cee72fca9553d7d6cd
# good: [417f78a2a1c8c2d517db8b2e04785c1c94a563b4] drm/amdkfd: Cleanup
workqueue during module unload
git bisect good 417f78a2a1c8c2d517db8b2e04785c1c94a563b4
# bad: [57a4e3a94caee6cfda41700da877bee77eab939c] Revert "drm/panthor:
Fix undefined panthor_device_suspend/resume symbol issue"
git bisect bad 57a4e3a94caee6cfda41700da877bee77eab939c
# bad: [2cddf770be0cebb663af3d72c049b9e24928f335] drm/kunit: fix
drm_kunit_helpers.h kernel-doc
git bisect bad 2cddf770be0cebb663af3d72c049b9e24928f335
# good: [d72f049087d4f973f6332b599c92177e718107de] drm/panthor: Allow
driver compilation
git bisect good d72f049087d4f973f6332b599c92177e718107de
# good: [e18aeeda0b6905c333df5a0566b99f5c84426098] drm/bridge: Fix
improper bridge init order with pre_enable_prev_first
git bisect good e18aeeda0b6905c333df5a0566b99f5c84426098
# bad: [f89632a9e5fa6c4787c14458cd42a9ef42025434] drm: Add CONFIG_DRM_WERROR
git bisect bad f89632a9e5fa6c4787c14458cd42a9ef42025434
# good: [460be1d527a8e296d85301e8b14923299508d4fc] drm/nouveau: move
more missing UAPI bits
git bisect good 460be1d527a8e296d85301e8b14923299508d4fc
# bad: [a61ddb4393ad1be61d2ffd92576d42707b05be17] drm: enable (most) W=1
warnings by default across the subsystem
git bisect bad a61ddb4393ad1be61d2ffd92576d42707b05be17
# first bad commit: [a61ddb4393ad1be61d2ffd92576d42707b05be17] drm:
enable (most) W=1 warnings by default across the subsystem

Thanks,
Aishwarya
