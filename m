Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A85900507
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2710EC39;
	Fri,  7 Jun 2024 13:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DVOooJ1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B966A10EC39
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T+EWaHPYVEFWgu3k3v6jY5PkV1W0nCenUcIlEovuAP0=; b=DVOooJ1i9mtA0BQ7yp3In03D/z
 E84O5BkhqLpy9RAZr2QwTGUWiN9RnK58w6bX/jNpmKIZFkSKPHWcdZOCJq1CrMw2pHeo5tEAp2J3L
 9goLnLXNjCe0Kr9oDYQcm5lhtykp+cnzUSFC3EvevSMXHeJK7d2a8tkbT50uhTM8/d76CaZXAp7yc
 xxV9smY7ji8CmvKvkPT2eatAG7QAAq9eHWrxcr7aPUEi5E1AICPt1G/RNLxtJM35+6avXb0iCyWBB
 Pliv+43XCOrCX34kVT2ajLsHaUXgSTqtAu9DL7+nGwOdIIjEeY1LdnbOeQdM01G7rmIgIiVHww7R4
 DKGokUPw==;
Received: from 97.red-81-39-191.dynamicip.rima-tde.net ([81.39.191.97]
 helo=[10.0.21.32]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sFZjU-000Y71-Kj; Fri, 07 Jun 2024 15:34:17 +0200
Message-ID: <b77b436d-511f-406a-bbde-67c023eecc18@igalia.com>
Date: Fri, 7 Jun 2024 15:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Fix perfmon build error/warning
To: Iago Toral <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 kernel test robot <lkp@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240604160210.24073-1-tursulin@igalia.com>
 <c8068a859b5c126cf7300143abe243361a0bae67.camel@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <c8068a859b5c126cf7300143abe243361a0bae67.camel@igalia.com>
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


On 05/06/2024 08:19, Iago Toral wrote:
> Thanks for looking at ixing this Tvrtko.
>
> El mar, 04-06-2024 a las 17:02 +0100, Tvrtko Ursulin escribió:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Move static const array into the source file to fix the "defined but
>> not
>> used" errors.
>>
>> The fix is perhaps not the prettiest due hand crafting the array
>> sizes
>> in v3d_performance_counters.h, but I did add some build time asserts
>> to
>> validate the counts look sensible, so hopefully it is good enough for
>> a
>> quick fix.
>>
> If we need this to go in ASAP I am fine with this patch as-is, so:
>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>
> With that said, if we are still in time for a bit of iteration may I
> suggest that instead of hard-coding the counters we instead add helper
> functions in drivers/gpu/drm/v3d/v3d_perfmon.c that call ARRAY_SIZE on
> the corresponding array based on v3d->ver? It is fine if we prefer to
> merge this as-is and do this change later as a follow-up patch.

I agree it isn't pretty and I was (and am) planning to see if things can 
be improved. The reason I gave up on a prettier solution in the original 
attempt is the the fact one array is statically sized (at build time) 
based on the max number of counters:

/* Number of perfmons required to handle all supported performance 
counters */
#define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
                       DRM_V3D_MAX_PERF_COUNTERS)

