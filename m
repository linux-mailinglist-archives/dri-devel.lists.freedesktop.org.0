Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ii/I0U7fmkOWgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 18:26:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB8C3323
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 18:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0ED10E0A3;
	Sat, 31 Jan 2026 17:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViRVfNH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BE510E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769880384; x=1801416384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uIWfSCvK68Etb9X3TzeCb76P3tmAfEpNTg90mX9Wfyg=;
 b=ViRVfNH61926YvSP4IpNwW13r/5E/nB6SG4HgPzX3ISHsz6GcmvqjZnZ
 GvpaV4KCVs3aYnqKPsQqnaSidxsCtrdVUhoRqhVsCQYrWz1F4dGy9sWdX
 /UMSDYCNPaMfXX8maASgNo0ixhfNyP2/XcOfqk/RD2BoVlElZ3bhZO50O
 /Fm9DtdJiAmfHAdrWVRAfc836uxiInFdkuv1j1Jnm5EDVeZA1fcbPMKgY
 5XNbSsxoebn2FAfWB0Dm1/P7kG5sQcq/cr47K66E5H944MgZJ+I43EOV9
 GAZJsYedzG2Wk8ZBeI0KxONVNM0VMC4izZeZjTrJ0KvGf/PVCdT/w3TPM Q==;
X-CSE-ConnectionGUID: /3Af3qW6ToKFkvAWnm5W6w==
X-CSE-MsgGUID: la28iow0Ti+IctKiUwrvRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="73705123"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; d="scan'208";a="73705123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2026 09:26:23 -0800
X-CSE-ConnectionGUID: PJk2UmUAQg2/JXjYRlChjQ==
X-CSE-MsgGUID: P3a5X5xzR/mmRtRzFiJGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; d="scan'208";a="213607954"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2026 09:26:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vmEji-00000000eEO-19A9;
 Sat, 31 Jan 2026 17:26:18 +0000
Date: Sun, 1 Feb 2026 01:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>, dev@lankhorst.se,
 mripard@kernel.org, natalie.vock@gmx.de, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lujialin4@huawei.com, chenridong@huaweicloud.com
Subject: Re: [PATCH -next 1/3] cgroup/dmem: fix NULL pointer dereference when
 setting max
Message-ID: <202602010100.5CjcoPFh-lkp@intel.com>
References: <20260131091202.344788-2-chenridong@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131091202.344788-2-chenridong@huaweicloud.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:chenridong@huaweicloud.com,m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:oe-kbuild-all@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[huaweicloud.com,lankhorst.se,kernel.org,gmx.de,cmpxchg.org,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 95FB8C3323
X-Rspamd-Action: no action

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260130]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/cgroup-dmem-fix-NULL-pointer-dereference-when-setting-max/20260131-173002
base:   next-20260130
patch link:    https://lore.kernel.org/r/20260131091202.344788-2-chenridong%40huaweicloud.com
patch subject: [PATCH -next 1/3] cgroup/dmem: fix NULL pointer dereference when setting max
config: x86_64-randconfig-161-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010100.5CjcoPFh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010100.5CjcoPFh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010100.5CjcoPFh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/dmem.c:703:7: warning: variable 'region' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     703 |                 if (!options || !*options) {
         |                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/dmem.c:729:13: note: uninitialized use occurs here
     729 |                 kref_put(&region->ref, dmemcg_free_region);
         |                           ^~~~~~
   kernel/cgroup/dmem.c:703:3: note: remove the 'if' if its condition is always false
     703 |                 if (!options || !*options) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     704 |                         err = -EINVAL;
         |                         ~~~~~~~~~~~~~~
     705 |                         goto out_put;
         |                         ~~~~~~~~~~~~~
     706 |                 }
         |                 ~
>> kernel/cgroup/dmem.c:703:7: warning: variable 'region' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     703 |                 if (!options || !*options) {
         |                     ^~~~~~~~
   kernel/cgroup/dmem.c:729:13: note: uninitialized use occurs here
     729 |                 kref_put(&region->ref, dmemcg_free_region);
         |                           ^~~~~~
   kernel/cgroup/dmem.c:703:7: note: remove the '||' if its condition is always false
     703 |                 if (!options || !*options) {
         |                     ^~~~~~~~~~~
   kernel/cgroup/dmem.c:685:36: note: initialize the variable 'region' to silence this warning
     685 |                 struct dmem_cgroup_region *region;
         |                                                  ^
         |                                                   = NULL
   2 warnings generated.


vim +703 kernel/cgroup/dmem.c

   674	
   675	static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
   676					 char *buf, size_t nbytes, loff_t off,
   677					 void (*apply)(struct dmem_cgroup_pool_state *, u64))
   678	{
   679		struct dmemcg_state *dmemcs = css_to_dmemcs(of_css(of));
   680		int err = 0;
   681	
   682		while (buf && !err) {
   683			struct dmem_cgroup_pool_state *pool = NULL;
   684			char *options, *region_name;
   685			struct dmem_cgroup_region *region;
   686			u64 new_limit;
   687	
   688			options = buf;
   689			buf = strchr(buf, '\n');
   690			if (buf)
   691				*buf++ = '\0';
   692	
   693			options = strstrip(options);
   694	
   695			/* eat empty lines */
   696			if (!options[0])
   697				continue;
   698	
   699			region_name = strsep(&options, " \t");
   700			if (!region_name[0])
   701				continue;
   702	
 > 703			if (!options || !*options) {
   704				err = -EINVAL;
   705				goto out_put;
   706			}
   707	
   708			rcu_read_lock();
   709			region = dmemcg_get_region_by_name(region_name);
   710			rcu_read_unlock();
   711	
   712			if (!region)
   713				return -EINVAL;
   714	
   715			err = dmemcg_parse_limit(options, region, &new_limit);
   716			if (err < 0)
   717				goto out_put;
   718	
   719			pool = get_cg_pool_unlocked(dmemcs, region);
   720			if (IS_ERR(pool)) {
   721				err = PTR_ERR(pool);
   722				goto out_put;
   723			}
   724	
   725			/* And commit */
   726			apply(pool, new_limit);
   727	
   728	out_put:
   729			kref_put(&region->ref, dmemcg_free_region);
   730		}
   731	
   732	
   733		return err ?: nbytes;
   734	}
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
