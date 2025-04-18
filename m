Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0859A937BF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 15:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5DA10E081;
	Fri, 18 Apr 2025 13:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Euc+PLWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC4910E081
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744982199; x=1776518199;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oHTmMYNpUzP3hjBBvsociNlKd/2+ZI5/nnpgJJMMtbc=;
 b=Euc+PLWy7ofroiqDYJJbEzDNyZrqo5QjXeJTUYb18u1XczEy2F1EgTT6
 yXf3Co5Zzl37GBXnTlcx8Z+zGeTSrnoTyDkWUuKeCHvNZq2TreEUz1cv5
 JDaTPsYcy9g0oav1g89P2loBNXYcLPATNZYI9/6DNnNvMx/3Wpa27EVet
 pxPwOBRxyS4h6dVJxkjwe251+7bKM3PEIM86LExk5gh8nlhWav+mmJuU8
 L8jRUcwmzj4liue2D0qgvuXOATtux0/KRtieS9kXWHRcdU/2ql2dI9/Xg
 fczqlbiQaWYLm/r8CUFKPJ4oZ9JUqyxlEiL8PUXDSEWDQT4WZaXXRQz+2 Q==;
X-CSE-ConnectionGUID: xTfPdJoxRP+8o4d2yEb0JQ==
X-CSE-MsgGUID: 922kVMU8TIudfjzfOk9EVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50408675"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50408675"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 06:16:31 -0700
X-CSE-ConnectionGUID: eD82im4WRH2yse43yVyjjw==
X-CSE-MsgGUID: nVktaCjOS62QoTJa4JNmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="135209556"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 18 Apr 2025 06:16:28 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u5lZx-0002sJ-24;
 Fri, 18 Apr 2025 13:16:25 +0000
Date: Fri, 18 Apr 2025 21:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/vmgfx: Use non-hybrid PCI devres API
Message-ID: <202504182115.mqoLn7FU-lkp@intel.com>
References: <20250417105931.32716-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417105931.32716-2-phasta@kernel.org>
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

Hi Philipp,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-vmgfx-Use-non-hybrid-PCI-devres-API/20250417-192714
base:   linus/master
patch link:    https://lore.kernel.org/r/20250417105931.32716-2-phasta%40kernel.org
patch subject: [PATCH] drm/vmgfx: Use non-hybrid PCI devres API
config: i386-buildonly-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504182115.mqoLn7FU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504182115.mqoLn7FU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504182115.mqoLn7FU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:856:18: warning: unused variable 'pdev' [-Wunused-variable]
     856 |         struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
         |                         ^~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1179:18: warning: unused variable 'pdev' [-Wunused-variable]
    1179 |         struct pci_dev *pdev = to_pci_dev(dev->dev);
         |                         ^~~~
   2 warnings generated.


vim +/pdev +856 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c

