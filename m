Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAbPNRW2omma5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:32:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471871C1C05
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997710E24E;
	Sat, 28 Feb 2026 09:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kj97QGmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B445410E24E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772271121; x=1803807121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Rrx8y/C17jrzfE6kvyZzwZwuPU1bRbyLhVZrjF/dgcs=;
 b=kj97QGmOTWRLlpEJ8/hgwUuywDU3X3JfdSFXB9G/rWNtP0cUDGkcmAiT
 a9nxEvmmE6NHswxhtTaJngi+hcVa1EgtJiYrLTkM1v+LlTYs9PUZcFcQz
 oXUETJ1f7soUqvfxxBsvKIzqt4WCdB2gukxSH1ddHP3+XYopSEJCOcaFS
 51wkwrAZZ/wLc49p4T0pXfmv5lDEUpIMKTDQ9MniRtEyz2XN17naK04UW
 foShup4p+OraQsIzJ3JtKHLKNGDaEWN7EGBbJTNip39YmrALjyQHhY63q
 /l8JOFCi/5uYMvXntS4Zz9QQ9ccEY0qIijCmzg3GVH19OkMsmdjOrY5dv g==;
X-CSE-ConnectionGUID: uG1xdaZNS1CXQcMHnR1ung==
X-CSE-MsgGUID: b1jN5C7wR4WtGprBY4taZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84053351"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="84053351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2026 01:32:01 -0800
X-CSE-ConnectionGUID: pykYmDP9SDaeLcRLYXMDlw==
X-CSE-MsgGUID: M64QioP1Qv+fcwnEXOpsQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="222113504"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 28 Feb 2026 01:31:55 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vwGfw-00000000BQt-0KRK;
 Sat, 28 Feb 2026 09:31:52 +0000
Date: Sat, 28 Feb 2026 17:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 8/9] dma-buf: heaps: cma: Turn the heap into a module
Message-ID: <202602281751.KRAYsRVG-lkp@intel.com>
References: <20260227-dma-buf-heaps-as-modules-v2-8-454aee7e06cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-dma-buf-heaps-as-modules-v2-8-454aee7e06cc@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 471871C1C05
X-Rspamd-Action: no action

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 499a718536dc0e1c1d1b6211847207d58acd9916]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/dma-contiguous-Turn-heap-registration-logic-around/20260227-212606
base:   499a718536dc0e1c1d1b6211847207d58acd9916
patch link:    https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-8-454aee7e06cc%40kernel.org
patch subject: [PATCH v2 8/9] dma-buf: heaps: cma: Turn the heap into a module
config: x86_64-randconfig-002-20260227 (https://download.01.org/0day-ci/archive/20260228/202602281751.KRAYsRVG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281751.KRAYsRVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281751.KRAYsRVG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dma_contiguous_get_reserved_region" [drivers/dma-buf/heaps/cma_heap.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
