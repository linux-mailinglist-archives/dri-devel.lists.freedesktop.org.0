Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64008C93CC7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 12:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B89010E031;
	Sat, 29 Nov 2025 11:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MokggMNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FE410E031
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 11:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764414663; x=1795950663;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2UA5sco6NuFh6yBNwCIqsd1c3E4ylFlBew9OjNjMjDA=;
 b=MokggMNnfiqYE0Bgk1DTO2XMnCsbJKbNNIgOf/3QkmPgLbpCLa2iCUZg
 UjMUtJ8ontSZedPZ2xp3POv48ZIU/iQyogrWJIESwkfPkFWStcOs4igkS
 ztbFgC7IJbFq/1Yv7bF/FwQ4o2W3Te8zbt5sdQc6gPBTED/wnFx5dPPki
 s4vItbDJwxfVbw1WsRQfzCBmU5miCTEoSBG+H2VxDEoCRX8vfckh1PnN+
 qTv7f952iBA+22w0KIJFgRJEAHtCDh3InfUdehBc4dEzkz7ll1HOAUwPz
 3J2kqlb3eGKcUEGnnYXXbs/YJrkNSzupO5MRWK+hpibvWOiInazI00wK0 g==;
X-CSE-ConnectionGUID: Vm5jFKFaSw646WY7VHBpsg==
X-CSE-MsgGUID: tFGeez1ETTWtGI7jXLmQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66306801"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="66306801"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 03:11:02 -0800
X-CSE-ConnectionGUID: 07e4EypTSjqk02QeoBMjlw==
X-CSE-MsgGUID: VptHr+F9Sd6YJLQl0Xa/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="193754572"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 29 Nov 2025 03:10:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vPIqt-00000000789-3cxV;
 Sat, 29 Nov 2025 11:10:55 +0000
Date: Sat, 29 Nov 2025 19:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Refactor mmap and munmap logic
 into helper functions
Message-ID: <202511291834.zu81Ud77-lkp@intel.com>
References: <20251128103428.1119696-2-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128103428.1119696-2-ekansh.gupta@oss.qualcomm.com>
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

Hi Ekansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Refactor-mmap-and-munmap-logic-into-helper-functions/20251128-183620
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251128103428.1119696-2-ekansh.gupta%40oss.qualcomm.com
patch subject: [PATCH v2 1/2] misc: fastrpc: Refactor mmap and munmap logic into helper functions
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251129/202511291834.zu81Ud77-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291834.zu81Ud77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291834.zu81Ud77-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/fastrpc.c: In function 'fastrpc_req_munmap_dsp':
>> drivers/misc/fastrpc.c:1825:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1825 |         args[0].ptr = (u64) &req_msg;
         |                       ^
   drivers/misc/fastrpc.c: In function 'fastrpc_req_map_dsp':
   drivers/misc/fastrpc.c:1897:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1897 |         args[0].ptr = (u64)&req_msg;
         |                       ^
   drivers/misc/fastrpc.c:1903:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1903 |         args[1].ptr = (u64)&pages;
         |                       ^
   drivers/misc/fastrpc.c:1906:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1906 |         args[2].ptr = (u64)&rsp_msg;
         |                       ^


vim +1825 drivers/misc/fastrpc.c

  1813	
  1814	static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, u64 raddr, u64 size)
  1815	{
  1816		struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
  1817		struct fastrpc_munmap_req_msg req_msg;
  1818		int err;
  1819		u32 sc;
  1820	
  1821		req_msg.client_id = fl->client_id;
  1822		req_msg.size = size;
  1823		req_msg.vaddr = raddr;
  1824	
> 1825		args[0].ptr = (u64) &req_msg;
  1826		args[0].length = sizeof(req_msg);
  1827	
  1828		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
  1829		err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
  1830					      &args[0]);
  1831	
  1832		return err;
  1833	}
  1834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
