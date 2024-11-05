Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F89BD96D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 00:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E5410E429;
	Tue,  5 Nov 2024 23:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGuzT5Bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12BC10E429;
 Tue,  5 Nov 2024 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730847894; x=1762383894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bDsqOE0h7DpVvro3xuFH5p1z7Y90lSI+b3Bzpdb+oqc=;
 b=FGuzT5BhBR57OrNcTfAEZckAJAnoXu6/VRgcoBMrn2UTk1q7pcXTnK4y
 u4eGhZUuFRX30Z7YfO8syyf2gCLIt7p0+6QtEL1zXwtdlkVuN6kJ6yftW
 RyrqqkLTHAj6lryBQnP/Cq7Rac18uxNxSrZrFQN6Y58fLc7TPFmOWUSka
 b4Npus0lvqPh37gMTVH+dqlvhofYFFULy4LZO2bX6SufmjYHluOgn0qcB
 BSmG5iio5LwzkoAxKevHzphw5F3t/deaTU8+z/PPphuUbC83BfY8X/vqz
 PKcKPD0U4a7lb/3xM/heCyRvdSSG2a/OC9calzqmDvcuDquMy8n6JrBrP g==;
X-CSE-ConnectionGUID: I5QMqWqHQcKMkVnRkcYzvg==
X-CSE-MsgGUID: 1hktB5sJQfaUB7UXNUOl3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42002979"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="42002979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 15:04:54 -0800
X-CSE-ConnectionGUID: 50ad3gzBR7OGb0pCBSFlmA==
X-CSE-MsgGUID: vIfxekcdRq2AHLl+2kICEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="107531475"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2024 15:04:51 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8SbR-000mYd-0L;
 Tue, 05 Nov 2024 23:04:49 +0000
Date: Wed, 6 Nov 2024 07:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LENAIN Simon <simon.lenain@thalesgroup.com>,
 BARBEAU Etienne <etienne.barbeau@thalesgroup.com>,
 LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>
Subject: Re: [PATCH] drm/etnaviv: add optional reset support
Message-ID: <202411060610.iIIdHXHP-lkp@intel.com>
References: <0825fa6ad3954cda970b42c25b45fb0d@thalesgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0825fa6ad3954cda970b42c25b45fb0d@thalesgroup.com>
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

Hi LECOINTRE,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.12-rc6]
[cannot apply to next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LECOINTRE-Philippe/drm-etnaviv-add-optional-reset-support/20241105-224118
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/0825fa6ad3954cda970b42c25b45fb0d%40thalesgroup.com
patch subject: [PATCH] drm/etnaviv: add optional reset support
config: i386-buildonly-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060610.iIIdHXHP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060610.iIIdHXHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060610.iIIdHXHP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/etnaviv/etnaviv_gpu.c: In function 'etnaviv_gpu_platform_probe':
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1900:9: error: implicit declaration of function 'irq_set_status_flags' [-Werror=implicit-function-declaration]
    1900 |         irq_set_status_flags(gpu->irq, IRQ_NOAUTOEN);
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1900:40: error: 'IRQ_NOAUTOEN' undeclared (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
    1900 |         irq_set_status_flags(gpu->irq, IRQ_NOAUTOEN);
         |                                        ^~~~~~~~~~~~
         |                                        IRQF_NO_AUTOEN
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1900:40: note: each undeclared identifier is reported only once for each function it appears in
   cc1: all warnings being treated as errors


vim +/irq_set_status_flags +1900 drivers/gpu/drm/etnaviv/etnaviv_gpu.c

  1874	
  1875	static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
  1876	{
  1877		struct device *dev = &pdev->dev;
  1878		struct etnaviv_gpu *gpu;
  1879		int err;
  1880	
  1881		gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
  1882		if (!gpu)
  1883			return -ENOMEM;
  1884	
  1885		gpu->dev = &pdev->dev;
  1886		mutex_init(&gpu->lock);
  1887		mutex_init(&gpu->sched_lock);
  1888	
  1889		/* Map registers: */
  1890		gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
  1891		if (IS_ERR(gpu->mmio))
  1892			return PTR_ERR(gpu->mmio);
  1893	
  1894		/* Get Interrupt: */
  1895		gpu->irq = platform_get_irq(pdev, 0);
  1896		if (gpu->irq < 0)
  1897			return gpu->irq;
  1898	
  1899		/* Avoid enabling the interrupt until everything is ready */
> 1900		irq_set_status_flags(gpu->irq, IRQ_NOAUTOEN);
  1901	
  1902		err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
  1903				       dev_name(gpu->dev), gpu);
  1904		if (err) {
  1905			dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
  1906			return err;
  1907		}
  1908	
  1909		/* Get Reset: */
  1910		gpu->rst = devm_reset_control_get_optional(&pdev->dev, NULL);
  1911		if (IS_ERR(gpu->rst))
  1912			return dev_err_probe(dev, PTR_ERR(gpu->rst),
  1913					     "failed to get reset\n");
  1914	
  1915		/* Get Clocks: */
  1916		gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
  1917		DBG("clk_reg: %p", gpu->clk_reg);
  1918		if (IS_ERR(gpu->clk_reg))
  1919			return PTR_ERR(gpu->clk_reg);
  1920	
  1921		gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");
  1922		DBG("clk_bus: %p", gpu->clk_bus);
  1923		if (IS_ERR(gpu->clk_bus))
  1924			return PTR_ERR(gpu->clk_bus);
  1925	
  1926		gpu->clk_core = devm_clk_get(&pdev->dev, "core");
  1927		DBG("clk_core: %p", gpu->clk_core);
  1928		if (IS_ERR(gpu->clk_core))
  1929			return PTR_ERR(gpu->clk_core);
  1930		gpu->base_rate_core = clk_get_rate(gpu->clk_core);
  1931	
  1932		gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
  1933		DBG("clk_shader: %p", gpu->clk_shader);
  1934		if (IS_ERR(gpu->clk_shader))
  1935			return PTR_ERR(gpu->clk_shader);
  1936		gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
  1937	
  1938		/* TODO: figure out max mapped size */
  1939		dev_set_drvdata(dev, gpu);
  1940	
  1941		/*
  1942		 * We treat the device as initially suspended.  The runtime PM
  1943		 * autosuspend delay is rather arbitary: no measurements have
  1944		 * yet been performed to determine an appropriate value.
  1945		 */
  1946		pm_runtime_use_autosuspend(gpu->dev);
  1947		pm_runtime_set_autosuspend_delay(gpu->dev, 200);
  1948		pm_runtime_enable(gpu->dev);
  1949	
  1950		err = component_add(&pdev->dev, &gpu_ops);
  1951		if (err < 0) {
  1952			dev_err(&pdev->dev, "failed to register component: %d\n", err);
  1953			return err;
  1954		}
  1955	
  1956		return 0;
  1957	}
  1958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
