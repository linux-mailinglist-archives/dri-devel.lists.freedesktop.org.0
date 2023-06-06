Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9787250F6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 01:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C767610E06E;
	Tue,  6 Jun 2023 23:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1A10E3EC;
 Tue,  6 Jun 2023 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686095788; x=1717631788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=66dLf9QF5suSz6s4ALv0ff3Sijn5fcliAkM/PxefKBo=;
 b=LI2My02QO2QjDSKzbiHeOri3apAP3wJh9uM6EyYBrqR0Zu1q9lyVs1CG
 ydPr9TNnwskd1iUzz47/omn5JWnmGC/4XPHoTHWOsB3xGg/qyktvOfa8m
 amy+veLfms+yslJxQ6ahmhb28oZMjrewWFecqe41ggUT7kBhJvQirseP+
 wVbCj3KZLhLjIVYtH4p+gpSZddBJ80m9EUFdGzUxezyBlD0twM+7TMOwy
 4ggNFfIDKk4RoE/vsfRwWH7oA0ZI83+9K8dVc6H2LQpT9vaSSxekluIYB
 SypuRXSdayFBb1EhocB0WHmv36Ysaw+HPiV5NWRjn4st0jvAmDbUhRhHr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337190049"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="337190049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="738979508"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="738979508"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 06 Jun 2023 16:56:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q6gXF-0005th-2F;
 Tue, 06 Jun 2023 23:56:21 +0000
Date: Wed, 7 Jun 2023 07:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v4 04/14] drm: debugfs: provide infrastructure
 to dump a DRM GPU VA space
Message-ID: <202306070751.26WX3ive-lkp@intel.com>
References: <20230606223130.6132-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-5-dakr@redhat.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33a86170888b7e4aa0cea94ebb9c67180139cea9]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230607-063442
base:   33a86170888b7e4aa0cea94ebb9c67180139cea9
patch link:    https://lore.kernel.org/r/20230606223130.6132-5-dakr%40redhat.com
patch subject: [PATCH drm-next v4 04/14] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230607/202306070751.26WX3ive-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 33a86170888b7e4aa0cea94ebb9c67180139cea9
        b4 shazam https://lore.kernel.org/r/20230606223130.6132-5-dakr@redhat.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070751.26WX3ive-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_debugfs.c: In function 'drm_debugfs_gpuva_info':
>> drivers/gpu/drm/drm_debugfs.c:213:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     213 |                            (u64)va->gem.obj, va->gem.offset);
         |                            ^


vim +213 drivers/gpu/drm/drm_debugfs.c

   178	
   179	/**
   180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
   181	 * @m: pointer to the &seq_file to write
   182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
   183	 *
   184	 * Dumps the GPU VA mappings of a given DRM GPU VA manager.
   185	 *
   186	 * For each DRM GPU VA space drivers should call this function from their
   187	 * &drm_info_list's show callback.
   188	 *
   189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
   190	 */
   191	int drm_debugfs_gpuva_info(struct seq_file *m,
   192				   struct drm_gpuva_manager *mgr)
   193	{
   194		DRM_GPUVA_ITER(it, mgr, 0);
   195		struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
   196	
   197		if (!mgr->name)
   198			return -ENODEV;
   199	
   200		seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
   201			   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
   202		seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
   203			   kva->va.addr, kva->va.addr + kva->va.range);
   204		seq_puts(m, "\n");
   205		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
   206		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
   207		drm_gpuva_iter_for_each(va, it) {
   208			if (unlikely(va == &mgr->kernel_alloc_node))
   209				continue;
   210	
   211			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
   212				   va->va.addr, va->va.range, va->va.addr + va->va.range,
 > 213				   (u64)va->gem.obj, va->gem.offset);
   214		}
   215	
   216		return 0;
   217	}
   218	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
