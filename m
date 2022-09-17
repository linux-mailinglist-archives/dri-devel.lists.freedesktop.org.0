Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FE5BBAFE
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 01:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722410E178;
	Sat, 17 Sep 2022 23:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15FF10E156;
 Sat, 17 Sep 2022 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663457536; x=1694993536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tREf2HalGLkdGPTcSf38sQSG9GGYEvCEMnZ19wlLTN4=;
 b=FBVpvfMWWjnL9rEaySeO8kouwZq8ZdYXBjE7dQm2hummKCzW7L6hn6g6
 gSuVpTdsGSdctvI76HFu4tkQR180kUssR4SeQJmNaAHK/XGFgv/bFWF5t
 N2E6AroWlN0Q9DB+W+5I5KQlNEeyt//bgVNAMWPQjn7mXX2uSGxE450ZL
 mlpn6kf48DAguk9AcTzvQNVBumHhXO/rtgKo7I2Zqhg/YWIV/bQrn2h+S
 9mweyX3TFZSBySrcWI5hZEfgIOM2r8OkxOfK4MKjJsGU5d6dynUZFciG2
 I+sCaiElpHrNoXmIuhowADVR1EAxhNS3NsFByMllr4i43+yBAzp3t1y2Y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="300008583"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; d="scan'208";a="300008583"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2022 16:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; d="scan'208";a="707136785"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2022 16:32:11 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oZhIA-0000gp-0o;
 Sat, 17 Sep 2022 23:32:10 +0000
Date: Sun, 18 Sep 2022 07:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v10 2/9] overflow: Move and add few utility macros into
 overflow
Message-ID: <202209180742.kE2Xbxqz-lkp@intel.com>
References: <20220909105913.752049-3-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909105913.752049-3-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 kbuild-all@lists.01.org, andi.shyti@linux.intel.com, keescook@chromium.org,
 jani.nikula@intel.com, ndesaulniers@google.com, dlatypov@google.com,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 andrzej.hajda@intel.com, matthew.auld@intel.com, airlied@redhat.com,
 mchehab@kernel.org, vitor@massaru.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gwan-gyeong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.0-rc5]
[cannot apply to drm-intel/for-linux-next kees/for-next/hardening next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220909-190301
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220918/202209180742.kE2Xbxqz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/8d39d691758034d1082773e43b9cb4738b1f4387
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220909-190301
        git checkout 8d39d691758034d1082773e43b9cb4738b1f4387
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_user_extensions.c:56:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct i915_user_extension [noderef] __user *ext @@     got void *[noderef] __user @@
   drivers/gpu/drm/i915/i915_user_extensions.c:56:21: sparse:     expected struct i915_user_extension [noderef] __user *ext
   drivers/gpu/drm/i915/i915_user_extensions.c:56:21: sparse:     got void *[noderef] __user

vim +56 drivers/gpu/drm/i915/i915_user_extensions.c

    15	
    16	int i915_user_extensions(struct i915_user_extension __user *ext,
    17				 const i915_user_extension_fn *tbl,
    18				 unsigned int count,
    19				 void *data)
    20	{
    21		unsigned int stackdepth = 512;
    22	
    23		while (ext) {
    24			int i, err;
    25			u32 name;
    26			u64 next;
    27	
    28			if (!stackdepth--) /* recursion vs useful flexibility */
    29				return -E2BIG;
    30	
    31			err = check_user_mbz(&ext->flags);
    32			if (err)
    33				return err;
    34	
    35			for (i = 0; i < ARRAY_SIZE(ext->rsvd); i++) {
    36				err = check_user_mbz(&ext->rsvd[i]);
    37				if (err)
    38					return err;
    39			}
    40	
    41			if (get_user(name, &ext->name))
    42				return -EFAULT;
    43	
    44			err = -EINVAL;
    45			if (name < count) {
    46				name = array_index_nospec(name, count);
    47				if (tbl[name])
    48					err = tbl[name](ext, data);
    49			}
    50			if (err)
    51				return err;
    52	
    53			if (get_user(next, &ext->next_extension))
    54				return -EFAULT;
    55	
  > 56			if (check_assign_user_ptr(next, ext))

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
