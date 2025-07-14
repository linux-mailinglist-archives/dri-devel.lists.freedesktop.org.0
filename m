Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098EB04322
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB0F10E4AF;
	Mon, 14 Jul 2025 15:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/FEVB8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874A10E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752506089; x=1784042089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uhR4oTtyTLRPzkqDzPtiWEgon2j5NRv9mdaGjQ0k3OM=;
 b=H/FEVB8b9xRpa7Xc/WVPnq4+ZBj5QLgziPs1Qt6n3UXuQv77Zav+ybhv
 LFmYXkI0BCutQGtdi6SyX4sBmFS3Zsa6vv+qqYwh5pEVkCOHYF4FJq879
 5lN6UJv7Vsgt1UPX/tNX8xvv5kkT5OFPTsWfTDAL1Vs021v4LoJkclNxu
 h8b58djYKF5S3L4VcDSiHHRYMJh46DhUsLjnk6REKvgReLgL8bGM3gar5
 8FkyfX44Sji9oNd142R1swa2ov50MUN7ucn9Nd/1U2RJCQQ+H+ml/ZXVa
 Kc+m67YUJ3qeMt6KC2ue1F1xhGda7jZO+qLopcivmIftbZLCBM4P4U5X6 A==;
X-CSE-ConnectionGUID: IAOmAcPLT7a6LMTeILlDig==
X-CSE-MsgGUID: W3tFcRHfTYaleNPelCeGZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66147849"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="66147849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:13:30 -0700
X-CSE-ConnectionGUID: QsmEd6zUTNqnT0GaVeEtLA==
X-CSE-MsgGUID: 47IN3f/gR+WROpmruZ/DZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="187943702"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 14 Jul 2025 08:13:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ubKro-00092V-1w;
 Mon, 14 Jul 2025 15:13:20 +0000
Date: Mon, 14 Jul 2025 23:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, David Airlie <airlied@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "(open list:INTEL IOMMU (VT-d))" <iommu@lists.linux.dev>,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 linux-sound@vger.kernel.org, Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v7 8/9] fbcon: Use screen info to find primary device
Message-ID: <202507142313.iWVTOSVB-lkp@intel.com>
References: <20250706143613.1972252-9-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706143613.1972252-9-superm1@kernel.org>
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

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus tiwai-sound/for-next tiwai-sound/for-linus tip/x86/core linus/master v6.16-rc6 next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PCI-Add-helper-for-checking-if-a-PCI-device-is-a-display-controller/20250706-223745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250706143613.1972252-9-superm1%40kernel.org
patch subject: [PATCH v7 8/9] fbcon: Use screen info to find primary device
config: i386-randconfig-053-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142313.iWVTOSVB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142313.iWVTOSVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142313.iWVTOSVB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/video/video-common.o: in function `video_is_primary_device':
>> arch/x86/video/video-common.c:45: undefined reference to `screen_info_pci_dev'


vim +45 arch/x86/video/video-common.c

    28	
    29	bool video_is_primary_device(struct device *dev)
    30	{
    31		struct screen_info *si = &screen_info;
    32		struct pci_dev *pdev;
    33	
    34		if (!dev_is_pci(dev))
    35			return false;
    36	
    37		pdev = to_pci_dev(dev);
    38	
    39		if (!pci_is_display(pdev))
    40			return false;
    41	
    42		if (pdev == vga_default_device())
    43			return true;
    44	
  > 45		if (pdev == screen_info_pci_dev(si))
    46			return true;
    47	
    48		return false;
    49	}
    50	EXPORT_SYMBOL(video_is_primary_device);
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
