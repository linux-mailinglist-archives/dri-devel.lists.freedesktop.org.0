Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB457DD961
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 00:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194010E5E7;
	Tue, 31 Oct 2023 23:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0A510E5DB;
 Tue, 31 Oct 2023 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698796385; x=1730332385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4i1y3DVKkpZNztiXnFlc1I3XO3HIruaCd99l2W6lqvs=;
 b=LPjOSX8S2cubHOJwNJpFs7YZg4OBdWnU5F5Q/BG7SnhB1jxKdosydYd0
 eUoN08JtylQejdBtqlP6EEOsQiGbWZ6dBcAfI9M8dQsgVEjFstLphxsFP
 tEbCVe6lHnuP1bS/ojjOy1wTvU86zlgYbdVZ2DvkmgRbx8xRzVvvlf6sr
 0BJgqYWSgnDyla4whTP2A+3bLwZmqBViWsDXeQbqkICzC1QohnupUzCBd
 wFSu1Y0171IXlh//4Q6zIRdSe5ijD32VDgUmwDkZ+HhWuYvd3S8Q1MM9m
 VVVuFpnPbokMcNITibk+85LEEpHmmVme8jvK0NhjraTzcTAEPnhuiYYie A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="419516381"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="419516381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 16:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092168372"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="1092168372"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2023 16:53:03 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxyXd-0000T8-0Z;
 Tue, 31 Oct 2023 23:53:01 +0000
Date: Wed, 1 Nov 2023 07:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/amdgpu: Separate eviction from VM status.
Message-ID: <202311010709.XbwKjVaq-lkp@intel.com>
References: <20231031134059.171277-3-ishitatsuyuki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231031134059.171277-3-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tatsuyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6 next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tatsuyuki-Ishi/drm-amdgpu-Don-t-implicit-sync-PRT-maps/20231031-224530
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231031134059.171277-3-ishitatsuyuki%40gmail.com
patch subject: [PATCH 2/6] drm/amdgpu: Separate eviction from VM status.
config: arc-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231101/202311010709.XbwKjVaq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010709.XbwKjVaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010709.XbwKjVaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:178: warning: Function parameter or member 'evicted' not described in 'amdgpu_vm_bo_set_evicted'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:178: warning: expecting prototype for amdgpu_vm_bo_evicted(). Prototype was for amdgpu_vm_bo_set_evicted() instead


vim +178 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

dcb388eddb5f1b Nirmoy Das      2021-06-28  168  
bcdc9fd634d1f0 Christian König 2018-08-30  169  /**
bcdc9fd634d1f0 Christian König 2018-08-30  170   * amdgpu_vm_bo_evicted - vm_bo is evicted
bcdc9fd634d1f0 Christian König 2018-08-30  171   *
bcdc9fd634d1f0 Christian König 2018-08-30  172   * @vm_bo: vm_bo which is evicted
bcdc9fd634d1f0 Christian König 2018-08-30  173   *
bcdc9fd634d1f0 Christian König 2018-08-30  174   * State for PDs/PTs and per VM BOs which are not at the location they should
bcdc9fd634d1f0 Christian König 2018-08-30  175   * be.
bcdc9fd634d1f0 Christian König 2018-08-30  176   */
cac82290238e47 Tatsuyuki Ishi  2023-10-31  177  static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evicted)
bcdc9fd634d1f0 Christian König 2018-08-30 @178  {
bcdc9fd634d1f0 Christian König 2018-08-30  179  	struct amdgpu_vm *vm = vm_bo->vm;
bcdc9fd634d1f0 Christian König 2018-08-30  180  	struct amdgpu_bo *bo = vm_bo->bo;
bcdc9fd634d1f0 Christian König 2018-08-30  181  
757eb2bedd08a1 Philip Yang     2022-09-15  182  	spin_lock(&vm_bo->vm->status_lock);
cac82290238e47 Tatsuyuki Ishi  2023-10-31  183  	if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
bcdc9fd634d1f0 Christian König 2018-08-30  184  		if (bo->tbo.type == ttm_bo_type_kernel)
cac82290238e47 Tatsuyuki Ishi  2023-10-31  185  			list_move(&vm_bo->eviction_status, &vm->evicted);
bcdc9fd634d1f0 Christian König 2018-08-30  186  		else
cac82290238e47 Tatsuyuki Ishi  2023-10-31  187  			list_move_tail(&vm_bo->eviction_status, &vm->evicted);
cac82290238e47 Tatsuyuki Ishi  2023-10-31  188  	} else {
cac82290238e47 Tatsuyuki Ishi  2023-10-31  189  		list_del_init(&vm_bo->eviction_status);
cac82290238e47 Tatsuyuki Ishi  2023-10-31  190  	}
757eb2bedd08a1 Philip Yang     2022-09-15  191  	spin_unlock(&vm_bo->vm->status_lock);
bcdc9fd634d1f0 Christian König 2018-08-30  192  }
cac82290238e47 Tatsuyuki Ishi  2023-10-31  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
