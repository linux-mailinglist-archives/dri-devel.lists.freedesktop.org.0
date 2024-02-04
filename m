Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A07848A4F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 02:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291C810FF9C;
	Sun,  4 Feb 2024 01:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoICgZyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3810FF9C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 01:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707011622; x=1738547622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YBgloSPUQGsN79as6MIpLeskAEvLny9XH2Aqu1+NgRw=;
 b=QoICgZykjYgswbKXoqZPltCaNJQHiRWeTf5dlWSjhFQ2ck93MrjlsIhh
 VYRKo9oPg9TBYq+kmrBIqEkutE99zRLY69yXrYp+eZ+YJnFN4eGhmQakr
 3fzfZnjWOhIH1ikylUEPJf4UJLD+JTq95D21Vvt1nfxXtFPnJatIlj/wR
 UaDdNzmB5bmJf9V9IM3hWNvgjyx8leUaGLBMUjYqFbITw8ap1unpk2OjY
 E5PdTeKZ+P8Pobci/u5dOCu8ojyXuacsFANyAQ+sa0g27NK4RGXac4bAl
 yuK8gT7sRmbTOXdbfA06FYr/Vid+Mj+9asZlStp4T1Jn7g46uZHpZgGiw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="263802"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="263802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2024 17:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="622506"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2024 17:53:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rWRhM-0005s2-2v;
 Sun, 04 Feb 2024 01:53:34 +0000
Date: Sun, 4 Feb 2024 09:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
Message-ID: <202402040957.xNqUV75N-lkp@intel.com>
References: <20240202120140.3517-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202120140.3517-3-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/video-Add-helpers-for-decoding-screen_info/20240202-200314
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240202120140.3517-3-tzimmermann%40suse.de
patch subject: [PATCH v2 2/8] video: Provide screen_info_get_pci_dev() to find screen_info's PCI device
config: i386-buildonly-randconfig-004-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040957.xNqUV75N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040957.xNqUV75N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040957.xNqUV75N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/screen_info_pci.c:10:6: warning: variable 'pdev' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      10 |         if (!(res->flags & IORESOURCE_MEM))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/screen_info_pci.c:13:19: note: uninitialized use occurs here
      13 |         for_each_pci_dev(pdev) {
         |                          ^~~~
   include/linux/pci.h:546:80: note: expanded from macro 'for_each_pci_dev'
     546 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   drivers/video/screen_info_pci.c:10:2: note: remove the 'if' if its condition is always true
      10 |         if (!(res->flags & IORESOURCE_MEM))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      11 |                 return NULL;
   drivers/video/screen_info_pci.c:8:22: note: initialize the variable 'pdev' to silence this warning
       8 |         struct pci_dev *pdev;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +10 drivers/video/screen_info_pci.c

     5	
     6	static struct pci_dev *__screen_info_pci_dev(struct resource *res)
     7	{
     8		struct pci_dev *pdev;
     9	
  > 10		if (!(res->flags & IORESOURCE_MEM))
    11			return NULL;
    12	
    13		for_each_pci_dev(pdev) {
    14			const struct resource *r;
    15	
    16			if ((pdev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
    17				continue;
    18	
    19			r = pci_find_resource(pdev, res);
    20			if (r)
    21				return pdev;
    22		}
    23	
    24		return NULL;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
