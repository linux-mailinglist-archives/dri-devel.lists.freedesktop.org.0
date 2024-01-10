Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA1829412
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 08:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE85610E04A;
	Wed, 10 Jan 2024 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091E10E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704870835; x=1736406835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+WIJNLdpuC68P5no2TbSORQjjEUKMmpVsVpXHpPsjEw=;
 b=PNvI3NT9kkviv2VfcwBp7ZfxUyee+To+oDQkygNqNFshDsDf0J955TWr
 bqjIzom9siOhqo6AP/+/c5zF/UbyeqMVw+L4UmJL3mHYGmh+RBBzepAQu
 zVFqwIZSdXQegeA3SZyov1cIxTnwbRgmVLSRTGFtONnrMBIEseJQPDeoR
 NyoLz1XNUgbmAZquHTsAX4V9/zFSmCEqG6AWj2PIRWIwALrtt4W6mpb6X
 Y4aWgZpio/aTKE5CFCoJKF44QS1YlcknCLlFBl7bZFpl2olcELK9Xj+vu
 OWzk6qqVuA2EgNKjQRf2g3TG0NOaH0VcN9NTUSwMvyEbj7N32ybG9OzIn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5791582"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5791582"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 23:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="758272379"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="758272379"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 09 Jan 2024 23:13:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rNSlx-0006iu-1a;
 Wed, 10 Jan 2024 07:13:44 +0000
Date: Wed, 10 Jan 2024 15:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/imx/dcss: have all init functions use devres
Message-ID: <202401101401.bi7U74fr-lkp@intel.com>
References: <20240109102032.16165-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109102032.16165-3-pstanner@redhat.com>
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
Cc: Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7]
[also build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next next-20240109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-dcss-request-memory-region/20240109-182239
base:   v6.7
patch link:    https://lore.kernel.org/r/20240109102032.16165-3-pstanner%40redhat.com
patch subject: [PATCH v2 2/2] drm/imx/dcss: have all init functions use devres
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240110/202401101401.bi7U74fr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101401.bi7U74fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101401.bi7U74fr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:17,
                    from include/linux/platform_device.h:13,
                    from drivers/gpu/drm/imx/dcss/dcss-dev.c:9:
   drivers/gpu/drm/imx/dcss/dcss-dev.c: In function 'dcss_dev_create':
   drivers/gpu/drm/imx/dcss/dcss-dev.c:186:42: error: incompatible type for argument 1 of '__devm_request_region'
     186 |         if (!devm_request_mem_region(pdev->dev, res->start, res_len, "dcss")) {
         |                                      ~~~~^~~~~
         |                                          |
         |                                          struct device
   include/linux/ioport.h:306:31: note: in definition of macro 'devm_request_mem_region'
     306 |         __devm_request_region(dev, &iomem_resource, (start), (n), (name))
         |                               ^~~
   include/linux/ioport.h:308:63: note: expected 'struct device *' but argument is of type 'struct device'
     308 | extern struct resource * __devm_request_region(struct device *dev,
         |                                                ~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/imx/dcss/dcss-dev.c:202:24: warning: returning 'int' from a function with return type 'struct dcss_dev *' makes pointer from integer without a cast [-Wint-conversion]
     202 |                 return ret;
         |                        ^~~
--
   drivers/gpu/drm/imx/dcss/dcss-scaler.c: In function 'dcss_scaler_ch_init_all':
>> drivers/gpu/drm/imx/dcss/dcss-scaler.c:305:45: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     305 |                 ch->base_reg = devm_ioremap(dev, ch->base_ofs, SZ_4K);
         |                                             ^~~
         |                                             cdev
   drivers/gpu/drm/imx/dcss/dcss-scaler.c:305:45: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/imx/dcss/dcss-scaler.c: In function 'dcss_scaler_init':
>> drivers/gpu/drm/imx/dcss/dcss-scaler.c:331:37: error: passing argument 1 of 'dcss_scaler_ch_init_all' from incompatible pointer type [-Werror=incompatible-pointer-types]
     331 |         if (dcss_scaler_ch_init_all(dev, scaler, scaler_base))
         |                                     ^~~
         |                                     |
         |                                     struct device *
   drivers/gpu/drm/imx/dcss/dcss-scaler.c:294:56: note: expected 'struct dcss_scaler *' but argument is of type 'struct device *'
     294 | static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
         |                                    ~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/imx/dcss/dcss-scaler.c:331:42: warning: passing argument 2 of 'dcss_scaler_ch_init_all' makes integer from pointer without a cast [-Wint-conversion]
     331 |         if (dcss_scaler_ch_init_all(dev, scaler, scaler_base))
         |                                          ^~~~~~
         |                                          |
         |                                          struct dcss_scaler *
   drivers/gpu/drm/imx/dcss/dcss-scaler.c:295:50: note: expected 'long unsigned int' but argument is of type 'struct dcss_scaler *'
     295 |                                    unsigned long scaler_base)
         |                                    ~~~~~~~~~~~~~~^~~~~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-scaler.c:331:13: error: too many arguments to function 'dcss_scaler_ch_init_all'
     331 |         if (dcss_scaler_ch_init_all(dev, scaler, scaler_base))
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/dcss/dcss-scaler.c:294:12: note: declared here
     294 | static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +305 drivers/gpu/drm/imx/dcss/dcss-scaler.c

   293	
   294	static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
   295					   unsigned long scaler_base)
   296	{
   297		struct dcss_scaler_ch *ch;
   298		int i;
   299	
   300		for (i = 0; i < 3; i++) {
   301			ch = &scl->ch[i];
   302	
   303			ch->base_ofs = scaler_base + i * 0x400;
   304	
 > 305			ch->base_reg = devm_ioremap(dev, ch->base_ofs, SZ_4K);
   306			if (!ch->base_reg) {
   307				dev_err(scl->dev, "scaler: unable to remap ch base\n");
   308				return -ENOMEM;
   309			}
   310	
   311			ch->scl = scl;
   312		}
   313	
   314		return 0;
   315	}
   316	
   317	int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base)
   318	{
   319		struct dcss_scaler *scaler;
   320		struct device *dev = dcss->dev;
   321	
   322		scaler = devm_kzalloc(dev, sizeof(*scaler), GFP_KERNEL);
   323		if (!scaler)
   324			return -ENOMEM;
   325	
   326		dcss->scaler = scaler;
   327		scaler->dev = dcss->dev;
   328		scaler->ctxld = dcss->ctxld;
   329		scaler->ctx_id = CTX_SB_HP;
   330	
 > 331		if (dcss_scaler_ch_init_all(dev, scaler, scaler_base))
   332			return -ENOMEM;
   333	
   334		return 0;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
