Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC18C1DA9
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 07:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3897C10E16F;
	Fri, 10 May 2024 05:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNyDCe8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB5210E16F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 05:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715318755; x=1746854755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FkGLtnlZ8fZVob3oYQ/PzCDEhIp08hyLY4qDOsXcQKI=;
 b=VNyDCe8M13HL3tGr8BrTLRTMZUlF1qKpwyrDRsw2YK8F2CNE6/CkJzZR
 fE7lx12Erbyg1QnlHs2Y24d4ZaoRPTICHVeEn7jrNFhRFqAwXfCWjx4fW
 1nQ10QtLIqodAEhI+VZ6IE9MFkCPQsfxhJgQz0eGGLSuqoY66c6owcZce
 h8ueINClmEHjv6Fdd2WWWeqLCoZyDbe/JsFLkced4xPB+AaiMIABdSgu7
 M546Y8XaI8BcP0zysxGYAbv1YlzzI9iVEXg+V+eEn/2IW/SrvmO7nt2iS
 u3vwPhUxgfu+Oj5Xt77iC2f7mmMMJsrrlGbIhP7mlS6t9uGfqdWp1F8r/ Q==;
X-CSE-ConnectionGUID: vffQ2WcoTlCVLRMbBEtK2Q==
X-CSE-MsgGUID: rbMCUtuXQ2awVKLt+p0uFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15089637"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="15089637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 22:25:54 -0700
X-CSE-ConnectionGUID: 7XnWVU9sTXid/yjQ40wPAQ==
X-CSE-MsgGUID: mLOqxVP1SeScPTOAxiYdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="34151806"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 09 May 2024 22:25:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s5IlN-0005lZ-0v;
 Fri, 10 May 2024 05:25:45 +0000
Date: Fri, 10 May 2024 13:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <202405101333.vdlWwpgr-lkp@intel.com>
References: <20240506215305.30756-4-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-4-alexey.makhalov@broadcom.com>
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

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus linus/master v6.9-rc7 next-20240509]
[cannot apply to tip/x86/vmware]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Makhalov/x86-vmware-Move-common-macros-to-vmware-h/20240507-055606
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240506215305.30756-4-alexey.makhalov%40broadcom.com
patch subject: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
config: x86_64-buildonly-randconfig-003-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101333.vdlWwpgr-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101333.vdlWwpgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101333.vdlWwpgr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_close_channel':
>> vmwgfx_msg.c:(.text+0xaf): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_port_hb_in':
   vmwgfx_msg.c:(.text+0x2c4): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_port_hb_out':
   vmwgfx_msg.c:(.text+0x604): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_send_msg':
   vmwgfx_msg.c:(.text+0x8b0): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_open_channel.constprop.0':
   vmwgfx_msg.c:(.text+0x9e8): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o:vmwgfx_msg.c:(.text+0xc3c): more undefined references to `vmware_hypercall_mode' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
