Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C37837D1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 04:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7A210E0C8;
	Tue, 22 Aug 2023 02:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0BF10E030;
 Tue, 22 Aug 2023 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692670740; x=1724206740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=59W+lMeV0W1rOuTl6I7R3yHzdGEmYFfi5zODViwOKR8=;
 b=ChDq4RzswOmIXL8+bNStTbzPWSbW6gsgg/hUAkc/H6mWjhURVDhY2UT2
 Qv7aQMeYQADA4myseHqPPxNry9Oxm/v550S+KS1sJemim+w/XjNAQR6oO
 CqLVI3K67kv5BqPAdP7L5uhOXtMH9tGIrPW6uhBB89tey27VYGWOUTA6W
 VN1uZU1G0LcUpvaoWxwKP+tlKmCVc/+NkJUqKOKnls0lVnpzPNWCz8665
 qsIcvahaYujLZqByUUp9GjaFZ7cumr8S98d+F6+LyxPCoW7fd5itIO/5B
 wMYhPxKU4kBLapaQD7P2fsJamhWq45CJ+loHhfewzhx9BvOA55YC00uIH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372651399"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="372651399"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 19:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826160291"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="826160291"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 19:18:55 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qYGys-0001E5-1U;
 Tue, 22 Aug 2023 02:18:54 +0000
Date: Tue, 22 Aug 2023 10:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com, Liam.Howlett@oracle.com
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <202308221021.jCZejWoy-lkp@intel.com>
References: <20230820215320.4187-3-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820215320.4187-3-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 25205087df1ffe06ccea9302944ed1f77dc68c6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-drm_exec-build-always-builtin/20230821-123143
base:   25205087df1ffe06ccea9302944ed1f77dc68c6f
patch link:    https://lore.kernel.org/r/20230820215320.4187-3-dakr%40redhat.com
patch subject: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize dma_resv/extobj handling and GEM validation
config: sparc-randconfig-r022-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221021.jCZejWoy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221021.jCZejWoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221021.jCZejWoy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuva_mgr.c:750:1: warning: no previous prototype for 'drm_gpuva_manager_prepare_objects' [-Wmissing-prototypes]
     750 | drm_gpuva_manager_prepare_objects(struct drm_gpuva_manager *mgr,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gpuva_mgr.c: In function '__drm_gpuva_sm_map':
   drivers/gpu/drm/drm_gpuva_mgr.c:1744:39: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1744 |         struct drm_gpuva *va, *next, *prev = NULL;
         |                                       ^~~~


vim +/drm_gpuva_manager_prepare_objects +750 drivers/gpu/drm/drm_gpuva_mgr.c

   734	
   735	/**
   736	 * drm_gpuva_manager_prepare_objects() - prepare all assoiciated BOs
   737	 * @mgr: the &drm_gpuva_manager
   738	 * @num_fences: the amount of &dma_fences to reserve
   739	 *
   740	 * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
   741	 * &drm_gpuva_manager contains mappings of.
   742	 *
   743	 * Drivers can obtain the corresponding &drm_exec instance through
   744	 * DRM_GPUVA_EXEC(). It is the drivers responsibility to call drm_exec_init()
   745	 * and drm_exec_fini() accordingly.
   746	 *
   747	 * Returns: 0 on success, negative error code on failure.
   748	 */
   749	int
 > 750	drm_gpuva_manager_prepare_objects(struct drm_gpuva_manager *mgr,
   751					  unsigned int num_fences)
   752	{
   753		struct drm_exec *exec = DRM_GPUVA_EXEC(mgr);
   754		MA_STATE(mas, &mgr->mt_ext, 0, 0);
   755		union {
   756			void *ptr;
   757			uintptr_t cnt;
   758		} ref;
   759		int ret;
   760	
   761		ret = drm_exec_prepare_obj(exec, &mgr->d_obj, num_fences);
   762		if (ret)
   763			goto out;
   764	
   765		rcu_read_lock();
   766		mas_for_each(&mas, ref.ptr, ULONG_MAX) {
   767			struct drm_gem_object *obj;
   768	
   769			mas_pause(&mas);
   770			rcu_read_unlock();
   771	
   772			obj = (struct drm_gem_object *)(uintptr_t)mas.index;
   773			ret = drm_exec_prepare_obj(exec, obj, num_fences);
   774			if (ret)
   775				goto out;
   776	
   777			rcu_read_lock();
   778		}
   779		rcu_read_unlock();
   780	
   781	out:
   782		return ret;
   783	}
   784	EXPORT_SYMBOL_GPL(drm_gpuva_manager_prepare_objects);
   785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
