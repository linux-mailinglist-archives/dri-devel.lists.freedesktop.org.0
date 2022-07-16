Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9F576F1F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B46210EE67;
	Sat, 16 Jul 2022 14:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA6210E091;
 Sat, 16 Jul 2022 03:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657941179; x=1689477179;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bvVdB9yaCRh1mzrRF0+P+YC+xXy0dx7FFoQAImldol8=;
 b=PLA4H97sjeL+nSktnazNgGXFLNZ3nPHT7JXWcuNwa3Mk4eqpKVCW8C/m
 TaTok02uUi+YUYnNbLaoKasZU+nhm+Eb56BpXkja6U0o/9EOQqeYxd+Dc
 lzXKk8oIQpRWPK9MTzC7fZhS8KyMRUmZtxzND2FmcxfTn04+qUo/cajwM
 u/2Gqr8bGD8KDAOxd8bQwoyqefnjq3Ma024zhDZyUEL46XvyArqMrsrNg
 1uOX7OZRqLHRbyoTP2HgPowgv96FM6j6aKMmzYtcKhvfswo3S412lnQTv
 JoYAek0agdF4JLvJCKE5SoxtTAXYzFnJPFkdzo0JB0wB5SlNgoG6mHdfb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="286677445"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="286677445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 20:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="629327570"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 15 Jul 2022 20:12:56 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCYEh-00015F-Dm;
 Sat, 16 Jul 2022 03:12:55 +0000
Date: Sat, 16 Jul 2022 11:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 5/7] drm/i915: Check if the size is too
 big while creating shmem file
Message-ID: <202207161058.dmOZoQzg-lkp@intel.com>
References: <20220714090807.2340818-6-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714090807.2340818-6-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, kbuild-all@lists.01.org,
 jani.nikula@intel.com, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gwan-gyeong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220714-171019
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220716/202207161058.dmOZoQzg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2938379499047baf3189503913f438fda6ea92eb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220714-171019
        git checkout 2938379499047baf3189503913f438fda6ea92eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:550:11: warning: result of comparison of constant 17592186040320 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (size > MAX_LFS_FILESIZE)
               ~~~~ ^ ~~~~~~~~~~~~~~~~
   1 warning generated.


vim +550 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

   534	
   535	static int __create_shmem(struct drm_i915_private *i915,
   536				  struct drm_gem_object *obj,
   537				  resource_size_t size)
   538	{
   539		unsigned long flags = VM_NORESERVE;
   540		struct file *filp;
   541	
   542		drm_gem_private_object_init(&i915->drm, obj, size);
   543	
   544		/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
   545		 * greater than MAX_LFS_FILESIZE.
   546		 * To handle the same error as other code that returns -E2BIG when
   547		 * the size is too large, we add a code that returns -E2BIG when the
   548		 * size is larger than the size that can be handled.
   549		 */
 > 550		if (size > MAX_LFS_FILESIZE)
   551			return -E2BIG;
   552	
   553		if (i915->mm.gemfs)
   554			filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
   555							 flags);
   556		else
   557			filp = shmem_file_setup("i915", size, flags);
   558		if (IS_ERR(filp))
   559			return PTR_ERR(filp);
   560	
   561		obj->filp = filp;
   562		return 0;
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
