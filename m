Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09167BCFD35
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 00:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA5F10E004;
	Sat, 11 Oct 2025 22:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEH1qPYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CB910E004;
 Sat, 11 Oct 2025 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760221786; x=1791757786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9ftHdqHrokZcQXhNcrNBSsyfRb38s2MdEhcqUsS5UxA=;
 b=iEH1qPYDh+bttozWoB9budNuMO0KxcnYiyunQLEeFZeFyekztSmHT8xi
 s77AKp9Ksu31UT15gaGTmSU6u8xFJ6fhXC35lW8l9OPsIMv7AFslgMZYy
 wZl6SNOLPCkIDvkFw7HOOByPlKh9dXQFXeZpIRn1ohMTWlFsShv43bYMo
 PIdcvvWmuF2icDwoFnZ6iUucqTkb4Jq8u095V4rhINp6cqVvV+Iw98ezm
 38TGqsYBwF8oU5F9bqdfozKjQgmza7Sr3zjzvocCEFBqPFC/ZR0MJcgXh
 GMAMsHZxUeKr8WmYgLCpcTcuh5PyI1V7ENITU47+QQC7rnWo8qgJZk8DX A==;
X-CSE-ConnectionGUID: /QhkUwhZSzqkebqeHbqkbQ==
X-CSE-MsgGUID: jUN4cpacQVu0SOr8o4U8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="72660432"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="72660432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 15:29:45 -0700
X-CSE-ConnectionGUID: 6aRIkqUKSgqrljdR0Y68Gg==
X-CSE-MsgGUID: VJALYLfTRNSHXLaG4Pa2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181682031"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 11 Oct 2025 15:29:40 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v7i5p-00041T-2l;
 Sat, 11 Oct 2025 22:29:37 +0000
Date: Sun, 12 Oct 2025 06:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH 07/26] drm/xe/pf: Add support for encap/decap of
 bitstream to/from packet
Message-ID: <202510120631.vW6dpp07-lkp@intel.com>
References: <20251011193847.1836454-8-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-8-michal.winiarski@intel.com>
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

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20251010]
[cannot apply to awilliam-vfio/next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master awilliam-vfio/for-linus v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/drm-xe-pf-Remove-GuC-version-check-for-migration-support/20251012-034301
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251011193847.1836454-8-michal.winiarski%40intel.com
patch subject: [PATCH 07/26] drm/xe/pf: Add support for encap/decap of bitstream to/from packet
config: riscv-randconfig-002-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120631.vW6dpp07-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120631.vW6dpp07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120631.vW6dpp07-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c:272 function parameter 'xe' not described in 'xe_sriov_pf_migration_data_read'
>> Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c:382 function parameter 'xe' not described in 'xe_sriov_pf_migration_data_write'
>> Warning: drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c:467 function parameter 'xe' not described in 'xe_sriov_pf_migration_data_save_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
