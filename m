Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D69BCB0E0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 00:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B92E10E068;
	Thu,  9 Oct 2025 22:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiIh3L2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463BE10E068
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760048343; x=1791584343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FH63L4f4agVldlvyuQWNSdonEKLJ0v2i3mUQaA7IUCg=;
 b=TiIh3L2oet/CpcmBhig5Y1p/JQFakObjEpv17IdbtvuINhQAd2m8TWGJ
 Lss570dUuip0ySDAypfuwGVfhC0FCe//1sb7Qx7U1dhCoT2/dVCA1/07E
 Fba7A3i6pVQQN+JAXeRcgushGnk3TrdhzfNJq2b9g5sL5QdZEt6XXUz3/
 7Jr1mIxdVzcuTINh30Si22xrv/4/Oipyl2HA/8aU4Egt+caBeqyIUrPyg
 NPEdS9eHeKKI7iooh63KAdIYXjgXrYT+kUo6ce+L94j4iEMimkckrRMAS
 x81zKpScve/5+8Xgh+eFMA+AjpoQpd5hFQJUfIBtt5ccDy9TgZGvJidK4 g==;
X-CSE-ConnectionGUID: wry6Sv6/Q764EpS63UzPBQ==
X-CSE-MsgGUID: lqFqLwvNRP6FmxowCmZ+Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73702914"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="73702914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:19:02 -0700
X-CSE-ConnectionGUID: mCaT9/RIROmRg9sraUUCIQ==
X-CSE-MsgGUID: SW0EvskZSKGSF23Uh2V9TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185080426"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 09 Oct 2025 15:18:59 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v6yyO-0001YF-1t;
 Thu, 09 Oct 2025 22:18:56 +0000
Date: Fri, 10 Oct 2025 06:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Ketil Johnsen <ketil.johnsen@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix UAF race between device unplug and FW
 event processing
Message-ID: <202510100644.YPzFXMEb-lkp@intel.com>
References: <20251008105322.4077661-1-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008105322.4077661-1-ketil.johnsen@arm.com>
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

Hi Ketil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ketil-Johnsen/drm-panthor-Fix-UAF-race-between-device-unplug-and-FW-event-processing/20251009-184851
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251008105322.4077661-1-ketil.johnsen%40arm.com
patch subject: [PATCH] drm/panthor: Fix UAF race between device unplug and FW event processing
config: i386-buildonly-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100644.YPzFXMEb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100644.YPzFXMEb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100644.YPzFXMEb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/panthor/panthor_sched.c:1788 function parameter 'ptdev' not described in 'panthor_sched_report_fw_events'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:1788 function parameter 'events' not described in 'panthor_sched_report_fw_events'
>> Warning: drivers/gpu/drm/panthor/panthor_sched.c:1800 function parameter 'ptdev' not described in 'panthor_sched_stop_fw_events'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:2693 function parameter 'ptdev' not described in 'panthor_sched_report_mmu_fault'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
