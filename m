Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBAA4646FF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 07:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181886EC68;
	Wed,  1 Dec 2021 06:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336996EC68;
 Wed,  1 Dec 2021 06:05:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236621114"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="236621114"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 22:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="459130103"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 30 Nov 2021 22:05:07 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1msIjq-000EL8-J5; Wed, 01 Dec 2021 06:05:06 +0000
Date: Wed, 1 Dec 2021 14:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robdclark@gmail.com
Subject: Re: [PATCH v2 1/2] drm/msm: Allocate msm_drm_private early and pass
 it as driver data
Message-ID: <202112011405.Wn79h7q3-lkp@intel.com>
References: <20211130141048.294246-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130141048.294246-2-angelogioacchino.delregno@collabora.com>
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
Cc: freedreno@lists.freedesktop.org, kbuild-all@lists.01.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AngeloGioacchino,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20211130]
[cannot apply to v5.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/AngeloGioacchino-Del-Regno/drm-msm-Fix-dsi-bridge-probe/20211130-221304
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: csky-randconfig-c004-20211128 (https://download.01.org/0day-ci/archive/20211201/202112011405.Wn79h7q3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/msm_drv.c:412:1-6: WARNING: invalid free of devm_ allocated data

vim +412 drivers/gpu/drm/msm/msm_drv.c

2aa31767259722 Sean Paul           2019-05-24  384  
98659487b845c0 Abhinav Kumar       2021-04-16  385  	msm_disp_snapshot_destroy(ddev);
98659487b845c0 Abhinav Kumar       2021-04-16  386  
2b669875332fbd Archit Taneja       2016-05-02  387  	drm_mode_config_cleanup(ddev);
c8afe684c95cd1 Rob Clark           2013-06-26  388  
2b669875332fbd Archit Taneja       2016-05-02  389  	pm_runtime_get_sync(dev);
f026e431cf8611 Thomas Zimmermann   2021-08-03  390  	msm_irq_uninstall(ddev);
2b669875332fbd Archit Taneja       2016-05-02  391  	pm_runtime_put_sync(dev);
c8afe684c95cd1 Rob Clark           2013-06-26  392  
16976085a114ae Archit Taneja       2016-11-03  393  	if (kms && kms->funcs)
c8afe684c95cd1 Rob Clark           2013-06-26  394  		kms->funcs->destroy(kms);
c8afe684c95cd1 Rob Clark           2013-06-26  395  
871d812aa43e63 Rob Clark           2013-11-16  396  	if (priv->vram.paddr) {
00085f1efa387a Krzysztof Kozlowski 2016-08-03  397  		unsigned long attrs = DMA_ATTR_NO_KERNEL_MAPPING;
871d812aa43e63 Rob Clark           2013-11-16  398  		drm_mm_takedown(&priv->vram.mm);
2b669875332fbd Archit Taneja       2016-05-02  399  		dma_free_attrs(dev, priv->vram.size, NULL,
00085f1efa387a Krzysztof Kozlowski 2016-08-03  400  			       priv->vram.paddr, attrs);
871d812aa43e63 Rob Clark           2013-11-16  401  	}
871d812aa43e63 Rob Clark           2013-11-16  402  
2b669875332fbd Archit Taneja       2016-05-02  403  	component_unbind_all(dev, ddev);
060530f1ea6740 Rob Clark           2014-03-03  404  
bc3220be22577e Rajesh Yadav        2018-06-21  405  	if (mdss && mdss->funcs)
bc3220be22577e Rajesh Yadav        2018-06-21  406  		mdss->funcs->destroy(ddev);
0a6030d224d3a4 Archit Taneja       2016-05-08  407  
2b669875332fbd Archit Taneja       2016-05-02  408  	ddev->dev_private = NULL;
4d8dc2dfae2c48 Thomas Zimmermann   2018-09-26  409  	drm_dev_put(ddev);
c8afe684c95cd1 Rob Clark           2013-06-26  410  
2aa31767259722 Sean Paul           2019-05-24  411  	destroy_workqueue(priv->wq);
c8afe684c95cd1 Rob Clark           2013-06-26 @412  	kfree(priv);
c8afe684c95cd1 Rob Clark           2013-06-26  413  
c8afe684c95cd1 Rob Clark           2013-06-26  414  	return 0;
c8afe684c95cd1 Rob Clark           2013-06-26  415  }
c8afe684c95cd1 Rob Clark           2013-06-26  416  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
