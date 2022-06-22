Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C471255438C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833F11138BF;
	Wed, 22 Jun 2022 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92E113B5E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655882682; x=1687418682;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NgoHLyZGRgMPgNFB7tpululSiyLjykD0PpFVx9n2Or0=;
 b=QgUftnS9QXVRkS1+5REL+XuB+6tf/aG0tEqGHYwE3oUx2Ww1OXB/Lqnv
 cUFtBsbpDWSB23LDKyjVfoPzf1m5jN3/BzIAV1xnTpv7aseUBoh7Jddn/
 dsIW/DPwBPqIXnPHrRME4Lk2bwLPuUf/7lYDr08gPumPo5+6Iw6qmHyr9
 CE00KFyw3fypDznoo8DpNhbw/hJ4Rlowy4MHJBoJUjKgoDY/3vWOkzdD7
 jkqhExFhvfzgD+cnplDgdXbJXKPnZXh4FwBV+zDaDwaG9s58+NyUTp9XS
 yga4nTRa4z71EiMZoJKuJOED774gBzbjIR55gi+Rvf/3v1afKuUOm3Poh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="279108869"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="279108869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 00:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="562834083"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2022 00:24:37 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3uj7-0000zN-5j;
 Wed, 22 Jun 2022 07:24:37 +0000
Date: Wed, 22 Jun 2022 15:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh+dt@kernel.org, krzysztof.kozlowski@canonical.com
Subject: Re: [PATCH v6 04/10] gpu: host1x: Add context device management code
Message-ID: <202206221557.laES8yNQ-lkp@intel.com>
References: <20220621151022.1416300-5-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621151022.1416300-5-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikko,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on tegra/for-next linus/master v5.19-rc3]
[cannot apply to tegra-drm/drm/tegra/for-next next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikko-Perttunen/Host1x-context-isolation-support/20220621-231339
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-randconfig-r021-20220622 (https://download.01.org/0day-ci/archive/20220622/202206221557.laES8yNQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2501beeae7469b805f9f624049fd56643cf6e18e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mikko-Perttunen/Host1x-context-isolation-support/20220621-231339
        git checkout 2501beeae7469b805f9f624049fd56643cf6e18e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/host1x/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/host1x/context.c:80:28: error: no member named 'ids' in 'struct iommu_fwspec'
                   ctx->stream_id = fwspec->ids[0] & 0xffff;
                                    ~~~~~~  ^
   1 error generated.


vim +80 drivers/gpu/host1x/context.c

    15	
    16	int host1x_memory_context_list_init(struct host1x *host1x)
    17	{
    18		struct host1x_memory_context_list *cdl = &host1x->context_list;
    19		struct device_node *node = host1x->dev->of_node;
    20		struct host1x_memory_context *ctx;
    21		unsigned int i;
    22		int err;
    23	
    24		cdl->devs = NULL;
    25		cdl->len = 0;
    26		mutex_init(&cdl->lock);
    27	
    28		err = of_property_count_u32_elems(node, "iommu-map");
    29		if (err < 0)
    30			return 0;
    31	
    32		cdl->devs = kcalloc(err, sizeof(*cdl->devs), GFP_KERNEL);
    33		if (!cdl->devs)
    34			return -ENOMEM;
    35		cdl->len = err / 4;
    36	
    37		for (i = 0; i < cdl->len; i++) {
    38			struct iommu_fwspec *fwspec;
    39	
    40			ctx = &cdl->devs[i];
    41	
    42			ctx->host = host1x;
    43	
    44			device_initialize(&ctx->dev);
    45	
    46			/*
    47			 * Due to an issue with T194 NVENC, only 38 bits can be used.
    48			 * Anyway, 256GiB of IOVA ought to be enough for anyone.
    49			 */
    50			ctx->dma_mask = DMA_BIT_MASK(38);
    51			ctx->dev.dma_mask = &ctx->dma_mask;
    52			ctx->dev.coherent_dma_mask = ctx->dma_mask;
    53			dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
    54			ctx->dev.bus = &host1x_context_device_bus_type;
    55			ctx->dev.parent = host1x->dev;
    56	
    57			dma_set_max_seg_size(&ctx->dev, UINT_MAX);
    58	
    59			err = device_add(&ctx->dev);
    60			if (err) {
    61				dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
    62				goto del_devices;
    63			}
    64	
    65			err = of_dma_configure_id(&ctx->dev, node, true, &i);
    66			if (err) {
    67				dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
    68					i, err);
    69				device_del(&ctx->dev);
    70				goto del_devices;
    71			}
    72	
    73			fwspec = dev_iommu_fwspec_get(&ctx->dev);
    74			if (!fwspec) {
    75				dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
    76				device_del(&ctx->dev);
    77				goto del_devices;
    78			}
    79	
  > 80			ctx->stream_id = fwspec->ids[0] & 0xffff;
    81		}
    82	
    83		return 0;
    84	
    85	del_devices:
    86		while (i--)
    87			device_del(&cdl->devs[i].dev);
    88	
    89		kfree(cdl->devs);
    90		cdl->len = 0;
    91	
    92		return err;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
