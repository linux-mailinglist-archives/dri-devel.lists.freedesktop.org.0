Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20629B0FD05
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 00:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5379410E048;
	Wed, 23 Jul 2025 22:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4kmCAI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC22A10E048
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753310613; x=1784846613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AB2be7bdlGypmACU4zZ0a1wnOFT1GBNtcZel1TManbs=;
 b=T4kmCAI4ezs1tii3zpNKI33/ss1aRp1tqWlKi/lQiOn+OBInQp0FmiJO
 bkXEtrgVisZuREpnaEG06e7aSi0vKgJsgCQCXPi0pQLaWSJtmB7vOAbRS
 jDN1NKRc+VGHHIEQercDOeZQEZmlhBUe8pxXK3yOu+amuTYuXoxUg/1Dj
 dbkZZDPdv9md7vDjdfjgQs4pTXPxeXyfOozueJlxPHb0cFsiHdlb7s9rA
 uupz54+lEX2hHZPAMtZ6Q0JLayz3lxGHWMx3e/ZKDL5K/GiahkDTiuHQ2
 JsPQ59LQM3gRyvnS0FSY3l7CCPy+Csb4h7uyyXCAWnqb6spriaVUMUBFg A==;
X-CSE-ConnectionGUID: 0C0A11tgSCOjs64BrFYcXQ==
X-CSE-MsgGUID: 6SQR4fhyRr+WPegxCdWcZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55551144"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55551144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 15:43:32 -0700
X-CSE-ConnectionGUID: 70TgYBp0R+So1kNDZjPRHg==
X-CSE-MsgGUID: gGNfpaRzTpeqI3mV40pCAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="190751334"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2025 15:43:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ueiBK-000Jr9-1n;
 Wed, 23 Jul 2025 22:43:26 +0000
Date: Thu, 24 Jul 2025 06:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH v2 14/15] drm: sprd: implement IOMMU-based buffer
 management
Message-ID: <202507240607.WFI08aBs-lkp@intel.com>
References: <20250722-ums9230-drm-v2-14-054276ec213d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722-ums9230-drm-v2-14-054276ec213d@abscue.de>
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

Hi Otto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05adbee3ad528100ab0285c15c91100e19e10138]

url:    https://github.com/intel-lab-lkp/linux/commits/Otto-Pfl-ger/dt-bindings-display-sprd-adapt-for-UMS9230-support/20250722-224414
base:   05adbee3ad528100ab0285c15c91100e19e10138
patch link:    https://lore.kernel.org/r/20250722-ums9230-drm-v2-14-054276ec213d%40abscue.de
patch subject: [PATCH v2 14/15] drm: sprd: implement IOMMU-based buffer management
config: hexagon-randconfig-r132-20250724 (https://download.01.org/0day-ci/archive/20250724/202507240607.WFI08aBs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507240607.WFI08aBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240607.WFI08aBs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sprd/sprd_gem.c:157:16: sparse: sparse: Using plain integer as NULL pointer

vim +157 drivers/gpu/drm/sprd/sprd_gem.c

   135	
   136	static struct sg_table *sprd_gem_object_get_sg_table(struct drm_gem_object *obj)
   137	{
   138		struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
   139		struct sg_table *sgt;
   140		int ret;
   141	
   142		if (sprd_gem->pages)
   143			return drm_prime_pages_to_sg(obj->dev, sprd_gem->pages,
   144						     obj->size >> PAGE_SHIFT);
   145	
   146		sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
   147		if (!sgt)
   148			return ERR_PTR(-ENOMEM);
   149	
   150		ret = dma_get_sgtable(obj->dev->dev, sgt, sprd_gem->vaddr,
   151				      sprd_gem->dma_addr, obj->size);
   152		if (ret < 0) {
   153			kfree(sgt);
   154			return ERR_PTR(ret);
   155		}
   156	
 > 157		return 0;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
