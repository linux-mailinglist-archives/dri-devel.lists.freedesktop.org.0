Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI1mIUVPf2nangIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 14:04:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B93C5F45
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 14:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D00110E035;
	Sun,  1 Feb 2026 13:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bv/7Kfns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0A110E035;
 Sun,  1 Feb 2026 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769951039; x=1801487039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JxRbL3UiA7chywZx7s/1NhqsSsDE4+0tIBI21pQzhp8=;
 b=bv/7Kfns29qip5HXbMTkHnYr/nrOjyWTXhSTbiLgeXLJbaws22qMJ0Gi
 8QlN/N7UWODKnlYZftibQu7Uf6O/NUk1Q7P3k9hPOZW2ISskh+o9pFYrH
 cROvZBxl90c2AVL4asxOhnc5yWP5eUM4ouAs0Mzen8u6AboxwwHDnt3Qm
 o3sJvPCs/0butZYkxp4L7PPJEUoSeGTgNClPgMBn4ktBTzorQH4+1xRqK
 htQmmlPklwkHMqrPJq3Zr6n0qsQyE5pa+Zy+GdLjbOUkdMl6D8OUzOe3q
 wNJsVO5odYyAFaih8A73DD6+9qtsruLQkUwBUkqE2iSrP4bEEf5tpE3BY w==;
X-CSE-ConnectionGUID: KqnM1Gj4TiS9tAHRa3IOGA==
X-CSE-MsgGUID: /fsG3yOHT2ma7QgikVK46w==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70149723"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; d="scan'208";a="70149723"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 05:03:58 -0800
X-CSE-ConnectionGUID: 3kWg8PvUTxuKPPw4OIctOQ==
X-CSE-MsgGUID: TrdnJnaNRvGEGGazG0k4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; d="scan'208";a="209048462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 05:03:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vmX7F-00000000elw-1KtL;
 Sun, 01 Feb 2026 13:03:49 +0000
Date: Sun, 1 Feb 2026 21:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, balbirs@nvidia.com,
 matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com, jniethe@nvidia.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: [PATCH v5 13/13] mm: Remove device private pages from the
 physical address space
Message-ID: <202602012037.jpAjBFBa-lkp@intel.com>
References: <20260130111050.53670-14-jniethe@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130111050.53670-14-jniethe@nvidia.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 86B93C5F45
X-Rspamd-Action: no action

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 344db0fba38920be64a429c64a8ca0531572896c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/mm-migrate_device-Introduce-migrate_pfn_from_page-helper/20260130-191416
base:   344db0fba38920be64a429c64a8ca0531572896c
patch link:    https://lore.kernel.org/r/20260130111050.53670-14-jniethe%40nvidia.com
patch subject: [PATCH v5 13/13] mm: Remove device private pages from the physical address space
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260201/202602012037.jpAjBFBa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602012037.jpAjBFBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602012037.jpAjBFBa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1071:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1071 |                 if (IS_ERR(r))
         |                     ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1075:6: note: uninitialized use occurs here
    1075 |         if (ret) {
         |             ^~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1071:3: note: remove the 'if' if its condition is always true
    1071 |                 if (IS_ERR(r))
         |                 ^~~~~~~~~~~~~~
    1072 |                         ret = PTR_ERR(r);
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1035:9: note: initialize the variable 'ret' to silence this warning
    1035 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +1071 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c

  1028	
  1029	int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
  1030	{
  1031		struct amdgpu_kfd_dev *kfddev = &adev->kfd;
  1032		struct dev_pagemap *pgmap;
  1033		unsigned long size;
  1034		void *r;
  1035		int ret;
  1036	
  1037		/* Page migration works on gfx9 or newer */
  1038		if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
  1039			return -EINVAL;
  1040	
  1041		if (adev->apu_prefer_gtt)
  1042			return 0;
  1043	
  1044		pgmap = &kfddev->pgmap;
  1045		memset(pgmap, 0, sizeof(*pgmap));
  1046	
  1047		/* TODO: register all vram to HMM for now.
  1048		 * should remove reserved size
  1049		 */
  1050		size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
  1051		if (adev->gmc.xgmi.connected_to_cpu) {
  1052			pgmap->range.start = adev->gmc.aper_base;
  1053			pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
  1054			pgmap->type = MEMORY_DEVICE_COHERENT;
  1055		} else {
  1056			pgmap->nr_pages = size / PAGE_SIZE;
  1057			pgmap->type = MEMORY_DEVICE_PRIVATE;
  1058		}
  1059	
  1060		pgmap->nr_range = 1;
  1061		pgmap->ops = &svm_migrate_pgmap_ops;
  1062		pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
  1063		pgmap->flags = 0;
  1064		/* Device manager releases device-specific resources, memory region and
  1065		 * pgmap when driver disconnects from device.
  1066		 */
  1067		if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
  1068			ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
  1069		} else {
  1070			r = devm_memremap_pages(adev->dev, pgmap);
> 1071			if (IS_ERR(r))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
