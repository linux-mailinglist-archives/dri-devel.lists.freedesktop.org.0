Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD3D1DD52
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CF710E59D;
	Wed, 14 Jan 2026 10:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="dfGtGBZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E73389A86
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:07:48 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso58021785e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768385267; x=1768990067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X/Z0fmvqWsCnRnKPKt0QOH8rpFv1SlCdBRhOC+pQhwI=;
 b=dfGtGBZigq/Vc3cSVbPWRY8sKLKQTshjrfytuK44NsTX+ewJu/LR6MDi8v7vBs4x3/
 7b5ErqIDZS00emrvqHtMlZRRd8yjZ0mubdWwBYcMiDBzEbKNzhEbhhZqv0yyDuQYA/m1
 flCzXKJIKGH1jUFsWGwPWQv/iAWL365YiAFBHy6ZGyb5OpZuBnwV4E0afR+wyPi5sK7b
 9glVysYZ3QbtlzD1XJ3fONeCpPtuvPg7VIGFbJkJpKVKREkVuWXhKZ+HnqpbgkPcgipN
 p04EIWa5Rg+LwotMsscrq8weakz/CGsi61UHcbcqiqJsszVDWhQ9xCwoJs2TwBch+Ijd
 6RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768385267; x=1768990067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X/Z0fmvqWsCnRnKPKt0QOH8rpFv1SlCdBRhOC+pQhwI=;
 b=ER7yk0WraecyGhKwJj9xPyE4F5I3eRnCExF3VKoOZluwqL3YVgHWaLeeMeAOccVEKQ
 kg30DhSPcyKUWfUDGhbzMCJq0vumoqCC1A6+qtI7jpdictBtApGgz3awMM1UgkeyXGYe
 RMzYGbcfPROs3IQvjl/JPVeovfI0pOeID+RzK6XGIH1h4Q83iuFLYNcLke2Opx0clS/Y
 WMQIuAeahP6MfVwl2z/SczBguRe9UvqsMYImxhzIntIwA1iYs1q7MxriLxHUQt4GgPlT
 f/9RaYNiZg5p3DL35eGhqW0jjRdOtCZ2x5Ck1r1kpi/oFadOyntfZdYl+n0Ocvps3vHE
 YXzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLB/5/gHLs6/p2KhisAojCU9YBlD3+Xn3+esLo+5eGFZDCDxIoDsvT8cYMFYKJ+DWtqId5EGMug3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmIygTHIFm5vF6TMVljW9TeQBFru11TPdaBq7K2wPuOqN95OZQ
 mytorE6UZep9wATfg55MMuajGTiHOGckIIQJ9B5pz36iz/RzKSYrjDomD/u6GBeLQtU=
X-Gm-Gg: AY/fxX5nirLFveUpeEWNNUDYLVFzi1r3Lc2K4L6ZMdd3iWgCu2SPO+ZOVWWVS8Aypuv
 VPHBc1O1vWZ1zANWWpYw+kj1lbmSdea1+BfcjvCllwljI1qpSkx8/guEg3qCG0/MmU34rWB0okg
 iS0LV3jxiboBNrxJiTKQAOAcowimkjjimEhVJ9zptSGhdnbUwmJYcARWMAvlfjoRsIYEl6rwDHD
 SgLuC6GxMSQTZ7ZexOLXqMGbVUueYnyU3596Q2Tklsirx3w28U21hflyNdIZk/0aCrME02vBRKP
 eYNKp6CoWMBG+ZMFDsKfW5V3WsGenGgK4g01r6bT4+1vdiCqsRe1trG0AaTwuQhFw+3aavd1V+G
 Q4PjDMqDxwDHBDEROisz07I5G++n8hQ6Ay7o6ISC9v01/4wTVH7mtsjxtyW/xLNhqZXVAk+i5TV
 PYLC8Xzve0Dm/8t45cy6O5C5IftQIvlAVQ
X-Received: by 2002:a05:600c:4446:b0:477:76cb:4812 with SMTP id
 5b1f17b1804b1-47ee47227cemr16589055e9.0.1768385266659; 
 Wed, 14 Jan 2026 02:07:46 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee2829954sm16633155e9.5.2026.01.14.02.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 02:07:46 -0800 (PST)
Message-ID: <d74dec32-82ef-471f-b04c-2f97971e1f2a@ursulin.net>
Date: Wed, 14 Jan 2026 10:07:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
To: kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-2-christian.koenig@amd.com>
 <202601141704.EpvIhy4M-lkp@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <202601141704.EpvIhy4M-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 14/01/2026 09:52, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build warnings:

New warnings aside, some of the old ones are caused by my changes last 
year. I sent a fix back then:

