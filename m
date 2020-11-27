Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B42C6C31
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1E96F3A8;
	Fri, 27 Nov 2020 19:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7B86F3A1;
 Fri, 27 Nov 2020 19:55:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23138784-1500050 for multiple; Fri, 27 Nov 2020 19:55:52 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-5-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-5-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 004/162] drm/i915/gt: Move move context
 layout registers and offsets to lrc_reg.h
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 19:55:50 +0000
Message-ID: <160650695028.2925.17557556900562582674@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:04:40)
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Cleanup intel_lrc.h by moving some of the residual common register
> definitions into intel_lrc_reg.h, prior to rebranding and splitting off
> the submission backends.
> 
> v2: keep the SCHEDULE enum in the old file, since it is specific to the
> gvt usage of the execlists submission backend (John)
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> #v2
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c    |  1 +
>  drivers/gpu/drm/i915/gt/intel_lrc.h       | 39 -----------------------
>  drivers/gpu/drm/i915/gt/intel_lrc_reg.h   | 39 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/mmio_context.h   |  2 ++
>  5 files changed, 43 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index d4e988b2816a..02ea16b29c9f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -36,7 +36,7 @@
>  #include "intel_gt.h"
>  #include "intel_gt_requests.h"
>  #include "intel_gt_pm.h"
> -#include "intel_lrc.h"
> +#include "intel_lrc_reg.h"
>  #include "intel_reset.h"
>  #include "intel_ring.h"
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 257063a57101..9830342aa6f4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -11,6 +11,7 @@
>  #include "intel_breadcrumbs.h"
>  #include "intel_gt.h"
>  #include "intel_gt_irq.h"
> +#include "intel_lrc_reg.h"
>  #include "intel_uncore.h"
>  #include "intel_rps.h"
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
> index 802585a308e9..9116b46844a2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.h
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
> @@ -34,45 +34,6 @@ struct i915_request;
>  struct intel_context;
>  struct intel_engine_cs;
>  
> -/* Execlists regs */
> -#define RING_ELSP(base)                                _MMIO((base) + 0x230)
> -#define RING_EXECLIST_STATUS_LO(base)          _MMIO((base) + 0x234)
> -#define RING_EXECLIST_STATUS_HI(base)          _MMIO((base) + 0x234 + 4)
> -#define RING_CONTEXT_CONTROL(base)             _MMIO((base) + 0x244)
> -#define          CTX_CTRL_INHIBIT_SYN_CTX_SWITCH       (1 << 3)
> -#define          CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT   (1 << 0)
> -#define   CTX_CTRL_RS_CTX_ENABLE               (1 << 1)
> -#define          CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT      (1 << 2)
> -#define          GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE     (1 << 8)
> -#define RING_CONTEXT_STATUS_PTR(base)          _MMIO((base) + 0x3a0)
> -#define RING_EXECLIST_SQ_CONTENTS(base)                _MMIO((base) + 0x510)
> -#define RING_EXECLIST_CONTROL(base)            _MMIO((base) + 0x550)
> -
> -#define          EL_CTRL_LOAD                          (1 << 0)
> -
> -/* The docs specify that the write pointer wraps around after 5h, "After status
> - * is written out to the last available status QW at offset 5h, this pointer
> - * wraps to 0."
> - *
> - * Therefore, one must infer than even though there are 3 bits available, 6 and
> - * 7 appear to be * reserved.
> - */
> -#define GEN8_CSB_ENTRIES 6
> -#define GEN8_CSB_PTR_MASK 0x7
> -#define GEN8_CSB_READ_PTR_MASK (GEN8_CSB_PTR_MASK << 8)
> -#define GEN8_CSB_WRITE_PTR_MASK (GEN8_CSB_PTR_MASK << 0)
> -
> -#define GEN11_CSB_ENTRIES 12
> -#define GEN11_CSB_PTR_MASK 0xf
> -#define GEN11_CSB_READ_PTR_MASK (GEN11_CSB_PTR_MASK << 8)
> -#define GEN11_CSB_WRITE_PTR_MASK (GEN11_CSB_PTR_MASK << 0)
> -
> -#define MAX_CONTEXT_HW_ID (1<<21) /* exclusive */
> -#define MAX_GUC_CONTEXT_HW_ID (1 << 20) /* exclusive */
> -#define GEN11_MAX_CONTEXT_HW_ID (1<<11) /* exclusive */
> -/* in Gen12 ID 0x7FF is reserved to indicate idle */
> -#define GEN12_MAX_CONTEXT_HW_ID        (GEN11_MAX_CONTEXT_HW_ID - 1)
> -
>  enum {
>         INTEL_CONTEXT_SCHEDULE_IN = 0,
>         INTEL_CONTEXT_SCHEDULE_OUT,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
> index 1b51f7b9a5c3..b2e03ce35599 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
> @@ -52,4 +52,43 @@
>  #define GEN8_EXECLISTS_STATUS_BUF 0x370
>  #define GEN11_EXECLISTS_STATUS_BUF2 0x3c0
>  
> +/* Execlists regs */
> +#define RING_ELSP(base)                                _MMIO((base) + 0x230)
> +#define RING_EXECLIST_STATUS_LO(base)          _MMIO((base) + 0x234)
> +#define RING_EXECLIST_STATUS_HI(base)          _MMIO((base) + 0x234 + 4)
> +#define RING_CONTEXT_CONTROL(base)             _MMIO((base) + 0x244)
> +#define          CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT   REG_BIT(0)
> +#define   CTX_CTRL_RS_CTX_ENABLE               REG_BIT(1)
> +#define          CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT      REG_BIT(2)
> +#define          CTX_CTRL_INHIBIT_SYN_CTX_SWITCH       REG_BIT(3)
> +#define          GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE     REG_BIT(8)
> +#define RING_CONTEXT_STATUS_PTR(base)          _MMIO((base) + 0x3a0)
> +#define RING_EXECLIST_SQ_CONTENTS(base)                _MMIO((base) + 0x510)
> +#define RING_EXECLIST_CONTROL(base)            _MMIO((base) + 0x550)
> +#define          EL_CTRL_LOAD                          REG_BIT(0)
> +
> +/*
> + * The docs specify that the write pointer wraps around after 5h, "After status
> + * is written out to the last available status QW at offset 5h, this pointer
> + * wraps to 0."
> + *
> + * Therefore, one must infer than even though there are 3 bits available, 6 and
> + * 7 appear to be * reserved.

Stray '*'

That's a very weird statement. 6/7 simply do not exist, since the
ringbuffer doesn't have that many elements.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
