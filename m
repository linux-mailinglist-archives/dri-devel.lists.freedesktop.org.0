Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B04A9145
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 00:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B707310E194;
	Thu,  3 Feb 2022 23:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B2610E16B;
 Thu,  3 Feb 2022 23:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643931863; x=1675467863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hSso29yQ/d2WIHtzZdaMQ8zQQqJ7T+2eIHQMFuY2k4A=;
 b=U/Gpc3/6K6dVJWx8ux0oS70bPTMtMMZLHOOsACjCYdmU329as2kiIyG/
 0+J+0GbwZd524WmX3NUQt/F1MzDff/BVgbAUAdcDD64+7myBXoMGj/NxZ
 7TA2wLMNDp6JYqr+/oqZ43YmJ03O2Db4FMzZTt7iLrB4roYkNrND/4EiW
 iAEFQK8grXF2xkelL+pzJ5IeRoAy565mMXOrLrrO0ESb0C1LxO1yMSqd9
 P3WI/4zct5Ql9GkKGrqWjEGbw9SBJwzg2EHFN/NArVqUE+cp7ujGZdKuf
 nKAtxapXB3e1KrKa+ObLEcJ9yKUOvjXn8UJMcKRCEwpwQf5utXEPkrve/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248491853"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="248491853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 15:44:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="524122966"
Received: from ekabir-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.144.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 15:44:22 -0800
Date: Thu, 3 Feb 2022 15:44:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 16/19] drm/i915/guc: Use a single pass to calculate regset
Message-ID: <20220203234420.d3ztz6fyi4k6xvds@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-17-lucas.demarchi@intel.com>
 <6a5c4a0f-2e71-7dd4-7f15-4e076cbdbe62@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a5c4a0f-2e71-7dd4-7f15-4e076cbdbe62@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 02:42:20PM -0800, Daniele Ceraolo Spurio wrote:
