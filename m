Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C07AEC18
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4D610E3BF;
	Tue, 26 Sep 2023 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6325E10E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695729796; x=1727265796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FU0AhVxXd739OYSha2yCrO+3VahEjA1ikBLDvuNth4E=;
 b=m9ULxA4LjFjcnMkL9UFpUEDO+Ddm54ykG8+764geq/0TgQouIp4x0vBH
 xy2Rk4qzhPfBYKu3a+0///za/4FvO292EN9Yisq0POvQGCag24QGKhuWA
 sjcYiw5O0kr9Rhr2ZsUSA+g2+aq84jNHkLj65Y8uk7TbzTevUZ6Gf9JM2
 9siwmaEnqeYzkDGkbeJeVKZfzpeUXJ/tg9Ja0xWZB8TakeQb1OxEdTKwU
 aRlV9bzSm9UCYJtIRb1IppZJLHfw9CsA96nR/J1kBx/qxYtEUys7WYmdG
 EUPEkKyfNYLFtYZn2g5uJR/z1MCrfoPjc1XTocVlSYaPJKrakFB1ybqn+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378827454"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="378827454"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="864381703"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="864381703"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 05:02:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ql6lq-0002mu-2F;
 Tue, 26 Sep 2023 12:02:30 +0000
Date: Tue, 26 Sep 2023 20:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack@kde.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: Make sure the mapped tt pages are decrypted
 when needed
Message-ID: <202309261923.XeaDU2Wg-lkp@intel.com>
References: <20230926040359.3040017-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926040359.3040017-1-zack@kde.org>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, oe-kbuild-all@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-ttm-Make-sure-the-mapped-tt-pages-are-decrypted-when-needed/20230926-120619
base:   linus/master
patch link:    https://lore.kernel.org/r/20230926040359.3040017-1-zack%40kde.org
patch subject: [PATCH] drm/ttm: Make sure the mapped tt pages are decrypted when needed
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309261923.XeaDU2Wg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261923.XeaDU2Wg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261923.XeaDU2Wg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_tt.c: In function 'ttm_tt_create':
>> drivers/gpu/drm/ttm/ttm_tt.c:89:41: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
      89 |         if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_MEM_ENCRYPT))
         |                                         ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/ttm/ttm_tt.c:89:57: error: 'CC_ATTR_MEM_ENCRYPT' undeclared (first use in this function)
      89 |         if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_MEM_ENCRYPT))
         |                                                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_tt.c:89:57: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/cc_platform_has +89 drivers/gpu/drm/ttm/ttm_tt.c

    56	
    57	/*
    58	 * Allocates a ttm structure for the given BO.
    59	 */
    60	int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
    61	{
    62		struct ttm_device *bdev = bo->bdev;
    63		uint32_t page_flags = 0;
    64	
    65		dma_resv_assert_held(bo->base.resv);
    66	
    67		if (bo->ttm)
    68			return 0;
    69	
    70		switch (bo->type) {
    71		case ttm_bo_type_device:
    72			if (zero_alloc)
    73				page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
    74			break;
    75		case ttm_bo_type_kernel:
    76			break;
    77		case ttm_bo_type_sg:
    78			page_flags |= TTM_TT_FLAG_EXTERNAL;
    79			break;
    80		default:
    81			pr_err("Illegal buffer object type\n");
    82			return -EINVAL;
    83		}
    84		/*
    85		 * When using dma_alloc_coherent with memory encryption the
    86		 * mapped TT pages need to be decrypted or otherwise the drivers
    87		 * will end up sending encrypted mem to the gpu.
    88		 */
  > 89		if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_MEM_ENCRYPT))
    90			page_flags |= TTM_TT_FLAG_DECRYPTED;
    91	
    92		bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);
    93		if (unlikely(bo->ttm == NULL))
    94			return -ENOMEM;
    95	
    96		WARN_ON(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE &&
    97			!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL));
    98	
    99		return 0;
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
