Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06437577F24
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C92AF297;
	Mon, 18 Jul 2022 09:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB50AAF28F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658138292; x=1689674292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=grH6/wPiac37Kup7YPmY7aPnwfH8mf17NyOlSAcmCgY=;
 b=lF3ehCJwVPXRHkDGDigzlNeWjNn5jUlPWjc1QfVq4a9/dxfKuwz8R8BH
 5QX+UyhbTCTOn1fyQW0efpRf+JnVmUyTm3o3b0flfhU17/pYbGZYbozl/
 DOIsjdU2jjizsGrXGpQ+Sa3AfQ5aMB68+5HQOYLEhq0L/SXStEJumKQks
 xQsUaj/jVS2U6KwXGYew9Uvw69N/7yTmFBcSk5zaZtW03gFCNAPp7VaFw
 aW6FYIkoscsPKrZlY6e57lZkyfQK3b+mhiIQIz52sNyZXqTC1l3fJpBh5
 XezEfS3g3+kzLHCBynJSKx4tbofgK976ZJeepEzgZOBvR8wpJL65aRFo6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="284938949"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="284938949"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 02:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="924283568"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2022 02:58:09 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oDNVx-0004FW-7w;
 Mon, 18 Jul 2022 09:58:09 +0000
Date: Mon, 18 Jul 2022 17:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Subject: Re: [PATCH v2 05/11] fbdev: Convert drivers to aperture helpers
Message-ID: <202207181701.mB5xBuhX-lkp@intel.com>
References: <20220718072322.8927-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718072322.8927-6-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on ebea934e2651857c9b56cc80bf99460ee18a3592]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Maintain-device-ownership-with-aperture-helpers/20220718-152559
base:   ebea934e2651857c9b56cc80bf99460ee18a3592
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220718/202207181701.mB5xBuhX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/64ab1ffe4e3accdef429db81ec645a1cbad540df
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-Maintain-device-ownership-with-aperture-helpers/20220718-152559
        git checkout 64ab1ffe4e3accdef429db81ec645a1cbad540df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/hyperv_fb.c:1080:26: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
                                               KBUILD_MODNAME, false);
                                                               ^~~~~
   1 warning generated.


vim +1080 drivers/video/fbdev/hyperv_fb.c

3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   987  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   988  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   989  /* Get framebuffer memory from Hyper-V video pci space */
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05   990  static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   991  {
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   992  	struct hvfb_par *par = info->par;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   993  	struct pci_dev *pdev  = NULL;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   994  	void __iomem *fb_virt;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   995  	int gen2vm = efi_enabled(EFI_BOOT);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   996  	phys_addr_t paddr;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   997  	int ret;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   998  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   999  	info->apertures = alloc_apertures(1);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1000  	if (!info->apertures)
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1001  		return -ENOMEM;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1002  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1003  	if (!gen2vm) {
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1004  		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1005  			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1006  		if (!pdev) {
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1007  			pr_err("Unable to find PCI Hyper-V video\n");
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1008  			return -ENODEV;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1009  		}
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1010  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1011  		info->apertures->ranges[0].base = pci_resource_start(pdev, 0);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1012  		info->apertures->ranges[0].size = pci_resource_len(pdev, 0);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1013  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1014  		/*
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1015  		 * For Gen 1 VM, we can directly use the contiguous memory
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1016  		 * from VM. If we succeed, deferred IO happens directly
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1017  		 * on this allocated framebuffer memory, avoiding extra
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1018  		 * memory copy.
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1019  		 */
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1020  		paddr = hvfb_get_phymem(hdev, screen_fb_size);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1021  		if (paddr != (phys_addr_t) -1) {
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1022  			par->mmio_pp = paddr;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1023  			par->mmio_vp = par->dio_vp = __va(paddr);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1024  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1025  			info->fix.smem_start = paddr;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1026  			info->fix.smem_len = screen_fb_size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1027  			info->screen_base = par->mmio_vp;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1028  			info->screen_size = screen_fb_size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1029  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1030  			par->need_docopy = false;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1031  			goto getmem_done;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1032  		}
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1033  		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1034  	} else {
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1035  		info->apertures->ranges[0].base = screen_info.lfb_base;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1036  		info->apertures->ranges[0].size = screen_info.lfb_size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1037  	}
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1038  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1039  	/*
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1040  	 * Cannot use the contiguous physical memory.
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1041  	 * Allocate mmio space for framebuffer.
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1042  	 */
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1043  	dio_fb_size =
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1044  		screen_width * screen_height * screen_depth / 8;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1045  
c4b4d7047f16a8 drivers/video/fbdev/hyperv_fb.c Saurabh Sengar    2022-04-27  1046  	ret = vmbus_allocate_mmio(&par->mem, hdev, 0, -1,
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1047  				  screen_fb_size, 0x100000, true);
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1048  	if (ret != 0) {
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1049  		pr_err("Unable to allocate framebuffer memory\n");
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1050  		goto err1;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1051  	}
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1052  
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1053  	/*
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1054  	 * Map the VRAM cacheable for performance. This is also required for
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1055  	 * VM Connect to display properly for ARM64 Linux VM, as the host also
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1056  	 * maps the VRAM cacheable.
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1057  	 */
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1058  	fb_virt = ioremap_cache(par->mem->start, screen_fb_size);
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1059  	if (!fb_virt)
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1060  		goto err2;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1061  
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1062  	/* Allocate memory for deferred IO */
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1063  	par->dio_vp = vzalloc(round_up(dio_fb_size, PAGE_SIZE));
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1064  	if (par->dio_vp == NULL)
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1065  		goto err3;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1066  
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1067  	/* Physical address of FB device */
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1068  	par->mmio_pp = par->mem->start;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1069  	/* Virtual address of FB device */
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1070  	par->mmio_vp = (unsigned char *) fb_virt;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1071  
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1072  	info->fix.smem_start = par->mem->start;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1073  	info->fix.smem_len = dio_fb_size;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1074  	info->screen_base = par->dio_vp;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1075  	info->screen_size = dio_fb_size;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1076  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1077  getmem_done:
64ab1ffe4e3acc drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-07-18  1078  	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
64ab1ffe4e3acc drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-07-18  1079  					    info->apertures->ranges[0].size,
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09 @1080  					    KBUILD_MODNAME, false);
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1081  
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1082  	if (gen2vm) {
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1083  		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1084  		screen_info.lfb_size = 0;
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1085  		screen_info.lfb_base = 0;
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1086  		screen_info.orig_video_isVGA = 0;
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1087  	} else {
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1088  		pci_dev_put(pdev);
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1089  	}
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1090  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1091  	return 0;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1092  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1093  err3:
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1094  	iounmap(fb_virt);
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1095  err2:
696ca5e82c057a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2016-04-05  1096  	vmbus_free_mmio(par->mem->start, screen_fb_size);
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1097  	par->mem = NULL;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1098  err1:
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1099  	if (!gen2vm)
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1100  		pci_dev_put(pdev);
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1101  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1102  	return -ENOMEM;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1103  }
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1104  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
