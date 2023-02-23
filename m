Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21126A1198
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 22:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E2510E293;
	Thu, 23 Feb 2023 21:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909010E293
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 21:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677186322; x=1708722322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pkiv/RmAaj3XTdjhlH/W97Sd8NeBFSXfTJOyljNQnWs=;
 b=EfcJfnBuhtFGigFfy1TzYz1EcZ6u+2jKPPjP8HwoCINO6WFqMvgQ/cju
 3luB1fj0zoBohr/ZVfXTOS1lT1FMRhZ8a9VajJcFI6yWDPcZDDrcnALow
 RWJm2vmUERwzFctARBZtpbBkkhQSo8FfLyuOSRoo+m9FW9v3fshxjymoy
 ygfPj8Bb2GHOqKnhOBr8E7AqcVHtHS5WLqW1WMH9Vm7nny8xkEorc7AIi
 uyJYYUBgw8viy5jZKEiMPs7HXeVzf67+Kge6m1/MjDPlJrcotTpkwWt+T
 OAbQSkCyA3GPOChN/LPA2Dqr5eXiFwKmIcFbH1o0DqqRMcbcpBO9Dyx9m w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333332831"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="333332831"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 13:05:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001577217"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="1001577217"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2023 13:05:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pVImF-0001kn-09;
 Thu, 23 Feb 2023 21:05:19 +0000
Date: Fri, 24 Feb 2023 05:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, patrik.r.jakobsson@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
Message-ID: <202302240435.wnJFtigI-lkp@intel.com>
References: <20230223121733.12549-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223121733.12549-7-tzimmermann@suse.de>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next v6.2 v6.2-rc8 v6.2-rc7 next-20230223 v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
patch link:    https://lore.kernel.org/r/20230223121733.12549-7-tzimmermann%40suse.de
patch subject: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230224/202302240435.wnJFtigI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d1c984af29e0c5219d353a4772527d233d1c1bcc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
        git checkout d1c984af29e0c5219d353a4772527d233d1c1bcc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240435.wnJFtigI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/cdv_device.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/cdv_intel_crt.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/gtt.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/intel_bios.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/intel_gmbus.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/intel_i2c.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/mid_bios.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/mmu.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/oaktrail_device.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/oaktrail_crtc.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psb_fbdev_setup
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/backlight.o:(psb_fbdev_setup) in archive vmlinux.a
   >>> defined at psb_drv.h:621 (drivers/gpu/drm/gma500/psb_drv.h:621)
   >>>            drivers/gpu/drm/gma500/oaktrail_hdmi.o:(.text+0x0) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
