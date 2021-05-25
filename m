Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AF538F847
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 04:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F006E30D;
	Tue, 25 May 2021 02:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555066E30D;
 Tue, 25 May 2021 02:45:29 +0000 (UTC)
IronPort-SDR: OKiEv70eGT485AZ7A7QPmBFAzVbpI8InhRXW8SrM9cPK8xYjdbPc/rJlp9dEr9rmcPyZ8d0bZK
 DP4e/0zJDUGg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="189461816"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="189461816"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 19:45:27 -0700
IronPort-SDR: Q47S6STcOck49lcro1HsDj4Gh1LvN2xHcL3rJPsTurtfyPCxLJDfO3MCNvXERrDEKeMLXLUIgs
 6EaxG0/+mZFg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546321767"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 19:45:26 -0700
Date: Mon, 24 May 2021 19:38:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 09/97] drm/i915/guc: Stop using fence/status from CTB
 descriptor
Message-ID: <20210525023818.GA7018@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-10-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-10-matthew.brost@intel.com>
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

On Thu, May 06, 2021 at 12:13:23PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Stop using fence/status from CTB descriptor as future GuC ABI will
> no longer support replies over CTB descriptor.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../gt/uc/abi/guc_communication_ctb_abi.h     |  4 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 72 ++-----------------
>  2 files changed, 6 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index ebd8c3e0e4bb..d38935f47ecf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -71,8 +71,8 @@ struct guc_ct_buffer_desc {
>  	u32 head;		/* offset updated by GuC*/
>  	u32 tail;		/* offset updated by owner */
>  	u32 is_in_error;	/* error indicator */
> -	u32 fence;		/* fence updated by GuC */
> -	u32 status;		/* status updated by GuC */
> +	u32 reserved1;
> +	u32 reserved2;
>  	u32 owner;		/* id of the channel owner */
>  	u32 owner_sub_id;	/* owner-defined field for extra tracking */
>  	u32 reserved[5];
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 25618649048f..4cc8c0b71699 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -90,13 +90,6 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
>  	desc->owner = CTB_OWNER_HOST;
>  }
>  
> -static void guc_ct_buffer_desc_reset(struct guc_ct_buffer_desc *desc)
> -{
> -	desc->head = 0;
> -	desc->tail = 0;
> -	desc->is_in_error = 0;
> -}
> -
>  static int guc_action_register_ct_buffer(struct intel_guc *guc,
>  					 u32 desc_addr,
>  					 u32 type)
> @@ -315,8 +308,7 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>  static int ct_write(struct intel_guc_ct *ct,
>  		    const u32 *action,
>  		    u32 len /* in dwords */,
> -		    u32 fence,
> -		    bool want_response)
> +		    u32 fence)
>  {
>  	struct intel_guc_ct_buffer *ctb = &ct->ctbs[CTB_SEND];
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> @@ -360,8 +352,7 @@ static int ct_write(struct intel_guc_ct *ct,
>  	 * DW2+: action data
>  	 */
>  	header = (len << GUC_CT_MSG_LEN_SHIFT) |
> -		 (GUC_CT_MSG_WRITE_FENCE_TO_DESC) |
> -		 (want_response ? GUC_CT_MSG_SEND_STATUS : 0) |
> +		 GUC_CT_MSG_SEND_STATUS |
>  		 (action[0] << GUC_CT_MSG_ACTION_SHIFT);
>  
>  	CT_DEBUG(ct, "writing %*ph %*ph %*ph\n",
> @@ -390,56 +381,6 @@ static int ct_write(struct intel_guc_ct *ct,
>  	return -EPIPE;
>  }
>  
> -/**
> - * wait_for_ctb_desc_update - Wait for the CT buffer descriptor update.
> - * @desc:	buffer descriptor
> - * @fence:	response fence
> - * @status:	placeholder for status
> - *
> - * Guc will update CT buffer descriptor with new fence and status
> - * after processing the command identified by the fence. Wait for
> - * specified fence and then read from the descriptor status of the
> - * command.
> - *
> - * Return:
> - * *	0 response received (status is valid)
> - * *	-ETIMEDOUT no response within hardcoded timeout
> - * *	-EPROTO no response, CT buffer is in error
> - */
> -static int wait_for_ctb_desc_update(struct guc_ct_buffer_desc *desc,
> -				    u32 fence,
> -				    u32 *status)
> -{
> -	int err;
> -
> -	/*
> -	 * Fast commands should complete in less than 10us, so sample quickly
> -	 * up to that length of time, then switch to a slower sleep-wait loop.
> -	 * No GuC command should ever take longer than 10ms.
> -	 */
> -#define done (READ_ONCE(desc->fence) == fence)
> -	err = wait_for_us(done, 10);
> -	if (err)
> -		err = wait_for(done, 10);
> -#undef done
> -
> -	if (unlikely(err)) {
> -		DRM_ERROR("CT: fence %u failed; reported fence=%u\n",
> -			  fence, desc->fence);
> -
> -		if (WARN_ON(desc->is_in_error)) {
> -			/* Something went wrong with the messaging, try to reset
> -			 * the buffer and hope for the best
> -			 */
> -			guc_ct_buffer_desc_reset(desc);
> -			err = -EPROTO;
> -		}
> -	}
> -
> -	*status = desc->status;
> -	return err;
> -}
> -
>  /**
>   * wait_for_ct_request_update - Wait for CT request state update.
>   * @req:	pointer to pending request
> @@ -483,8 +424,6 @@ static int ct_send(struct intel_guc_ct *ct,
>  		   u32 response_buf_size,
>  		   u32 *status)
>  {
> -	struct intel_guc_ct_buffer *ctb = &ct->ctbs[CTB_SEND];
> -	struct guc_ct_buffer_desc *desc = ctb->desc;
>  	struct ct_request request;
>  	unsigned long flags;
>  	u32 fence;
> @@ -505,16 +444,13 @@ static int ct_send(struct intel_guc_ct *ct,
>  	list_add_tail(&request.link, &ct->requests.pending);
>  	spin_unlock_irqrestore(&ct->requests.lock, flags);
>  
> -	err = ct_write(ct, action, len, fence, !!response_buf);
> +	err = ct_write(ct, action, len, fence);
>  	if (unlikely(err))
>  		goto unlink;
>  
>  	intel_guc_notify(ct_to_guc(ct));
>  
> -	if (response_buf)
> -		err = wait_for_ct_request_update(&request, status);
> -	else
> -		err = wait_for_ctb_desc_update(desc, fence, status);
> +	err = wait_for_ct_request_update(&request, status);
>  	if (unlikely(err))
>  		goto unlink;
>  
> -- 
> 2.28.0
> 
