Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263B0C731B5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A989A89854;
	Thu, 20 Nov 2025 09:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPf2MM1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B9489854
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763630691; x=1795166691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OPjNc/gUByCFqZ8Vixc1KLela/ta95EHDRNxS4C1lGg=;
 b=SPf2MM1xLa+vJHVeSH9Ay7RxnZaDNcv48c8ie25+RGkymxyX4lDko4ll
 QaNOyu8IvBXP9Ar0H5wF2yHwuYGUM3yLIghaxtza6kqAjYCSrQE9W8h8d
 tBYLlD7YYTZ949FdD4MDrrr2+hm1NVCeDKdQpl0btH5DHrv1RQ/gayzhf
 cHToiwayvLt2YNuVUPPlgNIA9qw34xiFIVUNekp3qepVGNcbDYMEDrrBS
 SzlV2vtYKExvvqw0lwKxj9rJNBmsj8uBtdZhp0F0t8H6UAwBfhv2xbbVd
 P5swZKX7qT1GY7YwM6QVS+1rrvPzlK50elTgcUS43MQQkbhKsru7baPGP w==;
X-CSE-ConnectionGUID: Bmgahkc7Q82EX41p1t9dqA==
X-CSE-MsgGUID: cUqR0lzhSZOFV/HEfYnIXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65572015"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65572015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:24:51 -0800
X-CSE-ConnectionGUID: c33I7xXpT0ibIp+AOLBl8w==
X-CSE-MsgGUID: 2SrIl1SnRwWseOQT7lVhaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221957870"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 01:24:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vM0uD-0003oF-2q;
 Thu, 20 Nov 2025 09:24:45 +0000
Date: Thu, 20 Nov 2025 17:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: ssrane_b23@ee.vjti.ac.in, Zsolt Kajtar <soci@c64.rulez.org>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
Subject: Re: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
Message-ID: <202511201752.4fVbQwPc-lkp@intel.com>
References: <20251119133821.89998-1-ssranevjti@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119133821.89998-1-ssranevjti@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ssrane_b23-ee-vjti-ac-in/fbdev-core-Fix-vmalloc-out-of-bounds-in-fb_imageblit/20251119-215054
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251119133821.89998-1-ssranevjti%40gmail.com
patch subject: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
config: nios2-randconfig-r073-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201752.4fVbQwPc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201752.4fVbQwPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201752.4fVbQwPc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/core/cfbimgblt.c:17:
   drivers/video/fbdev/core/fb_imageblit.h: In function 'fb_imageblit':
>> drivers/video/fbdev/core/fb_imageblit.h:490:16: warning: unused variable 'max_offset_bytes' [-Wunused-variable]
     490 |  unsigned long max_offset_bytes;
         |                ^~~~~~~~~~~~~~~~


vim +/max_offset_bytes +490 drivers/video/fbdev/core/fb_imageblit.h

   480	
   481	static inline void fb_imageblit(struct fb_info *p, const struct fb_image *image)
   482	{
   483		int bpp = p->var.bits_per_pixel;
   484		unsigned int bits_per_line = BYTES_TO_BITS(p->fix.line_length);
   485		struct fb_address dst = fb_address_init(p);
   486		struct fb_reverse reverse = fb_reverse_init(p);
   487		const u32 *palette = fb_palette(p);
   488		struct fb_image clipped_image;
   489		u32 max_x, max_y;
 > 490		unsigned long max_offset_bytes;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
