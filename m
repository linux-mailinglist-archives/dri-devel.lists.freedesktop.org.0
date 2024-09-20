Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D951C97D2D0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E811810E2E0;
	Fri, 20 Sep 2024 08:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCemhpwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A9F10E2E3;
 Fri, 20 Sep 2024 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726821458; x=1758357458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FjYT2BKjGT6OchrotM7LjHr6S6Ni/aoPuOPvVS5kbqU=;
 b=eCemhpwoplWgliqNxRtvRZJWspE9EeLvYFhGczQz4dePwLsEY4NZz7jp
 gttH714tzax2oRISeAXKFEAiFSgC8pnfdwaKaBTEjdw9E9swwYK7unfXj
 8kcUoP+JNbszLgXh9eofPbREYu8UyIuTpIXw/ibEyDTVGLhX+Z2U9dhfG
 mFjm7Xg3Sjm+WxDUtMGkWycsQxcEEy8TLRtR7xQdDTorYGlMIQuybGbV/
 wkzEtAn+zQLf6Nz+nlttOQjvf2rxeUFRmNspBdeYV4FEnPUmvVqV0DfXS
 UtezTIS6X16SFua60w1FyB7OIKjXoJ3i6ozdEm/el/ffalg2NtWTEFUAf Q==;
X-CSE-ConnectionGUID: 95MOZ2JdT+qdRRyb1xwl5g==
X-CSE-MsgGUID: VMebNUVoRV+qkUPbO0gJWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29605462"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="29605462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 01:37:38 -0700
X-CSE-ConnectionGUID: Rm93kEgkS8SLlfUah43CXQ==
X-CSE-MsgGUID: zz7eSZuWRdKWQL8YubJJjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="93540570"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2024 01:37:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1srZ8s-000E8n-30;
 Fri, 20 Sep 2024 08:37:30 +0000
Date: Fri, 20 Sep 2024 16:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 1/3] PCI: Add support for VF Resizable Bar extended cap
Message-ID: <202409201629.QlC0MRbn-lkp@intel.com>
References: <20240919223557.1897608-2-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919223557.1897608-2-michal.winiarski@intel.com>
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

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11 next-20240919]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/PCI-Add-support-for-VF-Resizable-Bar-extended-cap/20240920-064112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20240919223557.1897608-2-michal.winiarski%40intel.com
patch subject: [PATCH v2 1/3] PCI: Add support for VF Resizable Bar extended cap
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240920/202409201629.QlC0MRbn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201629.QlC0MRbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201629.QlC0MRbn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci.c:1920:20: warning: variable 'res' set but not used [-Wunused-but-set-variable]
    1920 |                 struct resource *res;
         |                                  ^
   1 warning generated.


vim +/res +1920 drivers/pci/pci.c

  1903	
  1904	static void pci_restore_vf_rebar_state(struct pci_dev *pdev)
  1905	{
  1906		unsigned int pos, nbars, i;
  1907		u32 ctrl;
  1908	
  1909		if (!pdev->is_physfn)
  1910			return;
  1911	
  1912		pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_VF_REBAR);
  1913		if (!pos)
  1914			return;
  1915	
  1916		pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
  1917		nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
  1918	
  1919		for (i = 0; i < nbars; i++, pos += 8) {
> 1920			struct resource *res;
  1921			int bar_idx, size;
  1922	
  1923			pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
  1924			bar_idx = ctrl & PCI_REBAR_CTRL_BAR_IDX;
  1925			res = pdev->resource + bar_idx;
  1926			size = pci_rebar_bytes_to_size(pdev->sriov->barsz[bar_idx]);
  1927			ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
  1928			ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
  1929			pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
  1930		}
  1931	}
  1932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
