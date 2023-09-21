Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C002D7AA2B9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 23:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1879C10E61A;
	Thu, 21 Sep 2023 21:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1610E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695331999; x=1726867999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B3NF89Ap9PsrlaAMkAw5YbXb0M806OUO1GxY05QCtr4=;
 b=ZbiOgHQ6dLuepTA88qD6yjG1BeBXqG0NrculeFxNQKgA/xxZAscwRd9l
 ZXGkrOVjv0l2UX20ejeV/iHDi9B/6G7kk82Hlm0OzeMRvBhLA0UIddLg7
 7OKd0JjievnTgbZ1MQPouKMKJChXwV1XRI6XUu09gXL+1soubp7+o7yUd
 W9yUq4F3dGO8MlHF44lSgDpHL8L96rRuzOEQzXSh4ue9Ohdj3zbV9UsxL
 mPmKL8h+ttBoQICqJyZ2BaI1E0w/+3DA8AeSaWA/4yWM/HKQZFgCjVr4g
 RtFXgYOlG/B2R1/46zvWrWYv5eVr0VM/APIBJekauLPL+ghLUT9AERxKN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447150760"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="447150760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 14:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="747293905"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="747293905"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 21 Sep 2023 14:33:00 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qjRIA-0000Qg-27;
 Thu, 21 Sep 2023 21:32:58 +0000
Date: Fri, 22 Sep 2023 05:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the
 atomic commit
Message-ID: <202309220530.84SlbdTU-lkp@intel.com>
References: <20230921200312.3989073-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921200312.3989073-3-l.stach@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/drm-lcdif-don-t-clear-unrelated-bits-in-CTRLDESCL0_5-when-setting-up-format/20230922-040438
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230921200312.3989073-3-l.stach%40pengutronix.de
patch subject: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the atomic commit
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309220530.84SlbdTU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220530.84SlbdTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220530.84SlbdTU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/lcdif_drv.c:39:6: warning: no previous prototype for 'lcdif_commit_tail' [-Wmissing-prototypes]
      39 | void lcdif_commit_tail(struct drm_atomic_state *old_state)
         |      ^~~~~~~~~~~~~~~~~


vim +/lcdif_commit_tail +39 drivers/gpu/drm/mxsfb/lcdif_drv.c

    38	
  > 39	void lcdif_commit_tail(struct drm_atomic_state *old_state)
    40	{
    41		struct drm_device *drm = old_state->dev;
    42	
    43		pm_runtime_get_sync(drm->dev);
    44	
    45		drm_atomic_helper_commit_modeset_disables(drm, old_state);
    46		drm_atomic_helper_commit_planes(drm, old_state,
    47						DRM_PLANE_COMMIT_ACTIVE_ONLY);
    48		drm_atomic_helper_commit_modeset_enables(drm, old_state);
    49	
    50		drm_atomic_helper_fake_vblank(old_state);
    51		drm_atomic_helper_commit_hw_done(old_state);
    52		drm_atomic_helper_wait_for_vblanks(drm, old_state);
    53	
    54		pm_runtime_put(drm->dev);
    55	
    56		drm_atomic_helper_cleanup_planes(drm, old_state);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
