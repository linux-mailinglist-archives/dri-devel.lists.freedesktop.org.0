Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNyCKcTAmWlDWgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 15:27:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5E16D062
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 15:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C803510E046;
	Sat, 21 Feb 2026 14:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIFbM1fU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ED410E035
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771684031; x=1803220031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7qmlvR0Yq0nrTCBBuGiyvxnV7w579oImjS5HrfNKpuQ=;
 b=CIFbM1fUQBhALv3m86MZAfwUfKI+rsfTex2nHvzWHHDb6CRaiG6Pj9G0
 94lt5/2UBYvD9nHNeJ90viJlHCZbYebEVI0mnckiksiT+PpsqXlzWdYB8
 AsSAhYOLFoHZDWzk30eT9meqUyP1k433/Y1vmWxanYwBQqK8N7SV02Jb8
 Jm7RiGa/TK8WlEPFNVdr2MtWlYvFI0ss52n6dX2wEhrity3LrmoJVx99n
 enO/cykZFrVPmniWJmWTGgiA8iq30j29ixBfCbCZZrAnpqimzWWby2xlU
 vczWBnOembuNP55wM+e+JahIwnqWXXe30gIvw52dBmFsavyhYsFiBoID6 g==;
X-CSE-ConnectionGUID: c2don3RQS6u4gg+fqb+CUQ==
X-CSE-MsgGUID: WiXEXYl6R3OeWhmkpPBEcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="60322793"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="60322793"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 06:27:11 -0800
X-CSE-ConnectionGUID: 0rvlshFARF2eV5jB7Xv0XQ==
X-CSE-MsgGUID: lFBHB36jS8WwZ9Rzjgyl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="214217038"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 21 Feb 2026 06:27:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vtnwo-000000014xw-3qfK;
 Sat, 21 Feb 2026 14:27:06 +0000
Date: Sat, 21 Feb 2026 22:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v7
Message-ID: <202602212224.vH1Jr91w-lkp@intel.com>
References: <20260219160822.1529-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219160822.1529-2-christian.koenig@amd.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:oe-kbuild-all@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 0EA5E16D062
X-Rspamd-Action: no action

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-detach-fence-ops-on-signal-v2/20260220-010804
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260219160822.1529-2-christian.koenig%40amd.com
patch subject: [PATCH 1/8] dma-buf: protected fence ops by RCU v7
config: m68k-randconfig-r111-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212224.vH1Jr91w-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212224.vH1Jr91w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212224.vH1Jr91w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_crtc.c:161:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>> drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const *

vim +161 drivers/gpu/drm/drm_crtc.c

35f8cc3b9a92c6 Gustavo Padovan 2016-12-06  158  
6d6003c4b613c9 Gustavo Padovan 2016-11-15  159  static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
6d6003c4b613c9 Gustavo Padovan 2016-11-15  160  {
6d6003c4b613c9 Gustavo Padovan 2016-11-15 @161  	BUG_ON(fence->ops != &drm_crtc_fence_ops);
6d6003c4b613c9 Gustavo Padovan 2016-11-15  162  	return container_of(fence->lock, struct drm_crtc, fence_lock);
6d6003c4b613c9 Gustavo Padovan 2016-11-15  163  }
6d6003c4b613c9 Gustavo Padovan 2016-11-15  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
