Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4CC6293E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 07:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912DF10E2D0;
	Mon, 17 Nov 2025 06:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbJaAZ9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10A410E2CB;
 Mon, 17 Nov 2025 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763362165; x=1794898165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NwknJqAvjELBef7CTQsUf+fdvLXW0SsIGNW2s4GpATU=;
 b=EbJaAZ9PcI1/6QojVkiX/LnOkvTDLOE8lS9sQLl6ja11CCoPZe466cHW
 Z53uGZN3eZiCo7iAo7hIs6FtUrNlVp+Mr3LWE7a2qjdDte218IbFsu6of
 8d/ZiYTJ8wpHnfwqI2WUIMCzlLPPGJm3iBAQkoUjDl9aY0xEHIrUD/cMO
 J5ff2CsFEwHbuy7vwtsDfSiM0Y+Pl1a4k2jAOicR1iEuQw6KP0PdBOsa/
 NJcXmBE42ybWNz2IMJUAjr3qX1g2plCPt/GyBZgVbvwQvWdI1Nkf4E7l/
 p9bk1cnQdLsp0vocIItO52h+UUElIEitg/QoDQc5t6SHSKpAacYGPdo0o A==;
X-CSE-ConnectionGUID: UxcJvVm0RAuu+nzT/Sv6Rw==
X-CSE-MsgGUID: gh/F+GbjTV2oAwSaADIpHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82742148"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="82742148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 22:49:25 -0800
X-CSE-ConnectionGUID: nhKpCg9bTXCOXYLo0uFEMg==
X-CSE-MsgGUID: 0yHV5K1bS8+1+aOBPtcH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="189668870"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 16 Nov 2025 22:49:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vKt38-0000EU-1M;
 Mon, 17 Nov 2025 06:49:18 +0000
Date: Mon, 17 Nov 2025 14:48:33 +0800
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
 linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: Re: [PATCH v2 3/5] drm/amdgpu: add UMA allocation setting helpers
Message-ID: <202511171049.kFPjY5Br-lkp@intel.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-3-4f6bdd48030d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-3-4f6bdd48030d@amd.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin-AMD/drm-amdgpu-parse-UMA-size-getting-setting-bits-in-ATCS-mask/20251114-164505
base:   ac9914fa72a5a917bb61c5e87bee6b8f9b751f33
patch link:    https://lore.kernel.org/r/20251114-vram-carveout-tuning-for-upstream-v2-3-4f6bdd48030d%40amd.com
patch subject: [PATCH v2 3/5] drm/amdgpu: add UMA allocation setting helpers
config: parisc-randconfig-002-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171049.kFPjY5Br-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171049.kFPjY5Br-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171049.kFPjY5Br-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_device.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/atombios_crtc.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/atom.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_fence.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_object.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gart.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_display.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_bios.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/atombios_dp.o: in function `amdgpu_acpi_set_uma_allocation_size':
>> (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/atombios_encoders.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_sa.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/atombios_i2c.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ib.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_pll.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_sync.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_virt.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_sched.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_rap.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_mca.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_aca.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.o: in function `amdgpu_acpi_set_uma_allocation_size':
   (.text.amdgpu_acpi_set_uma_allocation_size+0x0): multiple definition of `amdgpu_acpi_set_uma_allocation_size'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.text.amdgpu_acpi_set_uma_allocation_size+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
