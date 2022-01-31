Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB24A5345
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36C610E47E;
	Mon, 31 Jan 2022 23:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530910E456;
 Mon, 31 Jan 2022 23:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643671929; x=1675207929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s4qd5/3eVmC0zxoBFfHu2I1L/M6RmoRcjQxyASVjkfo=;
 b=k3nIZwPTL2bOHecEr2IoH37jGHioqdaTbDnR/kUhqz/hA59QkU1P3V51
 FaVsIOjGSmc6EoX2wpjAUXFjmzK7qd9oyh8KIdnXyZZwQxVp/4m9fYLMi
 +6wYrOX2nt3MyQA1PUdz2fZz217SW3zXdBcURl8hXi85SnHXyZWRI4cTQ
 1gXJTwNdCfz5f3KhfFh7+LSc8+hxAYB1VlJuZbhwPgof89ZOHHOSI/jB2
 O/EWPqtd2ZcFW24eZJwB4FyK2WVjZuqIQ31nEARXhUdxdsB1UCiX7elnA
 4GCBcZUwS62j9+miXKAjwfT05b+kfm6mJCVKc61SaulHWUPq/Ad9FK4dK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="308307264"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="308307264"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 15:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="619554614"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Jan 2022 15:31:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEg9K-000SSc-AF; Mon, 31 Jan 2022 23:31:54 +0000
Date: Tue, 1 Feb 2022 07:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 13/21] fbcon: move more common code into
 fb_open()
Message-ID: <202202010613.HT19HztX-lkp@intel.com>
References: <20220131210552.482606-14-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-14-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[also build test WARNING on drm/drm-next linus/master v5.17-rc2 next-20220131]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/some-fbcon-patches-mostly-locking/20220201-050907
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220201/202202010613.HT19HztX-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7a27c0ce71acfa8b67787d298de9836376fcc323
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Vetter/some-fbcon-patches-mostly-locking/20220201-050907
        git checkout 7a27c0ce71acfa8b67787d298de9836376fcc323
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c: In function 'con2fb_acquire_newinfo':
>> drivers/video/fbdev/core/fbcon.c:721:27: warning: variable 'ops' set but not used [-Wunused-but-set-variable]
     721 |         struct fbcon_ops *ops = NULL;
         |                           ^~~


vim +/ops +721 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  717  
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  718  static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
7a27c0ce71acfa8 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-01-31  719  				  int unit)
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  720  {
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16 @721  	struct fbcon_ops *ops = NULL;
ba35a78b17408b6 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-01-31  722  	int err;
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  723  
ba35a78b17408b6 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-01-31  724  	err = fbcon_open(info);
ba35a78b17408b6 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-01-31  725  	if (err)
ba35a78b17408b6 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-01-31  726  		return err;
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  727  
7a27c0ce71acfa8 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-01-31  728  	ops = info->fbcon_par;
d1baa4ffa677bf6 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  729  
d1baa4ffa677bf6 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  730  	if (vc)
b73deed32d08740 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-01-09  731  		set_blitting_type(vc, info);
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  732  
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  733  	return err;
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  734  }
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  735  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
