Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E4C5A021
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CD110E162;
	Thu, 13 Nov 2025 20:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIW7k8kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C331610E162;
 Thu, 13 Nov 2025 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763067010; x=1794603010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c14Im5Ycw0cJ83G30ozwTETFt4r0l7bFAsL/iOYSZDY=;
 b=BIW7k8kdqIjmxylY2yOCkgYljbvxExqX87EfnZzYn4sexAG5T8zWGtev
 M7IJLle4iBVU1BOh3vC2SiLwSGK2eoLlSdS3y2JH3xWVwGaplbBbRxjb7
 XBdQ7C9f8xjKAqvlY1PabgG21R2n25EjwOfOqIUF75yhDMPxYuqDAVK/2
 iCOMouQBMUAcZ307yaWr3n86wPxUEnOjSRzpwhXcRH+psMjsZxyoEmONN
 IqoaDDvUgsq79rh92Mz1TVmkZLfHkAkObn5s3Uaelc0HVbbnsyKIqzaVC
 u5i4BjSjDbMiVI/BQRgyKQCKxPStpMQibSMiYXTShw/ggXC2Gx11HhAHN A==;
X-CSE-ConnectionGUID: eXqGFZk/QJywcsMjh5fcAQ==
X-CSE-MsgGUID: 49YJkWBORy6goArE2mlIIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64165042"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64165042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:50:09 -0800
X-CSE-ConnectionGUID: zCf4xlQuQzOoYE5SoOHg8Q==
X-CSE-MsgGUID: kOJv2nQJTP+JB47h3uDyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194044028"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 12:50:05 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vJeGY-0005qx-0p;
 Thu, 13 Nov 2025 20:50:02 +0000
Date: Fri, 14 Nov 2025 04:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
Message-ID: <202511140459.HpT5i7v9-lkp@intel.com>
References: <20251113145332.16805-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113145332.16805-5-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251113]
[also build test ERROR on v6.18-rc5]
[cannot apply to drm-xe/drm-xe-next linus/master v6.18-rc5 v6.18-rc4 v6.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v3/20251113-235209
base:   next-20251113
patch link:    https://lore.kernel.org/r/20251113145332.16805-5-christian.koenig%40amd.com
patch subject: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
config: openrisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140459.HpT5i7v9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140459.HpT5i7v9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140459.HpT5i7v9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/st-dma-fence.c: In function '__wait_for_callbacks':
>> drivers/dma-buf/st-dma-fence.c:454:24: error: 'struct dma_fence' has no member named 'lock'
     454 |         spin_lock_irq(f->lock);
         |                        ^~
   drivers/dma-buf/st-dma-fence.c:455:26: error: 'struct dma_fence' has no member named 'lock'
     455 |         spin_unlock_irq(f->lock);
         |                          ^~


vim +454 drivers/dma-buf/st-dma-fence.c

2989f6451084ae Chris Wilson 2019-08-19  451  
2989f6451084ae Chris Wilson 2019-08-19  452  static void __wait_for_callbacks(struct dma_fence *f)
2989f6451084ae Chris Wilson 2019-08-19  453  {
2989f6451084ae Chris Wilson 2019-08-19 @454  	spin_lock_irq(f->lock);
2989f6451084ae Chris Wilson 2019-08-19  455  	spin_unlock_irq(f->lock);
2989f6451084ae Chris Wilson 2019-08-19  456  }
2989f6451084ae Chris Wilson 2019-08-19  457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
