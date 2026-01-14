Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66639D1DB7D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89CD10E3AF;
	Wed, 14 Jan 2026 09:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihyXgY2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A3410E3AF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768384354; x=1799920354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=agacMnmeYUrLp/UPUCqfFq2xNpFBHamuE1mee+9eS5o=;
 b=ihyXgY2Yp6aK9WEijsnSyN0GWCWRG8oYhjw6jxaHcpW/MnZGpINiwnXF
 K4xdWcYmRBptqwwhYSFxr22zhqaEHieu3YLKx/o6Q4koJnJo2Xgx+pLjt
 ocCcXTaJndeEyV67slZYBb/ux6jQ+a7BvRYwY85jIDwg10m5QAc0J4iCG
 RjvItKkkloCgnRlCJmQH729eXsOn4ZGtWbprM+GXtTR/koE1bkeI3io9O
 qrk2JfXbjHNjamKtBxaVrfX+pWInKPmKQkNjj66da6oZmFn4a/7EdHZFB
 sqGdIXrR4PLwDNSSRXPJl25xFAfFDQwWIHUKasW42rZJ8XkP8hks4q9T0 A==;
X-CSE-ConnectionGUID: LUdnjsFQTRaITbzcdfSmww==
X-CSE-MsgGUID: IXHM9OujQFS2VNadmXcEHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69588711"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69588711"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 01:52:33 -0800
X-CSE-ConnectionGUID: G9bV8ggqSX+hh14WYQFw1A==
X-CSE-MsgGUID: 8kzsbPJvTpGz2kACxGG3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205058563"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 01:52:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfxYC-00000000GAy-3Pky;
 Wed, 14 Jan 2026 09:52:28 +0000
Date: Wed, 14 Jan 2026 17:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
Message-ID: <202601141704.EpvIhy4M-lkp@intel.com>
References: <20260113152125.47380-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113152125.47380-2-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip next-20260114]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_is_initialized-function/20260114-001656
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260113152125.47380-2-christian.koenig%40amd.com
patch subject: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141704.EpvIhy4M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141704.EpvIhy4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141704.EpvIhy4M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence-unwrap.c: note: in included file:
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
--
   drivers/dma-buf/dma-fence-array.c: note: in included file (through include/linux/dma-fence-array.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
--
   drivers/dma-buf/dma-fence-chain.c: note: in included file (through include/linux/dma-fence-chain.h):
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
--
   drivers/dma-buf/dma-resv.c: note: in included file (through include/linux/dma-resv.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
--
   drivers/dma-buf/dma-fence.c:1042:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1042:38: sparse:     expected char const [noderef] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1042:38: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1043:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1043:36: sparse:     expected char const [noderef] __rcu *driver
   drivers/dma-buf/dma-fence.c:1043:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1160:44: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1160:44: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1160:44: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1162:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1162:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1162:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1193:46: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1193:46: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1193:46: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1195:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1195:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1195:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
--
>> drivers/gpu/drm/drm_crtc.c:161:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/sync_file.h):
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/ttm/ttm_bo.c:1203:31: sparse: sparse: symbol 'ttm_swap_ops' was not declared. Should it be static?
>> drivers/gpu/drm/ttm/ttm_bo.c:226:27: sparse: sparse: dereference of noderef expression
--
   drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>> drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_fence.c:95:31: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/radeon_fence.c: note: in included file:
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/radeon/radeon_display.c: note: in included file:
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/radeon/radeon_sync.c: note: in included file:
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:499:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: note: in included file (through include/linux/dma-fence-chain.h):
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/dma-fence-array.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/dma-fence-array.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through include/linux/dma-fence-array.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
   include/linux/pwm.h:13:1: sparse: sparse: bad integer constant expression
   include/linux/pwm.h:13:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h, drivers/gpu/drm/i915/i915_drv.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *

vim +717 include/linux/dma-fence.h

976b6d97c62347 Christian König 2022-01-19  708  
976b6d97c62347 Christian König 2022-01-19  709  /**
976b6d97c62347 Christian König 2022-01-19  710   * dma_fence_is_chain - check if a fence is from the chain subclass
976b6d97c62347 Christian König 2022-01-19  711   * @fence: the fence to test
976b6d97c62347 Christian König 2022-01-19  712   *
976b6d97c62347 Christian König 2022-01-19  713   * Return true if it is a dma_fence_chain and false otherwise.
976b6d97c62347 Christian König 2022-01-19  714   */
976b6d97c62347 Christian König 2022-01-19  715  static inline bool dma_fence_is_chain(struct dma_fence *fence)
976b6d97c62347 Christian König 2022-01-19  716  {
976b6d97c62347 Christian König 2022-01-19 @717  	return fence->ops == &dma_fence_chain_ops;
976b6d97c62347 Christian König 2022-01-19  718  }
976b6d97c62347 Christian König 2022-01-19  719  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
