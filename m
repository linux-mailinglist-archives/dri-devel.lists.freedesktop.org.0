Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E1C88545
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 07:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616FE10E004;
	Wed, 26 Nov 2025 06:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bwqvo+Fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B128410E004
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764140212; x=1795676212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mu/A6WTwOPzOFtjJtzxiGOLlJpJakjKpzGHoz5XkpY4=;
 b=Bwqvo+Fy3LrvkWdZy2XYSj/faMA4orGSKSJvgwVW/x06axBby2B3o6f+
 4ZEws5m8Ksg7p1zEHLZjPmjgawun8WamnN6wyCRhTDnhbfLDDV8enggzz
 zDI27is0mNvN8D3soNE0i42jz13m75l+dgRLoOTtVUxWOW58wt6Elq/6t
 XvywcntXXekJh2ZWETzv3dNdZt5PC4id5fiCLCMsRL6+hdzqx4ty/DpO5
 CLpjnIOvkWlrqxUwKRtT3gAk9Ey8Pfk5QgzqvpSsPjqDqDuDmtt1zpIbT
 P2oAXIGTofEg4qvaVqOXybAN7o2O6r1UjpUZd5CkOnzb+nqqrYQMSkjGA g==;
X-CSE-ConnectionGUID: OClCturSQ1GkVhgbgcoO1Q==
X-CSE-MsgGUID: eS9GN1EfSQGCvqT1vMtE6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77279928"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="77279928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 22:56:52 -0800
X-CSE-ConnectionGUID: o31zWgfrRUqmgMMDa8YZVQ==
X-CSE-MsgGUID: I2GaolsOQWKolPUqR1HrYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="230118861"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d)
 ([10.211.93.152])
 by orviesa001.jf.intel.com with ESMTP; 25 Nov 2025 22:56:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vO9SJ-000000000ej-1a9N;
 Wed, 26 Nov 2025 06:56:47 +0000
Date: Wed, 26 Nov 2025 07:55:50 +0100
From: kernel test robot <lkp@intel.com>
To: ssrane_b23@ee.vjti.ac.in, Zsolt Kajtar <soci@c64.rulez.org>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
Subject: Re: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
Message-ID: <202511260749.KJgv3MyF-lkp@intel.com>
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
[also build test WARNING on linus/master v6.18-rc7 next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ssrane_b23-ee-vjti-ac-in/fbdev-core-Fix-vmalloc-out-of-bounds-in-fb_imageblit/20251119-215054
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251119133821.89998-1-ssranevjti%40gmail.com
patch subject: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251126/202511260749.KJgv3MyF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260749.KJgv3MyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260749.KJgv3MyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/core/cfbimgblt.c:17:
   drivers/video/fbdev/core/fb_imageblit.h: In function 'fb_imageblit':
>> drivers/video/fbdev/core/fb_imageblit.h:490:23: warning: unused variable 'max_offset_bytes' [-Wunused-variable]
     490 |         unsigned long max_offset_bytes;
         |                       ^~~~~~~~~~~~~~~~


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
