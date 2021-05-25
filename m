Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBC38F85C
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 04:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EC76E32A;
	Tue, 25 May 2021 02:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB766E32A;
 Tue, 25 May 2021 02:54:23 +0000 (UTC)
IronPort-SDR: mzDD3KNx5JOqBziTxQnHRNGJwNHksqn1nCTcpvd4qzD5lodpmUzedrsrRjE8IWipguRS0l08mQ
 ehH9HYiEkYGw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="223246733"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="223246733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 19:54:22 -0700
IronPort-SDR: 5DgRWqyLz2p/IQjdgAz6M2PqITh4MtIG4iOUDdDTKgi0m6vihXlU4al0fmIGog6LB1/aCilIGv
 R9chAslW59kg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="443117608"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 19:54:20 -0700
Date: Mon, 24 May 2021 19:47:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 11/97] drm/i915/guc: Only rely on own CTB size
Message-ID: <20210525024712.GA8004@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-12-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-12-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:25PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> In upcoming GuC firmware, CTB size will be removed from the CTB
> descriptor so we must keep it locally for any calculations.
> 
> While around, improve some debug messages and helpers.
> 

desc->size is still used in the patch and really shouldn't be per this
comment but a patch later in the series drops it. Seeing as this patch
and that patch are going to squashed into a single patch upgrading the
GuC firmware I think that is ok.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 55 +++++++++++++++++------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 +
>  2 files changed, 43 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 4cc8c0b71699..dbece569fbe4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -90,6 +90,24 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
>  	desc->owner = CTB_OWNER_HOST;
>  }
>  
> +static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
> +{
> +	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
> +}
> +
> +static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
> +			       struct guc_ct_buffer_desc *desc,
> +			       u32 *cmds, u32 size)
> +{
> +	GEM_BUG_ON(size % 4);
> +
> +	ctb->desc = desc;
> +	ctb->cmds = cmds;
> +	ctb->size = size;
> +
> +	guc_ct_buffer_reset(ctb, 0);
> +}
> +
>  static int guc_action_register_ct_buffer(struct intel_guc *guc,
>  					 u32 desc_addr,
>  					 u32 type)
> @@ -148,7 +166,10 @@ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
>  int intel_guc_ct_init(struct intel_guc_ct *ct)
>  {
>  	struct intel_guc *guc = ct_to_guc(ct);
> +	struct guc_ct_buffer_desc *desc;
> +	u32 blob_size;
>  	void *blob;
> +	u32 *cmds;
>  	int err;
>  	int i;
>  
> @@ -176,19 +197,24 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>  	 * other code will need updating as well.
>  	 */
>  
> -	err = intel_guc_allocate_and_map_vma(guc, PAGE_SIZE, &ct->vma, &blob);
> +	blob_size = PAGE_SIZE;
> +	err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma, &blob);
>  	if (unlikely(err)) {
> -		CT_ERROR(ct, "Failed to allocate CT channel (err=%d)\n", err);
> +		CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data (%pe)\n",
> +			       blob_size, ERR_PTR(err));
>  		return err;
>  	}
>  
> -	CT_DEBUG(ct, "vma base=%#x\n", intel_guc_ggtt_offset(guc, ct->vma));
> +	CT_DEBUG(ct, "base=%#x size=%u\n", intel_guc_ggtt_offset(guc, ct->vma), blob_size);
>  
>  	/* store pointers to desc and cmds */
>  	for (i = 0; i < ARRAY_SIZE(ct->ctbs); i++) {
>  		GEM_BUG_ON((i !=  CTB_SEND) && (i != CTB_RECV));
> -		ct->ctbs[i].desc = blob + PAGE_SIZE/4 * i;
> -		ct->ctbs[i].cmds = blob + PAGE_SIZE/4 * i + PAGE_SIZE/2;
> +
> +		desc = blob + PAGE_SIZE / 4 * i;
> +		cmds = blob + PAGE_SIZE / 4 * i + PAGE_SIZE / 2;
> +
> +		guc_ct_buffer_init(&ct->ctbs[i], desc, cmds, PAGE_SIZE / 4);
>  	}
>  
>  	return 0;
> @@ -217,7 +243,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
>  int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  {
>  	struct intel_guc *guc = ct_to_guc(ct);
> -	u32 base, cmds, size;
> +	u32 base, cmds;
>  	int err;
>  	int i;
>  
> @@ -232,10 +258,11 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  	 */
>  	for (i = 0; i < ARRAY_SIZE(ct->ctbs); i++) {
>  		GEM_BUG_ON((i != CTB_SEND) && (i != CTB_RECV));
> +
>  		cmds = base + PAGE_SIZE / 4 * i + PAGE_SIZE / 2;
> -		size = PAGE_SIZE / 4;
> -		CT_DEBUG(ct, "%d: addr=%#x size=%u\n", i, cmds, size);
> -		guc_ct_buffer_desc_init(ct->ctbs[i].desc, cmds, size);
> +		CT_DEBUG(ct, "%d: cmds addr=%#x\n", i, cmds);
> +
> +		guc_ct_buffer_reset(&ct->ctbs[i], cmds);
>  	}
>  
>  	/*
> @@ -259,7 +286,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  err_deregister:
>  	ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
>  err_out:
> -	CT_PROBE_ERROR(ct, "Failed to open channel (err=%d)\n", err);
> +	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
>  	return err;
>  }
>  
> @@ -314,7 +341,7 @@ static int ct_write(struct intel_guc_ct *ct,
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
>  	u32 head = desc->head;
>  	u32 tail = desc->tail;
> -	u32 size = desc->size;
> +	u32 size = ctb->size;
>  	u32 used;
>  	u32 header;
>  	u32 *cmds = ctb->cmds;
> @@ -323,7 +350,7 @@ static int ct_write(struct intel_guc_ct *ct,
>  	if (unlikely(desc->is_in_error))
>  		return -EPIPE;
>  
> -	if (unlikely(!IS_ALIGNED(head | tail | size, 4) ||
> +	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
>  		     (tail | head) >= size))
>  		goto corrupted;
>  
> @@ -530,7 +557,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
>  	u32 head = desc->head;
>  	u32 tail = desc->tail;
> -	u32 size = desc->size;
> +	u32 size = ctb->size;
>  	u32 *cmds = ctb->cmds;
>  	s32 available;
>  	unsigned int len;
> @@ -539,7 +566,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
>  	if (unlikely(desc->is_in_error))
>  		return -EPIPE;
>  
> -	if (unlikely(!IS_ALIGNED(head | tail | size, 4) ||
> +	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
>  		     (tail | head) >= size))
>  		goto corrupted;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index 494a51a5200f..4009e2dd0de4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -29,10 +29,12 @@ struct intel_guc;
>   *
>   * @desc: pointer to the buffer descriptor
>   * @cmds: pointer to the commands buffer
> + * @size: size of the commands buffer
>   */
>  struct intel_guc_ct_buffer {
>  	struct guc_ct_buffer_desc *desc;
>  	u32 *cmds;
> +	u32 size;
>  };
>  
>  
> -- 
> 2.28.0
> 
