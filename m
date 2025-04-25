Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDC4A9CAFF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 16:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3A610E2AE;
	Fri, 25 Apr 2025 14:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9RP/828";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9542110E136;
 Fri, 25 Apr 2025 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745589687; x=1777125687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qJwvzDI/Ecr+K4pKDMV7GxiLNnGXwiyiJLLgrVXjl/8=;
 b=X9RP/8282XKWEqwwQ1seF/oIzTn+wRvohejTweFsHQ+eZ90khzlbjrJl
 WLG4uSCKKd508IwlNp2WjmRXLMrgzVfVjIIrY2SSQgrqxbIunGb5UC28c
 +z4A/X0i65REBlkHNh4YpBskBcu7MzjG57CygfsHCnMz6bmlR1A0tlPrY
 nyPME3MiXfYoaOVABkkqLlDilbzylpxp+/9QyBlS9dy2dCb1fuP/FJyK4
 9lpoNzbcRuzglZyAjPmsdAf3S9iOlti9OaMw7D7AbMLBPdiPfFyjK1UW6
 kM9W6FwNXo6agYKyRHdCLYKTEUMfudqzHQWs7Xpq970OdO8A1y+biBju6 A==;
X-CSE-ConnectionGUID: y8UPV2vtTt6yatsg3UUqoQ==
X-CSE-MsgGUID: WVfdjEy2RUKiTDj6rFBoAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58618395"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="58618395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:01:23 -0700
X-CSE-ConnectionGUID: WPIN99XYTSOGUq13aNBqYg==
X-CSE-MsgGUID: w3oFJ/h1SNKujDE+bMVYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="136970958"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2025 07:01:22 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u8JcG-0005G1-0m;
 Fri, 25 Apr 2025 14:01:20 +0000
Date: Fri, 25 Apr 2025 22:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <202504252124.jQDkibSg-lkp@intel.com>
References: <20250424121827.862729-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424121827.862729-15-matthew.auld@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250424]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-gpusvm-fix-hmm_pfn_to_map_order-usage/20250424-202128
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250424121827.862729-15-matthew.auld%40intel.com
patch subject: [PATCH v3 6/7] drm/xe/userptr: replace xe_hmm with gpusvm
config: alpha-kismet-CONFIG_DRM_GPUSVM-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20250425/202504252124.jQDkibSg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250425/202504252124.jQDkibSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504252124.jQDkibSg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GPUSVM when selected by DRM_XE
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
     Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
     Selected by [y]:
     - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GPUSVM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DEVICE_PRIVATE [=n]
     Selected by [m]:
     - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=n]=y [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
