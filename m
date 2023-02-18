Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629FB69B767
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 02:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D63210E4B2;
	Sat, 18 Feb 2023 01:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EB010E4B0;
 Sat, 18 Feb 2023 01:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676683031; x=1708219031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HNvNqbmNQGDbDMfLrMP6VuuwO0QUq34bgWJCvZxntGY=;
 b=Oh5ftZFvuiVqDksbKJ44AgyD6J1Gve1Mvb6BkNvGxxdzBUtzubqy1JM5
 ShIunspW6BevF0YI0MtgxC5bcbndTlwBfQ11MaCYeASRGUP3BXViJXdpN
 kWG1r7GGgmb/2ZcqjH/Okwb4Fvq7MJab2jz6S4EGOUbSlwOjcQCO4DYjP
 uavp7So5n1fzFc6v+K0CgVv9PE0cUNYkhciYfII9smaskVAv6QHXOw3JO
 C0+NenCm40FTDtZ1aE97VbWTJ7ElXpgFCd3zCQNBd4NSi45TSpLPoF3YI
 VoUw9rqmSTj9OBDfesK01LDhIX6gP7y2+4v1eDptGK99Dw3xwE7gwvWWm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394613002"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394613002"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 17:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="664062152"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="664062152"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 17:16:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pTBqC-000By7-0O;
 Sat, 18 Feb 2023 01:16:40 +0000
Date: Sat, 18 Feb 2023 09:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v2 13/16] drm/nouveau: nvkm/vmm: implement raw
 ops to manage uvmm
Message-ID: <202302180839.s0w26kcJ-lkp@intel.com>
References: <20230217134820.14672-8-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134820.14672-8-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 48075a66fca613477ac1969b576a93ef5db0164f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230217-215101
base:   48075a66fca613477ac1969b576a93ef5db0164f
patch link:    https://lore.kernel.org/r/20230217134820.14672-8-dakr%40redhat.com
patch subject: [PATCH drm-next v2 13/16] drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302180839.s0w26kcJ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b25c0bcfed93dd62ed732968d8987b92e10c4579
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230217-215101
        git checkout b25c0bcfed93dd62ed732968d8987b92e10c4579
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180839.s0w26kcJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:22:
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c: In function 'nvkm_uvmm_mthd_raw_map':
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:422:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     422 |                               (void *)args->argv, args->argc);
         |                               ^
   drivers/gpu/drm/nouveau/include/nvkm/core/memory.h:66:43: note: in definition of macro 'nvkm_memory_map'
      66 |         (p)->func->map((p),(o),(vm),(va),(av),(ac))
         |                                           ^~


vim +422 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c

   388	
   389	static int
   390	nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
   391	{
   392		struct nvkm_client *client = uvmm->object.client;
   393		struct nvkm_vmm *vmm = uvmm->vmm;
   394		struct nvkm_vma vma = {
   395			.addr = args->addr,
   396			.size = args->size,
   397			.used = true,
   398			.mapref = false,
   399			.no_comp = true,
   400		};
   401		struct nvkm_memory *memory;
   402		u64 handle = args->memory;
   403		u8 refd;
   404		int ret;
   405	
   406		if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
   407			return -EINVAL;
   408	
   409		ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
   410		if (ret)
   411			return ret;
   412	
   413		vma.page = vma.refd = refd;
   414	
   415		memory = nvkm_umem_search(client, args->memory);
   416		if (IS_ERR(memory)) {
   417			VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
   418			return PTR_ERR(memory);
   419		}
   420	
   421		ret = nvkm_memory_map(memory, args->offset, vmm, &vma,
 > 422				      (void *)args->argv, args->argc);
   423	
   424		nvkm_memory_unref(&vma.memory);
   425		nvkm_memory_unref(&memory);
   426		return ret;
   427	}
   428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
