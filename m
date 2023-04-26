Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323926EEE84
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 08:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C6610E8CD;
	Wed, 26 Apr 2023 06:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E209910E28F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682491725; x=1714027725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r5KFZ650Zsj4Y64nq1ui7ZF+VxLS/X2pG7gHFYtdLVE=;
 b=CUWQwFI+Plz8yl4FqhkdaIS9gEYkUwn3HZhMK8tzrzl++59GjdraYNRV
 uv8gAAUR7abObkEaMMZKSLX6bWPsgqUVH4IjV11BlzcqMsFQ0n62l4q/J
 VKblDQgTDPEzyJTCPYuYg04UDVN2HEDHNhnk2TrfmpDeE+yXThCAscAXr
 cc0YyeRvaq8+Ec7x+QbfO8rh3Is6eMj3ZS5P+jmBB56yIxgArzy68bzIm
 lhHsxLb9nFt3fzWvb66TBmOWMaq7lS7fxcWGSDmy96h/jD/oFhpkcuCJX
 iSHE8GX8hJorC/jfD60fXiBRGULXZIfc8TzK3Un54JhqAl92NZF4GI2ZO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="374969496"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; d="scan'208";a="374969496"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 23:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758479423"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; d="scan'208";a="758479423"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 23:48:42 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1prYxA-0000Dw-15;
 Wed, 26 Apr 2023 06:48:36 +0000
Date: Wed, 26 Apr 2023 14:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
 deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
Message-ID: <202304261419.LvfW9HTa-lkp@intel.com>
References: <20230425142846.730-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425142846.730-6-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master next-20230425]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Return-number-of-bytes-read-or-written/20230425-223011
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230425142846.730-6-tzimmermann%40suse.de
patch subject: [PATCH 5/6] fbdev: Move CFB read and write code into helper functions
config: openrisc-randconfig-s052-20230423 (https://download.01.org/0day-ci/archive/20230426/202304261419.LvfW9HTa-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d4a150f3dfa8e73f2e92f1c7efc9271e17632cc2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-Return-number-of-bytes-read-or-written/20230425-223011
        git checkout d4a150f3dfa8e73f2e92f1c7efc9271e17632cc2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261419.LvfW9HTa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fb_cfb_fops.c:44:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/core/fb_cfb_fops.c:44:39: sparse:     expected void const *src
   drivers/video/fbdev/core/fb_cfb_fops.c:44:39: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
>> drivers/video/fbdev/core/fb_cfb_fops.c:113:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dst @@
   drivers/video/fbdev/core/fb_cfb_fops.c:113:32: sparse:     expected void *dest
   drivers/video/fbdev/core/fb_cfb_fops.c:113:32: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dst

vim +44 drivers/video/fbdev/core/fb_cfb_fops.c

     6	
     7	ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
     8	{
     9		unsigned long p = *ppos;
    10		u8 *buffer, *dst;
    11		u8 __iomem *src;
    12		int c, cnt = 0, err = 0;
    13		unsigned long total_size;
    14	
    15		if (!info->screen_base)
    16			return -ENODEV;
    17	
    18		total_size = info->screen_size;
    19	
    20		if (total_size == 0)
    21			total_size = info->fix.smem_len;
    22	
    23		if (p >= total_size)
    24			return 0;
    25	
    26		if (count >= total_size)
    27			count = total_size;
    28	
    29		if (count + p > total_size)
    30			count = total_size - p;
    31	
    32		buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
    33		if (!buffer)
    34			return -ENOMEM;
    35	
    36		src = (u8 __iomem *)(info->screen_base + p);
    37	
    38		if (info->fbops->fb_sync)
    39			info->fbops->fb_sync(info);
    40	
    41		while (count) {
    42			c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
    43			dst = buffer;
  > 44			fb_memcpy_fromfb(dst, src, c);
    45			dst += c;
    46			src += c;
    47	
    48			if (copy_to_user(buf, buffer, c)) {
    49				err = -EFAULT;
    50				break;
    51			}
    52			*ppos += c;
    53			buf += c;
    54			cnt += c;
    55			count -= c;
    56		}
    57	
    58		kfree(buffer);
    59	
    60		return cnt ? cnt : err;
    61	}
    62	EXPORT_SYMBOL(fb_cfb_read);
    63	
    64	ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
    65	{
    66		unsigned long p = *ppos;
    67		u8 *buffer, *src;
    68		u8 __iomem *dst;
    69		int c, cnt = 0, err = 0;
    70		unsigned long total_size;
    71	
    72		if (!info->screen_base)
    73			return -ENODEV;
    74	
    75		total_size = info->screen_size;
    76	
    77		if (total_size == 0)
    78			total_size = info->fix.smem_len;
    79	
    80		if (p > total_size)
    81			return -EFBIG;
    82	
    83		if (count > total_size) {
    84			err = -EFBIG;
    85			count = total_size;
    86		}
    87	
    88		if (count + p > total_size) {
    89			if (!err)
    90				err = -ENOSPC;
    91	
    92			count = total_size - p;
    93		}
    94	
    95		buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
    96		if (!buffer)
    97			return -ENOMEM;
    98	
    99		dst = (u8 __iomem *)(info->screen_base + p);
   100	
   101		if (info->fbops->fb_sync)
   102			info->fbops->fb_sync(info);
   103	
   104		while (count) {
   105			c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
   106			src = buffer;
   107	
   108			if (copy_from_user(src, buf, c)) {
   109				err = -EFAULT;
   110				break;
   111			}
   112	
 > 113			fb_memcpy_tofb(dst, src, c);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