struct v3d_performance_query {
     /* Performance monitor IDs for this query */
     u32 kperfmon_ids[V3D_MAX_PERFMONS];

So need to see how to untangle that and then perhaps even go a step 
further than the getters but move the whole perfmon init into v3d_perfmon.c.

Regards,

Tvrtko

>
> Iago
>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 3cbcbe016c31 ("drm/v3d: Add Performance Counters descriptions
>> for V3D 4.2 and 7.1")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes:
>> https://lore.kernel.org/oe-kbuild-all/202405211137.hueFkLKG-lkp@intel.com/Cc
>> : Maíra Canal <mcanal@igalia.com>
>> Cc: Iago Toral Quiroga <itoral@igalia.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.c                 |   4 +-
>>   drivers/gpu/drm/v3d/v3d_drv.h                 |   3 -
>>   drivers/gpu/drm/v3d/v3d_perfmon.c             | 204
>> +++++++++++++++++-
>>   .../gpu/drm/v3d/v3d_performance_counters.h    | 189 +---------------
>>   4 files changed, 205 insertions(+), 195 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
>> b/drivers/gpu/drm/v3d/v3d_drv.c
>> index f7477488b1cc..a47f00b443d3 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>> @@ -299,9 +299,9 @@ static int v3d_platform_drm_probe(struct
>> platform_device *pdev)
>>   	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
>>   
>>   	if (v3d->ver >= 71)
>> -		v3d->max_counters =
>> ARRAY_SIZE(v3d_v71_performance_counters);
>> +		v3d->max_counters = V3D_V71_NUM_PERFCOUNTERS;
>>   	else if (v3d->ver >= 42)
>> -		v3d->max_counters =
>> ARRAY_SIZE(v3d_v42_performance_counters);
>> +		v3d->max_counters = V3D_V42_NUM_PERFCOUNTERS;
>>   	else
>>   		v3d->max_counters = 0;
>>   
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
>> b/drivers/gpu/drm/v3d/v3d_drv.h
>> index 556cbb400ba0..099b962bdfde 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -351,9 +351,6 @@ struct v3d_timestamp_query {
>>   	struct drm_syncobj *syncobj;
>>   };
>>   
>> -/* Maximum number of performance counters supported by any version
>> of V3D */
>> -#define V3D_MAX_COUNTERS ARRAY_SIZE(v3d_v71_performance_counters)
>> -
>>   /* Number of perfmons required to handle all supported performance
>> counters */
>>   #define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
>>   				      DRM_V3D_MAX_PERF_COUNTERS)
>> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c
>> b/drivers/gpu/drm/v3d/v3d_perfmon.c
>> index 73e2bb8bdb7f..b7d0b02e1a95 100644
>> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
>> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
>> @@ -9,6 +9,192 @@
>>   #define V3D_PERFMONID_MIN	1
>>   #define V3D_PERFMONID_MAX	U32_MAX
>>   
>> +static const struct v3d_perf_counter_desc
>> v3d_v42_performance_counters[] = {
>> +	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP]
>> Valid primitives that result in no rendered pixels, for all rendered
>> tiles"},
>> +	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid
>> primitives for all rendered tiles (primitives may be counted in more
>> than one tile)"},
>> +	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped
>> quads"},
>> +	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
>> +	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads
>> with no pixels passing the stencil test"},
>> +	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB]
>> Quads with no pixels passing the Z and stencil tests"},
>> +	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads
>> with any pixels passing the Z and stencil tests"},
>> +	{"TLB", "TLB-quads-with-zero-coverage", "[TLB] Quads with
>> all pixels having zero coverage"},
>> +	{"TLB", "TLB-quads-with-non-zero-coverage", "[TLB] Quads
>> with any pixels having non-zero coverage"},
>> +	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads
>> with valid pixels written to colour buffer"},
>> +	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB]
>> Primitives discarded by being outside the viewport"},
>> +	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives
>> that need clipping"},
>> +	{"PTB", "PTB-primitives-discarded-reversed", "[PTB]
>> Primitives that are discarded because they are reversed"},
>> +	{"QPU", "QPU-total-idle-clk-cycles", "[QPU] Total idle clock
>> cycles for all QPUs"},
>> +	{"QPU", "QPU-total-active-clk-cycles-vertex-coord-shading",
>> "[QPU] Total active clock cycles for all QPUs doing
>> vertex/coordinate/user shading (counts only when QPU is not
>> stalled)"},
>> +	{"QPU", "QPU-total-active-clk-cycles-fragment-shading",
>> "[QPU] Total active clock cycles for all QPUs doing fragment shading
>> (counts only when QPU is not stalled)"},
>> +	{"QPU", "QPU-total-clk-cycles-executing-valid-instr", "[QPU]
>> Total clock cycles for all QPUs executing valid instructions"},
>> +	{"QPU", "QPU-total-clk-cycles-waiting-TMU", "[QPU] Total
>> clock cycles for all QPUs stalled waiting for TMUs only (counter
>> won't increment if QPU also stalling for another reason)"},
>> +	{"QPU", "QPU-total-clk-cycles-waiting-scoreboard", "[QPU]
>> Total clock cycles for all QPUs stalled waiting for Scoreboard only
>> (counter won't increment if QPU also stalling for another reason)"},
>> +	{"QPU", "QPU-total-clk-cycles-waiting-varyings", "[QPU]
>> Total clock cycles for all QPUs stalled waiting for Varyings only
>> (counter won't increment if QPU also stalling for another reason)"},
>> +	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total
>> instruction cache hits for all slices"},
>> +	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total
>> instruction cache misses for all slices"},
>> +	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms
>> cache hits for all slices"},
>> +	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total
>> uniforms cache misses for all slices"},
>> +	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture
>> cache accesses"},
>> +	{"TMU", "TMU-total-text-cache-miss", "[TMU] Total texture
>> cache misses (number of fetches from memory/L2cache)"},
>> +	{"VPM", "VPM-total-clk-cycles-VDW-stalled", "[VPM] Total
>> clock cycles VDW is stalled waiting for VPM access"},
>> +	{"VPM", "VPM-total-clk-cycles-VCD-stalled", "[VPM] Total
>> clock cycles VCD is stalled waiting for VPM access"},
>> +	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread
>> active cycles"},
>> +	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render
>> thread active cycles"},
>> +	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache
>> hits"},
>> +	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache
>> misses"},
>> +	{"CORE", "cycle-count", "[CORE] Cycle counter"},
>> +	{"QPU", "QPU-total-clk-cycles-waiting-vertex-coord-shading",
>> "[QPU] Total stalled clock cycles for all QPUs doing
>> vertex/coordinate/user shading"},
>> +	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading",
>> "[QPU] Total stalled clock cycles for all QPUs doing fragment
>> shading"},
>> +	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives
>> binned"},
>> +	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by
>> watch 0"},
>> +	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch
>> 0"},
>> +	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write
>> stalls seen by watch 0"},
>> +	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls
>> seen by watch 0"},
>> +	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes
>> written seen by watch 0"},
>> +	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes
>> read seen by watch 0"},
>> +	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by
>> watch 1"},
>> +	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch
>> 1"},
>> +	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write
>> stalls seen by watch 1"},
>> +	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls
>> seen by watch 1"},
>> +	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes
>> written seen by watch 1"},
>> +	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes
>> read seen by watch 1"},
>> +	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB]
>> Partial quads written to the colour buffer"},
>> +	{"TMU", "TMU-total-config-access", "[TMU] Total config
>> accesses"},
>> +	{"L2T", "L2T-no-id-stalled", "[L2T] No ID stall"},
>> +	{"L2T", "L2T-command-queue-stalled", "[L2T] Command queue
>> full stall"},
>> +	{"L2T", "L2T-TMU-writes", "[L2T] TMU write accesses"},
>> +	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
>> +	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
>> +	{"CLE", "CLE-thread-active-cycles", "[CLE] Bin or render
>> thread active cycles"},
>> +	{"L2T", "L2T-TMU-reads", "[L2T] TMU read accesses"},
>> +	{"L2T", "L2T-CLE-reads", "[L2T] CLE read accesses"},
>> +	{"L2T", "L2T-VCD-reads", "[L2T] VCD read accesses"},
>> +	{"L2T", "L2T-TMU-config-reads", "[L2T] TMU CFG read
>> accesses"},
>> +	{"L2T", "L2T-SLC0-reads", "[L2T] SLC0 read accesses"},
>> +	{"L2T", "L2T-SLC1-reads", "[L2T] SLC1 read accesses"},
>> +	{"L2T", "L2T-SLC2-reads", "[L2T] SLC2 read accesses"},
>> +	{"L2T", "L2T-TMU-write-miss", "[L2T] TMU write misses"},
>> +	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
>> +	{"L2T", "L2T-CLE-read-miss", "[L2T] CLE read misses"},
>> +	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
>> +	{"L2T", "L2T-TMU-config-read-miss", "[L2T] TMU CFG read
>> misses"},
>> +	{"L2T", "L2T-SLC0-read-miss", "[L2T] SLC0 read misses"},
>> +	{"L2T", "L2T-SLC1-read-miss", "[L2T] SLC1 read misses"},
>> +	{"L2T", "L2T-SLC2-read-miss", "[L2T] SLC2 read misses"},
>> +	{"CORE", "core-memory-writes", "[CORE] Total memory
>> writes"},
>> +	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
>> +	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
>> +	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
>> +	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
>> +	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
>> +	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
>> +	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
>> +	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
>> +	{"GMP", "GMP-memory-reads", "[GMP] Total memory reads"},
>> +	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words
>> written"},
>> +	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words
>> written"},
>> +	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words
>> read"},
>> +	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words
>> read"},
>> +	{"TMU", "TMU-MRU-hits", "[TMU] Total MRU hits"},
>> +	{"CORE", "compute-active-cycles", "[CORE] Compute active
>> cycles"},
>> +};
>> +
>> +static const struct v3d_perf_counter_desc
>> v3d_v71_performance_counters[] = {
>> +	{"CORE", "cycle-count", "[CORE] Cycle counter"},
>> +	{"CORE", "core-active", "[CORE] Bin/Render/Compute active
>> cycles"},
>> +	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread
>> active cycles"},
>> +	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render
>> thread active cycles"},
>> +	{"CORE", "compute-active-cycles", "[CORE] Compute active
>> cycles"},
>> +	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP]
>> Valid primitives that result in no rendered pixels, for all rendered
>> tiles"},
>> +	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid
>> primitives for all rendered tiles (primitives may be counted in more
>> than one tile)"},
>> +	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped
>> quads"},
>> +	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
>> +	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads
>> with no pixels passing the stencil test"},
>> +	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB]
>> Quads with no pixels passing the Z and stencil tests"},
>> +	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads
>> with any pixels passing the Z and stencil tests"},
>> +	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads
>> with valid pixels written to colour buffer"},
>> +	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB]
>> Partial quads written to the colour buffer"},
>> +	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives
>> that need clipping"},
>> +	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB]
>> Primitives discarded by being outside the viewport"},
>> +	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives
>> binned"},
>> +	{"PTB", "PTB-primitives-discarded-reversed", "[PTB]
>> Primitives that are discarded because they are reversed"},
>> +	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total
>> instruction cache hits for all slices"},
>> +	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total
>> instruction cache misses for all slices"},
>> +	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms
>> cache hits for all slices"},
>> +	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total
>> uniforms cache misses for all slices"},
>> +	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
>> +	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
>> +	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture
>> cache accesses"},
>> +	{"TMU", "TMU-cache-x4-active-cycles", "[TMU] Cache active
>> cycles for x4 access"},
>> +	{"TMU", "TMU-cache-x4-stalled-cycles", "[TMU] Cache stalled
>> cycles for x4 access"},
>> +	{"TMU", "TMU-total-text-quads-x4-access", "[TMU] Total
>> texture cache x4 access"},
>> +	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache
>> hits"},
>> +	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache
>> misses"},
>> +	{"L2T", "L2T-local", "[L2T] Local mode access"},
>> +	{"L2T", "L2T-writeback", "[L2T] Writeback"},
>> +	{"L2T", "L2T-zero", "[L2T] Zero"},
>> +	{"L2T", "L2T-merge", "[L2T] Merge"},
>> +	{"L2T", "L2T-fill", "[L2T] Fill"},
>> +	{"L2T", "L2T-stalls-no-wid", "[L2T] Stalls because no WID
>> available"},
>> +	{"L2T", "L2T-stalls-no-rid", "[L2T] Stalls because no RID
>> available"},
>> +	{"L2T", "L2T-stalls-queue-full", "[L2T] Stalls because
>> internal queue full"},
>> +	{"L2T", "L2T-stalls-wrightback", "[L2T] Stalls because
>> writeback in flight"},
>> +	{"L2T", "L2T-stalls-mem", "[L2T] Stalls because AXI blocks
>> read"},
>> +	{"L2T", "L2T-stalls-fill", "[L2T] Stalls because fill
>> pending for victim cache-line"},
>> +	{"L2T", "L2T-hitq", "[L2T] Sent request via hit queue"},
>> +	{"L2T", "L2T-hitq-full", "[L2T] Sent request via main queue
>> because hit queue is full"},
>> +	{"L2T", "L2T-stalls-read-data", "[L2T] Stalls because
>> waiting for data from SDRAM"},
>> +	{"L2T", "L2T-TMU-read-hits", "[L2T] TMU read hits"},
>> +	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
>> +	{"L2T", "L2T-VCD-read-hits", "[L2T] VCD read hits"},
>> +	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
>> +	{"L2T", "L2T-SLC-read-hits", "[L2T] SLC read hits (all
>> slices)"},
>> +	{"L2T", "L2T-SLC-read-miss", "[L2T] SLC read misses (all
>> slices)"},
>> +	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by
>> watch 0"},
>> +	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch
>> 0"},
>> +	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write
>> stalls seen by watch 0"},
>> +	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls
>> seen by watch 0"},
>> +	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes
>> written seen by watch 0"},
>> +	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes
>> read seen by watch 0"},
>> +	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by
>> watch 1"},
>> +	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch
>> 1"},
>> +	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write
>> stalls seen by watch 1"},
>> +	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls
>> seen by watch 1"},
>> +	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes
>> written seen by watch 1"},
>> +	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes
>> read seen by watch 1"},
>> +	{"CORE", "core-memory-writes", "[CORE] Total memory
>> writes"},
>> +	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
>> +	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
>> +	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
>> +	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
>> +	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
>> +	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
>> +	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
>> +	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
>> +	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words
>> written"},
>> +	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words
>> written"},
>> +	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words
>> read"},
>> +	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words
>> read"},
>> +	{"AXI", "AXI-read-trans", "[AXI] Read transaction count"},
>> +	{"AXI", "AXI-write-trans", "[AXI] Write transaction count"},
>> +	{"AXI", "AXI-read-wait-cycles", "[AXI] Read total wait
>> cycles"},
>> +	{"AXI", "AXI-write-wait-cycles", "[AXI] Write total wait
>> cycles"},
>> +	{"AXI", "AXI-max-outstanding-reads", "[AXI] Maximum
>> outstanding read transactions"},
>> +	{"AXI", "AXI-max-outstanding-writes", "[AXI] Maximum
>> outstanding write transactions"},
>> +	{"QPU", "QPU-wait-bubble", "[QPU] Pipeline bubble in qcycles
>> due all threads waiting"},
>> +	{"QPU", "QPU-ic-miss-bubble", "[QPU] Pipeline bubble in
>> qcycles due instruction-cache miss"},
>> +	{"QPU", "QPU-active", "[QPU] Executed shader instruction"},
>> +	{"QPU", "QPU-total-active-clk-cycles-fragment-shading",
>> "[QPU] Total active clock cycles for all QPUs doing fragment shading
>> (counts only when QPU is not stalled)"},
>> +	{"QPU", "QPU-stalls", "[QPU] Stalled qcycles executing
>> shader instruction"},
>> +	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading",
>> "[QPU] Total stalled clock cycles for all QPUs doing fragment
>> shading"},
>> +	{"QPU", "QPU-stalls-TMU", "[QPU] Stalled qcycles waiting for
>> TMU"},
>> +	{"QPU", "QPU-stalls-TLB", "[QPU] Stalled qcycles waiting for
>> TLB"},
>> +	{"QPU", "QPU-stalls-VPM", "[QPU] Stalled qcycles waiting for
>> VPM"},
>> +	{"QPU", "QPU-stalls-uniforms", "[QPU] Stalled qcycles
>> waiting for uniforms"},
>> +	{"QPU", "QPU-stalls-SFU", "[QPU] Stalled qcycles waiting for
>> SFU"},
>> +	{"QPU", "QPU-stalls-other", "[QPU] Stalled qcycles waiting
>> for any other reason (vary/W/Z)"},
>> +};
>> +
>>   void v3d_perfmon_get(struct v3d_perfmon *perfmon)
>>   {
>>   	if (perfmon)
>> @@ -234,15 +420,21 @@ int v3d_perfmon_get_counter_ioctl(struct
>> drm_device *dev, void *data,
>>   	if (req->counter >= v3d->max_counters)
>>   		return -EINVAL;
>>   
>> -	if (v3d->ver >= 71) {
>> -		WARN_ON(v3d->max_counters !=
>> ARRAY_SIZE(v3d_v71_performance_counters));
>> +	BUILD_BUG_ON(ARRAY_SIZE(v3d_v42_performance_counters) !=
>> +		     V3D_V42_NUM_PERFCOUNTERS);
>> +	BUILD_BUG_ON(ARRAY_SIZE(v3d_v71_performance_counters) !=
>> +		     V3D_V71_NUM_PERFCOUNTERS);
>> +	BUILD_BUG_ON(V3D_MAX_COUNTERS < V3D_V42_NUM_PERFCOUNTERS);
>> +	BUILD_BUG_ON(V3D_MAX_COUNTERS < V3D_V71_NUM_PERFCOUNTERS);
>> +	BUILD_BUG_ON((V3D_MAX_COUNTERS != V3D_V42_NUM_PERFCOUNTERS)
>> &&
>> +		     (V3D_MAX_COUNTERS !=
>> V3D_V71_NUM_PERFCOUNTERS));
>> +
>> +	if (v3d->ver >= 71)
>>   		counter = &v3d_v71_performance_counters[req-
>>> counter];
>> -	} else if (v3d->ver >= 42) {
>> -		WARN_ON(v3d->max_counters !=
>> ARRAY_SIZE(v3d_v42_performance_counters));
>> +	else if (v3d->ver >= 42)
>>   		counter = &v3d_v42_performance_counters[req-
>>> counter];
>> -	} else {
>> +	else
>>   		return -EOPNOTSUPP;
>> -	}
>>   
>>   	strscpy(req->name, counter->name, sizeof(req->name));
>>   	strscpy(req->category, counter->category, sizeof(req-
>>> category));
>> diff --git a/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> b/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> index 72822205ebdc..131b2909522a 100644
>> --- a/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> +++ b/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> @@ -19,190 +19,11 @@ struct v3d_perf_counter_desc {
>>   	char description[256];
>>   };
>>   
>> -static const struct v3d_perf_counter_desc
>> v3d_v71_performance_counters[] = {
>> -	{"CORE", "cycle-count", "[CORE] Cycle counter"},
>> -	{"CORE", "core-active", "[CORE] Bin/Render/Compute active
>> cycles"},
>> -	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread
>> active cycles"},
>> -	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render
>> thread active cycles"},
>> -	{"CORE", "compute-active-cycles", "[CORE] Compute active
>> cycles"},
>> -	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP]
>> Valid primitives that result in no rendered pixels, for all rendered
>> tiles"},
>> -	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid
>> primitives for all rendered tiles (primitives may be counted in more
>> than one tile)"},
>> -	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped
>> quads"},
>> -	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
>> -	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads
>> with no pixels passing the stencil test"},
>> -	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB]
>> Quads with no pixels passing the Z and stencil tests"},
>> -	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads
>> with any pixels passing the Z and stencil tests"},
>> -	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads
>> with valid pixels written to colour buffer"},
>> -	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB]
>> Partial quads written to the colour buffer"},
>> -	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives
>> that need clipping"},
>> -	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB]
>> Primitives discarded by being outside the viewport"},
>> -	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives
>> binned"},
>> -	{"PTB", "PTB-primitives-discarded-reversed", "[PTB]
>> Primitives that are discarded because they are reversed"},
>> -	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total
>> instruction cache hits for all slices"},
>> -	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total
>> instruction cache misses for all slices"},
>> -	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms
>> cache hits for all slices"},
>> -	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total
>> uniforms cache misses for all slices"},
>> -	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
>> -	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
>> -	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture
>> cache accesses"},
>> -	{"TMU", "TMU-cache-x4-active-cycles", "[TMU] Cache active
>> cycles for x4 access"},
>> -	{"TMU", "TMU-cache-x4-stalled-cycles", "[TMU] Cache stalled
>> cycles for x4 access"},
>> -	{"TMU", "TMU-total-text-quads-x4-access", "[TMU] Total
>> texture cache x4 access"},
>> -	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache
>> hits"},
>> -	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache
>> misses"},
>> -	{"L2T", "L2T-local", "[L2T] Local mode access"},
>> -	{"L2T", "L2T-writeback", "[L2T] Writeback"},
>> -	{"L2T", "L2T-zero", "[L2T] Zero"},
>> -	{"L2T", "L2T-merge", "[L2T] Merge"},
>> -	{"L2T", "L2T-fill", "[L2T] Fill"},
>> -	{"L2T", "L2T-stalls-no-wid", "[L2T] Stalls because no WID
>> available"},
>> -	{"L2T", "L2T-stalls-no-rid", "[L2T] Stalls because no RID
>> available"},
>> -	{"L2T", "L2T-stalls-queue-full", "[L2T] Stalls because
>> internal queue full"},
>> -	{"L2T", "L2T-stalls-wrightback", "[L2T] Stalls because
>> writeback in flight"},
>> -	{"L2T", "L2T-stalls-mem", "[L2T] Stalls because AXI blocks
>> read"},
>> -	{"L2T", "L2T-stalls-fill", "[L2T] Stalls because fill
>> pending for victim cache-line"},
>> -	{"L2T", "L2T-hitq", "[L2T] Sent request via hit queue"},
>> -	{"L2T", "L2T-hitq-full", "[L2T] Sent request via main queue
>> because hit queue is full"},
>> -	{"L2T", "L2T-stalls-read-data", "[L2T] Stalls because
>> waiting for data from SDRAM"},
>> -	{"L2T", "L2T-TMU-read-hits", "[L2T] TMU read hits"},
>> -	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
>> -	{"L2T", "L2T-VCD-read-hits", "[L2T] VCD read hits"},
>> -	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
>> -	{"L2T", "L2T-SLC-read-hits", "[L2T] SLC read hits (all
>> slices)"},
>> -	{"L2T", "L2T-SLC-read-miss", "[L2T] SLC read misses (all
>> slices)"},
>> -	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by
>> watch 0"},
>> -	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch
>> 0"},
>> -	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write
>> stalls seen by watch 0"},
>> -	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls
>> seen by watch 0"},
>> -	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes
>> written seen by watch 0"},
>> -	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes
>> read seen by watch 0"},
>> -	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by
>> watch 1"},
>> -	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch
>> 1"},
>> -	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write
>> stalls seen by watch 1"},
>> -	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls
>> seen by watch 1"},
>> -	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes
>> written seen by watch 1"},
>> -	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes
>> read seen by watch 1"},
>> -	{"CORE", "core-memory-writes", "[CORE] Total memory
>> writes"},
>> -	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
>> -	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
>> -	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
>> -	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
>> -	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
>> -	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
>> -	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
>> -	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
>> -	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words
>> written"},
>> -	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words
>> written"},
>> -	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words
>> read"},
>> -	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words
>> read"},
>> -	{"AXI", "AXI-read-trans", "[AXI] Read transaction count"},
>> -	{"AXI", "AXI-write-trans", "[AXI] Write transaction count"},
>> -	{"AXI", "AXI-read-wait-cycles", "[AXI] Read total wait
>> cycles"},
>> -	{"AXI", "AXI-write-wait-cycles", "[AXI] Write total wait
>> cycles"},
>> -	{"AXI", "AXI-max-outstanding-reads", "[AXI] Maximum
>> outstanding read transactions"},
>> -	{"AXI", "AXI-max-outstanding-writes", "[AXI] Maximum
>> outstanding write transactions"},
>> -	{"QPU", "QPU-wait-bubble", "[QPU] Pipeline bubble in qcycles
>> due all threads waiting"},
>> -	{"QPU", "QPU-ic-miss-bubble", "[QPU] Pipeline bubble in
>> qcycles due instruction-cache miss"},
>> -	{"QPU", "QPU-active", "[QPU] Executed shader instruction"},
>> -	{"QPU", "QPU-total-active-clk-cycles-fragment-shading",
>> "[QPU] Total active clock cycles for all QPUs doing fragment shading
>> (counts only when QPU is not stalled)"},
>> -	{"QPU", "QPU-stalls", "[QPU] Stalled qcycles executing
>> shader instruction"},
>> -	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading",
>> "[QPU] Total stalled clock cycles for all QPUs doing fragment
>> shading"},
>> -	{"QPU", "QPU-stalls-TMU", "[QPU] Stalled qcycles waiting for
>> TMU"},
>> -	{"QPU", "QPU-stalls-TLB", "[QPU] Stalled qcycles waiting for
>> TLB"},
>> -	{"QPU", "QPU-stalls-VPM", "[QPU] Stalled qcycles waiting for
>> VPM"},
>> -	{"QPU", "QPU-stalls-uniforms", "[QPU] Stalled qcycles
>> waiting for uniforms"},
>> -	{"QPU", "QPU-stalls-SFU", "[QPU] Stalled qcycles waiting for
>> SFU"},
>> -	{"QPU", "QPU-stalls-other", "[QPU] Stalled qcycles waiting
>> for any other reason (vary/W/Z)"},
>> -};
>>   
>> -static const struct v3d_perf_counter_desc
>> v3d_v42_performance_counters[] = {
>> -	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP]
>> Valid primitives that result in no rendered pixels, for all rendered
>> tiles"},
>> -	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid
>> primitives for all rendered tiles (primitives may be counted in more
>> than one tile)"},
>> -	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped
>> quads"},
>> -	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
>> -	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads
>> with no pixels passing the stencil test"},
>> -	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB]
>> Quads with no pixels passing the Z and stencil tests"},
>> -	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads
>> with any pixels passing the Z and stencil tests"},
>> -	{"TLB", "TLB-quads-with-zero-coverage", "[TLB] Quads with
>> all pixels having zero coverage"},
>> -	{"TLB", "TLB-quads-with-non-zero-coverage", "[TLB] Quads
>> with any pixels having non-zero coverage"},
>> -	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads
>> with valid pixels written to colour buffer"},
>> -	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB]
>> Primitives discarded by being outside the viewport"},
>> -	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives
>> that need clipping"},
>> -	{"PTB", "PTB-primitives-discarded-reversed", "[PTB]
>> Primitives that are discarded because they are reversed"},
>> -	{"QPU", "QPU-total-idle-clk-cycles", "[QPU] Total idle clock
>> cycles for all QPUs"},
>> -	{"QPU", "QPU-total-active-clk-cycles-vertex-coord-shading",
>> "[QPU] Total active clock cycles for all QPUs doing
>> vertex/coordinate/user shading (counts only when QPU is not
>> stalled)"},
>> -	{"QPU", "QPU-total-active-clk-cycles-fragment-shading",
>> "[QPU] Total active clock cycles for all QPUs doing fragment shading
>> (counts only when QPU is not stalled)"},
>> -	{"QPU", "QPU-total-clk-cycles-executing-valid-instr", "[QPU]
>> Total clock cycles for all QPUs executing valid instructions"},
>> -	{"QPU", "QPU-total-clk-cycles-waiting-TMU", "[QPU] Total
>> clock cycles for all QPUs stalled waiting for TMUs only (counter
>> won't increment if QPU also stalling for another reason)"},
>> -	{"QPU", "QPU-total-clk-cycles-waiting-scoreboard", "[QPU]
>> Total clock cycles for all QPUs stalled waiting for Scoreboard only
>> (counter won't increment if QPU also stalling for another reason)"},
>> -	{"QPU", "QPU-total-clk-cycles-waiting-varyings", "[QPU]
>> Total clock cycles for all QPUs stalled waiting for Varyings only
>> (counter won't increment if QPU also stalling for another reason)"},
>> -	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total
>> instruction cache hits for all slices"},
>> -	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total
>> instruction cache misses for all slices"},
>> -	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms
>> cache hits for all slices"},
>> -	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total
>> uniforms cache misses for all slices"},
>> -	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture
>> cache accesses"},
>> -	{"TMU", "TMU-total-text-cache-miss", "[TMU] Total texture
>> cache misses (number of fetches from memory/L2cache)"},
>> -	{"VPM", "VPM-total-clk-cycles-VDW-stalled", "[VPM] Total
>> clock cycles VDW is stalled waiting for VPM access"},
>> -	{"VPM", "VPM-total-clk-cycles-VCD-stalled", "[VPM] Total
>> clock cycles VCD is stalled waiting for VPM access"},
>> -	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread
>> active cycles"},
>> -	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render
>> thread active cycles"},
>> -	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache
>> hits"},
>> -	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache
>> misses"},
>> -	{"CORE", "cycle-count", "[CORE] Cycle counter"},
>> -	{"QPU", "QPU-total-clk-cycles-waiting-vertex-coord-shading",
>> "[QPU] Total stalled clock cycles for all QPUs doing
>> vertex/coordinate/user shading"},
>> -	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading",
>> "[QPU] Total stalled clock cycles for all QPUs doing fragment
>> shading"},
>> -	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives
>> binned"},
>> -	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by
>> watch 0"},
>> -	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch
>> 0"},
>> -	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write
>> stalls seen by watch 0"},
>> -	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls
>> seen by watch 0"},
>> -	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes
>> written seen by watch 0"},
>> -	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes
>> read seen by watch 0"},
>> -	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by
>> watch 1"},
>> -	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch
>> 1"},
>> -	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write
>> stalls seen by watch 1"},
>> -	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls
>> seen by watch 1"},
>> -	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes
>> written seen by watch 1"},
>> -	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes
>> read seen by watch 1"},
>> -	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB]
>> Partial quads written to the colour buffer"},
>> -	{"TMU", "TMU-total-config-access", "[TMU] Total config
>> accesses"},
>> -	{"L2T", "L2T-no-id-stalled", "[L2T] No ID stall"},
>> -	{"L2T", "L2T-command-queue-stalled", "[L2T] Command queue
>> full stall"},
>> -	{"L2T", "L2T-TMU-writes", "[L2T] TMU write accesses"},
>> -	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
>> -	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
>> -	{"CLE", "CLE-thread-active-cycles", "[CLE] Bin or render
>> thread active cycles"},
>> -	{"L2T", "L2T-TMU-reads", "[L2T] TMU read accesses"},
>> -	{"L2T", "L2T-CLE-reads", "[L2T] CLE read accesses"},
>> -	{"L2T", "L2T-VCD-reads", "[L2T] VCD read accesses"},
>> -	{"L2T", "L2T-TMU-config-reads", "[L2T] TMU CFG read
>> accesses"},
>> -	{"L2T", "L2T-SLC0-reads", "[L2T] SLC0 read accesses"},
>> -	{"L2T", "L2T-SLC1-reads", "[L2T] SLC1 read accesses"},
>> -	{"L2T", "L2T-SLC2-reads", "[L2T] SLC2 read accesses"},
>> -	{"L2T", "L2T-TMU-write-miss", "[L2T] TMU write misses"},
>> -	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
>> -	{"L2T", "L2T-CLE-read-miss", "[L2T] CLE read misses"},
>> -	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
>> -	{"L2T", "L2T-TMU-config-read-miss", "[L2T] TMU CFG read
>> misses"},
>> -	{"L2T", "L2T-SLC0-read-miss", "[L2T] SLC0 read misses"},
>> -	{"L2T", "L2T-SLC1-read-miss", "[L2T] SLC1 read misses"},
>> -	{"L2T", "L2T-SLC2-read-miss", "[L2T] SLC2 read misses"},
>> -	{"CORE", "core-memory-writes", "[CORE] Total memory
>> writes"},
>> -	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
>> -	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
>> -	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
>> -	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
>> -	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
>> -	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
>> -	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
>> -	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
>> -	{"GMP", "GMP-memory-reads", "[GMP] Total memory reads"},
>> -	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words
>> written"},
>> -	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words
>> written"},
>> -	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words
>> read"},
>> -	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words
>> read"},
>> -	{"TMU", "TMU-MRU-hits", "[TMU] Total MRU hits"},
>> -	{"CORE", "compute-active-cycles", "[CORE] Compute active
>> cycles"},
>> -};
>> +#define V3D_V42_NUM_PERFCOUNTERS (87)
>> +#define V3D_V71_NUM_PERFCOUNTERS (93)
>> +
>> +/* Maximum number of performance counters supported by any version
>> of V3D */
>> +#define V3D_MAX_COUNTERS (93)
>>   
>>   #endif

