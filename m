Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D66A3CB6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 09:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EEF10E392;
	Mon, 27 Feb 2023 08:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A1910E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677486398; x=1709022398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3femBW50VuFuS6ruRz4PZ9bn3eoVxZ9MAUBA8SF1+/0=;
 b=ii4l6dN/WhmpysEZloyMacJ2W+UdUDVsJDBF/tUdCblrjnVPj+uR3yg1
 jPraGGAG30lvcoAIWnonBi63p8cOMGRk+3tgxbCwAjrCpzPixFIBzug7H
 OKSCvgGhkkew9gkrj+0yF11S5PwJv+Dtuc9nuNGDWeB4AzcX5wQHjKKMb
 HhWXng+hyqmXm/4y8caWX1BKrn7jZ445RP/9OGe+oq2POXF0K7F0w0Fcy
 2B5qsxvWrFByBlJTCRV9t6uCUfSoRtJ4RFCRiyEhqffayx89JZd+KVnLA
 PdRa5B7pefbbEArGzKepeO1RZJLUdp96NRjssL/B9kBQsFP/ZYr8IzDyv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314233006"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="314233006"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:26:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="1002647446"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="1002647446"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 00:26:32 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pWYq7-0004Er-1v;
 Mon, 27 Feb 2023 08:26:31 +0000
Date: Mon, 27 Feb 2023 16:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 05/10] drm/shmem-helper: Add memory shrinker
Message-ID: <202302271624.aEDOT0UV-lkp@intel.com>
References: <20230227060219.904986-6-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227060219.904986-6-dmitry.osipenko@collabora.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 oe-kbuild-all@lists.linux.dev, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-shmem-helper-Factor-out-pages-alloc-release-from-drm_gem_shmem_get-put_pages/20230227-140619
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230227060219.904986-6-dmitry.osipenko%40collabora.com
patch subject: [PATCH v11 05/10] drm/shmem-helper: Add memory shrinker
config: riscv-randconfig-r006-20230227 (https://download.01.org/0day-ci/archive/20230227/202302271624.aEDOT0UV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c4d106484ddbebccf4219dacbc2a9975909f4c2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/drm-shmem-helper-Factor-out-pages-alloc-release-from-drm_gem_shmem_get-put_pages/20230227-140619
        git checkout c4d106484ddbebccf4219dacbc2a9975909f4c2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271624.aEDOT0UV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_shmem_helper.c:832:18: warning: no previous prototype for function 'drm_gem_shmem_get_pages_sgt_locked' [-Wmissing-prototypes]
   struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
                    ^
   drivers/gpu/drm/drm_gem_shmem_helper.c:832:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
   ^
   static 
>> drivers/gpu/drm/drm_gem_shmem_helper.c:1016:7: error: too many arguments to function call, expected 3, have 4
                                     drm_gem_shmem_shrinker_purge);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:489:15: note: 'drm_gem_lru_scan' declared here
   unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
                 ^
   drivers/gpu/drm/drm_gem_shmem_helper.c:1022:8: error: too many arguments to function call, expected 3, have 4
                                             drm_gem_shmem_shrinker_evict);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:489:15: note: 'drm_gem_lru_scan' declared here
   unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
                 ^
   1 warning and 2 errors generated.


vim +1016 drivers/gpu/drm/drm_gem_shmem_helper.c

  1001	
  1002	static unsigned long
  1003	drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
  1004					    struct shrink_control *sc)
  1005	{
  1006		struct drm_gem_shmem_shrinker *shmem_shrinker;
  1007		unsigned long nr_to_scan = sc->nr_to_scan;
  1008		unsigned long remaining = 0;
  1009		unsigned long freed = 0;
  1010	
  1011		shmem_shrinker = to_drm_gem_shmem_shrinker(shrinker);
  1012	
  1013		/* purge as many objects as we can */
  1014		freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
  1015					  nr_to_scan, &remaining,
> 1016					  drm_gem_shmem_shrinker_purge);
  1017	
  1018		/* evict as many objects as we can */
  1019		if (freed < nr_to_scan)
  1020			freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
  1021						  nr_to_scan - freed, &remaining,
  1022						  drm_gem_shmem_shrinker_evict);
  1023	
  1024		return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
  1025	}
  1026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
