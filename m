Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C207DDA8E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 02:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1768A10E035;
	Wed,  1 Nov 2023 01:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5B010E035;
 Wed,  1 Nov 2023 01:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698801537; x=1730337537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Rk1ZxSgYbAz9UEI7+AafvdSQxaZN59nO5DTFXDLNVSA=;
 b=U6nCag2ZwL1JyYcqS7fzAtv/i8vNqu61DXULCAP/YtI4ZS0bn+5v9450
 BssCm4+m09ZbWwJl7x40Y3nRkIzVUvwQHvhk+b69LfV/NeAwKb5bGf5Jt
 NoXPePZUPLJMddyHOU4WVcCOPYwrX1gNNFuLNvyHwsjYJkMgZ461KBDfh
 rpKVT96wsD7xb3n4R9w+AqGlAf7Dy8s0DUvlR7bLuHvjXJ2lb8GHcjjjG
 MwKbsQ23TTTkxI+OyVRQULnLQ2cJxixPBwaG2VFMeJsHoKIvDKSndO/ep
 Uh6/gLA8roVT0hxaKk2K9E8C36eF4tAZDoEwrNn23+yjXrw+MBbGRIeWp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388233880"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="388233880"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 18:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826612970"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="826612970"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2023 18:18:55 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxzsi-0000V6-0Y;
 Wed, 01 Nov 2023 01:18:52 +0000
Date: Wed, 1 Nov 2023 09:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Message-ID: <202311010948.G6I55pTu-lkp@intel.com>
References: <20231031134059.171277-4-ishitatsuyuki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231031134059.171277-4-ishitatsuyuki@gmail.com>
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
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes linus/master v6.6]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tatsuyuki-Ishi/drm-amdgpu-Don-t-implicit-sync-PRT-maps/20231031-224530
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231031134059.171277-4-ishitatsuyuki%40gmail.com
patch subject: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings eagerly.
config: arc-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231101/202311010948.G6I55pTu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010948.G6I55pTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010948.G6I55pTu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:608: warning: Excess function parameter 'bo_va' description in 'amdgpu_gem_va_update_vm'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:608: warning: Excess function parameter 'operation' description in 'amdgpu_gem_va_update_vm'


vim +608 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

d38ceaf99ed015f Alex Deucher        2015-04-20  594  
d38ceaf99ed015f Alex Deucher        2015-04-20  595  /**
d38ceaf99ed015f Alex Deucher        2015-04-20  596   * amdgpu_gem_va_update_vm -update the bo_va in its VM
d38ceaf99ed015f Alex Deucher        2015-04-20  597   *
d38ceaf99ed015f Alex Deucher        2015-04-20  598   * @adev: amdgpu_device pointer
dc54d3d1744d23e Christian König     2017-03-13  599   * @vm: vm to update
d38ceaf99ed015f Alex Deucher        2015-04-20  600   * @bo_va: bo_va to update
dc54d3d1744d23e Christian König     2017-03-13  601   * @operation: map, unmap or clear
d38ceaf99ed015f Alex Deucher        2015-04-20  602   *
2ffdaafb5d5f37b Christian König     2017-01-27  603   * Update the bo_va directly after setting its address. Errors are not
d38ceaf99ed015f Alex Deucher        2015-04-20  604   * vital here, so they are not reported back to userspace.
d38ceaf99ed015f Alex Deucher        2015-04-20  605   */
d38ceaf99ed015f Alex Deucher        2015-04-20  606  static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  607  				    struct amdgpu_vm *vm)
d38ceaf99ed015f Alex Deucher        2015-04-20 @608  {
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  609  	struct amdgpu_bo_va *bo_va;
3f3333f8a0e90ac Christian König     2017-08-03  610  	int r;
d38ceaf99ed015f Alex Deucher        2015-04-20  611  
3f3333f8a0e90ac Christian König     2017-08-03  612  	if (!amdgpu_vm_ready(vm))
3f3333f8a0e90ac Christian König     2017-08-03  613  		return;
e410b5cbabe70b1 Chunming Zhou       2015-12-07  614  
f34678187a33970 Nicolai Hähnle      2017-03-23  615  	r = amdgpu_vm_clear_freed(adev, vm, NULL);
d38ceaf99ed015f Alex Deucher        2015-04-20  616  	if (r)
2ffdaafb5d5f37b Christian König     2017-01-27  617  		goto error;
194a33643b1161f monk.liu            2015-07-22  618  
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  619  	spin_lock(&vm->status_lock);
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  620  	while (!list_empty(&vm->dirty)) {
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  621  		bo_va = list_first_entry(&vm->dirty, struct amdgpu_bo_va,
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  622  					 base.vm_status);
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  623  		spin_unlock(&vm->status_lock);
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  624  
8f8cc3fb43508a2 Christian König     2022-03-17  625  		r = amdgpu_vm_bo_update(adev, bo_va, false);
0abc6878fc2d699 Christian König     2017-09-01  626  		if (r)
0abc6878fc2d699 Christian König     2017-09-01  627  			goto error;
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  628  		spin_lock(&vm->status_lock);
93bab704c1513f8 Gustavo A. R. Silva 2018-02-14  629  	}
ddf1ffe56ab385a Tatsuyuki Ishi      2023-10-31  630  	spin_unlock(&vm->status_lock);
93bab704c1513f8 Gustavo A. R. Silva 2018-02-14  631  
807e2994092c0bd Christian König     2019-03-14  632  	r = amdgpu_vm_update_pdes(adev, vm, false);
0abc6878fc2d699 Christian König     2017-09-01  633  
2ffdaafb5d5f37b Christian König     2017-01-27  634  error:
68fdd3df79ee4bf Christian König     2015-06-16  635  	if (r && r != -ERESTARTSYS)
d38ceaf99ed015f Alex Deucher        2015-04-20  636  		DRM_ERROR("Couldn't update BO_VA (%d)\n", r);
d38ceaf99ed015f Alex Deucher        2015-04-20  637  }
d38ceaf99ed015f Alex Deucher        2015-04-20  638  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
