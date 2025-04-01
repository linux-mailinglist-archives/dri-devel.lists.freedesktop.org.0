Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2EA78162
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256F710E635;
	Tue,  1 Apr 2025 17:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSGxIc94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2E10E635
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743528246; x=1775064246;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZSueX9ZPfbBqnd7iCXR2CxKrXQwyxJnrUz3vLrxouAs=;
 b=dSGxIc946GjxLOE4a/xeC4wtpwvbBEYcyzEgCjsvBlSszQdkdikydQzx
 eXpqrSTSVQST9ek/pMyFGycm0h0vFPHXHO1NPBrKfM7VrhuvNkmE/feWO
 ACTdBssrqWqpjKfC35SuC1FnN3mNEtUEuGFC37ZCKnyEh9ZK8YvytVQIm
 F/WsLNbzF0DOEzQozZAqr9E3/WaCBmGO0OE81QscXz7e3H4J4iXffIXXS
 vCnV39/bfrUTMPEdqgl5gw70NIWoCCXyJ+kFZ0IE3zGdW6OaFFkuJtVdV
 URuxifNopND6gh4fpl5J4bRLcC+1sksmOqUDp8Pceg4YafZ6Peivr/EEn g==;
X-CSE-ConnectionGUID: B5iv0fi0Rc6wOmY5KgcSqA==
X-CSE-MsgGUID: CdMoGsNVSum+tPg95XMNaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48530717"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="48530717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:24:06 -0700
X-CSE-ConnectionGUID: uxFydbHOQbW5LPkz7izSRg==
X-CSE-MsgGUID: eYz/prUFRwCtx+BvryS5lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="130568838"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2025 10:24:03 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5BA5F34974;
 Tue,  1 Apr 2025 18:24:02 +0100 (IST)
Message-ID: <69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com>
Date: Tue, 1 Apr 2025 19:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe/sriov: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250331132107.1242954-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


please use "drm/xe/vf:" in the subject as this patch is still more VF
oriented, then general SRIOV

On 31.03.2025 15:21, Tomasz Lis wrote:
> We have only one GGTT for all IOV functions, with each VF having assigned
> a range of addresses for its use. After migration, a VF can receive a
> different range of addresses than it had initially.
> 
> This implements shifting GGTT addresses within drm_mm nodes, so that
> VMAs stay valid after migration. This will make the driver use new
> addresses when accessing GGTT from the moment the shifting ends.
> 
> By taking the ggtt->lock for the period of VMA fixups, this change
> also adds constraint on that mutex. Any locks used during the recovery
> cannot ever wait for hardware response - because after migration,
> the hardware will not do anything until fixups are finished.
> 
> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>   after querying; improved documentation; switched some warns to asserts;
>   skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
> v3: Updated kerneldocs, removed unused funct, properly allocate
>   balloning nodes if non existent
> v4: Re-used ballooning functions from VF init, used bool in place of
>   standard error codes
> v5: Renamed one function
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c              | 33 +++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 83 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          | 17 +++++
>  6 files changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2d7456e37ef4..b13c4a12393e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -482,6 +482,39 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>  	drm_mm_remove_node(&node->base);
>  }
>  
> +/**
> + * xe_ggtt_shift_mm_nodes - Shift GGTT nodes to adjust for a change in usable address range.

drop "mm" from the function name as it is implementation detail

	xe_ggtt_shift_nodes()

> + * @ggtt: the &xe_ggtt struct instance
> + * @shift: change to the location of area provisioned for current VF

this function is quite generic and while it is used by the VF only, the
parameter doesn't have to be described as such

you may add here, in the 'longer description' part of the kernel-doc,
after explaining how it works, that function is mostly used by the VF,
and why we believe it will succeed

> + */
> +void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift)
> +{
> +	struct drm_mm_node *node, *tmpn;
> +	LIST_HEAD(temp_list_head);
> +	int err;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	/*
> +	 * Move nodes, from range previously assigned to this VF, to a temp list.

nit: no need for multi-line comment style

also, maybe it could be moved to the 'longer description' part of the
function kernel-doc, after sanitize it from the 'VF' specific wording

> +	 */
> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> +		drm_mm_remove_node(node);
> +		list_add(&node->node_list, &temp_list_head);
> +	}
> +
> +	/*
> +	 * Now the GGTT VM contains no nodes. We can re-add all VF nodes with
> +	 * shifted offsets.
> +	 */

also consider to move this comment to function kernel-doc

> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> +		list_del(&node->node_list);
> +		node->start += shift;
> +		err = drm_mm_reserve_node(&ggtt->mm, node);
> +		xe_tile_assert(ggtt->tile, !err);

while we believe it should be always possible to 'shift' all nodes, as
we just released our balloons, I'm not sure that this assert here alone
is sufficient

maybe before starting any movements, check that 'shift' is valid, and
add asserts for each node that shifted location is within GGTT space?

