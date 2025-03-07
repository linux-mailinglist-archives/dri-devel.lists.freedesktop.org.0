Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BCA55E06
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 04:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CD310E089;
	Fri,  7 Mar 2025 03:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVkCZG2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0010E089
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 03:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741316919; x=1772852919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DcLJ9aKimVNyrW/43nsjmeGTwBj8U+eyVkMor5z0OH0=;
 b=aVkCZG2DevpG8JhaJV75ZEFrc0J/n5atqb7tyEJMR/ygxC2aSndFonEI
 QcBreTctw1nNJEVGEiM4JdSQm0N07RG8wXrHiq5pXvjfZTbXb1oZdpDfq
 N2Guc5GkMyafaaOui7niWWL3q5tTXgUh+auYfxKgd4moO36GGWln1E4Yk
 MurS67dSCWQ960762KMk8yv4zDuL2AxNf+HVucocLXltfzqZ6sYj+Ey/Q
 W6fdJeWLFoBtLVBswa3T8c3B/GmU/FqpdnHqOhRDHq/PvRYy2YdkG1Gex
 9Kiu4IkA5KomO6VtLRytp2QPMYN2cCx9UayqOyxCkVtUQJQeydP/dyXoQ w==;
X-CSE-ConnectionGUID: VEBXEHnZTyWibiF+UcjSyA==
X-CSE-MsgGUID: qJnDEP2aTjCNI2sKzmJPFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52996211"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52996211"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 19:08:39 -0800
X-CSE-ConnectionGUID: NYB16Ma0QrSPRJ6pD9Bw5g==
X-CSE-MsgGUID: UPRbNo95TJeuYJ1WV0owAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119130707"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 06 Mar 2025 19:08:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tqO4d-000O7i-2r;
 Fri, 07 Mar 2025 03:08:31 +0000
Date: Fri, 7 Mar 2025 11:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, jfalempe@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ryosuke Yasuoka <ryasuoka@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH drm-next 2/2] drm/virtio: Use atomic_vmap to work
 drm_panic in GUI
Message-ID: <202503071022.q1pg7suf-lkp@intel.com>
References: <20250305152555.318159-3-ryasuoka@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305152555.318159-3-ryasuoka@redhat.com>
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

Hi Ryosuke,

kernel test robot noticed the following build errors:

[auto build test ERROR on e21cba704714c301d04c5fd37a693734b623872a]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryosuke-Yasuoka/vmalloc-Add-atomic_vmap/20250305-232918
base:   e21cba704714c301d04c5fd37a693734b623872a
patch link:    https://lore.kernel.org/r/20250305152555.318159-3-ryasuoka%40redhat.com
patch subject: [PATCH drm-next 2/2] drm/virtio: Use atomic_vmap to work drm_panic in GUI
config: i386-buildonly-randconfig-003-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071022.q1pg7suf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071022.q1pg7suf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071022.q1pg7suf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
ERROR: modpost: "drm_gem_atomic_get_pages" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
ERROR: modpost: "atomic_vmap" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
>> ERROR: modpost: "drm_gem_shmem_atomic_vmap" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
