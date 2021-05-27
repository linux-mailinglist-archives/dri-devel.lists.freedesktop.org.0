Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B13936A8
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 21:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A096E1FB;
	Thu, 27 May 2021 19:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4656E1FB;
 Thu, 27 May 2021 19:51:13 +0000 (UTC)
IronPort-SDR: 7bqhsWDNx6TpoOErVW4FPa07bIG7BiA4Gi4rL/+QctXu5prwQCKBpOPyPnuCZqg5DBvKLRBfYw
 HEZVi3mblzJA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="190192074"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="190192074"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 12:51:11 -0700
IronPort-SDR: +ksiKppIR2S+VamVlBFFFklRurSmTwi6kWVQgCMtEX1sKgYRaXq5YwLyMvkXineqBS11O236ps
 U0pbp2opwcmA==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="480728455"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 12:51:08 -0700
Date: Thu, 27 May 2021 12:44:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 24/97] drm/i915/guc: Add flag for mark broken CTB
Message-ID: <20210527194402.GA31589@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-25-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506191451.77768-25-matthew.brost@intel.com>
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

On Thu, May 06, 2021 at 12:13:38PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Once CTB descriptor is found in error state, either set by GuC
> or us, there is no need continue checking descriptor any more,
> we can rely on our internal flag.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 13 +++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 1afdeac683b5..178f73ab2c96 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -123,6 +123,7 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
>  
>  static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
>  {
> +	ctb->broken = false;
>  	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
>  }
>  
> @@ -365,9 +366,12 @@ static int ct_write(struct intel_guc_ct *ct,
>  	u32 *cmds = ctb->cmds;
>  	unsigned int i;
>  
> -	if (unlikely(desc->is_in_error))
> +	if (unlikely(ctb->broken))
>  		return -EPIPE;
>  
> +	if (unlikely(desc->is_in_error))
> +		goto corrupted;
> +
>  	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
>  		     (tail | head) >= size))
>  		goto corrupted;
> @@ -423,6 +427,7 @@ static int ct_write(struct intel_guc_ct *ct,
>  	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
>  		 desc->addr, desc->head, desc->tail, desc->size);
>  	desc->is_in_error = 1;
> +	ctb->broken = true;
>  	return -EPIPE;
>  }
>  
> @@ -608,9 +613,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	unsigned int i;
>  	u32 header;
>  
> -	if (unlikely(desc->is_in_error))
> +	if (unlikely(ctb->broken))
>  		return -EPIPE;
>  
> +	if (unlikely(desc->is_in_error))
> +		goto corrupted;
> +
>  	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
>  		     (tail | head) >= size))
>  		goto corrupted;
> @@ -674,6 +682,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
>  		 desc->addr, desc->head, desc->tail, desc->size);
>  	desc->is_in_error = 1;
> +	ctb->broken = true;
>  	return -EPIPE;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index cb222f202301..7d3cd375d6a7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -32,12 +32,14 @@ struct intel_guc;
>   * @desc: pointer to the buffer descriptor
>   * @cmds: pointer to the commands buffer
>   * @size: size of the commands buffer
> + * @broken: flag to indicate if descriptor data is broken
>   */
>  struct intel_guc_ct_buffer {
>  	spinlock_t lock;
>  	struct guc_ct_buffer_desc *desc;
>  	u32 *cmds;
>  	u32 size;
> +	bool broken;
>  };
>  
>  
> -- 
> 2.28.0
> 
