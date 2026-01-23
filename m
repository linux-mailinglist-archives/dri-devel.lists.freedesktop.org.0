Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id okKrI5jgcmkTrAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:44:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB07F6FC56
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C50710E103;
	Fri, 23 Jan 2026 02:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msFWzlNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167B10E103
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 02:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769136275; x=1800672275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8ndyNJikJsEpVSc9dj51nBXSlOB/gf6TZifRUHaN9w0=;
 b=msFWzlNz0ybpgs4nYUwlKxywWKhkQ4yu1G25vlxjQIc1PFKXVsmbVq9O
 fgfxJQzXfuqkWwGVMIPIy4V+avaHg8vZfnGp9WFqlrx7KMjuAj+2SSX8O
 8DcyXVuQ/3NqBk4roHp0IKd28PY4dxBXmUTiC05ra1Y1mhBf/pUKfu3L3
 R6z1oel22fTg7/zabbXp1mIMKbhTzLSLmXJ3Zx6IZojGIm/7oG/ee7qnQ
 stb1n+fm4unBINkBYr3WJCrDcqrhWKRz3WQDeOkydS929wVODFaPjCEnp
 pom3jdALj3DBjwkCrJgZZFSbHKO1R60zngBorVqXkPq89wxzgXTa5Z5Qa w==;
X-CSE-ConnectionGUID: h0qu1VqUQvqlJjzeagCEvg==
X-CSE-MsgGUID: sili0TgXTJ6VqmAwPY3eBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70440032"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="70440032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:44:34 -0800
X-CSE-ConnectionGUID: /cURpc/CT/q72pVQuMgWrw==
X-CSE-MsgGUID: VLZI25VOQ0uqjgYyO5JaEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="211361570"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 18:44:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vj79v-00000000TS2-33aC;
 Fri, 23 Jan 2026 02:44:27 +0000
Date: Fri, 23 Jan 2026 10:43:31 +0800
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
Message-ID: <202601231051.5GWCp3mt-lkp@intel.com>
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
	NEURAL_HAM(-0.00)[-0.782];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: BB07F6FC56
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
config: i386-buildonly-randconfig-003-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231051.5GWCp3mt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231051.5GWCp3mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231051.5GWCp3mt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/cma_debug.c: In function 'cma_debugfs_init':
>> mm/cma_debug.c:207:25: error: 'cma_area_count' undeclared (first use in this function)
     207 |         for (i = 0; i < cma_area_count; i++)
         |                         ^~~~~~~~~~~~~~
   mm/cma_debug.c:207:25: note: each undeclared identifier is reported only once for each function it appears in
>> mm/cma_debug.c:208:38: error: 'cma_areas' undeclared (first use in this function); did you mean 'cma_free'?
     208 |                 cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
         |                                      ^~~~~~~~~
         |                                      cma_free


vim +/cma_area_count +207 mm/cma_debug.c

28b24c1fc8c22c Sasha Levin 2015-04-14  199  
28b24c1fc8c22c Sasha Levin 2015-04-14  200  static int __init cma_debugfs_init(void)
28b24c1fc8c22c Sasha Levin 2015-04-14  201  {
5a7f1b2f2fbeb4 Yue Hu      2019-03-05  202  	struct dentry *cma_debugfs_root;
28b24c1fc8c22c Sasha Levin 2015-04-14  203  	int i;
28b24c1fc8c22c Sasha Levin 2015-04-14  204  
28b24c1fc8c22c Sasha Levin 2015-04-14  205  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
28b24c1fc8c22c Sasha Levin 2015-04-14  206  
28b24c1fc8c22c Sasha Levin 2015-04-14 @207  	for (i = 0; i < cma_area_count; i++)
5a7f1b2f2fbeb4 Yue Hu      2019-03-05 @208  		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