> +	}
> +}
> +
>  /**
>   * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @node: the &xe_ggtt_node to be inserted
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..a07194cd3724 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>  				u64 start, u64 size);
>  void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
> +void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 9edbe34f45f4..e9e7ddeb4254 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> +	config->ggtt_shift = start - (s64)config->ggtt_base;

on the first probe, shouldn't we store it as '0' ?

>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
>  
> @@ -972,6 +973,88 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>  	return err;
>  }

hmm, are you sure that place between

	xe_gt_sriov_vf_query_runtime
and
	vf_runtime_reg_cmp

is the best place for this function?

maybe at least place it closer to

	xe_gt_sriov_vf_migrated_event_handler

that is at least partially related,
but not sure if also not miss-located

>  
> +/**
> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * @gt: the &xe_gt struct instance
> + * Return: True if fixups are necessary
> + *
> + * Since Global GTT is not virtualized, each VF has an assigned range
> + * within the global space. This range might have changed during migration,
> + * which requires all memory addresses pointing to GGTT to be shifted.

This 'longer description' shall be _after_ 'Return' description

see https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

> + */
> +bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;

you should introduce xe_gt_sriov_vf_ggtt_shift() earlier than patch 4/4
and use it here (or better let the caller use it and pass ggtt_shift as
parameter)

> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	s64 ggtt_shift;
> +

assert that gt is not a media one

> +	mutex_lock(&ggtt->lock);
> +	ggtt_shift = config->ggtt_shift;
> +	/*
> +	 * Move nodes, including balloons, from range previously assigned to this VF,
> +	 * into newly provisioned area.
> +	 *
> +	 * The balloon nodes are there to eliminate unavailable ranges from use: one
> +	 * reserves the GGTT area below the range for current VF, and another one
> +	 * reserves area above.
> +	 *
> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
> +	 * said VF, and inaccessible areas above and below:
> +	 *
> +	 *  0                                                                        4GiB
> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
> +	 *      WOPCM                                                         GUC_TOP
> +	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
> +	 *
> +	 *  +---+---------------------------------+----------+----------------------+---+
> +	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
> +	 *  +---+---------------------------------+----------+----------------------+---+
> +	 *
> +	 * Hardware enforced access rules before migration:
> +	 *
> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> +	 *
> +	 * drm_mm nodes used for tracking allocations:

use of drm_mm is implementation detail of the xe_ggtt and it is not
relevant here, just say 'GGTT nodes'

> +	 *
> +	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
> +	 *
> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
> +	 * to lower or to higher address. But we expect the total size and extra areas to
> +	 * be identical, as migration can only happen between matching platforms.
> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> +	 *
> +	 *  +---+----------------------+----------+---------------------------------+---+
> +	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
> +	 *  +---+----------------------+----------+---------------------------------+---+
> +	 *
> +	 * Hardware enforced access rules after migration:
> +	 *
> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> +	 *
> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
> +	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
> +	 * are still tracking allocations using the old addresses. The nodes within VF
> +	 * owned area have to be shifted, and balloon nodes need to be resized to
> +	 * properly mask out areas not owned by the VF.
> +	 *
> +	 * Fixed drm_mm nodes used for tracking allocations:
> +	 *
> +	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> +	 *
> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> +	 * overlap; but our node shifting will fix addresses properly regardless.
> +	 */

this inline comment is now much bigger than actual implementation

why not promote it to the full DOC: as then it could be included in the
master SRIOV documentation

> +	if (ggtt_shift) {
> +		xe_gt_sriov_vf_deballoon_ggtt(gt);
> +		xe_ggtt_shift_mm_nodes(ggtt, ggtt_shift);
> +		xe_gt_sriov_vf_balloon_ggtt(gt);
> +	}
> +	mutex_unlock(&ggtt->lock);
> +	return ggtt_shift != 0;
> +}
> +
>  static int vf_runtime_reg_cmp(const void *a, const void *b)
>  {
>  	const struct vf_runtime_reg *ra = a;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index c87b0e9c7ebc..13c04e313aa6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -20,6 +20,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
>  void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
> +bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index a57f13b5afcd..5ccbdf8d08b6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  	u64 ggtt_base;
>  	/** @ggtt_size: assigned size of the GGTT region. */
>  	u64 ggtt_size;
> +	/** @ggtt_shift: difference in ggtt_base on last migration */
> +	s64 ggtt_shift;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;
>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index c1275e64aa9c..2eb6b8d8a217 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_pm.h"
> @@ -170,6 +171,20 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>  	work_pending(&xe->sriov.vf.migration.worker);
>  }
>  
> +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +	bool need_fixups = false;

try to define vars in reverse-xmas-tree order

	bool need_fixups = false;
	struct xe_tile *tile;
	unsigned int id;

> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_gt *gt = tile->primary_gt;

		shift = xe_gt_sriov_vf_ggtt_shift(gt);
		if (shift) {
			need_fixups = true;
			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
		}

> +
> +		need_fixups |= xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
> +	}
> +	return need_fixups;
> +}
> +
>  /*
>   * Notify all GuCs about resource fixups apply finished.
>   */
> @@ -191,6 +206,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>  
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
> +	bool need_fixups;
>  	int err;
>  
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
> @@ -201,6 +217,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	if (unlikely(err))
>  		goto fail;
>  
> +	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);

