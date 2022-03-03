Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BD4CB363
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 01:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF0410E95C;
	Thu,  3 Mar 2022 00:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BDD10E2AB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 00:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646267705; x=1677803705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4zSXdc7KAQv6ROJTapgLcs4iC6Ro436n8GV5J48iRho=;
 b=ljmJdOq1o0Tu5Y+Cfxllg70PFai4jL8X/HFV80n2NkTRB5lDabMkE0Z1
 TN3BYolbD7oTpjnjaFtq/ayO2bCaS+EctKE3fxTgnBkzAin13XJ1RzEm6
 vOG9kueqR5E8PfL+DUvVwks5o15qV1LlhEyErQkGJB66jmhL2XlTyBhry
 +Vmx3nt5TZ6tDXbI9fKwx7bofGI6E6UQW6IpagWlf6VSdmMqurJ9e59cR
 1FEF8DGMNtI+Ov+91ZeF62OGwUc8pFJr4XAb3Kvj1eEBRiAaW39RatfyV
 9wQve8c+EOZ+h6xSkRaps9CKR/H379Dsq4VG0vLe+cuk1Duu3Yl5PYzdy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="314257983"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="314257983"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 16:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="594197552"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2022 16:35:03 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nPZQs-00029A-EQ; Thu, 03 Mar 2022 00:35:02 +0000
Date: Thu, 3 Mar 2022 08:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack@kde.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/8] drm/vmwgfx: Implement MSI/MSI-X support for IRQs
Message-ID: <202203030802.itIYtJH1-lkp@intel.com>
References: <20220302152426.885214-8-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302152426.885214-8-zack@kde.org>
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
Cc: krastevm@vmware.com, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc6 next-20220302]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/drm-vmwgfx-3D-on-arm64-and-large-cursor-support/20220302-232641
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220303/202203030802.itIYtJH1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/63d27e1cb11562966a6f07bf0e667b0a54dc2412
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-3D-on-arm64-and-large-cursor-support/20220302-232641
        git checkout 63d27e1cb11562966a6f07bf0e667b0a54dc2412
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/vmwgfx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_irq.c:340:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (nvec <= 0) {
               ^~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_irq.c:369:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/gpu/drm/vmwgfx/vmwgfx_irq.c:340:2: note: remove the 'if' if its condition is always false
           if (nvec <= 0) {
           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_irq.c:330:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +340 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c

   319	
   320	/**
   321	 * vmw_irq_install - Install the irq handlers
   322	 *
   323	 * @dev_priv:  Pointer to the vmw_private device.
   324	 * Return:  Zero if successful. Negative number otherwise.
   325	 */
   326	int vmw_irq_install(struct vmw_private *dev_priv)
   327	{
   328		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
   329		struct drm_device *dev = &dev_priv->drm;
   330		int ret;
   331		int nvec;
   332		int i = 0;
   333	
   334		BUILD_BUG_ON((SVGA_IRQFLAG_MAX >> VMWGFX_MAX_NUM_IRQS) != 1);
   335		BUG_ON(VMWGFX_MAX_NUM_IRQS != get_count_order(SVGA_IRQFLAG_MAX));
   336	
   337		nvec = pci_alloc_irq_vectors(pdev, 1, VMWGFX_MAX_NUM_IRQS,
   338					     PCI_IRQ_ALL_TYPES);
   339	
 > 340		if (nvec <= 0) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
