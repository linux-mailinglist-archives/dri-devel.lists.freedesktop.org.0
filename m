Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B8CA7B05
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 14:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0DE10EB25;
	Fri,  5 Dec 2025 13:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYMax4ow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053E10EB21;
 Fri,  5 Dec 2025 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764940074; x=1796476074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TUxdgERn6nZzlsaaOa8H5Va7UsGi5iweAuEEbITZPGM=;
 b=bYMax4owri20qBDVo1YJyssnuCV1EKq7IpENrPTmPrvuFqSas6Pv0rUv
 Zi6XtNeaeKZ7OIdbF/aCLhF7HZGCOmlrB6om8U3Q3M4gpduODnGm1Ut7a
 +sdFpj28vuqdGy8ANLKp5vyLlT3mWvD4Ei9YAh2P8/n5sFSjzy7tDzInW
 mpIsM/bb9D3yfWjjJqtTG10Kgx431NdXvlEmqDmt06tCgGLIoRlF5oKDf
 +ieNigqQtCnaCBSSHvcxDRP1EapwrTCX4KZht4GakSfH32NtqDjVTFGHv
 OdkD0vOxHvxJB7vAXcTZfBvUBWfbsC/MhDkLbyE0rkJBSQS7tZY2L5sdu w==;
X-CSE-ConnectionGUID: pqCgj15oTTmflvAM/hkHRA==
X-CSE-MsgGUID: 4k+xccSLTHKbH9QvbxIesw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77658836"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77658836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 05:07:54 -0800
X-CSE-ConnectionGUID: HIlMWZlJQkWsZ2+w9RywUA==
X-CSE-MsgGUID: sUrnZ8TATCyqBNhk3RjPKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194943323"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 05:07:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vRVXF-00000000F13-3a1m;
 Fri, 05 Dec 2025 13:07:45 +0000
Date: Fri, 5 Dec 2025 21:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v7 12/13] drm/panfrost: Add flag to map GEM object
 Write-Back Cacheable
Message-ID: <202512051903.QuHryKTr-lkp@intel.com>
References: <20251203090141.227394-13-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203090141.227394-13-boris.brezillon@collabora.com>
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

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip linus/master next-20251205]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes daeinki-drm-exynos/exynos-drm-next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-panthor-Provide-a-custom-dma_buf-implementation/20251203-174141
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251203090141.227394-13-boris.brezillon%40collabora.com
patch subject: [PATCH v7 12/13] drm/panfrost: Add flag to map GEM object Write-Back Cacheable
config: sparc64-randconfig-r113-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051903.QuHryKTr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051903.QuHryKTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051903.QuHryKTr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panfrost/panfrost_gem.c:392:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/panfrost/panfrost_gem.c:396:10: sparse:   also defined here

vim +392 drivers/gpu/drm/panfrost/panfrost_gem.c

06fdcb378400a75 Boris Brezillon   2025-12-03  383  
f3ba91228e8e917 Rob Herring       2018-09-10  384  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
f3ba91228e8e917 Rob Herring       2018-09-10  385  	.free = panfrost_gem_free_object,
a5efb4c9a562aa1 Rob Herring       2019-07-01  386  	.open = panfrost_gem_open,
a5efb4c9a562aa1 Rob Herring       2019-07-01  387  	.close = panfrost_gem_close,
c7fbcb7149ff932 Thomas Zimmermann 2021-11-08  388  	.print_info = drm_gem_shmem_object_print_info,
187d2929206e6b0 Rob Herring       2019-07-26  389  	.pin = panfrost_gem_pin,
c7fbcb7149ff932 Thomas Zimmermann 2021-11-08  390  	.unpin = drm_gem_shmem_object_unpin,
c7fbcb7149ff932 Thomas Zimmermann 2021-11-08  391  	.get_sg_table = drm_gem_shmem_object_get_sg_table,
06fdcb378400a75 Boris Brezillon   2025-12-03 @392  	.export = panfrost_gem_prime_export,
c7fbcb7149ff932 Thomas Zimmermann 2021-11-08  393  	.vmap = drm_gem_shmem_object_vmap,
c7fbcb7149ff932 Thomas Zimmermann 2021-11-08  394  	.vunmap = drm_gem_shmem_object_vunmap,
c7fbcb7149ff932 Thomas Zimmermann 2021-11-08  395  	.mmap = drm_gem_shmem_object_mmap,
cf47bdd19762531 Faith Ekstrand    2025-12-03  396  	.export = drm_gem_prime_export,
9ccdac7aa822f04 Adrián Larumbe    2023-09-29  397  	.status = panfrost_gem_status,
407c0ad5b19a477 Adrián Larumbe    2023-09-29  398  	.rss = panfrost_gem_rss,
d315bdbfebd517c Thomas Zimmermann 2022-02-09  399  	.vm_ops = &drm_gem_shmem_vm_ops,
f3ba91228e8e917 Rob Herring       2018-09-10  400  };
f3ba91228e8e917 Rob Herring       2018-09-10  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
