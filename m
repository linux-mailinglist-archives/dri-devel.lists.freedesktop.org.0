Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF32097D48E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 13:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A99F10E806;
	Fri, 20 Sep 2024 11:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCVj7zUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6B10E805;
 Fri, 20 Sep 2024 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726830587; x=1758366587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vCaO4ypVNNj50k616bvbWb0ZhmSIhGXQ+CsBpme5xXE=;
 b=mCVj7zUGKdRM9OeE91UgS/y6/ALdlwtR1cP0DiaPVgbKu7a1SjSz1E7F
 J6dTxb/EiNZ1MnVPcY6dstvAK+6lj8gpq5zzCMZT9Zd0VlOyhFazGQRAH
 qsVhsgY9SiDppANml+U+cju9rw7R/ic4Hi998f+NSlAtBQJurT+yNKEVP
 11RZx6lXVZlCdC64ksNhg9T/Fo5EmKDYbmuglptowoq8CgDR3gHZ6ydqA
 sB5uHFN+sLvCdTy7EsQ7ouc/3jQNkL5jKjLeKoDfkIXzhE6p8/oUrUvHG
 UFipjUnumwnXv/vnSXbJ79Kh7mzhoYRapw7tzrhKjgaVgy9t3KiOD1/C1 w==;
X-CSE-ConnectionGUID: 2beGaYp5RXy+rsucW5AcYQ==
X-CSE-MsgGUID: E2xJi31zTaKtAOTq2cdIzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29726425"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29726425"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:09:46 -0700
X-CSE-ConnectionGUID: N1zVYBiWRBCSO1UCyjakwg==
X-CSE-MsgGUID: wtpa2aEqTcynycK8eRDJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75219609"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 20 Sep 2024 04:09:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1srbW7-000EJH-28;
 Fri, 20 Sep 2024 11:09:39 +0000
Date: Fri, 20 Sep 2024 19:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
Message-ID: <202409201854.z0daqyYE-lkp@intel.com>
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
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240920/202409201854.z0daqyYE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201854.z0daqyYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201854.z0daqyYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/of.c:12:
   include/linux/pci.h: In function 'pci_iov_resource_extend':
>> include/linux/pci.h:2421:10: warning: 'return' with a value, in function returning void [-Wreturn-type]
    2421 | { return -ENODEV; }
         |          ^
   include/linux/pci.h:2420:20: note: declared here
    2420 | static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/return +2421 include/linux/pci.h

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
