Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7CA78173
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD7510E639;
	Tue,  1 Apr 2025 17:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adM01F0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEA710E639
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743528339; x=1775064339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4KYsGncfQM1PZywhZpwEMAdRHpd8RrQgQTsmXSRha0Q=;
 b=adM01F0YnsYBsBYf5owEqL6BK1HL8dIsluC3+z+gUa3VUfSHggmW+64p
 hgruZpH6HuTPSm7TGW/uIdE2/oQkVxd/bV275t4At3ClL0P3/spUHVXN4
 8p3Hh7EuC5DmlEn70kzFeOr3uTNeb/HGXY4lY8bdYX77ehNlLSokywQGo
 BLAxB51N/e0tPsUxl4g3CNvdhAz7vPIZHW37Huqg2O8nFI5LqJC6Dw0BP
 Td65vf8g9OEi41UcPejlOfvwmbCIyI+TKpanhUFMxle9iXXFHSxWcBUOO
 hbcZeZ+CteY9A4/rx+6wA+/qpSpD4xxMtUObgcmCZFxoNbHQGsFgl9thY w==;
X-CSE-ConnectionGUID: tWTAAJguQni57USGobdhmg==
X-CSE-MsgGUID: DywCA6nUR0uRzxDfAWZZ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48530872"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="48530872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:25:39 -0700
X-CSE-ConnectionGUID: 1igmbNsnTwS/WTew9I9aVg==
X-CSE-MsgGUID: ukOaBd/sQC+jUIMbDhAnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="130569064"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2025 10:25:36 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 33EF734973;
 Tue,  1 Apr 2025 18:25:35 +0100 (IST)
Message-ID: <1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com>
Date: Tue, 1 Apr 2025 19:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-5-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250331132107.1242954-5-tomasz.lis@intel.com>
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



On 31.03.2025 15:21, Tomasz Lis wrote:
> During post-migration recovery of a VF, it is necessary to update
> GGTT references included in messages which are going to be sent
> to GuC. GuC will start consuming messages after VF KMD will inform
> it about fixups being done; before that, the VF KMD is expected
> to update any H2G messages which are already in send buffer but
> were not consumed by GuC.
> 
> Only a small subset of messages allowed for VFs have GGTT references
> in them. This patch adds the functionality to parse the CTB send
> ring buffer and shift addresses contained within.
> 
> While fixing the CTB content, ct->lock is not taken. This means
> the only barrier taken remains GGTT address lock - which is ok,
> because only requests with GGTT addresses matter, but it also means
> tail changes can happen during the CTB fixups execution (which may
> be ignored as any new messages will not have anything to fix).
> 
> The GGTT address locking will be introduced in a future series.

can you add some FIXME to the code to at least mark places with this
missing locking schema?

> 
> v2: removed storing shift as that's now done in VMA nodes patch;
>   macros to inlines; warns to asserts; log messages fixes (Michal)
> v3: removed inline keywords, enums for offsets in CTB messages,
>   less error messages, if return unused then made functs void (Michal)
> v4: update the cached head before starting fixups
> v5: removed/updated comments, wrapped lines, converted assert into
>   error, enums for offsets to separate patch, reused xe_map_rd
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c   | 142 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c |  25 ++++++
>  3 files changed, 169 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 686fe664c20d..6c80106e5e8b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -84,6 +84,8 @@ struct g2h_fence {
>  	bool done;
>  };
>  
> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> +
>  static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>  {
>  	g2h_fence->response_buffer = response_buffer;
> @@ -1622,6 +1624,146 @@ static void g2h_worker_func(struct work_struct *w)
>  	receive_g2h(ct);
>  }
>  
> +static u32 xe_map_rd_u32(struct xe_device *xe, struct iosys_map *cmds,
> +			     u32 head, u32 pos)
> +{
> +	return xe_map_rd(xe, cmds, (head + pos) * sizeof(u32), u32);
> +}

this helper as-is is little confusing as it mimics the xe_map_rd() but
changes the meaning of the offset to index, so maybe we need:

#define xe_map_rd_array(xe, map, index, type) \
	xe_map_rd((xe), (map), (index) * sizeof(type), (type))

and

#define xe_map_rd_array_u32(xe, map, index) \
	xe_map_rd_array((xe), (map), (index), u32)

both defined in xe_map.h and then use:

	foo = xe_map_rd_array_u32(xe, cmds, head + pos);

> +
> +static void xe_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
> +			       u32 head, u32 pos, s64 shift)

hmm, this can't be "xe_map" generic function, see below

> +{
> +	u32 msg[2];
> +	u64 offset;
> +
> +	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
> +			   2 * sizeof(u32));

in general *) CTB messages could be wrapped at the buffer edge so you
shouldn't assume that both dwords will be always together, and in other
places you seem to take care of this case, so maybe do this as:

	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
	...
	offset = make_u64(hi, lo) + shift;
	lo = lower_32_bits(offset);
	hi = upper_32_bits(offset);
	...
	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);


