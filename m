Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F06403B15
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D604089852;
	Wed,  8 Sep 2021 13:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA7B897BC;
 Wed,  8 Sep 2021 13:57:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="281505361"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="281505361"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 06:57:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="465640606"
Received: from eoinwals-mobl.ger.corp.intel.com (HELO [10.213.233.175])
 ([10.213.233.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 06:57:29 -0700
Subject: Re: [PATCH 4/8] drm/i915/xehp: CCS should use RCS setup functions
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-5-matthew.d.roper@intel.com>
 <bbe1d640-5583-9da3-0524-bf231ab3a19a@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <321db881-d8d2-d4a9-f369-96e5b781f070@linux.intel.com>
Date: Wed, 8 Sep 2021 14:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bbe1d640-5583-9da3-0524-bf231ab3a19a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 08/09/2021 11:13, Tvrtko Ursulin wrote:
> 
> On 07/09/2021 18:19, Matt Roper wrote:
>> The compute engine handles the same commands the render engine can
>> (except 3D pipeline), so it makes sense that CCS is more similar to RCS
>> than non-render engines.
>>
>> The CCS context state (lrc) is also similar to the render one, so reuse
>> it. Note that the compute engine has its own CTX_R_PWR_CLK_STATE
>> register.
>>
>> In order to avoid having multiple RCS && CCS checks, add the following
>> engine flag:
>>   - I915_ENGINE_HAS_RCS_REG_STATE - use the render (larger) reg state 
>> ctx.
>>
>> BSpec: 46260
>> Original-patch-by: Michel Thierry
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 8 +++++---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c             | 6 ++++++
>>   drivers/gpu/drm/i915/gt/intel_engine_types.h          | 1 +
>>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c  | 2 +-
>>   drivers/gpu/drm/i915/gt/intel_lrc.c                   | 4 ++--
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c     | 2 +-
>>   drivers/gpu/drm/i915/i915_perf.c                      | 4 ++--
>>   drivers/gpu/drm/i915/i915_reg.h                       | 2 +-
>>   8 files changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> index b32f7fed2d9c..fbe10783628b 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> @@ -883,7 +883,9 @@ static int igt_shared_ctx_exec(void *arg)
>>       return err;
>>   }
>> -static int rpcs_query_batch(struct drm_i915_gem_object *rpcs, struct 
>> i915_vma *vma)
>> +static int rpcs_query_batch(struct drm_i915_gem_object *rpcs,
>> +                struct i915_vma *vma,
>> +                struct intel_engine_cs *engine)
>>   {
>>       u32 *cmd;
>> @@ -894,7 +896,7 @@ static int rpcs_query_batch(struct 
>> drm_i915_gem_object *rpcs, struct i915_vma *v
>>           return PTR_ERR(cmd);
>>       *cmd++ = MI_STORE_REGISTER_MEM_GEN8;
>> -    *cmd++ = i915_mmio_reg_offset(GEN8_R_PWR_CLK_STATE);
>> +    *cmd++ = 
>> i915_mmio_reg_offset(GEN8_R_PWR_CLK_STATE(engine->mmio_base));
>>       *cmd++ = lower_32_bits(vma->node.start);
>>       *cmd++ = upper_32_bits(vma->node.start);
>>       *cmd = MI_BATCH_BUFFER_END;
>> @@ -955,7 +957,7 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
>>       if (err)
>>           goto err_vma;
>> -    err = rpcs_query_batch(rpcs, vma);
>> +    err = rpcs_query_batch(rpcs, vma, ce->engine);
>>       if (err)
>>           goto err_batch;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 69944bd8c19d..b346b946602d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -205,6 +205,8 @@ u32 intel_engine_context_size(struct intel_gt *gt, 
>> u8 class)
>>       BUILD_BUG_ON(I915_GTT_PAGE_SIZE != PAGE_SIZE);
>>       switch (class) {
>> +    case COMPUTE_CLASS:
>> +        fallthrough;
>>       case RENDER_CLASS:
>>           switch (GRAPHICS_VER(gt->i915)) {
>>           default:
>> @@ -379,6 +381,10 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id)
>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>           engine->props.preempt_timeout_ms = 0;
>> +    /* features common between engines sharing EUs */
>> +    if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS)
>> +        engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
>> +
>>       engine->defaults = engine->props; /* never to change again */
>>       engine->context_size = intel_engine_context_size(gt, 
>> engine->class);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> index dcb9d8b2362a..30a0c69c36c8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> @@ -454,6 +454,7 @@ struct intel_engine_cs {
>>   #define I915_ENGINE_HAS_RELATIVE_MMIO BIT(6)
>>   #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
>>   #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
>> +#define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
>>       unsigned int flags;
>>       /*
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index de5f9c86b9a4..4c600c46414d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -3406,7 +3406,7 @@ int intel_execlists_submission_setup(struct 
>> intel_engine_cs *engine)
>>       logical_ring_default_vfuncs(engine);
>>       logical_ring_default_irqs(engine);
>> -    if (engine->class == RENDER_CLASS)
>> +    if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE)
>>           rcs_submission_override(engine);
> 
> Hm, what do pipe control flushes which relate to 3d pipeline end up 
> doing on CCS engines?

Right, answer found in the following patch.

Ideally the two would swap places in the series so by the time vfunc are 
assigned to the engines they actually handle them correctly. It's a 
minor point since it's all disabled until the very end of the series so 
either way:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
> Regards,
> 
> Tvrtko
> 
>>       lrc_init_wa_ctx(engine);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c 
>> b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> index 6ba8daea2f56..6490dce0a73f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> @@ -619,7 +619,7 @@ static const u8 *reg_offsets(const struct 
>> intel_engine_cs *engine)
>>       GEM_BUG_ON(GRAPHICS_VER(engine->i915) >= 12 &&
>>              !intel_engine_has_relative_mmio(engine));
>> -    if (engine->class == RENDER_CLASS) {
>> +    if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
>>           if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>>               return dg2_rcs_offsets;
>>           else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
>> @@ -1572,7 +1572,7 @@ void lrc_init_wa_ctx(struct intel_engine_cs 
>> *engine)
>>       unsigned int i;
>>       int err;
>> -    if (engine->class != RENDER_CLASS)
>> +    if (!(engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
>>           return;
>>       switch (GRAPHICS_VER(engine->i915)) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 87d8dc8f51b9..2f5bf7aa7e3b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2517,7 +2517,7 @@ int intel_guc_submission_setup(struct 
>> intel_engine_cs *engine)
>>       guc_default_irqs(engine);
>>       guc_init_breadcrumbs(engine);
>> -    if (engine->class == RENDER_CLASS)
>> +    if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE)
>>           rcs_submission_override(engine);
>>       lrc_init_wa_ctx(engine);
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>> b/drivers/gpu/drm/i915/i915_perf.c
>> index 2f01b8c0284c..5e12a9726c43 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -2418,7 +2418,7 @@ gen12_configure_all_contexts(struct 
>> i915_perf_stream *stream,
>>   {
>>       struct flex regs[] = {
>>           {
>> -            GEN8_R_PWR_CLK_STATE,
>> +            GEN8_R_PWR_CLK_STATE(RENDER_RING_BASE),
>>               CTX_R_PWR_CLK_STATE,
>>           },
>>       };
>> @@ -2438,7 +2438,7 @@ lrc_configure_all_contexts(struct 
>> i915_perf_stream *stream,
>>   #define ctx_flexeuN(N) (ctx_flexeu0 + 2 * (N) + 1)
>>       struct flex regs[] = {
>>           {
>> -            GEN8_R_PWR_CLK_STATE,
>> +            GEN8_R_PWR_CLK_STATE(RENDER_RING_BASE),
>>               CTX_R_PWR_CLK_STATE,
>>           },
>>           {
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index 31e9c2cc4c0c..0bb185ce9529 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -441,7 +441,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t 
>> reg)
>>   #define GEN8_RING_PDP_UDW(base, n)    _MMIO((base) + 0x270 + (n) * 8 
>> + 4)
>>   #define GEN8_RING_PDP_LDW(base, n)    _MMIO((base) + 0x270 + (n) * 8)
>> -#define GEN8_R_PWR_CLK_STATE        _MMIO(0x20C8)
>> +#define GEN8_R_PWR_CLK_STATE(base)    _MMIO((base)+0xc8)
>>   #define   GEN8_RPCS_ENABLE        (1 << 31)
>>   #define   GEN8_RPCS_S_CNT_ENABLE    (1 << 18)
>>   #define   GEN8_RPCS_S_CNT_SHIFT        15
>>
