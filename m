Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAcCAMeZnmnXWQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 07:42:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA41926D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 07:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E406610E6B3;
	Wed, 25 Feb 2026 06:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEWcgyH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6787110E1A7;
 Wed, 25 Feb 2026 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772001731; x=1803537731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fM2txuhNeICW8Ro1iChqOY7CRWcaOwVJ3d53u4wNsHU=;
 b=dEWcgyH6dEqC9lVHNiCtGdR2WKtAPZ0vWSsgCtaQo5zUexM7A4BYl1N1
 AGiA60kkLDZT+qdF4AQsDp7TnRLOsLhq92di9lmlvjYWDQqrR46S51820
 HZYc1eqGBgUHRAaReupYJ0nly489mttoSKCcNyrF5PS2cLYW7QImdKrfY
 j6tdF+o+zDVNHI8afBIB2chLE9nIH5J2ErTbZLyyuwYZQYFl8s6ZT8CCS
 IkqGuh4bE9SQBRNIb5rjeDHBUoH4UFWdscIyo3gTscplqlLe0RN8B2xZf
 hDSz5lkvRn85Tbzuh6ca8YE5qS0fhOw1VFDn5Sl6k1M/Ma7L+tPuSyulo Q==;
X-CSE-ConnectionGUID: TF22nLSVTT2G0y1Fa1LY/g==
X-CSE-MsgGUID: +S9CcuvFSdmOs+/Ze7Qb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="95648388"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="95648388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:42:10 -0800
X-CSE-ConnectionGUID: Bch7d7APTou6Ijb36Z5vGQ==
X-CSE-MsgGUID: FUq5MRIxToq/g5YGyKp1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215383112"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 24 Feb 2026 22:41:59 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vv8WS-0000000041t-3Jb9;
 Wed, 25 Feb 2026 06:39:56 +0000
Date: Wed, 25 Feb 2026 14:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <superm1@kernel.org>, Ce Sun <cesun102@amd.com>,
 Yo-Jung Leo Lin <Leo.Lin@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix resource leaks
Message-ID: <202602251459.1jr0PuUf-lkp@intel.com>
References: <20260225014425.2474802-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225014425.2474802-1-ethantidmore06@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,ffwll.ch,amd.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: A1CA41926D7
X-Rspamd-Action: no action

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Tidmore/drm-amdgpu-Fix-resource-leaks/20260225-095342
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260225014425.2474802-1-ethantidmore06%40gmail.com
patch subject: [PATCH] drm/amdgpu: Fix resource leaks
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260225/202602251459.1jr0PuUf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251459.1jr0PuUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251459.1jr0PuUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_fini_sw':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4942:16: warning: unused variable 'idx' [-Wunused-variable]
    4942 |         int i, idx;
         |                ^~~


vim +/idx +4942 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

