Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E316FAE2E8B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 08:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9345E10E31B;
	Sun, 22 Jun 2025 06:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzvxpXmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDEF10E31B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750572197; x=1782108197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Q8FrnkdsmldV9GcNFIT4wN8l3RVnI5WN8GsaLdbscs=;
 b=KzvxpXmdBMKDiBIPmfkyncA7Y8tMjp0EeOy7LREVoQVAJ4MPPn1Cb03x
 kkDf5SFI6iTimD/96Gl1jMWhYpEJaf9NTif53+nVx6JTAgWg1/dEER8n+
 lFRBuHUwRDWCxGP9ygahgliOKs/FzJx3gfUz7W1B7PBdtht+UbxPjKXs9
 9mgKh1Jqv0RbNAPyNTdrRoVQiCn0eV2NWifT9gI9t+s4inLmUs+1yU0ay
 zBRUNcOAPkqvMmDFkXx+hdbxowACU6Cnd9xYEKKK93V0iqMVXJieE+Oak
 e+1t2PfUCERjMvWILCzMQmVL1aMFco6HVD8piU13t7W4tp8XcRPFhQ2c8 A==;
X-CSE-ConnectionGUID: TWOqAwWMQh+hboUDfdoWsA==
X-CSE-MsgGUID: Vcmm6CzNSx+bRRdiiiCe6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="63473352"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; d="scan'208";a="63473352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2025 23:03:16 -0700
X-CSE-ConnectionGUID: YCSARsZ5RWG/zST+8dcpBQ==
X-CSE-MsgGUID: 3MdxRylsSUqbPeP8nS9RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; d="scan'208";a="150871451"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jun 2025 23:03:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uTDnI-000N5q-1P;
 Sun, 22 Jun 2025 06:03:08 +0000
Date: Sun, 22 Jun 2025 14:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
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
Subject: Re: [PATCH v3 6/7] PCI/VGA: Move check for firmware default out of
 VGA arbiter
Message-ID: <202506221312.49Fy1aNA-lkp@intel.com>
References: <20250620024943.3415685-7-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620024943.3415685-7-superm1@kernel.org>
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
[also build test ERROR on pci/for-linus tiwai-sound/for-next tiwai-sound/for-linus awilliam-vfio/next awilliam-vfio/for-linus tip/x86/core linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PCI-Add-helper-for-checking-if-a-PCI-device-is-a-display-controller/20250620-105220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250620024943.3415685-7-superm1%40kernel.org
patch subject: [PATCH v3 6/7] PCI/VGA: Move check for firmware default out of VGA arbiter
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20250622/202506221312.49Fy1aNA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221312.49Fy1aNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221312.49Fy1aNA-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/pci/vgaarb.o: in function `vga_arbiter_add_pci_device':
>> vgaarb.c:(.text+0x14ec): undefined reference to `video_is_primary_device'
>> sparc-linux-ld: vgaarb.c:(.text+0x174c): undefined reference to `video_is_primary_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
