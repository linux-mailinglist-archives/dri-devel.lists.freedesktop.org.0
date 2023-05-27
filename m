Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB817135A4
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 18:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7B10E164;
	Sat, 27 May 2023 16:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256EA10E164;
 Sat, 27 May 2023 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685203991; x=1716739991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HRz+uuIx0+xElN7wrpO41PLA0XnkoBsOOVf57+jeZVs=;
 b=XJnoatpkjlBO2Zpnjhn7zf2JbsYOJJgIvKrLmN0a2ThehJ3G4efDu75S
 VkGKRuX9nH6ni8RCTdmGFWuhvhViKD9QaCcxuft9AbQudm2A751C7zeob
 wZcaqIb9HxlIrqNRmJ2uk2Q1RBRc0eRSX/NfZPoUIn1i+v/pJnIMZi3/6
 wuUyK2GAz5mH9tZy/xWIRuJEfKOlHL/MGfFuM5mkzJg1KKKjePDhUPQYx
 eJ6twblxteXZOYGqO8W5/pqM4J5I1oTagoC8a080uYsABlT3IXMUx6099
 jPg2VYlkg5ljBQ85YH1peDbTCDBN+E5eHJnUamebaMkc+1uUN5cL+3ozb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="356796435"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; d="scan'208";a="356796435"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2023 09:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="1035682343"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; d="scan'208";a="1035682343"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 27 May 2023 09:13:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q2wXS-000K3U-0t;
 Sat, 27 May 2023 16:13:06 +0000
Date: Sun, 28 May 2023 00:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <lm0963hack@gmail.com>, alexander.deucher@amd.com
Subject: Re: [PATCH] drm/radeon: fix race condition UAF in
 radeon_gem_set_domain_ioctl
Message-ID: <202305272311.JHzuoUJZ-lkp@intel.com>
References: <20230526123753.16160-1-lm0963hack@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526123753.16160-1-lm0963hack@gmail.com>
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
Cc: llvm@lists.linux.dev, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Min,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Min-Li/drm-radeon-fix-race-condition-UAF-in-radeon_gem_set_domain_ioctl/20230527-155623
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230526123753.16160-1-lm0963hack%40gmail.com
patch subject: [PATCH] drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl
config: riscv-randconfig-r042-20230526 (https://download.01.org/0day-ci/archive/20230527/202305272311.JHzuoUJZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/66fb975494d21e80b90235b7d8bf0953990c5c89
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Min-Li/drm-radeon-fix-race-condition-UAF-in-radeon_gem_set_domain_ioctl/20230527-155623
        git checkout 66fb975494d21e80b90235b7d8bf0953990c5c89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/radeon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305272311.JHzuoUJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_gem.c:462:20: warning: variable 'robj' set but not used [-Wunused-but-set-variable]
           struct radeon_bo *robj;
                             ^
   1 warning generated.


vim +/robj +462 drivers/gpu/drm/radeon/radeon_gem.c

f72a113a71ab08 Christian König 2014-08-07  453  
771fe6b912fca5 Jerome Glisse   2009-06-05  454  int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
771fe6b912fca5 Jerome Glisse   2009-06-05  455  				struct drm_file *filp)
771fe6b912fca5 Jerome Glisse   2009-06-05  456  {
771fe6b912fca5 Jerome Glisse   2009-06-05  457  	/* transition the BO to a domain -
771fe6b912fca5 Jerome Glisse   2009-06-05  458  	 * just validate the BO into a certain domain */
dee53e7fb3ee01 Jerome Glisse   2012-07-02  459  	struct radeon_device *rdev = dev->dev_private;
771fe6b912fca5 Jerome Glisse   2009-06-05  460  	struct drm_radeon_gem_set_domain *args = data;
771fe6b912fca5 Jerome Glisse   2009-06-05  461  	struct drm_gem_object *gobj;
4c7886791264f0 Jerome Glisse   2009-11-20 @462  	struct radeon_bo *robj;
771fe6b912fca5 Jerome Glisse   2009-06-05  463  	int r;
771fe6b912fca5 Jerome Glisse   2009-06-05  464  
771fe6b912fca5 Jerome Glisse   2009-06-05  465  	/* for now if someone requests domain CPU -
771fe6b912fca5 Jerome Glisse   2009-06-05  466  	 * just make sure the buffer is finished with */
dee53e7fb3ee01 Jerome Glisse   2012-07-02  467  	down_read(&rdev->exclusive_lock);
771fe6b912fca5 Jerome Glisse   2009-06-05  468  
771fe6b912fca5 Jerome Glisse   2009-06-05  469  	/* just do a BO wait for now */
a8ad0bd84f9860 Chris Wilson    2016-05-09  470  	gobj = drm_gem_object_lookup(filp, args->handle);
771fe6b912fca5 Jerome Glisse   2009-06-05  471  	if (gobj == NULL) {
dee53e7fb3ee01 Jerome Glisse   2012-07-02  472  		up_read(&rdev->exclusive_lock);
bf79cb914dbfe8 Chris Wilson    2010-08-04  473  		return -ENOENT;
771fe6b912fca5 Jerome Glisse   2009-06-05  474  	}
7e4d15d90afe46 Daniel Vetter   2011-02-18  475  	robj = gem_to_radeon_bo(gobj);
771fe6b912fca5 Jerome Glisse   2009-06-05  476  
771fe6b912fca5 Jerome Glisse   2009-06-05  477  	r = radeon_gem_set_domain(gobj, args->read_domains, args->write_domain);
771fe6b912fca5 Jerome Glisse   2009-06-05  478  
f11fb66ae92193 Emil Velikov    2020-05-15  479  	drm_gem_object_put(gobj);
dee53e7fb3ee01 Jerome Glisse   2012-07-02  480  	up_read(&rdev->exclusive_lock);
66fb975494d21e Min Li          2023-05-26  481  	r = radeon_gem_handle_lockup(rdev, r);
771fe6b912fca5 Jerome Glisse   2009-06-05  482  	return r;
771fe6b912fca5 Jerome Glisse   2009-06-05  483  }
771fe6b912fca5 Jerome Glisse   2009-06-05  484  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
