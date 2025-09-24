Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A94B98F70
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2C610E6BC;
	Wed, 24 Sep 2025 08:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lmh5blB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03AC10E6B8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758703597; x=1790239597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5zURv/VkwJ7uwftpG82eT/JkNOOOUKHmFDMlNcbtWEg=;
 b=Lmh5blB23I9h4mP3HsZ6ZX/hSiXZvrFu/MEwuKgrx/812r1c2xZv2Ih/
 hON1kAgruZCcxPFUqV2D6Q+f13mp9La2hmd1mIakQc0XuTReEpXcrcWT8
 +8R4ueB6Ba/yrsUmTJOcnHDOTfAYpttQpw8XZv/isw9Begg/NdZnnAp4w
 P7kYJ/wQvXsFumfy1Pmd7EpPzTx4/HmCqT/HdSYoU5Tn8OxSwrFK3ASSN
 g5VEU506v0EuAUqvLDB2leBiK0Zd+zOzYU+6C8lMHGcSxqRznAEEApxsc
 tdz6rXJBq/S/f/+OAz12aqYDa9RoAPyR0N+EOLS/K5syjK00brGvAbw02 g==;
X-CSE-ConnectionGUID: dY5gor0KTUCr+//PL0qe3Q==
X-CSE-MsgGUID: zdS+snzoRZ6E6Enzwq8Irg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71618215"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="71618215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:46:36 -0700
X-CSE-ConnectionGUID: 75A3mkAlQkO7AvUCGYr9YQ==
X-CSE-MsgGUID: 0VYw90Z7QwWqmMgwo+Gqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177762293"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2025 01:46:34 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v1L8y-0003xJ-1K;
 Wed, 24 Sep 2025 08:46:32 +0000
Date: Wed, 24 Sep 2025 16:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/shmem-helper: Add huge page fault handler
Message-ID: <202509241654.qJk1H5kr-lkp@intel.com>
References: <20250923095634.50051-1-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923095634.50051-1-loic.molinari@collabora.com>
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

Hi Loïc,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20250923-175753
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250923095634.50051-1-loic.molinari%40collabora.com
patch subject: [PATCH] drm/shmem-helper: Add huge page fault handler
config: alpha-randconfig-r073-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241654.qJk1H5kr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241654.qJk1H5kr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241654.qJk1H5kr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_huge_fault':
>> drivers/gpu/drm/drm_gem_shmem_helper.c:594:2: error: label at end of compound statement
     default:
     ^~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:548:21: warning: unused variable 'paddr' [-Wunused-variable]
     unsigned long pfn, paddr;
                        ^~~~~


vim +594 drivers/gpu/drm/drm_gem_shmem_helper.c

   593	
 > 594		default:
   595		}
   596	
   597	 out:
   598		dma_resv_unlock(shmem->base.resv);
   599	
   600		return ret;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
