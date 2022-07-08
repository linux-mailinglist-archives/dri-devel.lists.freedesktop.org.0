Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167956B13F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 06:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8212B4C6;
	Fri,  8 Jul 2022 04:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9DB12B4B6;
 Fri,  8 Jul 2022 04:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657253306; x=1688789306;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w+a9pw0jGz5UJqQLkFKwzJOSX8nn6ZRwZsIYHTH/MAs=;
 b=RJXYnItHYsAlAY7+hJZ7wcTJcD9SdHwydCzWntsAMw55tEfvpQ6n+fyw
 Fp2zXJcgbBgFFyPiefIwYhLWXkYMvkW8d7P7kXDQvidRM7IFCCRIUOQGx
 xLnaCk6CsAVl1LItBsS8Jo5iLBqwxQI1dsgr+uCHqrzqBiNvI3+Zc8My4
 Opmh+e5W0NkLW0HRaCwk7UgLv2dV1XncHpftDaGQ7/N5wCh2frn21RRlE
 y0sqKgRNBIXSk9m/nsFZsPhsITFF9QNhrIpYaXYctBe6dXLttB+83t5wx
 vSZr+kcFPxwno3Gx3xRxBaR9nabWwtQKiQfikCxaGfrZf03tCvAHYlbzo Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285311017"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="285311017"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 21:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="661634281"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2022 21:08:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9fHy-000MtG-QC;
 Fri, 08 Jul 2022 04:08:22 +0000
Date: Fri, 8 Jul 2022 12:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/ttm: fix sg_table construction
Message-ID: <202207081158.l1RcEsDh-lkp@intel.com>
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
 llvm@lists.linux.dev, kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
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
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220708/202207081158.l1RcEsDh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a318752ca76b5fc3e8d9efa87d483c88d177475a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Auld/drm-i915-ttm-fix-sg_table-construction/20220708-011115
        git checkout a318752ca76b5fc3e8d9efa87d483c88d177475a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/i915/i915.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/i915/i915.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
