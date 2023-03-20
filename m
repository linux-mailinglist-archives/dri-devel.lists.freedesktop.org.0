Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BA6C22D4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD1D10E658;
	Mon, 20 Mar 2023 20:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA8D10E658;
 Mon, 20 Mar 2023 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679344565; x=1710880565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GtBtdYrXOiqXO5+kSEFWGjUn4FOWbsjzFAFsbQ+Cb7U=;
 b=XQx7PNaRtofgCuU24MCUuRIaQxWCuUULJVx6X8no6sA6ZzzxsVpnE5IV
 cWegZ25XJHJ3cV6Z2jme0gJdNOGAwY4s6b0uIq5BsMa4oARJqAV7KNoiX
 El8PPZrOJ8JEIUgBuLE8b6hl+blpy2di7niaHE3arJW5S1iieDJ5nrmMr
 qyJEzPxyNOeLyfVwkXfq+AkjKE6qajju71Y8E1vA10JJFtYMZ1ADQBhk3
 j7WmdNZoTztf8njjHptomaEsXOnj0bfObS5Ww2l8tLJPRhBqQ6v6XwZ8d
 XiuwhQNOp0aI2uGoGM4ZkcUYT/nldAn6+WrG+JvSahopfDLdrG75cEqeB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338800542"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="338800542"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631263106"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="631263106"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 13:36:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peMEW-000BIW-0W;
 Mon, 20 Mar 2023 20:35:56 +0000
Date: Tue, 21 Mar 2023 04:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 18/23] PM / QoS: Decouple request alloc from
 dev_pm_qos_mtx
Message-ID: <202303210420.9g2z6MgO-lkp@intel.com>
References: <20230320144356.803762-19-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320144356.803762-19-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>,
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on rafael-pm/linux-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc3 next-20230320]
[cannot apply to chanwoo/devfreq-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Pre-allocate-hw_fence/20230320-224826
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230320144356.803762-19-robdclark%40gmail.com
patch subject: [PATCH v2 18/23] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230321/202303210420.9g2z6MgO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d7e4629d7265d7e77fc72d01e84d27d805b7485
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/drm-msm-Pre-allocate-hw_fence/20230320-224826
        git checkout 2d7e4629d7265d7e77fc72d01e84d27d805b7485
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/base/power/ drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210420.9g2z6MgO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/qos.c:947:8: warning: variable 'req' is uninitialized when used here [-Wuninitialized]
                   if (!req) {
                        ^~~
   drivers/base/power/qos.c:938:33: note: initialize the variable 'req' to silence this warning
                   struct dev_pm_qos_request *req;
                                                 ^
                                                  = NULL
   1 warning generated.


vim +/req +947 drivers/base/power/qos.c

2d984ad132a87c Rafael J. Wysocki 2014-02-11  917  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  918  /**
2d984ad132a87c Rafael J. Wysocki 2014-02-11  919   * dev_pm_qos_update_user_latency_tolerance - Update user space latency tolerance.
2d984ad132a87c Rafael J. Wysocki 2014-02-11  920   * @dev: Device to update the user space latency tolerance for.
2d984ad132a87c Rafael J. Wysocki 2014-02-11  921   * @val: New user space latency tolerance for @dev (negative values disable).
2d984ad132a87c Rafael J. Wysocki 2014-02-11  922   */
2d984ad132a87c Rafael J. Wysocki 2014-02-11  923  int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
2d984ad132a87c Rafael J. Wysocki 2014-02-11  924  {
2d7e4629d7265d Rob Clark         2023-03-20  925  	struct dev_pm_qos_request *req = NULL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  926  	int ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  927  
00dd582e52a535 Rob Clark         2023-03-20  928  	ret = dev_pm_qos_constraints_ensure_allocated(dev);
00dd582e52a535 Rob Clark         2023-03-20  929  	if (ret)
00dd582e52a535 Rob Clark         2023-03-20  930  		return ret;
00dd582e52a535 Rob Clark         2023-03-20  931  
2d7e4629d7265d Rob Clark         2023-03-20  932  	if (!dev->power.qos->latency_tolerance_req)
2d7e4629d7265d Rob Clark         2023-03-20  933  		req = kzalloc(sizeof(*req), GFP_KERNEL);
2d7e4629d7265d Rob Clark         2023-03-20  934  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  935  	mutex_lock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  936  
00dd582e52a535 Rob Clark         2023-03-20  937  	if (!dev->power.qos->latency_tolerance_req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  938  		struct dev_pm_qos_request *req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  939  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  940  		if (val < 0) {
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  941  			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  942  				ret = 0;
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  943  			else
2d984ad132a87c Rafael J. Wysocki 2014-02-11  944  				ret = -EINVAL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  945  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  946  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @947  		if (!req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  948  			ret = -ENOMEM;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  949  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  950  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  951  		ret = __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LATENCY_TOLERANCE, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  952  		if (ret < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  953  			kfree(req);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  954  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  955  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  956  		dev->power.qos->latency_tolerance_req = req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  957  	} else {
2d7e4629d7265d Rob Clark         2023-03-20  958  		/*
2d7e4629d7265d Rob Clark         2023-03-20  959  		 * If we raced with another thread to allocate the request,
2d7e4629d7265d Rob Clark         2023-03-20  960  		 * simply free the redundant allocation and move on.
2d7e4629d7265d Rob Clark         2023-03-20  961  		 */
2d7e4629d7265d Rob Clark         2023-03-20  962  		if (req)
2d7e4629d7265d Rob Clark         2023-03-20  963  			kfree(req);
2d7e4629d7265d Rob Clark         2023-03-20  964  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  965  		if (val < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  966  			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  967  			ret = 0;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  968  		} else {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  969  			ret = __dev_pm_qos_update_request(dev->power.qos->latency_tolerance_req, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  970  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  971  	}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  972  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  973   out:
2d984ad132a87c Rafael J. Wysocki 2014-02-11  974  	mutex_unlock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  975  	return ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  976  }
034e7906211c18 Andrew Lutomirski 2016-11-29  977  EXPORT_SYMBOL_GPL(dev_pm_qos_update_user_latency_tolerance);
13b2c4a0c3b1cd Mika Westerberg   2015-07-27  978  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
