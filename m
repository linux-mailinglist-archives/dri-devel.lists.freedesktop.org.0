Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A3C390C6
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 05:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93EF10E801;
	Thu,  6 Nov 2025 04:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoGMZ7aS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D502B10E7FF;
 Thu,  6 Nov 2025 04:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762401959; x=1793937959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ku5UN6ubuw5qXs/1aggtvAHoXMZEpFrPbNCln0OoMmQ=;
 b=DoGMZ7aSC/vC/Jm3bUb6u8Wdp17dDvYvKlNpMKxBqDwUVhcU4YR4gb3M
 DG7J9dbhhEkBI+JXbyiiFsgJzuqg4wtoiy8HUh66zg14GrYE7QbIo5a+7
 LtcfBiMGS68OQax8GqJoDgRD0zn5KJElmW6vyQKa6p1ghf/8IjNhyD5ij
 vn35YjsX+MUn9tNQ8aybxbxcvplUydqqCJ0sdWlykVwEZgYHPIXX6nT0q
 UeeW/CTw+fCLoEvho/6T22EncBZSj6jV3UrdZhrrMoD0AuWI0JsOymzKx
 uo8I6x78MomGIOJUHGX8yJjKIJcnLWSh7soBqHALHbia9nSHIYWBD+bFH g==;
X-CSE-ConnectionGUID: +FHuK4UYTA+dJaVhhgJiBA==
X-CSE-MsgGUID: yAvN7vvNTV2BRYEFD6Qdww==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75214309"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="75214309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:05:58 -0800
X-CSE-ConnectionGUID: 70cl3AqUTNOF+OjwN0kV5w==
X-CSE-MsgGUID: cPETdGk8QH2/VqpnFgJj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="187593273"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 05 Nov 2025 20:05:54 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vGrFw-000TU0-0W;
 Thu, 06 Nov 2025 04:05:52 +0000
Date: Thu, 6 Nov 2025 12:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>, anson.tsao@amd.com,
 superm1@kernel.org
Subject: Re: [PATCH 3/5] drm/amdgpu: add UMA allocation setting helpers
Message-ID: <202511061141.OaKEdSVv-lkp@intel.com>
References: <20251103-vram-carveout-tuning-for-upstream-v1-3-17e2a72639c5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-3-17e2a72639c5@amd.com>
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

Hi Yo-Jung,

kernel test robot noticed the following build errors:

[auto build test ERROR on ac9914fa72a5a917bb61c5e87bee6b8f9b751f33]

url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin-AMD/drm-amdgpu-parse-UMA-size-getting-setting-bits-in-ATCS-mask/20251103-155539
base:   ac9914fa72a5a917bb61c5e87bee6b8f9b751f33
patch link:    https://lore.kernel.org/r/20251103-vram-carveout-tuning-for-upstream-v1-3-17e2a72639c5%40amd.com
patch subject: [PATCH 3/5] drm/amdgpu: add UMA allocation setting helpers
config: x86_64-buildonly-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061141.OaKEdSVv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061141.OaKEdSVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061141.OaKEdSVv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sys.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cmd.c:24:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1733:5: warning: no previous prototype for 'amdgpu_acpi_set_uma_allocation_size' [-Wmissing-prototypes]
    1733 | int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/vega20_reg_init.c:23:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1733:5: warning: no previous prototype for 'amdgpu_acpi_set_uma_allocation_size' [-Wmissing-prototypes]
    1733 | int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sys.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:24:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1733:5: warning: no previous prototype for 'amdgpu_acpi_set_uma_allocation_size' [-Wmissing-prototypes]
    1733 | int amdgpu_acpi_set_uma_allocation_size(struct amdgpu_device *adev, u8 index, u8 type)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c: In function 'cper_generate_runtime_record.isra':
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:75:36: warning: '%llX' directive output may be truncated writing between 1 and 14 bytes into a region of size between 0 and 7 [-Wformat-truncation=]
      75 |         snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
         |                                    ^~~~
   In function 'fill_section_hdr',
       inlined from 'cper_generate_runtime_record.isra' at drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:180:2:
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:75:32: note: directive argument in the range [0, 72057594037927935]
      75 |         snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:75:9: note: 'snprintf' output between 4 and 27 bytes into a destination of size 9
      75 |         snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      76 |                     RAS_LOG_SEQNO_TO_BATCH_IDX(trace->seqno));
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c: In function 'cper_generate_fatal_record.isra':
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:75:36: warning: '%llX' directive output may be truncated writing between 1 and 14 bytes into a region of size between 0 and 7 [-Wformat-truncation=]
      75 |         snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
         |                                    ^~~~
   In function 'fill_section_hdr',
       inlined from 'cper_generate_fatal_record.isra' at drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:205:3:
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:75:32: note: directive argument in the range [0, 72057594037927935]
      75 |         snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cper.c:75:9: note: 'snprintf' output between 4 and 27 bytes into a destination of size 9
      75 |         snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      76 |                     RAS_LOG_SEQNO_TO_BATCH_IDX(trace->seqno));
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_device.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> amdgpu_device.c:(.text+0x11f0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_doorbell_mgr.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_kms.c:(.text+0x1e20): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_atombios.c:(.text+0x8b0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/atombios_crtc.o: in function `amdgpu_acpi_set_uma_allocation_size':
   atombios_crtc.c:(.text+0x7d0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_connectors.c:(.text+0x1950): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/atom.o: in function `amdgpu_acpi_set_uma_allocation_size':
   atom.c:(.text+0x4400): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_fence.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_fence.c:(.text+0x3c0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ttm.c:(.text+0x28b0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_object.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_object.c:(.text+0x70): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gart.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_gart.c:(.text+0xe0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_encoders.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_display.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_display.c:(.text+0xc90): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_i2c.c:(.text+0x830): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_gem.c:(.text+0xab0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ring.c:(.text+0x660): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_cs.c:(.text+0x3380): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_bios.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_bios.c:(.text+0x790): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_benchmark.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/atombios_dp.o: in function `amdgpu_acpi_set_uma_allocation_size':
   atombios_dp.c:(.text+0x7e0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_afmt.c:(.text+0x100): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_trace_points.c:(.text+0x78a0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/atombios_encoders.o: in function `amdgpu_acpi_set_uma_allocation_size':
   atombios_encoders.c:(.text+0x440): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_sa.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_sa.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/atombios_i2c.o: in function `amdgpu_acpi_set_uma_allocation_size':
   atombios_i2c.c:(.text+0x280): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_dma_buf.c:(.text+0x6c0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_vm.c:(.text+0x1740): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_vm_pt.c:(.text+0x830): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_vm_tlb_fence.c:(.text+0x190): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ib.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ib.c:(.text+0xd0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_pll.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_pll.c:(.text+0x240): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ucode.c:(.text+0x1a80): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_bo_list.c:(.text+0x60): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ctx.c:(.text+0xca0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_sync.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_sync.c:(.text+0xc0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_gtt_mgr.c:(.text+0x410): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_preempt_mgr.c:(.text+0x100): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_vram_mgr.c:(.text+0x1340): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_virt.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_virt.c:(.text+0x1800): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_atomfirmware.c:(.text+0xe0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_vf_error.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_sched.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_sched.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_debugfs.c:(.text+0x4b10): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ids.c:(.text+0x560): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_gmc.c:(.text+0x3c0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_mmhub.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_hdp.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_xgmi.c:(.text+0x1a20): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_csa.c:(.text+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_ras.c:(.text+0x23a0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o: in function `amdgpu_acpi_set_uma_allocation_size':
   amdgpu_vm_cpu.c:(.text+0x230): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.text+0x14a0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
