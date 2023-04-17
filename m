Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CC6E4AF5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49CE10E2E5;
	Mon, 17 Apr 2023 14:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EBC10E07C;
 Mon, 17 Apr 2023 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681740634; x=1713276634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YXao0Y1mlgkXgxIiX0P3t1OzKW+v0FkIvOH0kfXVX2Y=;
 b=ML23VdU3MtAeovqUoRhWjVRDkYYpFOQriqfs896DcgVqmbhpz7yfy5di
 /F92BHeSOvo9C0+qhkqwwSyBFGq+HI9J93DrAfqmMMet+JiFVIeyBauuK
 QZf8SZkpdaBDi3KwCZJ6leHmM3CrKvORMsnJCofY54emxsGD85qQPAMgI
 mJS1GE0Rs8xygsBOvoOKxKKqElDmYkRNQop4+z8rao47XGPZAMDySfnGB
 jawI3QBEzQiAqLdAtMBEyn7ahAjcWKL65aQA6KAuF4KuvqVkQeJZzCDh0
 PDDtDInSOt62kblPKavOQxF4W24ErKezOzEyyTYzUtEUQcldkqH0wweOt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="344898570"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="344898570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 07:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="640965833"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="640965833"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 17 Apr 2023 07:06:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1poPVG-000cQH-2A;
 Mon, 17 Apr 2023 14:06:46 +0000
Date: Mon, 17 Apr 2023 22:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v9 10/10] drm/msm: Implement HDCP 1.x using
 the new drm HDCP helpers
Message-ID: <202304172130.pXI8PgGX-lkp@intel.com>
References: <20230411192134.508113-11-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411192134.508113-11-markyacoub@google.com>
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
Cc: linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 intel-gfx@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 seanpaul@chromium.org, oe-kbuild-all@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next-fixes]
[also build test ERROR on linus/master v6.3-rc7]
[cannot apply to drm-tip/drm-tip drm-misc/drm-misc-next drm-intel/for-linux-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230412-032412
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230411192134.508113-11-markyacoub%40google.com
patch subject: [Intel-gfx] [PATCH v9 10/10] drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
config: loongarch-randconfig-r015-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172130.pXI8PgGX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93651da28f1a578d2edab2d2b47d9935145d675f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230412-032412
        git checkout 93651da28f1a578d2edab2d2b47d9935145d675f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172130.pXI8PgGX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_atomic.c:12:10: fatal error: dp_drm.h: No such file or directory
      12 | #include "dp_drm.h"
         |          ^~~~~~~~~~
   compilation terminated.


vim +12 drivers/gpu/drm/msm/msm_atomic.c

    11	
  > 12	#include "dp_drm.h"
    13	#include "msm_atomic_trace.h"
    14	#include "msm_drv.h"
    15	#include "msm_gem.h"
    16	#include "msm_kms.h"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
