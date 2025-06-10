Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE33AD2E6F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5710E477;
	Tue, 10 Jun 2025 07:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGwNJdvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F9210E472;
 Tue, 10 Jun 2025 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749539741; x=1781075741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rCqGwz7zedTJ2RQSCyeJ2YeiiQ4CI6xrq7Q5IEgEQlU=;
 b=GGwNJdvlR6Ku/C3b0hOmujNNuTJmsn/CFdYYHRafAuqs8wxdVH+8It7C
 naS821kNDHqFNWZw73keHczbUVIVNl+5uMv83AA1oYIyMLZ+I3S0+lypq
 Ea4AUK/STrl+9emQlPRsCx1ooLEpey24QIseRjxvMpycNcae2QsWzxDAy
 DT4rOl4J+UjCOpzu5Zn4dWdJVMXIL9NMxuPvbUMhmv/QrkTt+UC+svIYz
 Wg4rZ0G8DVqW1J7RvGjRezAHtSgT7S7EaAjG3IF07MduDjNBLe6oRSMvU
 8gpnZoDtg/bzUUAj0zecywLj9rGnEsQLbkKVPFNyRyUrswDpBftCUiuk0 Q==;
X-CSE-ConnectionGUID: STn7wlTtRWqTETUuEjjElg==
X-CSE-MsgGUID: eE0b9biSSwWRPOc7M38Zag==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39256287"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="39256287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:15:40 -0700
X-CSE-ConnectionGUID: cc7AaFCcRWe7MlgjHLhM7w==
X-CSE-MsgGUID: 0PDIT9JMQ5av4f3D8PsPpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146657771"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 10 Jun 2025 00:15:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uOtCp-0007uv-2O;
 Tue, 10 Jun 2025 07:15:35 +0000
Date: Tue, 10 Jun 2025 15:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 2/7] drm/syncobj: Do not allocate an array to store
 zeros when waiting
Message-ID: <202506101443.xwvcZ2hC-lkp@intel.com>
References: <20250609113313.75395-3-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609113313.75395-3-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master drm/drm-next drm-misc/drm-misc-next v6.16-rc1 next-20250606]
[cannot apply to v3.1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-syncobj-Remove-unhelpful-helper/20250609-194350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250609113313.75395-3-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v3 2/7] drm/syncobj: Do not allocate an array to store zeros when waiting
config: arm-davinci_all_defconfig (https://download.01.org/0day-ci/archive/20250610/202506101443.xwvcZ2hC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101443.xwvcZ2hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101443.xwvcZ2hC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__get_user_bad" [drivers/gpu/drm/drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
