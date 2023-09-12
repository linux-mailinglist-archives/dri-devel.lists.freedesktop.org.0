Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5279D358
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E64710E419;
	Tue, 12 Sep 2023 14:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77F10E419;
 Tue, 12 Sep 2023 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694527932; x=1726063932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wbRiBFZ4+dx/HV/xU4htIqQ3xk7BwZ0yVTxG47NP2co=;
 b=hDOLjvygOdSrlNkV1RgGQORv8gc6XTlqP0uUU6slIl4qdPbM2uq5P4E1
 WUgnq/MLZgVQ3qI8Gl+1KQBtOrZORbPwyP00y9fiSlyD89C9y4e2awhvv
 cR/1Yd8Vnkfqjwh/wvoxfWVkbOGsMb4Uhd2ARYaKEmZ5AMHgp7Vg6OV1I
 R/QtqwEAUcf9srEK4LMoUdJ3TcLsowSvdJoR/JaM5y8HkWF+nMRo0BG4u
 eOSVSYIxwBQaY5XYKwQ2W+qkIdIGiCw+UUpkVUqI21x+wUjyXUDWxhcMn
 6HwPghp6vv+c7NkpVR47zuvk4gttvOgd/ilk7SygSTF0IOIDGHclczGiR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375715163"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="375715163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809276394"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="809276394"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2023 07:12:05 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qg47V-00003L-2y;
 Tue, 12 Sep 2023 14:12:01 +0000
Date: Tue, 12 Sep 2023 22:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <202309122100.HAEi8ytJ-lkp@intel.com>
References: <20230912021615.2086698-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912021615.2086698-4-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, mcanal@igalia.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 llvm@lists.linux.dev, Liviu.Dudau@arm.com, oe-kbuild-all@lists.linux.dev,
 luben.tuikov@amd.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc1 next-20230912]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_submit_-helpers/20230912-102001
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230912021615.2086698-4-matthew.brost%40intel.com
patch subject: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler / entity
config: arm64-randconfig-r032-20230912 (https://download.01.org/0day-ci/archive/20230912/202309122100.HAEi8ytJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122100.HAEi8ytJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122100.HAEi8ytJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/v3d/v3d_sched.c:403:9: error: use of undeclared identifier 'ULL'
                                ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
                                ^
   1 error generated.


vim +/ULL +403 drivers/gpu/drm/v3d/v3d_sched.c

   381	
   382	int
   383	v3d_sched_init(struct v3d_dev *v3d)
   384	{
   385		int hw_jobs_limit = 1;
   386		int job_hang_limit = 0;
   387		int hang_limit_ms = 500;
   388		int ret;
   389	
   390		ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
   391				     &v3d_bin_sched_ops, NULL,
   392				     hw_jobs_limit, job_hang_limit,
   393				     msecs_to_jiffies(hang_limit_ms), NULL,
   394				     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
   395				     v3d->drm.dev);
   396		if (ret)
   397			return ret;
   398	
   399		ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
   400				     &v3d_render_sched_ops, NULL,
   401				     hw_jobs_limit, job_hang_limit,
   402				     msecs_to_jiffies(hang_limit_ms), NULL,
 > 403				     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
   404				     v3d->drm.dev);
   405		if (ret)
   406			goto fail;
   407	
   408		ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
   409				     &v3d_tfu_sched_ops, NULL,
   410				     hw_jobs_limit, job_hang_limit,
   411				     msecs_to_jiffies(hang_limit_ms), NULL,
   412				     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
   413				     v3d->drm.dev);
   414		if (ret)
   415			goto fail;
   416	
   417		if (v3d_has_csd(v3d)) {
   418			ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
   419					     &v3d_csd_sched_ops, NULL,
   420					     hw_jobs_limit, job_hang_limit,
   421					     msecs_to_jiffies(hang_limit_ms), NULL,
   422					     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
   423					     v3d->drm.dev);
   424			if (ret)
   425				goto fail;
   426	
   427			ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
   428					     &v3d_cache_clean_sched_ops, NULL,
   429					     hw_jobs_limit, job_hang_limit,
   430					     msecs_to_jiffies(hang_limit_ms), NULL,
   431					     NULL, "v3d_cache_clean",
   432					     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
   433			if (ret)
   434				goto fail;
   435		}
   436	
   437		return 0;
   438	
   439	fail:
   440		v3d_sched_fini(v3d);
   441		return ret;
   442	}
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
