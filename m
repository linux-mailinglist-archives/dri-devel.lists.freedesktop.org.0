Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A750B56AC89
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 22:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C9A14A39D;
	Thu,  7 Jul 2022 20:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62114A39D;
 Thu,  7 Jul 2022 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657224544; x=1688760544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PJOXNirRxbQj5szCD2eK9bDM0x+hy95/wc7r4B0KjSA=;
 b=GVu5MunvkuCx8RSBKMN8rPJpN+HjZgOUdoGsNjNUv+FDBuBGIrLi9nM3
 MBJ3HzqdOHfdFhyzY3P/YrvsAB92Dqh1Id1mxobOjuiekQTUBYwqd36AI
 M82di3BracIyIqjh0ZjQwrQAnKv4PeyWRh6KAZPQdli9SJR6yRT1IaElK
 dQCBpT0YQSAx5suMdZNLwN++rPBW3RxM5yaKC4AlFLf5oM9ef/h9W6qSO
 VyOi3F9SsVxJ6VQkDSOk8U1q+t5e5Ep+9ifQ4Epm2MWvY7gV2U8bKnntc
 EqaUxGIJmU3zsDAG4+JqG6IZsqgUrvemWnn67KA6PRXfszfqNhtU1V6t9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309673986"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="309673986"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 13:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="920725367"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jul 2022 13:09:02 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9Xo5-000MQ6-Gd;
 Thu, 07 Jul 2022 20:09:01 +0000
Date: Fri, 8 Jul 2022 04:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/ttm: fix sg_table construction
Message-ID: <202207080407.Ah1H6WFK-lkp@intel.com>
References: <20220707170927.499451-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707170927.499451-1-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-i915-ttm-fix-sg_table-construction/20220708-011115
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220708/202207080407.Ah1H6WFK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/a318752ca76b5fc3e8d9efa87d483c88d177475a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Auld/drm-i915-ttm-fix-sg_table-construction/20220708-011115
        git checkout a318752ca76b5fc3e8d9efa87d483c88d177475a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/i915_scatterlist.o: in function `i915_rsgt_from_mm_node':
>> i915_scatterlist.c:(.text+0x196): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/i915/i915_scatterlist.o: in function `i915_rsgt_from_buddy_resource':
>> i915_scatterlist.c:(.text+0x426): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
