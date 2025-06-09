Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E5AD19CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 10:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E2910E10F;
	Mon,  9 Jun 2025 08:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edm/kAxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A46910E0AA;
 Mon,  9 Jun 2025 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749457844; x=1780993844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ensT7p+N/ywee7KLRyYcOmYZaATuuZJ+u1tIIRo0PZs=;
 b=edm/kAxssvUiFX2AcN+EAlNgiGMoSEqPkcBZtMlOhpUwUXLrUuj7mzzw
 COAFDJK46yujl/+lQuGZo7lQhVdJRENo0wf5r8lHxQTHi83ACMsmJQTG1
 JR0psujnKpCBT3TRqoVCFZIZ5p1uaDPt8EdqVF1q4V0RjA+gVAqAMOV4D
 rPhfLUU7oZRnzX6m/nUwHM0byacBMDnQEKb4a/NVHZCtYDNzzx/hf4Gpw
 +pJZ7AiWgT7rKZV9p+dJDcTDs/rYQekVeC/Y3EahooJEd4ofKpQznAOYU
 niSDK5EDgQiiZdrB5Q0pr8DfpbCwNDchmYge14oYb+L/ZMmwRoQS11KRY Q==;
X-CSE-ConnectionGUID: fYpt84mdQEeiQ36My9utvw==
X-CSE-MsgGUID: wyar3VBdRMCqtcI1sRqYdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="76921927"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="76921927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 01:30:43 -0700
X-CSE-ConnectionGUID: 5Pkjg0zRSoW7rgRyVlx9Gg==
X-CSE-MsgGUID: h31gkaVcRXapdesgq+80fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147382809"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 09 Jun 2025 01:30:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uOXts-0006t3-0L;
 Mon, 09 Jun 2025 08:30:36 +0000
Date: Mon, 9 Jun 2025 16:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 amd-gfx@lists.freedesktop.org,
 "(open list:HIBERNATION (aka Software Suspend,
 aka swsusp))" <linux-pm@vger.kernel.org>, 
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Denis Benato <benato.denis96@gmail.com>,
 Merthan =?utf-8?Q?Karaka=C5=9F?= <m3rthn.k@gmail.com>
Subject: Re: [PATCH v3 2/5] PCI: Put PCIe ports with downstream devices into
 D3 at hibernate
Message-ID: <202506091639.HaxwbWtd-lkp@intel.com>
References: <20250609024619.407257-3-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609024619.407257-3-superm1@kernel.org>
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

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge mkp-scsi/for-next jejb-scsi/for-next linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PM-Use-hibernate-flows-for-system-power-off/20250609-105658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250609024619.407257-3-superm1%40kernel.org
patch subject: [PATCH v3 2/5] PCI: Put PCIe ports with downstream devices into D3 at hibernate
config: i386-buildonly-randconfig-003-20250609 (https://download.01.org/0day-ci/archive/20250609/202506091639.HaxwbWtd-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506091639.HaxwbWtd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506091639.HaxwbWtd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci-driver.c:1221:7: error: call to undeclared function 'pci_pm_set_prepare_bus_pm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1221 |         if (!pci_pm_set_prepare_bus_pm(pci_dev))
         |              ^
   1 error generated.


vim +/pci_pm_set_prepare_bus_pm +1221 drivers/pci/pci-driver.c

  1195	
  1196	static int pci_pm_poweroff_noirq(struct device *dev)
  1197	{
  1198		struct pci_dev *pci_dev = to_pci_dev(dev);
  1199		const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
  1200	
  1201		if (dev_pm_skip_suspend(dev))
  1202			return 0;
  1203	
  1204		if (pci_has_legacy_pm_support(pci_dev))
  1205			return pci_legacy_suspend_late(dev);
  1206	
  1207		if (!pm) {
  1208			pci_fixup_device(pci_fixup_suspend_late, pci_dev);
  1209			return 0;
  1210		}
  1211	
  1212		if (pm->poweroff_noirq) {
  1213			int error;
  1214	
  1215			error = pm->poweroff_noirq(dev);
  1216			suspend_report_result(dev, pm->poweroff_noirq, error);
  1217			if (error)
  1218				return error;
  1219		}
  1220	
> 1221		if (!pci_pm_set_prepare_bus_pm(pci_dev))
  1222			goto Fixup;
  1223	
  1224		/*
  1225		 * The reason for doing this here is the same as for the analogous code
  1226		 * in pci_pm_suspend_noirq().
  1227		 */
  1228		if (pci_dev->class == PCI_CLASS_SERIAL_USB_EHCI)
  1229			pci_write_config_word(pci_dev, PCI_COMMAND, 0);
  1230	
  1231	Fixup:
  1232		pci_fixup_device(pci_fixup_suspend_late, pci_dev);
  1233	
  1234		return 0;
  1235	}
  1236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