*) currently xe is filling CTB with undocumented NOP messages, but that
could/should be changed any time, since it is sub-optimal in case of
sending larger VFPF CTB messages

> +	offset = make_u64(msg[1], msg[0]);
> +	offset += shift;
> +	msg[0] = lower_32_bits(offset);
> +	msg[1] = upper_32_bits(offset);
> +	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
> +}
> +
> +/*
> + * Shift any GGTT addresses within a single message left within CTB from
> + * before post-migration recovery.
> + * @ct: pointer to CT struct of the target GuC
> + * @cmds: iomap buffer containing CT messages

we don't need to pass this, as it is always has to be ct->h2g.cmds, no?

> + * @head: start of the target message within the buffer
> + * @len: length of the target message
> + * @size: size of the commands buffer

same here

> + * @shift: the address shift to be added to each GGTT reference
> + */
> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
> +					   struct iosys_map *cmds, u32 head,
> +					   u32 len, u32 size, s64 shift)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	u32 action, i, n;
> +	u32 msg[1];
> +
> +	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
> +			   1 * sizeof(u32));
> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
> +	switch (action) {
> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
> +		xe_map_fixup_u64(xe, cmds, head,
> +				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
> +		xe_map_fixup_u64(xe, cmds, head,
> +				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
> +		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {

hmm, that looks ugly, maybe do this part in MRLC case and then fall into
common case like:

	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
		n = ct_read_h2g(ct, head + N_CHILDREN);
		for (i = 0; i < n; i++)
			ct_fixup_u64(xe, head + HWLRCA + 2 * i, shift);
		fallthrough;
	case XE_GUC_ACTION_REGISTER_CONTEXT:
		ct_fixup_u64(xe, head + WQ_DESC, shift);
		ct_fixup_u64(xe, head + WQ_BASE, shift);
		break;


> +			n = xe_map_rd_u32(xe, cmds, head,
> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);

beware of the wrap!

> +			for (i = 0; i < n; i++)
> +				xe_map_fixup_u64(xe, cmds, head,
> +					    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA
> +					    + 2 * i, shift);
> +		} else {
> +			xe_map_fixup_u64(xe, cmds, head, 10, shift);

magic "10"

> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
> +					 struct guc_ctb *h2g,
> +					 s64 shift, u32 *mhead, s32 avail)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	u32 head = *mhead;
> +	u32 size = h2g->info.size;
> +	u32 msg[1];
> +	u32 len;
> +
> +	/* Read header */
> +	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
> +			   sizeof(u32));
> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> +
> +	if (unlikely(len > (u32)avail)) {
> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
> +			  avail, len);
> +		return 0;
> +	}
> +
> +	head = (head + 1) % size;
> +	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
> +	*mhead = (head + len - 1) % size;
> +
> +	return avail - len;
> +}
> +
> +/**
> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
> + * GGTT offsets in their payloads.

nit: "by ..." part is more appropriate for the 'longer description'
section of the function kernel-doc

> + * @ct: pointer to CT struct of the target GuC
> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
> + */
> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
> +{
> +	struct xe_guc *guc = ct_to_guc(ct);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> +	u32 head, tail, size;
> +	s32 avail;
> +
> +	if (unlikely(h2g->info.broken))
> +		return;
> +
> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
> +	head = h2g->info.head;
> +	tail = READ_ONCE(h2g->info.tail);
> +	size = h2g->info.size;
> +
> +	if (unlikely(head > size))
> +		goto corrupted;
> +
> +	if (unlikely(tail >= size))
> +		goto corrupted;
> +
> +	avail = tail - head;
> +
> +	/* beware of buffer wrap case */
> +	if (unlikely(avail < 0))
> +		avail += size;
> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
> +	xe_gt_assert(gt, avail >= 0);
> +
> +	while (avail > 0)
> +		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
> +
> +	return;
> +
> +corrupted:
> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
> +		 head, tail, size);
> +	h2g->info.broken = true;
> +}
> +
>  static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>  							bool want_ctb)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 82c4ae458dda..5649bda82823 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
> +
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
>  	return ct->state == XE_GUC_CT_STATE_ENABLED;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 2eb6b8d8a217..9a1b578fdd03 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> +#include "xe_guc_ct.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -158,6 +159,27 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)

this function shall be defined in xe_gt_sriov_vf.h|c

> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +
> +	return config->ggtt_shift;
> +}
> +
> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
> +
> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
> +	}
> +}
> +
>  /*
>   * vf_post_migration_imminent - Check if post-restore recovery is coming.
>   * @xe: the &xe_device struct instance
> @@ -219,6 +241,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */
> +	if (need_fixups)
> +		vf_post_migration_fixup_ctb(xe);
> +
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");

