Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C563A013E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 21:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053666EC2B;
	Tue,  8 Jun 2021 19:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE64A6E22F;
 Tue,  8 Jun 2021 19:09:41 +0000 (UTC)
IronPort-SDR: r6PQxrztCK4FQ1b75yegwAoYxJdlzdjp0yM2uaElfTLQQb9oKxZD2/DWBjNEY8TwiDetrwNO5c
 wEpHLiih17uQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="192027563"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="192027563"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:09:40 -0700
IronPort-SDR: uNcmj5gAEU+ohokUD19oatPD07usltsBbhC+tHdkcwplBFUe5o1aT1MSn0jTvDraitd3jgAFP2
 KBkF86xMxIFg==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="637740262"
Received: from arajji-mobl.ger.corp.intel.com (HELO [10.249.254.90])
 ([10.249.254.90])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:09:38 -0700
Message-ID: <6090f80bd4a3ec65fc42579b729c0206f811f3cc.camel@linux.intel.com>
Subject: Re: [PATCH 7/9] drm/i915/gt: Pipelined page migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 08 Jun 2021 21:09:36 +0200
In-Reply-To: <20210608092846.64198-8-thomas.hellstrom@linux.intel.com>
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
 <20210608092846.64198-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
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
Cc: matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-06-08 at 11:28 +0200, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If we pipeline the PTE updates and then do the copy of those pages
> within a single unpreemptible command packet, we can submit the
> copies
> and leave them to be scheduled without having to synchronously wait
> under a global lock. In order to manage migration, we need to
> preallocate the page tables (and keep them pinned and available for
> use
> at any time), causing a bottleneck for migrations as all clients must
> contend on the limited resources. By inlining the ppGTT updates and
> performing the blit atomically, each client only owns the PTE while
> in
> use, and so we can reschedule individual operations however we see
> fit.
> And most importantly, we do not need to take a global lock on the
> shared
> vm, and wait until the operation is complete before releasing the
> lock
> for others to claim the PTE for themselves.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gt/intel_engine.h        |   1 +
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
>  drivers/gpu/drm/i915/gt/intel_migrate.c       | 543
> ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_migrate.h       |  45 ++
>  drivers/gpu/drm/i915/gt/intel_migrate_types.h |  15 +
>  drivers/gpu/drm/i915/gt/intel_ring.h          |   1 +
>  drivers/gpu/drm/i915/gt/selftest_migrate.c    | 291 ++++++++++
>  .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>  9 files changed, 900 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
>  create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
> 
> diff --git a/drivers/gpu/drm/i915/Makefile
> b/drivers/gpu/drm/i915/Makefile
> index ea8ee4b3e018..9f18902be626 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -109,6 +109,7 @@ gt-y += \
>         gt/intel_gtt.o \
>         gt/intel_llc.o \
>         gt/intel_lrc.o \
> +       gt/intel_migrate.o \
>         gt/intel_mocs.o \
>         gt/intel_ppgtt.o \
>         gt/intel_rc6.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h
> b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 0862c42b4cac..949965680c37 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -188,6 +188,7 @@ intel_write_status_page(struct intel_engine_cs
> *engine, int reg, u32 value)
>  #define I915_GEM_HWS_PREEMPT_ADDR      (I915_GEM_HWS_PREEMPT *
> sizeof(u32))
>  #define I915_GEM_HWS_SEQNO             0x40
>  #define I915_GEM_HWS_SEQNO_ADDR                (I915_GEM_HWS_SEQNO *
> sizeof(u32))
> +#define I915_GEM_HWS_MIGRATE           (0x42 * sizeof(u32))
>  #define I915_GEM_HWS_SCRATCH           0x80
>  
>  #define I915_HWS_CSB_BUF0_INDEX                0x10
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 2694dbb9967e..1c3af0fc0456 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -123,8 +123,10 @@
>  #define   MI_SEMAPHORE_SAD_NEQ_SDD     (5 << 12)
>  #define   MI_SEMAPHORE_TOKEN_MASK      REG_GENMASK(9, 5)
>  #define   MI_SEMAPHORE_TOKEN_SHIFT     5
> +#define MI_STORE_DATA_IMM      MI_INSTR(0x20, 0)
>  #define MI_STORE_DWORD_IMM     MI_INSTR(0x20, 1)
>  #define MI_STORE_DWORD_IMM_GEN4        MI_INSTR(0x20, 2)
> +#define MI_STORE_QWORD_IMM_GEN8 (MI_INSTR(0x20, 3) | REG_BIT(21))
>  #define   MI_MEM_VIRTUAL       (1 << 22) /* 945,g33,965 */
>  #define   MI_USE_GGTT          (1 << 22) /* g4x+ */
>  #define MI_STORE_DWORD_INDEX   MI_INSTR(0x21, 1)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> b/drivers/gpu/drm/i915/gt/intel_migrate.c
> new file mode 100644
> index 000000000000..1f60f8ee36f8
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -0,0 +1,543 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "intel_context.h"
> +#include "intel_gpu_commands.h"
> +#include "intel_gt.h"
> +#include "intel_gtt.h"
> +#include "intel_migrate.h"
> +#include "intel_ring.h"
> +
> 
...
> +
> +void intel_migrate_fini(struct intel_migrate *m)
> +{
> +       struct intel_context *ce;
> +
> +       ce = fetch_and_zero(&m->context);
> +       if (!ce)
> +               return;
> +
> +       intel_context_unpin(ce);
> +       intel_context_put(ce);
> +}

Hmm, CI hints at we should be exporting and using an
intel_engine_destroy_pinned_context() here...

/Thomas



