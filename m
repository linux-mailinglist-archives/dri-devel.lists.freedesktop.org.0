Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDCB67FC16
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 02:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C610E03C;
	Sun, 29 Jan 2023 01:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05C10E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674955684; x=1706491684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Pf51/oAUaJshmIVcADxYnuxpSq3l3LnzVUDIQaSaQA=;
 b=MmhPU0RgNl3j8T4pfw9ddEqIZirk0QBRicNi9IDf8eKAvIVZ83coBxza
 J+E3e8LVEPAvXnn6pEOQH7GV/TVxkEBNKCBk76gbabzfu3NsHVUc80VD2
 W+D8OSd7678Gd1tQ/ZUS6bLfsCKOeQ84NcIFkD+rxID7xO4Sv4mFbYL+G
 AIykSaslm3j3jwVspQOWEhmfzwQQOkiArsE2aKZdF+H4QBNub0ab+RMWe
 LFep52KNOJka4KbqFr3uu/gruZemg6RKzEAgd0KSvNC61vArbdWuZRv3k
 zEmm4JR3Q+FhcCrS4ATgPhDXLPtSKSMZiyijHaJeS715+iVBb+TQztUqR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325046616"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="325046616"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 17:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="727093825"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="727093825"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2023 17:28:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pLwUD-0001J0-0i;
 Sun, 29 Jan 2023 01:28:01 +0000
Date: Sun, 29 Jan 2023 09:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: Fix invalid page access after closing deferred
 I/O devices
Message-ID: <202301290917.puRyNsug-lkp@intel.com>
References: <20230127165834.11387-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127165834.11387-1-tiwai@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Patrik Jakobsson <pjakobsson@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Takashi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/fbdev-Fix-invalid-page-access-after-closing-deferred-I-O-devices/20230128-180330
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230127165834.11387-1-tiwai%40suse.de
patch subject: [PATCH] fbdev: Fix invalid page access after closing deferred I/O devices
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230129/202301290917.puRyNsug-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f28e22b16f34068d07913fa5d4fb2c9683aa8dc4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/fbdev-Fix-invalid-page-access-after-closing-deferred-I-O-devices/20230128-180330
        git checkout f28e22b16f34068d07913fa5d4fb2c9683aa8dc4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fbmem.c: In function 'fb_release':
>> drivers/video/fbdev/core/fbmem.c:1456:17: error: 'struct fb_info' has no member named 'fbdefio'
    1456 |         if (info->fbdefio)
         |                 ^~


vim +1456 drivers/video/fbdev/core/fbmem.c

  1447	
  1448	static int
  1449	fb_release(struct inode *inode, struct file *file)
  1450	__acquires(&info->lock)
  1451	__releases(&info->lock)
  1452	{
  1453		struct fb_info * const info = file->private_data;
  1454	
  1455		lock_fb_info(info);
> 1456		if (info->fbdefio)
  1457			fb_deferred_io_release(info);
  1458		if (info->fbops->fb_release)
  1459			info->fbops->fb_release(info,1);
  1460		module_put(info->fbops->owner);
  1461		unlock_fb_info(info);
  1462		put_fb_info(info);
  1463		return 0;
  1464	}
  1465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
