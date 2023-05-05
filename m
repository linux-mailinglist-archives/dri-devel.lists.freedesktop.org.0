Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311126F8614
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 17:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D5510E167;
	Fri,  5 May 2023 15:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4010E167
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683301464; x=1714837464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lbTzMAvAr3LREHg1QmVWQGp0MTSnNPitDvtk32wqL+w=;
 b=VvBHb2rSlfDG6ZwkFcZ64vCawBdENLZAjAFeIKijwBCrnX9rSRvHHlrK
 S6ZaIgLnRkfyPEWX9drVlLxZVuHp7ghJxn1j6rPI3gSJ557zbek0wCMnH
 bqUsh8jqTZjBb7dC9aQWVVmmfTfVYsYiiyVUEVCrl8QNeOTajupjlVPit
 pKxaJsOlr3bL9lXAkGmlTOOqTCM7oo9MWWB181lyqzXysVq6E1kn7C9+v
 rnoXA904jE1HT5ryiHzNylqhP0lM6J3yYvhIqQE+2/TH7GXMqgqbnRJXM
 bs33ZNrvDvuIgPeWoymEKJttoIFp5ACGO1acjZxWpCHy89y9w8r7VmPkR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="329590811"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="329590811"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871901080"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871901080"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 05 May 2023 08:44:20 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1puxbY-0000hZ-10;
 Fri, 05 May 2023 15:44:20 +0000
Date: Fri, 5 May 2023 23:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
 lyude@redhat.com
Subject: Re: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
Message-ID: <202305052344.TAIFBCMZ-lkp@intel.com>
References: <20230505124337.854845-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505124337.854845-5-jfalempe@redhat.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230505124337.854845-5-jfalempe%40redhat.com
patch subject: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the VRAM
config: i386-randconfig-a013-20230501 (https://download.01.org/0day-ci/archive/20230505/202305052344.TAIFBCMZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b3cab0043427adee56c6f3169cdfa15526dd331c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
        git checkout b3cab0043427adee56c6f3169cdfa15526dd331c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305052344.TAIFBCMZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mgag200/mgag200_dma.c:86:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +86 drivers/gpu/drm/mgag200/mgag200_dma.c

    81	
    82	void mgag200_dma_run_cmd(struct mga_device *mdev)
    83	{
    84		struct drm_device *dev = &mdev->base;
    85		u32 primend;
  > 86		int ret;
    87	
    88		/* Add a last block to trigger the softrap interrupt */
    89		mgag200_dma_add_block(mdev,
    90				MGAREG_DMAPAD, 0,
    91				MGAREG_DMAPAD, 0,
    92				MGAREG_DMAPAD, 0,
    93				MGAREG_SOFTRAP, 0);
    94	
    95		primend = mdev->cmd_handle + mdev->cmd_idx * sizeof(struct mga_cmd_block);
    96	
    97		// Use primary DMA to send the commands
    98		WREG32(MGAREG_PRIMADDR, (u32) mdev->cmd_handle);
    99		WREG32(MGAREG_PRIMEND, primend);
   100		mdev->dma_in_use = 1;
   101	
   102		ret = wait_event_timeout(mdev->waitq, mdev->dma_in_use == 0, HZ);
   103	
   104		if (mdev->dma_in_use) {
   105			drm_err(dev, "DMA transfert timed out\n");
   106			/* something goes wrong, reset the DMA engine */
   107			WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
   108			mdev->dma_in_use = 0;
   109		}
   110	
   111		/* reset command index to start a new sequence */
   112		mdev->cmd_idx = 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
