Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD65468196
	for <lists+dri-devel@lfdr.de>; Sat,  4 Dec 2021 01:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648E0ABABB;
	Sat,  4 Dec 2021 00:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF233ABAB6;
 Sat,  4 Dec 2021 00:51:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="300467392"
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; d="scan'208";a="300467392"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 16:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; d="scan'208";a="610608615"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 03 Dec 2021 16:51:27 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mtJGw-000IGY-Lz; Sat, 04 Dec 2021 00:51:26 +0000
Date: Sat, 4 Dec 2021 08:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Rollback seqno when request creation fails
Message-ID: <202112040802.QqhQIE5v-lkp@intel.com>
References: <20211203175910.28516-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203175910.28516-1-matthew.brost@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniele.ceraolospurio@intel.com, kbuild-all@lists.01.org,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.16-rc3 next-20211203]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Brost/drm-i915-Rollback-seqno-when-request-creation-fails/20211204-020638
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-m021-20211203 (https://download.01.org/0day-ci/archive/20211204/202112040802.QqhQIE5v-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/af590220a3160c7a680487eac25eb2dc24baf42d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Brost/drm-i915-Rollback-seqno-when-request-creation-fails/20211204-020638
        git checkout af590220a3160c7a680487eac25eb2dc24baf42d
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_timeline.c: In function 'intel_timeline_rollback_seqno':
>> drivers/gpu/drm/i915/gt/intel_timeline.c:306:2: error: implicit declaration of function 'timeline_rollback' [-Werror=implicit-function-declaration]
     306 |  timeline_rollback(tl);
         |  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/timeline_rollback +306 drivers/gpu/drm/i915/gt/intel_timeline.c

   303	
   304	void intel_timeline_rollback_seqno(struct intel_timeline *tl)
   305	{
 > 306		timeline_rollback(tl);
   307	}
   308	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
