Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32119B22D52
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E910E607;
	Tue, 12 Aug 2025 16:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BD1X9zBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6A610E16C;
 Tue, 12 Aug 2025 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755015866; x=1786551866;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q3ATWwbJnmhEV0tER11ue3lL09n8bcsLC90p1qBToR0=;
 b=BD1X9zBY/U8VTu6XBGOF+2j5ZS+oYGAFfCZ2DRzPcFrXtKpD5jJ8tjr8
 io2l5JKHeNrE74PDPjEK+GAnQRnFwlkjknkFwBCNLki11WJIDxKdqmGdF
 fyhrUtR9lRKxCw1wu7wnjeQ65Rpce8rs+AyFqSVtSblhu/XDoqJ382iz8
 UD/kEVeVc7zbZdk1Bb6pdhCgMnxE+1Fs6JBbmvZVG5sv7jfgmpLt/GGpp
 Yu3VZF3Y9Xs2bES32TiIAbzgIbt98L7rFPcRQ4jYq/mSE0EYgaR2YFh/F
 wsqTZH5nZPBjkX50VecjG20kO75pue5U077Qk/obrQCxu4Xxpx5Ay7G7M Q==;
X-CSE-ConnectionGUID: qHmw+viASd6WDR0uevUayA==
X-CSE-MsgGUID: yOJUlOeATgGU4OzYwVjqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57378401"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57378401"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 09:24:25 -0700
X-CSE-ConnectionGUID: yC4pQlA5TSWMd4+9pje4Aw==
X-CSE-MsgGUID: aWFQrDsnQvqkjbg6wiAiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170457391"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 12 Aug 2025 09:24:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ulrnN-0006zD-1K;
 Tue, 12 Aug 2025 16:24:17 +0000
Date: Wed, 13 Aug 2025 00:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "(open list:HIBERNATION (aka Software Suspend,
 aka swsusp))" <linux-pm@vger.kernel.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Merthan =?utf-8?Q?Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH v5 04/11] USB: Pass PMSG_POWEROFF event to
 suspend_common() for poweroff with S4 flow
Message-ID: <202508130049.aA2DXgHW-lkp@intel.com>
References: <20250811194102.864225-5-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811194102.864225-5-superm1@kernel.org>
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

[auto build test ERROR on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello-AMD/PM-Introduce-new-PMSG_POWEROFF-event/20250812-034228
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250811194102.864225-5-superm1%40kernel.org
patch subject: [PATCH v5 04/11] USB: Pass PMSG_POWEROFF event to suspend_common() for poweroff with S4 flow
config: i386-randconfig-013-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130049.aA2DXgHW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130049.aA2DXgHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130049.aA2DXgHW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/core/hcd-pci.c:650:27: error: 'hcd_pci_poweroff' undeclared here (not in a function); did you mean 'hcd_pci_poweroff_late'?
     650 |         .poweroff       = hcd_pci_poweroff,
         |                           ^~~~~~~~~~~~~~~~
         |                           hcd_pci_poweroff_late


vim +650 drivers/usb/core/hcd-pci.c

   640	
   641	const struct dev_pm_ops usb_hcd_pci_pm_ops = {
   642		.suspend	= hcd_pci_suspend,
   643		.suspend_noirq	= hcd_pci_suspend_noirq,
   644		.resume_noirq	= hcd_pci_resume_noirq,
   645		.resume		= hcd_pci_resume,
   646		.freeze		= hcd_pci_freeze,
   647		.freeze_noirq	= check_root_hub_suspended,
   648		.thaw_noirq	= NULL,
   649		.thaw		= hcd_pci_resume,
 > 650		.poweroff	= hcd_pci_poweroff,
   651		.poweroff_late	= hcd_pci_poweroff_late,
   652		.poweroff_noirq	= hcd_pci_suspend_noirq,
   653		.restore_noirq	= hcd_pci_resume_noirq,
   654		.restore	= hcd_pci_restore,
   655		.runtime_suspend = hcd_pci_runtime_suspend,
   656		.runtime_resume	= hcd_pci_runtime_resume,
   657	};
   658	EXPORT_SYMBOL_GPL(usb_hcd_pci_pm_ops);
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