https://lore.kernel.org/dri-devel/20250616155952.24259-1-tvrtko.ursulin@igalia.com/

But it seems to have fallen through the cracks.

Maybe pull it to your series Christian to make sure you are getting 
report for only new warnings with any future respins?

Regards,

Tvrtko

> 
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip next-20260114]
> [cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_is_initialized-function/20260114-001656
> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
> patch link:    https://lore.kernel.org/r/20260113152125.47380-2-christian.koenig%40amd.com
> patch subject: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
> config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141704.EpvIhy4M-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141704.EpvIhy4M-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601141704.EpvIhy4M-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>     drivers/dma-buf/dma-fence-unwrap.c: note: in included file:
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-fence-array.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-fence-chain.c: note: in included file (through include/linux/dma-fence-chain.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-resv.c: note: in included file (through include/linux/dma-resv.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/dma-buf/dma-fence.c:1042:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1042:38: sparse:     expected char const [noderef] __rcu *timeline
>     drivers/dma-buf/dma-fence.c:1042:38: sparse:     got char *
>     drivers/dma-buf/dma-fence.c:1043:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1043:36: sparse:     expected char const [noderef] __rcu *driver
>     drivers/dma-buf/dma-fence.c:1043:36: sparse:     got char *
>     drivers/dma-buf/dma-fence.c:1160:44: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
>     drivers/dma-buf/dma-fence.c:1160:44: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1160:44: sparse:     got char const *
>     drivers/dma-buf/dma-fence.c:1162:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1162:24: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1162:24: sparse:     got char *
>     drivers/dma-buf/dma-fence.c:1193:46: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
>     drivers/dma-buf/dma-fence.c:1193:46: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1193:46: sparse:     got char const *
>     drivers/dma-buf/dma-fence.c:1195:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
>     drivers/dma-buf/dma-fence.c:1195:24: sparse:     expected char const [noderef] __rcu *
>     drivers/dma-buf/dma-fence.c:1195:24: sparse:     got char *
>     drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>     include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
>     include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
>     include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
>>> include/trace/events/dma_fence.h:42:1: sparse: sparse: dereference of noderef expression
> --
>>> drivers/gpu/drm/drm_crtc.c:161:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/sync_file.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/ttm/ttm_bo.c:1203:31: sparse: sparse: symbol 'ttm_swap_ops' was not declared. Should it be static?
>>> drivers/gpu/drm/ttm/ttm_bo.c:226:27: sparse: sparse: dereference of noderef expression
> --
>     drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: bad integer constant expression
>     drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
>     drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>>> drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse:     expected unsigned int volatile [usertype]
>     drivers/gpu/drm/radeon/radeon_fence.c:73:40: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/radeon/radeon_fence.c:95:31: sparse: sparse: cast to restricted __le32
>     drivers/gpu/drm/radeon/radeon_fence.c: note: in included file:
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/radeon/radeon_display.c: note: in included file:
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/radeon/radeon_sync.c: note: in included file:
>>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
>     drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:499:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>     drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: note: in included file (through include/linux/dma-fence-chain.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:93:20: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>>> include/linux/dma-fence.h:717:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:717:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/dma-fence-array.h):
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     include/linux/dma-fence.h:706:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     include/linux/dma-fence.h:706:27: sparse:    struct dma_fence_ops const *
>     drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
> --
>     drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
>     include/linux/pwm.h:13:1: sparse: sparse: bad integer constant expression
>     include/linux/pwm.h:13:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
>     drivers/gpu/drm/i915/display/intel_display_rps.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h, drivers/gpu/drm/i915/i915_drv.h):
>>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
>     drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
> 
> vim +717 include/linux/dma-fence.h
> 
> 976b6d97c62347 Christian König 2022-01-19  708
> 976b6d97c62347 Christian König 2022-01-19  709  /**
> 976b6d97c62347 Christian König 2022-01-19  710   * dma_fence_is_chain - check if a fence is from the chain subclass
> 976b6d97c62347 Christian König 2022-01-19  711   * @fence: the fence to test
> 976b6d97c62347 Christian König 2022-01-19  712   *
> 976b6d97c62347 Christian König 2022-01-19  713   * Return true if it is a dma_fence_chain and false otherwise.
> 976b6d97c62347 Christian König 2022-01-19  714   */
> 976b6d97c62347 Christian König 2022-01-19  715  static inline bool dma_fence_is_chain(struct dma_fence *fence)
> 976b6d97c62347 Christian König 2022-01-19  716  {
> 976b6d97c62347 Christian König 2022-01-19 @717  	return fence->ops == &dma_fence_chain_ops;
> 976b6d97c62347 Christian König 2022-01-19  718  }
> 976b6d97c62347 Christian König 2022-01-19  719
> 

