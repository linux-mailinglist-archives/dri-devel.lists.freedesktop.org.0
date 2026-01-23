Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLgtFhbZcmmqqAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:12:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA316F795
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353B210EB29;
	Fri, 23 Jan 2026 02:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gypx1fP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DDF10EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 02:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769134354; x=1800670354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Urg92rPlSCxkcW9xwWZMP1kRZiw/qhuHYe6F6frl7B0=;
 b=gypx1fP9nohmiqhfpTQKIwMVjarKlgNxBzdT9bQiy7XkUJZkDanwit8E
 D/Ozll3iWXmZvJdKhYrMQy4RyesPu66ZWuTnIdY2c0a10bjAManWlAv6p
 NXuxWrDNGn4F6iXbjHjk8axOCdy83MqqoykocUuDziWXboZriWlAXJAvo
 ss0QZtr5WLyTBLOahQZN5qysTN5psG5qmqcE1kLW76VbXQQdUXCOROo9N
 YLYwgnp0dj6c0QscsbzCQb5u7D+XX0A+C4GqT61TIz14KxZ1DXgh9PIb0
 zlkghxQiLSw8A8mF5xyDAsdNcybP8keogpMFC+yIrIZKGQjLPS7M+q9oq w==;
X-CSE-ConnectionGUID: 84+4wkqtT3+hJSGUd9hpkg==
X-CSE-MsgGUID: X/cqs9qRQXyTiKAJpUQPNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81827751"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="81827751"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:12:34 -0800
X-CSE-ConnectionGUID: ZXJ8HK+9RoiuAX4b/V1nhg==
X-CSE-MsgGUID: kenf7FazSm+yHFpZFug07w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2026 18:12:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vj6ew-00000000TQo-2Ia2;
 Fri, 23 Jan 2026 02:12:26 +0000
Date: Fri, 23 Jan 2026 10:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <202601231052.RfGOFd3g-lkp@intel.com>
References: <20260122161009.3865888-5-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-5-thierry.reding@kernel.org>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:oe-kbuild-all@lists.linux.dev,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,linaro.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.775];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 4EA316F795
X-Rspamd-Action: no action

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20260122]
[cannot apply to drm-misc/drm-misc-next robh/for-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20260123-001244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122161009.3865888-5-thierry.reding%40kernel.org
patch subject: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
config: openrisc-randconfig-r072-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231052.RfGOFd3g-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231052.RfGOFd3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231052.RfGOFd3g-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/cma_sysfs.c: In function 'cma_sysfs_init':
>> mm/cma_sysfs.c:119:25: error: 'cma_area_count' undeclared (first use in this function); did you mean 'cma_early_area_count'?
     119 |         for (i = 0; i < cma_area_count; i++) {
         |                         ^~~~~~~~~~~~~~
         |                         cma_early_area_count
   mm/cma_sysfs.c:119:25: note: each undeclared identifier is reported only once for each function it appears in
>> mm/cma_sysfs.c:126:24: error: 'cma_areas' undeclared (first use in this function); did you mean 'cma_attrs'?
     126 |                 cma = &cma_areas[i];
         |                        ^~~~~~~~~
         |                        cma_attrs


vim +119 mm/cma_sysfs.c

43ca106fa8ec7d Minchan Kim 2021-05-04  107  
43ca106fa8ec7d Minchan Kim 2021-05-04  108  static int __init cma_sysfs_init(void)
43ca106fa8ec7d Minchan Kim 2021-05-04  109  {
43ca106fa8ec7d Minchan Kim 2021-05-04  110  	struct kobject *cma_kobj_root;
43ca106fa8ec7d Minchan Kim 2021-05-04  111  	struct cma_kobject *cma_kobj;
43ca106fa8ec7d Minchan Kim 2021-05-04  112  	struct cma *cma;
43ca106fa8ec7d Minchan Kim 2021-05-04  113  	int i, err;
43ca106fa8ec7d Minchan Kim 2021-05-04  114  
43ca106fa8ec7d Minchan Kim 2021-05-04  115  	cma_kobj_root = kobject_create_and_add("cma", mm_kobj);
43ca106fa8ec7d Minchan Kim 2021-05-04  116  	if (!cma_kobj_root)
43ca106fa8ec7d Minchan Kim 2021-05-04  117  		return -ENOMEM;
43ca106fa8ec7d Minchan Kim 2021-05-04  118  
43ca106fa8ec7d Minchan Kim 2021-05-04 @119  	for (i = 0; i < cma_area_count; i++) {
43ca106fa8ec7d Minchan Kim 2021-05-04  120  		cma_kobj = kzalloc(sizeof(*cma_kobj), GFP_KERNEL);
43ca106fa8ec7d Minchan Kim 2021-05-04  121  		if (!cma_kobj) {
43ca106fa8ec7d Minchan Kim 2021-05-04  122  			err = -ENOMEM;
43ca106fa8ec7d Minchan Kim 2021-05-04  123  			goto out;
43ca106fa8ec7d Minchan Kim 2021-05-04  124  		}
43ca106fa8ec7d Minchan Kim 2021-05-04  125  
43ca106fa8ec7d Minchan Kim 2021-05-04 @126  		cma = &cma_areas[i];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