72c8c97b1522ce Andrey Grodzovsky   2021-05-12  4939  
72c8c97b1522ce Andrey Grodzovsky   2021-05-12  4940  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
72c8c97b1522ce Andrey Grodzovsky   2021-05-12  4941  {
bd22e44ad415ac Christian König     2025-01-15 @4942  	int i, idx;
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4943  	bool px;
62d5f9f7110ad3 Leslie Shi          2022-01-05  4944  
a5c5d8d50ecf58 Lang Yu             2021-10-21  4945  	amdgpu_device_ip_fini(adev);
b61badd20b443e Vitaly Prosyak      2024-11-11  4946  	amdgpu_fence_driver_sw_fini(adev);
b31d306378d9ba Mario Limonciello   2023-01-04  4947  	amdgpu_ucode_release(&adev->firmware.gpu_info_fw);
d38ceaf99ed015 Alex Deucher        2015-04-20  4948  	adev->accel_working = false;
68ce8b24224265 Christian König     2022-03-02  4949  	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
bd22e44ad415ac Christian König     2025-01-15  4950  	for (i = 0; i < MAX_XCP; ++i) {
bd22e44ad415ac Christian König     2025-01-15  4951  		dma_fence_put(adev->isolation[i].spearhead);
bd22e44ad415ac Christian König     2025-01-15  4952  		amdgpu_sync_free(&adev->isolation[i].active);
bd22e44ad415ac Christian König     2025-01-15  4953  		amdgpu_sync_free(&adev->isolation[i].prev);
bd22e44ad415ac Christian König     2025-01-15  4954  	}
04442bf70debb1 Lijo Lazar          2021-03-16  4955  
04442bf70debb1 Lijo Lazar          2021-03-16  4956  	amdgpu_reset_fini(adev);
04442bf70debb1 Lijo Lazar          2021-03-16  4957  
d38ceaf99ed015 Alex Deucher        2015-04-20  4958  	/* free i2c buses */
d38ceaf99ed015 Alex Deucher        2015-04-20  4959  	amdgpu_i2c_fini(adev);
bfca02892773d2 Shaoyun Liu         2018-02-01  4960  
6e8ca38ebc9b13 Lijo Lazar          2025-02-05  4961  	if (adev->bios) {
bfca02892773d2 Shaoyun Liu         2018-02-01  4962  		if (amdgpu_emu_mode != 1)
d38ceaf99ed015 Alex Deucher        2015-04-20  4963  			amdgpu_atombios_fini(adev);
e986e89659e18b Lijo Lazar          2025-02-05  4964  		amdgpu_bios_release(adev);
6e8ca38ebc9b13 Lijo Lazar          2025-02-05  4965  	}
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4966  
8a2b51392ac4a5 Lijo Lazar          2023-10-04  4967  	kfree(adev->fru_info);
8a2b51392ac4a5 Lijo Lazar          2023-10-04  4968  	adev->fru_info = NULL;
8a2b51392ac4a5 Lijo Lazar          2023-10-04  4969  
b5aaa82e2b12fe Flora Cui           2025-03-14  4970  	kfree(adev->xcp_mgr);
b5aaa82e2b12fe Flora Cui           2025-03-14  4971  	adev->xcp_mgr = NULL;
b5aaa82e2b12fe Flora Cui           2025-03-14  4972  
127ed492ad2df0 Lijo Lazar          2025-06-30  4973  	px = amdgpu_device_supports_px(adev);
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4974  
7b1c6263eaf4fd Alex Deucher        2023-10-17  4975  	if (px || (!dev_is_removable(&adev->pdev->dev) &&
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4976  				apple_gmux_detect(NULL, NULL)))
d38ceaf99ed015 Alex Deucher        2015-04-20  4977  		vga_switcheroo_unregister_client(adev->pdev);
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4978  
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4979  	if (px)
83ba126a9be318 Alex Deucher        2016-06-03  4980  		vga_switcheroo_fini_domain_pm_ops(adev->dev);
d37a3929ca0363 Orlando Chamberlain 2023-03-03  4981  
38d6be8199331e Alex Deucher        2020-11-20  4982  	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
b8779475869a26 Christoph Hellwig   2021-07-16  4983  		vga_client_unregister(adev->pdev);
e9bc1bf7916e00 Yintian Tao         2019-06-05  4984  
d155bef0636e01 Arnd Bergmann       2019-07-08  4985  	if (IS_ENABLED(CONFIG_PERF_EVENTS))
9c7c85f7ea1fe5 Jonathan Kim        2019-06-19  4986  		amdgpu_pmu_fini(adev);
9e2096baab9add Lijo Lazar          2025-10-10  4987  	if (adev->discovery.bin)
a190d1c75c73ce Xiaojie Yuan        2019-03-27  4988  		amdgpu_discovery_fini(adev);
72c8c97b1522ce Andrey Grodzovsky   2021-05-12  4989  
cfbb6b0047448e Andrey Grodzovsky   2022-01-21  4990  	amdgpu_reset_put_reset_domain(adev->reset_domain);
cfbb6b0047448e Andrey Grodzovsky   2022-01-21  4991  	adev->reset_domain = NULL;
cfbb6b0047448e Andrey Grodzovsky   2022-01-21  4992  
72c8c97b1522ce Andrey Grodzovsky   2021-05-12  4993  	kfree(adev->pci_state);
1dd2fa0e00f17b Lijo Lazar          2025-06-28  4994  	kfree(adev->pcie_reset_ctx.swds_pcistate);
1dd2fa0e00f17b Lijo Lazar          2025-06-28  4995  	kfree(adev->pcie_reset_ctx.swus_pcistate);
d38ceaf99ed015 Alex Deucher        2015-04-20  4996  }
d38ceaf99ed015 Alex Deucher        2015-04-20  4997  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
