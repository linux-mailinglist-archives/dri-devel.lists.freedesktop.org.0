Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F16A5D60
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BB810E6AE;
	Tue, 28 Feb 2023 16:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B93510E6AE;
 Tue, 28 Feb 2023 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677602744; x=1709138744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ll+g8W+BPsRQwYjoOrbS9PwPYnVqpEtunNHrBOzRBd4=;
 b=Lo+Pm3B8Tzxtht0m0IZ9YS4PeLVq2wYHHBz7Sp024iMnVXGqAofoue4r
 wwS1SDK7OBp5Yjx8yZMbixdzApsyh48Am1rC5qEafTeYf666qhMtBZKV7
 uvlwhNJOUkkT9ZUUfsIz1r2CPqmEhje1wiuRuUnhlFl61EAK3cZwxQd6Z
 LBo3qli/jE85cH906VB3YOpMF5uSNkyD9hxxoZvRB5geoUIA8+m2NnLXx
 kF+eK/TjWax/vKvvRZfmxmlAmecNEbbTDuAkJL75aE9nVgcNeJEaJ7BFZ
 dPzqn+4l6jsGOaOVyGdOU/VgsKEp0rHbpA91O0UV9OWk12R9raJ5WkqLb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="313857949"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="313857949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="817138303"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="817138303"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2023 08:45:42 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pX36j-0005X3-12;
 Tue, 28 Feb 2023 16:45:41 +0000
Date: Wed, 1 Mar 2023 00:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/9] drm/radeon: switch over to drm_exec
Message-ID: <202303010052.xJCf8UMu-lkp@intel.com>
References: <20230228083406.1720795-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228083406.1720795-8-christian.koenig@amd.com>
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
Cc: arunpravin.paneerselvam@amd.com, dakr@redhat.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next linus/master next-20230228]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230228083406.1720795-8-christian.koenig%40amd.com
patch subject: [PATCH 7/9] drm/radeon: switch over to drm_exec
config: openrisc-randconfig-r016-20230226 (https://download.01.org/0day-ci/archive/20230301/202303010052.xJCf8UMu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93b3fd6c23deae79357cfb6bc0a7fcb07ed819f9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
        git checkout 93b3fd6c23deae79357cfb6bc0a7fcb07ed819f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010052.xJCf8UMu-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_object.o: in function `radeon_bo_list_validate':
>> radeon_object.c:(.text+0xf10): undefined reference to `drm_exec_cleanup'
   radeon_object.c:(.text+0xf10): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_cleanup'
>> or1k-linux-ld: radeon_object.c:(.text+0xf9c): undefined reference to `drm_exec_prepare_obj'
   radeon_object.c:(.text+0xf9c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_prepare_obj'
   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_gem.o: in function `radeon_gem_va_update_vm':
>> radeon_gem.c:(.text+0x218): undefined reference to `drm_exec_init'
   radeon_gem.c:(.text+0x218): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_init'
>> or1k-linux-ld: radeon_gem.c:(.text+0x228): undefined reference to `drm_exec_cleanup'
   radeon_gem.c:(.text+0x228): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_cleanup'
>> or1k-linux-ld: radeon_gem.c:(.text+0x27c): undefined reference to `drm_exec_fini'
   radeon_gem.c:(.text+0x27c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
>> or1k-linux-ld: radeon_gem.c:(.text+0x2b8): undefined reference to `drm_exec_prepare_obj'
   radeon_gem.c:(.text+0x2b8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_prepare_obj'
   or1k-linux-ld: radeon_gem.c:(.text+0x360): undefined reference to `drm_exec_prepare_obj'
   radeon_gem.c:(.text+0x360): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_prepare_obj'
   or1k-linux-ld: radeon_gem.c:(.text+0x3bc): undefined reference to `drm_exec_fini'
   radeon_gem.c:(.text+0x3bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
   or1k-linux-ld: radeon_gem.c:(.text+0x41c): undefined reference to `drm_exec_fini'
   radeon_gem.c:(.text+0x41c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_cs.o: in function `radeon_cs_parser_fini':
>> radeon_cs.c:(.text+0xf98): undefined reference to `drm_exec_fini'
   radeon_cs.c:(.text+0xf98): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_exec_fini'
   or1k-linux-ld: drivers/gpu/drm/radeon/radeon_cs.o: in function `radeon_cs_parser_init':
>> radeon_cs.c:(.text+0x119c): undefined reference to `drm_exec_init'
   radeon_cs.c:(.text+0x119c): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
