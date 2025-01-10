Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C93A08554
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A86010EF73;
	Fri, 10 Jan 2025 02:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ll/mYVIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE8A10EF73;
 Fri, 10 Jan 2025 02:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736476162; x=1768012162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2e4NUqNMR+8tCxvxRNqVHQBg8ursswlcpfpui8hI55Y=;
 b=ll/mYVIUwe2dw9+y5X4ZEjWb8Aqe3k/L8dswbDgY+VW/b9+A+w79ZYhV
 zERMVUp+sw91kTNvPDETgeHf1g803AI9rRWSHGQ+5ZSH1eTUX2ldFbMpk
 JtXHujF0qEfDQ+yz00KekzaD/H6L+R+WfsMYBq1a6PWW9/OyTwX/AejRY
 p9r8Am4fTFfsSy2O5FeUQHaMDaVW1ZBWH/eWQ683ZTHRWvE36KpwamP+N
 2Le3r3r7Xk1oHzZccoSmVgYodb8cFL8bhfG2vmszjqqK7CrsoQJd9X0lR
 kWpRor5ul1hbohQ+U18o5H0d58PKpGXli40DtqZ8rXjU9NJ7mb+Deu++F Q==;
X-CSE-ConnectionGUID: IegklJgbTtugI+v0C7rhnA==
X-CSE-MsgGUID: CTpHtjCVSHCCN9pe1/IQeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36048677"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36048677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 18:29:21 -0800
X-CSE-ConnectionGUID: EkNBlxT7TLyDNjhJQz77lw==
X-CSE-MsgGUID: SYhPZIY+Rfa6UT2NCmfu3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="103405332"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 18:29:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tW4lx-000IQL-2K;
 Fri, 10 Jan 2025 02:29:17 +0000
Date: Fri, 10 Jan 2025 10:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, nouveau@lists.freedesktop.org,
 dakr@kernel.org
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
Message-ID: <202501101033.wlEjeZwK-lkp@intel.com>
References: <20250109005553.623947-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109005553.623947-1-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on drm-misc/drm-misc-next drm-tip/drm-tip v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-fence-handle-cross-device-fences-properly-v3/20250109-085805
base:   linus/master
patch link:    https://lore.kernel.org/r/20250109005553.623947-1-airlied%40gmail.com
patch subject: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
config: loongarch-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101033.wlEjeZwK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101033.wlEjeZwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101033.wlEjeZwK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_fence.c: In function 'nouveau_fence_sync':
>> drivers/gpu/drm/nouveau/nouveau_fence.c:394:53: error: 'struct nouveau_channel' has no member named 'drm'
     394 |                                 local = prev && prev->drm == chan->drm;
         |                                                     ^~
   drivers/gpu/drm/nouveau/nouveau_fence.c:394:66: error: 'struct nouveau_channel' has no member named 'drm'
     394 |                                 local = prev && prev->drm == chan->drm;
         |                                                                  ^~


vim +394 drivers/gpu/drm/nouveau/nouveau_fence.c

   356	
   357	int
   358	nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
   359			   bool exclusive, bool intr)
   360	{
   361		struct nouveau_fence_chan *fctx = chan->fence;
   362		struct dma_resv *resv = nvbo->bo.base.resv;
   363		int i, ret;
   364	
   365		ret = dma_resv_reserve_fences(resv, 1);
   366		if (ret)
   367			return ret;
   368	
   369		/* Waiting for the writes first causes performance regressions
   370		 * under some circumstances. So manually wait for the reads first.
   371		 */
   372		for (i = 0; i < 2; ++i) {
   373			struct dma_resv_iter cursor;
   374			struct dma_fence *fence;
   375	
   376			dma_resv_for_each_fence(&cursor, resv,
   377						dma_resv_usage_rw(exclusive),
   378						fence) {
   379				enum dma_resv_usage usage;
   380				struct nouveau_fence *f;
   381	
   382				usage = dma_resv_iter_usage(&cursor);
   383				if (i == 0 && usage == DMA_RESV_USAGE_WRITE)
   384					continue;
   385	
   386				f = nouveau_local_fence(fence, chan->cli->drm);
   387				if (f) {
   388					struct nouveau_channel *prev;
   389					bool must_wait = true;
   390					bool local;
   391	
   392					rcu_read_lock();
   393					prev = rcu_dereference(f->channel);
 > 394					local = prev && prev->drm == chan->drm;
   395					if (local && (prev == chan ||
   396						      fctx->sync(f, prev, chan) == 0))
   397						must_wait = false;
   398					rcu_read_unlock();
   399					if (!must_wait)
   400						continue;
   401				}
   402	
   403				ret = dma_fence_wait(fence, intr);
   404				if (ret)
   405					return ret;
   406			}
   407		}
   408	
   409		return 0;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
