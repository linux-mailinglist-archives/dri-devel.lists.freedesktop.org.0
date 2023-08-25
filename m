Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE6788D0C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E0710E6D3;
	Fri, 25 Aug 2023 16:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE38310E6D3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692980122; x=1724516122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rwr6PSTgN8wp4klUyHHPGoINVGER8BObj2gS+V7ZX38=;
 b=A4QulLF8ViSrAPXCivJkS5cjKXaN9a8FiPyi0pkVS4Z+VWTumXWlIrUf
 5t1e0EADw4BBHUMcys4NzUhudBNFcmN4yv6gTlmifUp3JmQOGGrcvw5Ul
 2ZKDh+qMDhgk/ZEBmCXv9I2CFiPNYCihZL4WEsH9H6ATfAbqlfBe34xDV
 tNgJgssoiSQCqTasDUzfmq+Fwyv9s0A6ULdwCCE05yvhhQQf3M9DZy7R2
 168Og22IxSa1x5K2qdNcdPwF960gBNxxtdWPN9DyVx2fZNR3SC0btICSq
 TgQEDJe8WFEEO1xk6BgJNGjfUxbtIPlPivwG5eTnM5RBv18vd+pXsObym w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="364942524"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="364942524"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 09:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068283943"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="1068283943"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 09:10:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZZOY-0003nL-17;
 Fri, 25 Aug 2023 16:10:46 +0000
Date: Sat, 26 Aug 2023 00:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] accel/ivpu: Move set autosuspend delay to HW
 specific code
Message-ID: <202308260057.5bVOUnNo-lkp@intel.com>
References: <20230825124135.4086628-2-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825124135.4086628-2-stanislaw.gruszka@linux.intel.com>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stanislaw,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on next-20230825]
[cannot apply to drm-misc/drm-misc-next linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislaw-Gruszka/accel-ivpu-Move-set-autosuspend-delay-to-HW-specific-code/20230825-204444
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230825124135.4086628-2-stanislaw.gruszka%40linux.intel.com
patch subject: [PATCH 1/9] accel/ivpu: Move set autosuspend delay to HW specific code
config: x86_64-randconfig-004-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260057.5bVOUnNo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260057.5bVOUnNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260057.5bVOUnNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/accel/ivpu/ivpu_pm.c:8:
   drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_pm_init':
>> drivers/accel/ivpu/ivpu_pm.c:303:66: error: 'struct dev_pm_info' has no member named 'autosuspend_delay'
     303 |         ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
         |                                                                  ^
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/accel/ivpu/ivpu_drv.h:73:17: note: in expansion of macro 'dev_dbg'
      73 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
         |                 ^~~~~~~
   drivers/accel/ivpu/ivpu_pm.c:303:9: note: in expansion of macro 'ivpu_dbg'
     303 |         ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
         |         ^~~~~~~~


vim +303 drivers/accel/ivpu/ivpu_pm.c

   284	
   285	int ivpu_pm_init(struct ivpu_device *vdev)
   286	{
   287		struct device *dev = vdev->drm.dev;
   288		struct ivpu_pm_info *pm = vdev->pm;
   289	
   290		pm->vdev = vdev;
   291		pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
   292	
   293		atomic_set(&pm->in_reset, 0);
   294		INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
   295	
   296		pm_runtime_use_autosuspend(dev);
   297	
   298		if (ivpu_disable_recovery)
   299			pm_runtime_set_autosuspend_delay(dev, -1);
   300		else
   301			pm_runtime_set_autosuspend_delay(dev, vdev->timeout.autosuspend);
   302	
 > 303		ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
   304	
   305		return 0;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
