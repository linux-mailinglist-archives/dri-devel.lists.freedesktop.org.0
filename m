Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09FAE5DD4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 09:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862610E214;
	Tue, 24 Jun 2025 07:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mro7t4WO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B9310E214;
 Tue, 24 Jun 2025 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750750428; x=1782286428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PKV9c/lsGQc1Lfg8W9yxKSsMGfV1QfYb+yKQY/6y6uc=;
 b=Mro7t4WO8nRfbo/dLxu0BzrYxAji6PnkAHzN7iEHS1TVUTvJbOSIWrsv
 lQlMUGPajPmdeaMjNLP8AOizsE6GbJ+mEuaU0s/nc2bMt0a3yuc6B1z9S
 GMHaW/Mlvult17bWIdTj+jjAsNj5ZOXwP8W1m+sbw71Che3o7RY8uJpP4
 234dnOaZkN/YPVbYQ99/B+pcof6rYpZ9oURk328acABdo+h9BHZU7NiXm
 8U6OEU9czhlMZDW6z01v9/J+t9WgQ3EwzB/kFhSMMWqW/Avdxvbilgh9E
 O6ecxECgH+fyw4x68fZ7kfS7seYB4PZO9FnfWMWTQ1bnc87Hg28Bnn/Jk Q==;
X-CSE-ConnectionGUID: +aOinOfrQuS1n2Mz3T/BgA==
X-CSE-MsgGUID: lLeEKmkQTBCFB6mYu6DbkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70547317"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="70547317"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 00:33:47 -0700
X-CSE-ConnectionGUID: qvT++gUTSrGUu7p13G5RMQ==
X-CSE-MsgGUID: LAt0UfglSIeUb7XCr0jgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="157336325"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2025 00:33:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uTyA3-000Rry-0d;
 Tue, 24 Jun 2025 07:33:43 +0000
Date: Tue, 24 Jun 2025 15:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH v5 14/16] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
Message-ID: <202506241518.ufRm4IS8-lkp@intel.com>
References: <20250623122746.46478-15-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623122746.46478-15-tvrtko.ursulin@igalia.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20250623]
[cannot apply to linus/master drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250623-202942
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250623122746.46478-15-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v5 14/16] drm/sched: Remove FIFO and RR and simplify to a single run queue
config: i386-buildonly-randconfig-002-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241518.ufRm4IS8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241518.ufRm4IS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241518.ufRm4IS8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/scheduler/sched_rq.c:96 Excess function parameter 'ts' description in 'drm_sched_rq_add_entity'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