>
>
>On 1/26/2022 12:36 PM, Lucas De Marchi wrote:
>>The ADS initialitazion was using 2 passes to calculate the regset sent
>>to GuC to initialize each engine: the first pass to just have the final
>>object size and the second to set each register in place in the final
>>gem object.
>>
>>However in order to maintain an ordered set of registers to pass to guc,
>>each register needs to be added and moved in the final array. The second
>>phase may actually happen in IO memory rather than system memory and
>>accessing IO memory by simply dereferencing the pointer doesn't work on
>>all architectures. Other places of the ADS initializaition were
>>converted to use the dma_buf_map API, but here there may be a lot more
>>accesses to IO memory. So, instead of following that same approach,
>>convert the regset initialization to calculate the final array in 1
>>pass and in the second pass that array is just copied to its final
>>location, updating the pointers for each engine written to the ADS blob.
>>
>>One important thing is that struct temp_regset now have
>>different semantics: `registers` continues to track the registers of a
>>single engine, however the other fields are updated together, according
>>to the newly added `storage`, which tracks the memory allocated for
>>all the registers. So rename some of these fields and add a
>>__mmio_reg_add(): this function (possibly) allocates memory and operates
>>on the storage pointer while guc_mmio_reg_add() continues to manage the
>>registers pointer.
>>
>>On a Tiger Lake system using enable_guc=3, the following log message is
>>now seen:
>>
>>	[  187.334310] i915 0000:00:02.0: [drm:intel_guc_ads_create [i915]] Used 4 KB for temporary ADS regset
>>
>>This change has also been tested on an ARM64 host with DG2 and other
>>discrete graphics cards.
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>Cc: Daniel Vetter <daniel@ffwll.ch>
>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>Cc: Matthew Brost <matthew.brost@intel.com>
>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.h     |   7 ++
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 117 +++++++++++++--------
>>  2 files changed, 79 insertions(+), 45 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>index e2e0df1c3d91..4c852eee3ad8 100644
>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>@@ -152,6 +152,13 @@ struct intel_guc {
>>  	struct dma_buf_map ads_map;
>>  	/** @ads_regset_size: size of the save/restore regsets in the ADS */
>>  	u32 ads_regset_size;
>>+	/**
>>+	 * @ads_regset_count: number of save/restore registers in the ADS for
>>+	 * each engine
>>+	 */
>>+	u32 ads_regset_count[I915_NUM_ENGINES];
>>+	/** @ads_regset: save/restore regsets in the ADS */
>>+	struct guc_mmio_reg *ads_regset;
>>  	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
>>  	u32 ads_golden_ctxt_size;
>>  	/** @ads_engine_usage_size: size of engine usage in the ADS */
>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>index 73ca34de44f7..390101ee3661 100644
>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>@@ -226,14 +226,13 @@ static void guc_mapping_table_init(struct intel_gt *gt,
>>  /*
>>   * The save/restore register list must be pre-calculated to a temporary
>>- * buffer of driver defined size before it can be generated in place
>>- * inside the ADS.
>>+ * buffer before it can be copied inside the ADS.
>>   */
>>-#define MAX_MMIO_REGS	128	/* Arbitrary size, increase as needed */
>>  struct temp_regset {
>>  	struct guc_mmio_reg *registers;
>>-	u32 used;
>>-	u32 size;
>>+	struct guc_mmio_reg *storage;
>
>I think this could use a comment to distinguish between registers and 
>storage. Something like.:
>
>/* ptr to the base of the allocated storage for all engines */
>struct guc_mmio_reg *storage;
>
>/* ptr to the section of the storage for the engine currently being 
>worked on */
>struct guc_mmio_reg *registers;

agreed, I will add that

>
>
>>+	u32 storage_used;
>>+	u32 storage_max;
>>  };
>>  static int guc_mmio_reg_cmp(const void *a, const void *b)
>>@@ -244,18 +243,44 @@ static int guc_mmio_reg_cmp(const void *a, const void *b)
>>  	return (int)ra->offset - (int)rb->offset;
>>  }
>>+static struct guc_mmio_reg * __must_check
>>+__mmio_reg_add(struct temp_regset *regset, struct guc_mmio_reg *reg)
>>+{
>>+	u32 pos = regset->storage_used;
>>+	struct guc_mmio_reg *slot;
>>+
>>+	if (pos >= regset->storage_max) {
>>+		size_t size = ALIGN((pos + 1) * sizeof(*slot), PAGE_SIZE);
>>+		struct guc_mmio_reg *r = krealloc(regset->storage,
>>+						  size, GFP_KERNEL);
>>+		if (!r) {
>>+			WARN_ONCE(1, "Incomplete regset list: can't add register (%d)\n",
>>+				  -ENOMEM);
>>+			return ERR_PTR(-ENOMEM);
>>+		}
>>+
>>+		regset->registers = r + (regset->registers - regset->storage);
>>+		regset->storage = r;
>>+		regset->storage_max = size / sizeof(*slot);
>>+	}
>>+
>>+	slot = &regset->storage[pos];
>>+	regset->storage_used++;
>>+	*slot = *reg;
>>+
>>+	return slot;
>>+}
>>+
>>  static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
>>  					  u32 offset, u32 flags)
>>  {
>>-	u32 count = regset->used;
>>+	u32 count = regset->storage_used - (regset->registers - regset->storage);
>>  	struct guc_mmio_reg reg = {
>>  		.offset = offset,
>>  		.flags = flags,
>>  	};
>>  	struct guc_mmio_reg *slot;
>>-	GEM_BUG_ON(count >= regset->size);
>>-
>>  	/*
>>  	 * The mmio list is built using separate lists within the driver.
>>  	 * It's possible that at some point we may attempt to add the same
>>@@ -266,9 +291,9 @@ static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
>>  		    sizeof(reg), guc_mmio_reg_cmp))
>>  		return 0;
>>-	slot = &regset->registers[count];
>>-	regset->used++;
>>-	*slot = reg;
>>+	slot = __mmio_reg_add(regset, &reg);
>>+	if (IS_ERR(slot))
>>+		return PTR_ERR(slot);
>>  	while (slot-- > regset->registers) {
>>  		GEM_BUG_ON(slot[0].offset == slot[1].offset);
>>@@ -295,7 +320,11 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>>  	unsigned int i;
>>  	int ret = 0;
>>-	regset->used = 0;
>>+	/*
>>+	 * Each engine's registers point to a new start relative to
>>+	 * storage
>>+	 */
>>+	regset->registers = regset->storage + regset->storage_used;
>>  	ret |= GUC_MMIO_REG_ADD(regset, RING_MODE_GEN7(base), true);
>>  	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
>>@@ -317,32 +346,28 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>>  	return ret ? -1 : 0;
>>  }
>>-static int guc_mmio_reg_state_query(struct intel_guc *guc)
>>+static long guc_mmio_reg_state_create(struct intel_guc *guc)
>>  {
>>  	struct intel_gt *gt = guc_to_gt(guc);
>>  	struct intel_engine_cs *engine;
>>  	enum intel_engine_id id;
>>-	struct temp_regset temp_set;
>>-	u32 total;
>>+	struct temp_regset temp_set = {};
>>+	long total = 0;
>>-	/*
>>-	 * Need to actually build the list in order to filter out
>>-	 * duplicates and other such data dependent constructions.
>>-	 */
>>-	temp_set.size = MAX_MMIO_REGS;
>>-	temp_set.registers = kmalloc_array(temp_set.size,
>>-					   sizeof(*temp_set.registers),
>>-					   GFP_KERNEL);
>>-	if (!temp_set.registers)
>>-		return -ENOMEM;
>>-
>>-	total = 0;
>>  	for_each_engine(engine, gt, id) {
>>-		guc_mmio_regset_init(&temp_set, engine);
>>-		total += temp_set.used;
>>+		u32 used = temp_set.storage_used;
>>+
>>+		if (guc_mmio_regset_init(&temp_set, engine) < 0)
>>+			return -1;
>
>If you fail here you're leaking temp_set.storage.

thanks for catching this. I fixed it for next version

>Also, any reason not to just return the return code from 
>guc_mmio_regset_init?

no


>Apart from these minor comments, the change LGTM. IMO we could also 
>merge this patch on its own ahead of the rest of the dma_buf code, 
>because not having to recreate the regset on every reset/resume is 
>still helpful.

now the dma_buf_map (renamed to iosys_map) is more settled. I will send
everything together once more and than probably split on next versions
if needed.


thanks
Lucas De Marchi
