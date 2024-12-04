Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA99E3C09
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B95410ED31;
	Wed,  4 Dec 2024 14:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFcW0JUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF06210ED31;
 Wed,  4 Dec 2024 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733321041; x=1764857041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7KLMpaj3psPE975L+wGRX1NRSUDet9hdWj+hEc/t+XE=;
 b=SFcW0JUcV5HsTJwzIxd3YL4oeL+pZTiu6QCOJVI+wkPbtIYy3HJPNVhY
 R7owYyAgwLRtXmlOizOd9fHIZz6LgcaOrieTIl1TlYfmDEQkTu1YpcDiC
 IY+Wi4Ni3rX7B1h9TfpGgNndRcJ56OQEbaU4uou6/DWyQbqF6+Sn4e0tV
 M73LM1fPh1S5CSTmXQS/4a6JewjZpFN4T+/Px/ASc3A+YicRLgrYwx8Ey
 X4NnKgMrsDzjxMefB73obluOhqc+98Lmrqj6yWRttYTXbIEPfVCXi0YCL
 SMUx4IeADGqqeK14sbJIEsvW4CPOYOMRyoOomN7GuWH7UxbpJ9a2RKTx8 w==;
X-CSE-ConnectionGUID: Dn/5gnahQaCVQQKJlDuZAg==
X-CSE-MsgGUID: jiWDbmD8SomzlQCUbsklvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44617560"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44617560"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:04:00 -0800
X-CSE-ConnectionGUID: 4yfn1dd1SteZ8DH1tW0vMg==
X-CSE-MsgGUID: 435jbu0ITeikpMsf38kSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94600355"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 06:03:57 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tIpys-00035D-2A;
 Wed, 04 Dec 2024 14:03:54 +0000
Date: Wed, 4 Dec 2024 22:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 1/5] drm/i915/fbdev: Add intel_fbdev_get_vaddr()
Message-ID: <202412042119.5ErpNlAU-lkp@intel.com>
References: <20241203092836.426422-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203092836.426422-2-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_get_vaddr/20241203-173213
base:   44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
patch link:    https://lore.kernel.org/r/20241203092836.426422-2-jfalempe%40redhat.com
patch subject: [PATCH v2 1/5] drm/i915/fbdev: Add intel_fbdev_get_vaddr()
config: i386-randconfig-062-20241204 (https://download.01.org/0day-ci/archive/20241204/202412042119.5ErpNlAU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042119.5ErpNlAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042119.5ErpNlAU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fb_pin.c:333:34: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/i915/display/intel_fb_pin.c:333:34: sparse:     expected void *
   drivers/gpu/drm/i915/display/intel_fb_pin.c:333:34: sparse:     got void [noderef] __iomem *

vim +333 drivers/gpu/drm/i915/display/intel_fb_pin.c

   330	
   331	void *intel_fb_get_vaddr(struct i915_vma *vma)
   332	{
 > 333		return i915_vma_get_iomap(vma);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
