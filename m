Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35897D4B8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 13:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979510E807;
	Fri, 20 Sep 2024 11:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rg7Y0YK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506D310E807;
 Fri, 20 Sep 2024 11:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726831247; x=1758367247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cOkG5YrAfWWRLhi0lqdnxR0XhBJNfGEMHWKajqt7vE8=;
 b=Rg7Y0YK7TLjLipU6QzVdDcMdasTklPhEx0iCGpoK6XqHddJJixLuqnMA
 JQUdv9nPcgiqeDe3TaT1RpMY73+qIUPGA2fEtih/w08X9855ZSl8fUVqb
 3QEQCf+btCC9J1+HBt3rzzx04KyUnVYuhSlyxepLC8h3eUthSLvmtz0F7
 Mghf8TwLujAM3egSVTQTGt+PniU92oDaSfruL+Jz5+kASTxwCe+NljqoG
 I2kZluWT5fty55Un2NU4tvJzRXzYzLeiUBk5Jje6pxCxLGDaSj/yd7oUk
 tOZKpBpnPpItsUqPtYqt4u7pvhHcoKCBiKqezJNfPchj5h6PlW1/mfJen A==;
X-CSE-ConnectionGUID: FtsE/ItoQy+YZ2ziCiTpbA==
X-CSE-MsgGUID: UqhnY7l4R+2/pkpYlWhI1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="26018569"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="26018569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:20:47 -0700
X-CSE-ConnectionGUID: B3bubxXqRtyC80JACfA9Ig==
X-CSE-MsgGUID: NmwJsoqIRU+K3lIEz7n1bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="69868882"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2024 04:20:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1srbgl-000EJd-2d;
 Fri, 20 Sep 2024 11:20:39 +0000
Date: Fri, 20 Sep 2024 19:19:39 +0800
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
Subject: Re: [PATCH v2 2/3] PCI: Allow extending VF BAR within original
 resource boundary
Message-ID: <202409201934.yM9hVUai-lkp@intel.com>
References: <20240919223557.1897608-3-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919223557.1897608-3-michal.winiarski@intel.com>
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
[also build test WARNING on drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11 next-20240920]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/PCI-Add-support-for-VF-Resizable-Bar-extended-cap/20240920-064112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20240919223557.1897608-3-michal.winiarski%40intel.com
patch subject: [PATCH v2 2/3] PCI: Allow extending VF BAR within original resource boundary
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240920/202409201934.yM9hVUai-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201934.yM9hVUai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201934.yM9hVUai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/mm/iomap.c:9:
>> include/linux/pci.h:2421:3: warning: void function 'pci_iov_resource_extend' should not return a value [-Wreturn-mismatch]
    2421 | { return -ENODEV; }
         |   ^      ~~~~~~~
   In file included from arch/arm/mm/iomap.c:9:
   In file included from include/linux/pci.h:2672:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings generated.


vim +/pci_iov_resource_extend +2421 include/linux/pci.h

  2397	
  2398	static inline int pci_iov_sysfs_link(struct pci_dev *dev,
  2399					     struct pci_dev *virtfn, int id)
  2400	{
  2401		return -ENODEV;
  2402	}
  2403	static inline int pci_iov_add_virtfn(struct pci_dev *dev, int id)
  2404	{
  2405		return -ENOSYS;
  2406	}
  2407	static inline void pci_iov_remove_virtfn(struct pci_dev *dev,
  2408						 int id) { }
  2409	static inline void pci_disable_sriov(struct pci_dev *dev) { }
  2410	static inline int pci_num_vf(struct pci_dev *dev) { return 0; }
  2411	static inline int pci_vfs_assigned(struct pci_dev *dev)
  2412	{ return 0; }
  2413	static inline int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs)
  2414	{ return 0; }
  2415	static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
  2416	{ return 0; }
  2417	#define pci_sriov_configure_simple	NULL
  2418	static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
  2419	{ return 0; }
  2420	static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
> 2421	{ return -ENODEV; }
  2422	static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
  2423	#endif
  2424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
