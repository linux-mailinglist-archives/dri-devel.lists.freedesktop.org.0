Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F04EC42CB3
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 13:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC43810E056;
	Sat,  8 Nov 2025 12:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6hMnC1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA2710E056
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762604626; x=1794140626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/UNiD6iZWtMAA32mdLWWp5dIJx1FTs18CCctACPfibM=;
 b=n6hMnC1rMTBjHRK0XGbaN+NT/cuC4O4zWzJMcwzv/aW+DUusK9Nxd55H
 rGN+TNBcBztNO2fEOCdEYIxS5h9n8xMScpI4M45V3ZylCZRr2ICpbLDdr
 ONWm6N5ve4S0FqF4j1uzjKuH5OqxFIwRDiRaQTHQ+IJGu+A/PMsw9Vc4S
 XzpCC52mJSODqBegUwZfxlLrzSEs0n6z4ahV2eQsypmHza1oy8e2xYgao
 HTSUt3kd9/Bsw0UkfDNDf6zVpaBXLNDGAGIUUPO45XZjGPCnbP4sZ1PCw
 HKj0CKaLcUjg0OWikKLW1JkmXKMIjxHAZ6Vr9dm0mKUPQBOMrw1Msuctu Q==;
X-CSE-ConnectionGUID: oc+nYeZATNa7dZCg2IVBtA==
X-CSE-MsgGUID: oXCTafr2T5+IGNs46kMBzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64648880"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="64648880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 04:23:46 -0800
X-CSE-ConnectionGUID: 5MO9ovN7SGmtO+WvV5zMFw==
X-CSE-MsgGUID: cLNPkkqGRNaj2dSNCa/Cwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="187527035"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 08 Nov 2025 04:23:44 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vHhyn-0000uv-2f;
 Sat, 08 Nov 2025 12:23:41 +0000
Date: Sat, 8 Nov 2025 20:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup
Message-ID: <202511082041.cMOd6r9h-lkp@intel.com>
References: <20251106131926.28096-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106131926.28096-1-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip next-20251107]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-gem-Use-vmemdup_array_user-in-drm_gem_objects_lookup/20251106-212028
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251106131926.28096-1-tvrtko.ursulin%40igalia.com
patch subject: [PATCH] drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup
config: loongarch-randconfig-002-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082041.cMOd6r9h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082041.cMOd6r9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082041.cMOd6r9h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem.c: In function 'drm_gem_objects_lookup':
>> drivers/gpu/drm/drm_gem.c:786:28: warning: unused variable 'dev' [-Wunused-variable]
     786 |         struct drm_device *dev = filp->minor->dev;
         |                            ^~~


vim +/dev +786 drivers/gpu/drm/drm_gem.c

c117aa4d8701a7 Rob Herring         2019-03-08  764  
c117aa4d8701a7 Rob Herring         2019-03-08  765  /**
c117aa4d8701a7 Rob Herring         2019-03-08  766   * drm_gem_objects_lookup - look up GEM objects from an array of handles
c117aa4d8701a7 Rob Herring         2019-03-08  767   * @filp: DRM file private date
c117aa4d8701a7 Rob Herring         2019-03-08  768   * @bo_handles: user pointer to array of userspace handle
c117aa4d8701a7 Rob Herring         2019-03-08  769   * @count: size of handle array
c117aa4d8701a7 Rob Herring         2019-03-08  770   * @objs_out: returned pointer to array of drm_gem_object pointers
c117aa4d8701a7 Rob Herring         2019-03-08  771   *
c117aa4d8701a7 Rob Herring         2019-03-08  772   * Takes an array of userspace handles and returns a newly allocated array of
c117aa4d8701a7 Rob Herring         2019-03-08  773   * GEM objects.
c117aa4d8701a7 Rob Herring         2019-03-08  774   *
c117aa4d8701a7 Rob Herring         2019-03-08  775   * For a single handle lookup, use drm_gem_object_lookup().
c117aa4d8701a7 Rob Herring         2019-03-08  776   *
c117aa4d8701a7 Rob Herring         2019-03-08  777   * Returns:
c117aa4d8701a7 Rob Herring         2019-03-08  778   * @objs filled in with GEM object pointers. Returned GEM objects need to be
be6ee102341bc4 Emil Velikov        2020-05-15  779   * released with drm_gem_object_put(). -ENOENT is returned on a lookup
c117aa4d8701a7 Rob Herring         2019-03-08  780   * failure. 0 is returned on success.
c117aa4d8701a7 Rob Herring         2019-03-08  781   *
c117aa4d8701a7 Rob Herring         2019-03-08  782   */
c117aa4d8701a7 Rob Herring         2019-03-08  783  int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
c117aa4d8701a7 Rob Herring         2019-03-08  784  			   int count, struct drm_gem_object ***objs_out)
c117aa4d8701a7 Rob Herring         2019-03-08  785  {
e5e0350d5d1ab0 Athul Raj Kollareth 2025-09-02 @786  	struct drm_device *dev = filp->minor->dev;
c117aa4d8701a7 Rob Herring         2019-03-08  787  	struct drm_gem_object **objs;
e5e0350d5d1ab0 Athul Raj Kollareth 2025-09-02  788  	u32 *handles;
e5e0350d5d1ab0 Athul Raj Kollareth 2025-09-02  789  	int ret;
c117aa4d8701a7 Rob Herring         2019-03-08  790  
c117aa4d8701a7 Rob Herring         2019-03-08  791  	if (!count)
c117aa4d8701a7 Rob Herring         2019-03-08  792  		return 0;
c117aa4d8701a7 Rob Herring         2019-03-08  793  
c117aa4d8701a7 Rob Herring         2019-03-08  794  	objs = kvmalloc_array(count, sizeof(struct drm_gem_object *),
c117aa4d8701a7 Rob Herring         2019-03-08  795  			     GFP_KERNEL | __GFP_ZERO);
c117aa4d8701a7 Rob Herring         2019-03-08  796  	if (!objs)
c117aa4d8701a7 Rob Herring         2019-03-08  797  		return -ENOMEM;
c117aa4d8701a7 Rob Herring         2019-03-08  798  
ec0bb482de0ad5 Dan Carpenter       2020-03-20  799  	*objs_out = objs;
ec0bb482de0ad5 Dan Carpenter       2020-03-20  800  
50c1d127a2aa88 Tvrtko Ursulin      2025-11-06  801  	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
50c1d127a2aa88 Tvrtko Ursulin      2025-11-06  802  	if (IS_ERR(handles)) {
50c1d127a2aa88 Tvrtko Ursulin      2025-11-06  803  		ret = PTR_ERR(handles);
c117aa4d8701a7 Rob Herring         2019-03-08  804  		goto out;
c117aa4d8701a7 Rob Herring         2019-03-08  805  	}
c117aa4d8701a7 Rob Herring         2019-03-08  806  
c117aa4d8701a7 Rob Herring         2019-03-08  807  	ret = objects_lookup(filp, handles, count, objs);
c117aa4d8701a7 Rob Herring         2019-03-08  808  out:
c117aa4d8701a7 Rob Herring         2019-03-08  809  	kvfree(handles);
c117aa4d8701a7 Rob Herring         2019-03-08  810  	return ret;
c117aa4d8701a7 Rob Herring         2019-03-08  811  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