9e931f2e09701e Maaz Mombasawala  2022-10-22   850  
8772c0bb58bbf9 Zack Rusin        2020-11-04   851  static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
8772c0bb58bbf9 Zack Rusin        2020-11-04   852  {
8772c0bb58bbf9 Zack Rusin        2020-11-04   853  	int ret;
c0951b797e7d0f Thomas Hellstrom  2012-11-20   854  	enum vmw_res_type i;
d92d985177c495 Thomas Hellstrom  2013-10-24   855  	bool refuse_dma = false;
9703bb32920625 Zack Rusin        2020-11-03  @856  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   857  
9e931f2e09701e Maaz Mombasawala  2022-10-22   858  	vmw_sw_context_init(dev_priv);
9e931f2e09701e Maaz Mombasawala  2022-10-22   859  
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   860  	mutex_init(&dev_priv->cmdbuf_mutex);
173fb7d4e26705 Thomas Hellstrom  2013-10-08   861  	mutex_init(&dev_priv->binding_mutex);
13289241fe8b8c Thomas Hellstrom  2018-09-26   862  	spin_lock_init(&dev_priv->resource_lock);
496eb6fd2c3fd1 Thomas Hellstrom  2015-01-14   863  	spin_lock_init(&dev_priv->hw_lock);
496eb6fd2c3fd1 Thomas Hellstrom  2015-01-14   864  	spin_lock_init(&dev_priv->waiter_lock);
36cc79bc907731 Sinclair Yeh      2017-03-23   865  	spin_lock_init(&dev_priv->cursor_lock);
c0951b797e7d0f Thomas Hellstrom  2012-11-20   866  
68ce556bd16434 Zack Rusin        2021-03-22   867  	ret = vmw_setup_pci_resources(dev_priv, pci_id);
68ce556bd16434 Zack Rusin        2021-03-22   868  	if (ret)
68ce556bd16434 Zack Rusin        2021-03-22   869  		return ret;
68ce556bd16434 Zack Rusin        2021-03-22   870  	ret = vmw_detect_version(dev_priv);
68ce556bd16434 Zack Rusin        2021-03-22   871  	if (ret)
bdea0942fec95e Philipp Stanner   2025-04-17   872  		return ret;
68ce556bd16434 Zack Rusin        2021-03-22   873  
68ce556bd16434 Zack Rusin        2021-03-22   874  
c0951b797e7d0f Thomas Hellstrom  2012-11-20   875  	for (i = vmw_res_context; i < vmw_res_max; ++i) {
aec70c39129de1 Deepak R Varma    2020-11-06   876  		idr_init_base(&dev_priv->res_idr[i], 1);
c0951b797e7d0f Thomas Hellstrom  2012-11-20   877  		INIT_LIST_HEAD(&dev_priv->res_lru[i]);
c0951b797e7d0f Thomas Hellstrom  2012-11-20   878  	}
c0951b797e7d0f Thomas Hellstrom  2012-11-20   879  
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   880  	init_waitqueue_head(&dev_priv->fence_queue);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   881  	init_waitqueue_head(&dev_priv->fifo_queue);
4f73a96bd76914 Thomas Hellstrom  2011-09-01   882  	dev_priv->fence_queue_waiters = 0;
d2e8851a909c76 Thomas Hellstrom  2015-10-28   883  	dev_priv->fifo_queue_waiters = 0;
c0951b797e7d0f Thomas Hellstrom  2012-11-20   884  
5bb39e81816978 Thomas Hellstrom  2011-10-04   885  	dev_priv->used_memory_size = 0;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   886  
04319d89fbec72 Sinclair Yeh      2016-06-29   887  	dev_priv->assume_16bpp = !!vmw_assume_16bpp;
04319d89fbec72 Sinclair Yeh      2016-06-29   888  
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   889  	dev_priv->capabilities = vmw_read(dev_priv, SVGA_REG_CAPABILITIES);
af326e28380ab8 Zack Rusin        2022-03-02   890  	vmw_print_bitmap(&dev_priv->drm, "Capabilities",
af326e28380ab8 Zack Rusin        2022-03-02   891  			 dev_priv->capabilities,
af326e28380ab8 Zack Rusin        2022-03-02   892  			 cap1_names, ARRAY_SIZE(cap1_names));
3b4c2511c00452 Neha Bhende       2018-06-18   893  	if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER) {
3b4c2511c00452 Neha Bhende       2018-06-18   894  		dev_priv->capabilities2 = vmw_read(dev_priv, SVGA_REG_CAP2);
af326e28380ab8 Zack Rusin        2022-03-02   895  		vmw_print_bitmap(&dev_priv->drm, "Capabilities2",
af326e28380ab8 Zack Rusin        2022-03-02   896  				 dev_priv->capabilities2,
af326e28380ab8 Zack Rusin        2022-03-02   897  				 cap2_names, ARRAY_SIZE(cap2_names));
3b4c2511c00452 Neha Bhende       2018-06-18   898  	}
3b4c2511c00452 Neha Bhende       2018-06-18   899  
35d86fb626a255 Zack Rusin        2023-03-20   900  	if (!vmwgfx_supported(dev_priv)) {
35d86fb626a255 Zack Rusin        2023-03-20   901  		vmw_disable_backdoor();
35d86fb626a255 Zack Rusin        2023-03-20   902  		drm_err_once(&dev_priv->drm,
35d86fb626a255 Zack Rusin        2023-03-20   903  			     "vmwgfx seems to be running on an unsupported hypervisor.");
35d86fb626a255 Zack Rusin        2023-03-20   904  		drm_err_once(&dev_priv->drm,
35d86fb626a255 Zack Rusin        2023-03-20   905  			     "This configuration is likely broken.");
35d86fb626a255 Zack Rusin        2023-03-20   906  		drm_err_once(&dev_priv->drm,
35d86fb626a255 Zack Rusin        2023-03-20   907  			     "Please switch to a supported graphics device to avoid problems.");
35d86fb626a255 Zack Rusin        2023-03-20   908  	}
35d86fb626a255 Zack Rusin        2023-03-20   909  
cd2eb57df1b8bb Zack Rusin        2024-04-11   910  	vmw_vkms_init(dev_priv);
cd2eb57df1b8bb Zack Rusin        2024-04-11   911  
d92d985177c495 Thomas Hellstrom  2013-10-24   912  	ret = vmw_dma_select_mode(dev_priv);
d92d985177c495 Thomas Hellstrom  2013-10-24   913  	if (unlikely(ret != 0)) {
2b273544f5800a Zack Rusin        2021-07-23   914  		drm_info(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23   915  			 "Restricting capabilities since DMA not available.\n");
d92d985177c495 Thomas Hellstrom  2013-10-24   916  		refuse_dma = true;
81a00960d3fa83 Thomas Hellstrom  2020-01-15   917  		if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS)
2b273544f5800a Zack Rusin        2021-07-23   918  			drm_info(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23   919  				 "Disabling 3D acceleration.\n");
d92d985177c495 Thomas Hellstrom  2013-10-24   920  	}
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   921  
5bb39e81816978 Thomas Hellstrom  2011-10-04   922  	dev_priv->vram_size = vmw_read(dev_priv, SVGA_REG_VRAM_SIZE);
be4f77ac68843f Zack Rusin        2020-11-04   923  	dev_priv->fifo_mem_size = vmw_read(dev_priv, SVGA_REG_MEM_SIZE);
5bb39e81816978 Thomas Hellstrom  2011-10-04   924  	dev_priv->fb_max_width = vmw_read(dev_priv, SVGA_REG_MAX_WIDTH);
5bb39e81816978 Thomas Hellstrom  2011-10-04   925  	dev_priv->fb_max_height = vmw_read(dev_priv, SVGA_REG_MAX_HEIGHT);
eb4f923b1ceac8 Jakob Bornecrantz 2012-02-09   926  
eb4f923b1ceac8 Jakob Bornecrantz 2012-02-09   927  	vmw_get_initial_size(dev_priv);
eb4f923b1ceac8 Jakob Bornecrantz 2012-02-09   928  
0d00c488f3de59 Thomas Hellstrom  2014-01-15   929  	if (dev_priv->capabilities & SVGA_CAP_GMR2) {
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   930  		dev_priv->max_gmr_ids =
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   931  			vmw_read(dev_priv, SVGA_REG_GMR_MAX_IDS);
fb17f18993071c Thomas Hellstrom  2011-08-31   932  		dev_priv->max_gmr_pages =
fb17f18993071c Thomas Hellstrom  2011-08-31   933  			vmw_read(dev_priv, SVGA_REG_GMRS_MAX_PAGES);
fb17f18993071c Thomas Hellstrom  2011-08-31   934  		dev_priv->memory_size =
fb17f18993071c Thomas Hellstrom  2011-08-31   935  			vmw_read(dev_priv, SVGA_REG_MEMORY_SIZE);
5bb39e81816978 Thomas Hellstrom  2011-10-04   936  		dev_priv->memory_size -= dev_priv->vram_size;
5bb39e81816978 Thomas Hellstrom  2011-10-04   937  	} else {
5bb39e81816978 Thomas Hellstrom  2011-10-04   938  		/*
5bb39e81816978 Thomas Hellstrom  2011-10-04   939  		 * An arbitrary limit of 512MiB on surface
5bb39e81816978 Thomas Hellstrom  2011-10-04   940  		 * memory. But all HWV8 hardware supports GMR2.
5bb39e81816978 Thomas Hellstrom  2011-10-04   941  		 */
5bb39e81816978 Thomas Hellstrom  2011-10-04   942  		dev_priv->memory_size = 512*1024*1024;
fb17f18993071c Thomas Hellstrom  2011-08-31   943  	}
6da768aa66d2df Thomas Hellstrom  2012-11-21   944  	dev_priv->max_mob_pages = 0;
857aea1c576938 Charmaine Lee     2014-02-12   945  	dev_priv->max_mob_size = 0;
6da768aa66d2df Thomas Hellstrom  2012-11-21   946  	if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS) {
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   947  		uint64_t mem_size;
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   948  
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   949  		if (dev_priv->capabilities2 & SVGA_CAP2_GB_MEMSIZE_2)
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   950  			mem_size = vmw_read(dev_priv,
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   951  					    SVGA_REG_GBOBJECT_MEM_SIZE_KB);
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   952  		else
7ebb47c9f9abf4 Deepak Rawat      2019-05-03   953  			mem_size =
6da768aa66d2df Thomas Hellstrom  2012-11-21   954  				vmw_read(dev_priv,
6da768aa66d2df Thomas Hellstrom  2012-11-21   955  					 SVGA_REG_SUGGESTED_GBOBJECT_MEM_SIZE_KB);
6da768aa66d2df Thomas Hellstrom  2012-11-21   956  
6da768aa66d2df Thomas Hellstrom  2012-11-21   957  		dev_priv->max_mob_pages = mem_size * 1024 / PAGE_SIZE;
ebc9ac7c3dfe85 Zack Rusin        2021-06-15   958  		dev_priv->max_primary_mem =
ebc9ac7c3dfe85 Zack Rusin        2021-06-15   959  			vmw_read(dev_priv, SVGA_REG_MAX_PRIMARY_MEM);
857aea1c576938 Charmaine Lee     2014-02-12   960  		dev_priv->max_mob_size =
857aea1c576938 Charmaine Lee     2014-02-12   961  			vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
35c051258e8fd7 Sinclair Yeh      2015-06-26   962  		dev_priv->stdu_max_width =
35c051258e8fd7 Sinclair Yeh      2015-06-26   963  			vmw_read(dev_priv, SVGA_REG_SCREENTARGET_MAX_WIDTH);
35c051258e8fd7 Sinclair Yeh      2015-06-26   964  		dev_priv->stdu_max_height =
35c051258e8fd7 Sinclair Yeh      2015-06-26   965  			vmw_read(dev_priv, SVGA_REG_SCREENTARGET_MAX_HEIGHT);
35c051258e8fd7 Sinclair Yeh      2015-06-26   966  
35c051258e8fd7 Sinclair Yeh      2015-06-26   967  		vmw_write(dev_priv, SVGA_REG_DEV_CAP,
35c051258e8fd7 Sinclair Yeh      2015-06-26   968  			  SVGA3D_DEVCAP_MAX_TEXTURE_WIDTH);
35c051258e8fd7 Sinclair Yeh      2015-06-26   969  		dev_priv->texture_max_width = vmw_read(dev_priv,
35c051258e8fd7 Sinclair Yeh      2015-06-26   970  						       SVGA_REG_DEV_CAP);
35c051258e8fd7 Sinclair Yeh      2015-06-26   971  		vmw_write(dev_priv, SVGA_REG_DEV_CAP,
35c051258e8fd7 Sinclair Yeh      2015-06-26   972  			  SVGA3D_DEVCAP_MAX_TEXTURE_HEIGHT);
35c051258e8fd7 Sinclair Yeh      2015-06-26   973  		dev_priv->texture_max_height = vmw_read(dev_priv,
35c051258e8fd7 Sinclair Yeh      2015-06-26   974  							SVGA_REG_DEV_CAP);
df45e9d410fc07 Thomas Hellstrom  2015-08-12   975  	} else {
df45e9d410fc07 Thomas Hellstrom  2015-08-12   976  		dev_priv->texture_max_width = 8192;
df45e9d410fc07 Thomas Hellstrom  2015-08-12   977  		dev_priv->texture_max_height = 8192;
ebc9ac7c3dfe85 Zack Rusin        2021-06-15   978  		dev_priv->max_primary_mem = dev_priv->vram_size;
df45e9d410fc07 Thomas Hellstrom  2015-08-12   979  	}
cfdc3458db8a16 Zack Rusin        2021-07-23   980  	drm_info(&dev_priv->drm,
a54a200f3dc710 Ian Forbes        2024-05-21   981  		 "Legacy memory limits: VRAM = %llu KiB, FIFO = %llu KiB, surface = %u KiB\n",
cfdc3458db8a16 Zack Rusin        2021-07-23   982  		 (u64)dev_priv->vram_size / 1024,
cfdc3458db8a16 Zack Rusin        2021-07-23   983  		 (u64)dev_priv->fifo_mem_size / 1024,
cfdc3458db8a16 Zack Rusin        2021-07-23   984  		 dev_priv->memory_size / 1024);
cfdc3458db8a16 Zack Rusin        2021-07-23   985  
cfdc3458db8a16 Zack Rusin        2021-07-23   986  	drm_info(&dev_priv->drm,
a54a200f3dc710 Ian Forbes        2024-05-21   987  		 "MOB limits: max mob size = %u KiB, max mob pages = %u\n",
cfdc3458db8a16 Zack Rusin        2021-07-23   988  		 dev_priv->max_mob_size / 1024, dev_priv->max_mob_pages);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   989  
0d00c488f3de59 Thomas Hellstrom  2014-01-15   990  	ret = vmw_dma_masks(dev_priv);
496eb6fd2c3fd1 Thomas Hellstrom  2015-01-14   991  	if (unlikely(ret != 0))
0d00c488f3de59 Thomas Hellstrom  2014-01-15   992  		goto out_err0;
0d00c488f3de59 Thomas Hellstrom  2014-01-15   993  
9703bb32920625 Zack Rusin        2020-11-03   994  	dma_set_max_seg_size(dev_priv->drm.dev, U32_MAX);
39916897cd815a Qian Cai          2019-06-03   995  
0d00c488f3de59 Thomas Hellstrom  2014-01-15   996  	if (dev_priv->capabilities & SVGA_CAP_GMR2) {
2b273544f5800a Zack Rusin        2021-07-23   997  		drm_info(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23   998  			 "Max GMR ids is %u\n",
fb1d9738ca053e Jakob Bornecrantz 2009-12-10   999  			 (unsigned)dev_priv->max_gmr_ids);
2b273544f5800a Zack Rusin        2021-07-23  1000  		drm_info(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1001  			 "Max number of GMR pages is %u\n",
fb17f18993071c Thomas Hellstrom  2011-08-31  1002  			 (unsigned)dev_priv->max_gmr_pages);
fb17f18993071c Thomas Hellstrom  2011-08-31  1003  	}
2b273544f5800a Zack Rusin        2021-07-23  1004  	drm_info(&dev_priv->drm,
a54a200f3dc710 Ian Forbes        2024-05-21  1005  		 "Maximum display memory size is %llu KiB\n",
ebc9ac7c3dfe85 Zack Rusin        2021-06-15  1006  		 (uint64_t)dev_priv->max_primary_mem / 1024);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1007  
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1008  	/* Need mmio memory to check for fifo pitchlock cap. */
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1009  	if (!(dev_priv->capabilities & SVGA_CAP_DISPLAY_TOPOLOGY) &&
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1010  	    !(dev_priv->capabilities & SVGA_CAP_PITCHLOCK) &&
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1011  	    !vmw_fifo_have_pitchlock(dev_priv)) {
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1012  		ret = -ENOSYS;
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1013  		DRM_ERROR("Hardware has no pitchlock\n");
be4f77ac68843f Zack Rusin        2020-11-04  1014  		goto out_err0;
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1015  	}
d7e1958dbe4a7b Jakob Bornecrantz 2010-05-28  1016  
931e09d8d5b4aa Maaz Mombasawala  2022-10-22  1017  	dev_priv->tdev = ttm_object_device_init(&vmw_prime_dmabuf_ops);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1018  
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1019  	if (unlikely(dev_priv->tdev == NULL)) {
2b273544f5800a Zack Rusin        2021-07-23  1020  		drm_err(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1021  			"Unable to initialize TTM object management.\n");
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1022  		ret = -ENOMEM;
be4f77ac68843f Zack Rusin        2020-11-04  1023  		goto out_err0;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1024  	}
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1025  
506ff75c92a44d Thomas Hellstrom  2012-11-09  1026  	if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
32160e6a98f33c Zack Rusin        2022-03-07  1027  		ret = vmw_irq_install(dev_priv);
506ff75c92a44d Thomas Hellstrom  2012-11-09  1028  		if (ret != 0) {
2b273544f5800a Zack Rusin        2021-07-23  1029  			drm_err(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1030  				"Failed installing irq: %d\n", ret);
506ff75c92a44d Thomas Hellstrom  2012-11-09  1031  			goto out_no_irq;
506ff75c92a44d Thomas Hellstrom  2012-11-09  1032  		}
506ff75c92a44d Thomas Hellstrom  2012-11-09  1033  	}
506ff75c92a44d Thomas Hellstrom  2012-11-09  1034  
ae2a104058e217 Thomas Hellstrom  2011-09-01  1035  	dev_priv->fman = vmw_fence_manager_init(dev_priv);
14bbf20c8839eb Wei Yongjun       2013-08-26  1036  	if (unlikely(dev_priv->fman == NULL)) {
14bbf20c8839eb Wei Yongjun       2013-08-26  1037  		ret = -ENOMEM;
ae2a104058e217 Thomas Hellstrom  2011-09-01  1038  		goto out_no_fman;
14bbf20c8839eb Wei Yongjun       2013-08-26  1039  	}
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1040  
8af8a109b34fa8 Christian König   2020-10-01  1041  	ret = ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
9703bb32920625 Zack Rusin        2020-11-03  1042  			      dev_priv->drm.dev,
9703bb32920625 Zack Rusin        2020-11-03  1043  			      dev_priv->drm.anon_inode->i_mapping,
298799a28264ce Zack Rusin        2022-04-20  1044  			      dev_priv->drm.vma_offset_manager,
ee5d2a8e549e90 Christian König   2020-10-24  1045  			      dev_priv->map_mode == vmw_dma_alloc_coherent,
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1046  			      false);
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1047  	if (unlikely(ret != 0)) {
2b273544f5800a Zack Rusin        2021-07-23  1048  		drm_err(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1049  			"Failed initializing TTM buffer object driver.\n");
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1050  		goto out_no_bdev;
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1051  	}
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1052  
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1053  	/*
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1054  	 * Enable VRAM, but initially don't use it until SVGA is enabled and
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1055  	 * unhidden.
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1056  	 */
252f8d7b917464 Dave Airlie       2020-08-04  1057  
252f8d7b917464 Dave Airlie       2020-08-04  1058  	ret = vmw_vram_manager_init(dev_priv);
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1059  	if (unlikely(ret != 0)) {
2b273544f5800a Zack Rusin        2021-07-23  1060  		drm_err(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1061  			"Failed initializing memory manager for VRAM.\n");
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1062  		goto out_no_vram;
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1063  	}
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1064  
d92223ead97cd6 Zack Rusin        2021-06-09  1065  	ret = vmw_devcaps_create(dev_priv);
d92223ead97cd6 Zack Rusin        2021-06-09  1066  	if (unlikely(ret != 0)) {
2b273544f5800a Zack Rusin        2021-07-23  1067  		drm_err(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1068  			"Failed initializing device caps.\n");
d92223ead97cd6 Zack Rusin        2021-06-09  1069  		goto out_no_vram;
d92223ead97cd6 Zack Rusin        2021-06-09  1070  	}
d92223ead97cd6 Zack Rusin        2021-06-09  1071  
3629ca5dfb9ab5 Christian König   2020-07-23  1072  	/*
3629ca5dfb9ab5 Christian König   2020-07-23  1073  	 * "Guest Memory Regions" is an aperture like feature with
3629ca5dfb9ab5 Christian König   2020-07-23  1074  	 *  one slot per bo. There is an upper limit of the number of
3629ca5dfb9ab5 Christian König   2020-07-23  1075  	 *  slots as well as the bo size.
3629ca5dfb9ab5 Christian König   2020-07-23  1076  	 */
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1077  	dev_priv->has_gmr = true;
3629ca5dfb9ab5 Christian König   2020-07-23  1078  	/* TODO: This is most likely not correct */
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1079  	if (((dev_priv->capabilities & (SVGA_CAP_GMR | SVGA_CAP_GMR2)) == 0) ||
621617780a62ba Dave Airlie       2020-08-04  1080  	    refuse_dma ||
621617780a62ba Dave Airlie       2020-08-04  1081  	    vmw_gmrid_man_init(dev_priv, VMW_PL_GMR) != 0) {
2b273544f5800a Zack Rusin        2021-07-23  1082  		drm_info(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1083  			  "No GMR memory available. "
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1084  			 "Graphics memory resources are very limited.\n");
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1085  		dev_priv->has_gmr = false;
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1086  	}
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1087  
81a00960d3fa83 Thomas Hellstrom  2020-01-15  1088  	if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS && !refuse_dma) {
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1089  		dev_priv->has_mob = true;
621617780a62ba Dave Airlie       2020-08-04  1090  
621617780a62ba Dave Airlie       2020-08-04  1091  		if (vmw_gmrid_man_init(dev_priv, VMW_PL_MOB) != 0) {
2b273544f5800a Zack Rusin        2021-07-23  1092  			drm_info(&dev_priv->drm,
2b273544f5800a Zack Rusin        2021-07-23  1093  				 "No MOB memory available. "
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1094  				 "3D will be disabled.\n");
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1095  			dev_priv->has_mob = false;
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1096  		}
f6be23264bbac8 Zack Rusin        2021-11-05  1097  		if (vmw_sys_man_init(dev_priv) != 0) {
f6be23264bbac8 Zack Rusin        2021-11-05  1098  			drm_info(&dev_priv->drm,
f6be23264bbac8 Zack Rusin        2021-11-05  1099  				 "No MOB page table memory available. "
f6be23264bbac8 Zack Rusin        2021-11-05  1100  				 "3D will be disabled.\n");
f6be23264bbac8 Zack Rusin        2021-11-05  1101  			dev_priv->has_mob = false;
f6be23264bbac8 Zack Rusin        2021-11-05  1102  		}
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1103  	}
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1104  
ef7c7b7497d6ab Deepak Rawat      2018-12-13  1105  	if (dev_priv->has_mob && (dev_priv->capabilities & SVGA_CAP_DX)) {
d92223ead97cd6 Zack Rusin        2021-06-09  1106  		if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_DXCONTEXT))
878c6ecd3e24dc Deepak Rawat      2018-12-13  1107  			dev_priv->sm_type = VMW_SM_4;
d80efd5cb3dec1 Thomas Hellstrom  2015-08-10  1108  	}
d80efd5cb3dec1 Thomas Hellstrom  2015-08-10  1109  
878c6ecd3e24dc Deepak Rawat      2018-12-13  1110  	/* SVGA_CAP2_DX2 (DefineGBSurface_v3) is needed for SM4_1 support */
878c6ecd3e24dc Deepak Rawat      2018-12-13  1111  	if (has_sm4_context(dev_priv) &&
878c6ecd3e24dc Deepak Rawat      2018-12-13  1112  	    (dev_priv->capabilities2 & SVGA_CAP2_DX2)) {
d92223ead97cd6 Zack Rusin        2021-06-09  1113  		if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_SM41))
878c6ecd3e24dc Deepak Rawat      2018-12-13  1114  			dev_priv->sm_type = VMW_SM_4_1;
4dec28053ba0a1 Deepak Rawat      2018-12-13  1115  		if (has_sm4_1_context(dev_priv) &&
4dec28053ba0a1 Deepak Rawat      2018-12-13  1116  				(dev_priv->capabilities2 & SVGA_CAP2_DX3)) {
4fb9326b96cbf9 Zack Rusin        2021-12-06  1117  			if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_SM5)) {
4dec28053ba0a1 Deepak Rawat      2018-12-13  1118  				dev_priv->sm_type = VMW_SM_5;
4fb9326b96cbf9 Zack Rusin        2021-12-06  1119  				if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_GL43))
4fb9326b96cbf9 Zack Rusin        2021-12-06  1120  					dev_priv->sm_type = VMW_SM_5_1X;
4fb9326b96cbf9 Zack Rusin        2021-12-06  1121  			}
4dec28053ba0a1 Deepak Rawat      2018-12-13  1122  		}
878c6ecd3e24dc Deepak Rawat      2018-12-13  1123  	}
878c6ecd3e24dc Deepak Rawat      2018-12-13  1124  
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1125  	ret = vmw_kms_init(dev_priv);
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1126  	if (unlikely(ret != 0))
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1127  		goto out_no_kms;
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1128  	vmw_overlay_init(dev_priv);
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1129  
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1130  	ret = vmw_request_device(dev_priv);
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1131  	if (ret)
506ff75c92a44d Thomas Hellstrom  2012-11-09  1132  		goto out_no_fifo;
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1133  
2b273544f5800a Zack Rusin        2021-07-23  1134  	vmw_print_sm_type(dev_priv);
523375c943e51a Zack Rusin        2021-05-04  1135  	vmw_host_printf("vmwgfx: Module Version: %d.%d.%d (kernel: %s)",
f921791314811a Sinclair Yeh      2016-04-27  1136  			VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
523375c943e51a Zack Rusin        2021-05-04  1137  			VMWGFX_DRIVER_PATCHLEVEL, UTS_RELEASE);
7f4c33778686cc Zack Rusin        2022-10-22  1138  	vmw_write_driver_id(dev_priv);
f921791314811a Sinclair Yeh      2016-04-27  1139  
d9f36a0051b7c0 Thomas Hellstrom  2010-01-13  1140  	dev_priv->pm_nb.notifier_call = vmwgfx_pm_notifier;
d9f36a0051b7c0 Thomas Hellstrom  2010-01-13  1141  	register_pm_notifier(&dev_priv->pm_nb);
d9f36a0051b7c0 Thomas Hellstrom  2010-01-13  1142  
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1143  	return 0;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1144  
506ff75c92a44d Thomas Hellstrom  2012-11-09  1145  out_no_fifo:
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1146  	vmw_overlay_close(dev_priv);
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1147  	vmw_kms_close(dev_priv);
56d1c78df52323 Jakob Bornecrantz 2011-10-04  1148  out_no_kms:
f6be23264bbac8 Zack Rusin        2021-11-05  1149  	if (dev_priv->has_mob) {
6eee6675e01da7 Dave Airlie       2020-08-04  1150  		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
f6be23264bbac8 Zack Rusin        2021-11-05  1151  		vmw_sys_man_fini(dev_priv);
f6be23264bbac8 Zack Rusin        2021-11-05  1152  	}
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1153  	if (dev_priv->has_gmr)
6eee6675e01da7 Dave Airlie       2020-08-04  1154  		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
d92223ead97cd6 Zack Rusin        2021-06-09  1155  	vmw_devcaps_destroy(dev_priv);
e0830704de7c06 Dave Airlie       2020-08-04  1156  	vmw_vram_manager_fini(dev_priv);
3458390b9f0ba7 Thomas Hellstrom  2015-03-05  1157  out_no_vram:
8af8a109b34fa8 Christian König   2020-10-01  1158  	ttm_device_fini(&dev_priv->bdev);
153b3d5b037eeb Thomas Hellstrom  2015-06-25  1159  out_no_bdev:
ae2a104058e217 Thomas Hellstrom  2011-09-01  1160  	vmw_fence_manager_takedown(dev_priv->fman);
ae2a104058e217 Thomas Hellstrom  2011-09-01  1161  out_no_fman:
506ff75c92a44d Thomas Hellstrom  2012-11-09  1162  	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
9703bb32920625 Zack Rusin        2020-11-03  1163  		vmw_irq_uninstall(&dev_priv->drm);
506ff75c92a44d Thomas Hellstrom  2012-11-09  1164  out_no_irq:
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1165  	ttm_object_device_release(&dev_priv->tdev);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1166  out_err0:
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1167  	for (i = vmw_res_context; i < vmw_res_max; ++i)
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1168  		idr_destroy(&dev_priv->res_idr[i]);
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1169  
d80efd5cb3dec1 Thomas Hellstrom  2015-08-10  1170  	if (dev_priv->ctx.staged_bindings)
d80efd5cb3dec1 Thomas Hellstrom  2015-08-10  1171  		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
bdea0942fec95e Philipp Stanner   2025-04-17  1172  
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1173  	return ret;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1174  }
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
