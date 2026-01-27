Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fPBUJqFFeGmqpAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 05:57:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB628FE86
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 05:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9710E13F;
	Tue, 27 Jan 2026 04:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3HfF2Vv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0BC10E13F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 04:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769489820; x=1801025820;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gdAbZco7AYOgBCqpBkUvDwk4XLCrRqIpAeLK1rwSmtI=;
 b=P3HfF2Vv7Mnu4drYKqmRF+fpK66QP9I/KQMjMG2rkPeACJ7UpJJQiF8Z
 z9N+TgIeMWewizM/SPw9rhIaO4yfYrtNfF1duf0izgxbihzVNHLXaFYtZ
 khm8H3wr9++03/hYp2UOaXhy6fUNitjbGx7W/jViE7+2sntHhFKw7x9vB
 yIzY8MepTEMun4AHT86cqmqCD9o7Pk8hH5QVJik63zv9z5BRxrdwe22PD
 y4V+ZUDB3R8Q87ckeKntwWxl5+nKL4oKAEa5D3lh0C866VdSBqyAFlYxI
 BVdEWeyg3w1/9oxFVToSOb9pnR6kQ6XeuYbgk6+lueL+7cMgxIA0IPPeA g==;
X-CSE-ConnectionGUID: j0fbXFncRd2hCcGAopsYlQ==
X-CSE-MsgGUID: tE+Uo/Q0Rqatrka13VbbOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70576394"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70576394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:56:56 -0800
X-CSE-ConnectionGUID: YKkVOZHhR3ePQucQF9Ts6g==
X-CSE-MsgGUID: 1ddyYHuPTq6JtQO7mril+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207103832"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 26 Jan 2026 20:56:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkb8E-00000000Y0Q-2Q01;
 Tue, 27 Jan 2026 04:56:50 +0000
Date: Tue, 27 Jan 2026 12:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
Message-ID: <202601271204.Yb3rgz99-lkp@intel.com>
References: <20260120105655.7134-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120105655.7134-6-christian.koenig@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:oe-kbuild-all@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,ursulin.net,intel.com,linaro.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: EBB628FE86
X-Rspamd-Action: no action

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next drm-tip/drm-tip next-20260126]
[cannot apply to linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v5/20260120-195535
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260120105655.7134-6-christian.koenig%40amd.com
patch subject: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260127/202601271204.Yb3rgz99-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271204.Yb3rgz99-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271204.Yb3rgz99-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/kthread.h:6,
                    from drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:6:
   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c: In function '__dma_fence_signal__notify':
>> drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:151:34: error: 'struct dma_fence' has no member named 'lock'
     151 |         lockdep_assert_held(fence->lock);
         |                                  ^~
   include/linux/lockdep.h:392:61: note: in definition of macro 'lockdep_assert_held'
     392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^
--
   In file included from include/linux/debugobjects.h:6,
                    from drivers/gpu/drm/i915/i915_active.c:7:
   drivers/gpu/drm/i915/i915_active.c: In function '__i915_active_fence_set':
>> drivers/gpu/drm/i915/i915_active.c:1048:32: error: 'struct dma_fence' has no member named 'lock'
    1048 |         spin_lock_irqsave(fence->lock, flags);
         |                                ^~
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1048:9: note: in expansion of macro 'spin_lock_irqsave'
    1048 |         spin_lock_irqsave(fence->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1050:38: error: 'struct dma_fence' has no member named 'lock'
    1050 |                 spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                      ^~
   include/linux/spinlock.h:235:44: note: in definition of macro 'raw_spin_lock_nested'
     235 |         _raw_spin_lock(((void)(subclass), (lock)))
         |                                            ^~~~
   drivers/gpu/drm/i915/i915_active.c:1050:17: note: in expansion of macro 'spin_lock_nested'
    1050 |                 spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                 ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1064:41: error: 'struct dma_fence' has no member named 'lock'
    1064 |                         spin_unlock(prev->lock);
         |                                         ^~
   drivers/gpu/drm/i915/i915_active.c:1067:45: error: 'struct dma_fence' has no member named 'lock'
    1067 |                 spin_unlock_irqrestore(fence->lock, flags);
         |                                             ^~
   drivers/gpu/drm/i915/i915_active.c:1072:40: error: 'struct dma_fence' has no member named 'lock'
    1072 |                 spin_lock_irqsave(fence->lock, flags);
         |                                        ^~
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1072:17: note: in expansion of macro 'spin_lock_irqsave'
    1072 |                 spin_lock_irqsave(fence->lock, flags);
         |                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1074:46: error: 'struct dma_fence' has no member named 'lock'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                              ^~
   include/linux/spinlock.h:235:44: note: in definition of macro 'raw_spin_lock_nested'
     235 |         _raw_spin_lock(((void)(subclass), (lock)))
         |                                            ^~~~
   drivers/gpu/drm/i915/i915_active.c:1074:25: note: in expansion of macro 'spin_lock_nested'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                         ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1091:33: error: 'struct dma_fence' has no member named 'lock'
    1091 |                 spin_unlock(prev->lock); /* serialise with prev->cb_list */
         |                                 ^~
   drivers/gpu/drm/i915/i915_active.c:1094:37: error: 'struct dma_fence' has no member named 'lock'
    1094 |         spin_unlock_irqrestore(fence->lock, flags);
         |                                     ^~


vim +151 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c

0152b3b3f49b36 Chris Wilson 2019-05-08  144  
0152b3b3f49b36 Chris Wilson 2019-05-08  145  static void
f2cb60e9a3881e Chris Wilson 2019-08-17  146  __dma_fence_signal__notify(struct dma_fence *fence,
f2cb60e9a3881e Chris Wilson 2019-08-17  147  			   const struct list_head *list)
0152b3b3f49b36 Chris Wilson 2019-05-08  148  {
0152b3b3f49b36 Chris Wilson 2019-05-08  149  	struct dma_fence_cb *cur, *tmp;
0152b3b3f49b36 Chris Wilson 2019-05-08  150  
0152b3b3f49b36 Chris Wilson 2019-05-08 @151  	lockdep_assert_held(fence->lock);
0152b3b3f49b36 Chris Wilson 2019-05-08  152  
f2cb60e9a3881e Chris Wilson 2019-08-17  153  	list_for_each_entry_safe(cur, tmp, list, node) {
0152b3b3f49b36 Chris Wilson 2019-05-08  154  		INIT_LIST_HEAD(&cur->node);
0152b3b3f49b36 Chris Wilson 2019-05-08  155  		cur->func(fence, cur);
0152b3b3f49b36 Chris Wilson 2019-05-08  156  	}
0152b3b3f49b36 Chris Wilson 2019-05-08  157  }
0152b3b3f49b36 Chris Wilson 2019-05-08  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
