Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05137285B7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A212810E5EC;
	Thu,  8 Jun 2023 16:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353BF10E5EC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686242879; x=1717778879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l8Z/IYTNBSl07ZAQStJ1qxIojWKIIikPRwNacBmX6pg=;
 b=U0esasqij8RU6Gde94AAtdq9tt/i1P5WRXnjKIIBMURoKkzjUtP8znPU
 6ztn2Z+udF/imweXog1ceE3xiebzr9Ia78T3rw7ZYj2VDtYDzEdN0HLah
 AsROr05AMma0T6b04pReUEK4Qrly45ZVNGcMjeKktPUq2vih1G2FbS4oI
 n2M7k4Ua0UhwL3o3EdbWwDf2cdK130HOXJ/bhgkk7wI+8ofvAU0EDzU9q
 gcXPyRdceoJmhwMtf9VhEwnm022CGdgzr9l8QIbJwB17smTrGhwSY619+
 EF2evKYQs37hxP0GEdMQYHYnNv5loOhjWwIlAKSbbpl8q0iE3ewdeH6N8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385712234"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="385712234"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 09:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="704189141"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="704189141"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 08 Jun 2023 09:45:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7IlN-00083c-1r;
 Thu, 08 Jun 2023 16:45:29 +0000
Date: Fri, 9 Jun 2023 00:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dma-fence: Bypass signaling annotation from
 dma_fence_is_signaled
Message-ID: <202306090039.JEYvWyVv-lkp@intel.com>
References: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.4-rc5 next-20230608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/dma-fence-Bypass-signaling-annotation-from-dma_fence_is_signaled/20230608-223804
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230608143059.1038115-1-tvrtko.ursulin%40linux.intel.com
patch subject: [PATCH] dma-fence: Bypass signaling annotation from dma_fence_is_signaled
config: arm-buildonly-randconfig-r006-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090039.JEYvWyVv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch drm-misc drm-misc-next
        git checkout drm-misc/drm-misc-next
        b4 shazam https://lore.kernel.org/r/20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma-buf/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090039.JEYvWyVv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-fence.c:454: warning: expecting prototype for __dma_fence_signal(). Prototype was for _dma_fence_signal() instead


vim +454 drivers/dma-buf/dma-fence.c

   446	
   447	/**
   448	 * __dma_fence_signal - signal completion of a fence bypassing critical section annotation
   449	 * @fence: the fence to signal
   450	 *
   451	 * This low-level helper should not be used by code external to dma-fence.h|c!
   452	 */
   453	int _dma_fence_signal(struct dma_fence *fence)
 > 454	{
   455		unsigned long flags;
   456		int ret;
   457	
   458		spin_lock_irqsave(fence->lock, flags);
   459		ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
   460		spin_unlock_irqrestore(fence->lock, flags);
   461	
   462		return ret;
   463	}
   464	EXPORT_SYMBOL(_dma_fence_signal);
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
