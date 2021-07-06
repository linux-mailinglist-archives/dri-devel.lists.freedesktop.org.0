Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A363C3BDD1E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 20:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824BA6E090;
	Tue,  6 Jul 2021 18:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019776E090;
 Tue,  6 Jul 2021 18:23:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="270292365"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="270292365"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 11:23:52 -0700
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="647487075"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 11:23:51 -0700
Date: Tue, 6 Jul 2021 11:17:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 4/7] drm/i915/guc: Add non blocking CTB send function
Message-ID: <20210706181720.GA26536@sdutt-i7>
References: <20210701171550.49353-1-matthew.brost@intel.com>
 <20210701171550.49353-5-matthew.brost@intel.com>
 <a620a386-f00d-3891-606e-3779e07ea057@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a620a386-f00d-3891-606e-3779e07ea057@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 11:12:21AM -0700, John Harrison wrote:
>    On 7/1/2021 10:15, Matthew Brost wrote:
> 
> Add non blocking CTB send function, intel_guc_send_nb. GuC submission
> will send CTBs in the critical path and does not need to wait for these
> CTBs to complete before moving on, hence the need for this new function.
> 
> The non-blocking CTB now must have a flow control mechanism to ensure
> the buffer isn't overrun. A lazy spin wait is used as we believe the
> flow control condition should be rare with a properly sized buffer.
> 
> The function, intel_guc_send_nb, is exported in this patch but unused.
> Several patches later in the series make use of this function.
> 
> v2:
>  (Michal)
>   - Use define for H2G room calculations
>   - Move INTEL_GUC_SEND_NB define
>  (Daniel Vetter)
>   - Use msleep_interruptible rather than cond_resched
> v3:
>  (Michal)
>   - Move includes to following patch
>   - s/INTEL_GUC_SEND_NB/INTEL_GUC_CT_SEND_NB/g
> 
> Signed-off-by: John Harrison [1]<John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost [2]<matthew.brost@intel.com>
> ---
>  .../gt/uc/abi/guc_communication_ctb_abi.h     |  3 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 11 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 87 +++++++++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +-
>  4 files changed, 91 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/driver
> s/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index e933ca02d0eb..99e1fad5ca20 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -79,7 +79,8 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>   *  +---+-------+--------------------------------------------------------------
> +
>   */
> 
> -#define GUC_CTB_MSG_MIN_LEN                    1u
> +#define GUC_CTB_HDR_LEN                                1u
> +#define GUC_CTB_MSG_MIN_LEN                    GUC_CTB_HDR_LEN
>  #define GUC_CTB_MSG_MAX_LEN                    256u
>  #define GUC_CTB_MSG_0_FENCE                    (0xffff << 16)
>  #define GUC_CTB_MSG_0_FORMAT                   (0xf << 12)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
> /intel_guc.h
> index 4abc59f6f3cd..72e4653222e2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -74,7 +74,14 @@ static inline struct intel_guc *log_to_guc(struct intel_guc_l
> og *log)
>  static
>  inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
>  {
> -       return intel_guc_ct_send(&guc->ct, action, len, NULL, 0);
> +       return intel_guc_ct_send(&guc->ct, action, len, NULL, 0, 0);
> +}
> +
> +static
> +inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
> +{
> +       return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
> +                                INTEL_GUC_CT_SEND_NB);
>  }
> 
>  static inline int
> @@ -82,7 +89,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *a
> ction, u32 len,
>                            u32 *response_buf, u32 response_buf_size)
>  {
>         return intel_guc_ct_send(&guc->ct, action, len,
> -                                response_buf, response_buf_size);
> +                                response_buf, response_buf_size, 0);
>  }
> 
>  static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
> /uc/intel_guc_ct.c
> index 43e03aa2dde8..fb825cc1d090 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2016-2019 Intel Corporation
>   */
> 
> +#include <linux/circ_buf.h>
> +
>  #include "i915_drv.h"
>  #include "intel_guc_ct.h"
>  #include "gt/intel_gt.h"
> @@ -373,7 +375,7 @@ static void write_barrier(struct intel_guc_ct *ct)
>  static int ct_write(struct intel_guc_ct *ct,
>                     const u32 *action,
>                     u32 len /* in dwords */,
> -                   u32 fence)
> +                   u32 fence, u32 flags)
>  {
>         struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>         struct guc_ct_buffer_desc *desc = ctb->desc;
> @@ -409,7 +411,7 @@ static int ct_write(struct intel_guc_ct *ct,
>                 used = tail - head;
> 
>         /* make sure there is a space including extra dw for the fence */
> -       if (unlikely(used + len + 1 >= size))
> +       if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
> 
>    I thought the plan was to update the comment? Given that the '+1' is
>    now 'HDR_LEN' it would be good to update the comment to say 'header'
>    instead of 'fence'.
> 

Yep, will fix.

>                 return -ENOSPC;
> 
>         /*
> @@ -421,9 +423,13 @@ static int ct_write(struct intel_guc_ct *ct,
>                  FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>                  FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
> 
> -       hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -             FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> -                        GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
> +       hxg = (flags & INTEL_GUC_CT_SEND_NB) ?
> +               (FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +                FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> +                           GUC_HXG_EVENT_MSG_0_DATA0, action[0])) :
> +               (FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +                FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> +                           GUC_HXG_REQUEST_MSG_0_DATA0, action[0]));
> 
>    If would be much easier to read if this used a proper 'if' rather than
>    an inline '?'. Or maybe have something like:
> 
>      type = SEND_NB ? TYPE_EVENT : TYPE REQUEST;
>      hxg = PREP(type) | ACTION ...;
> 
>    Neither issue above is a blocker but I think the comment at least
>    should be fixed up when merging. With that:

Probably a bit cleaner. Will fix.

Matt

>    Reviewed-by: John Harrison [3]<John.C.Harrison@Intel.com>
> 
> 
>         CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
>                  tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
> @@ -500,6 +506,48 @@ static int wait_for_ct_request_update(struct ct_request *re
> q, u32 *status)
>         return err;
>  }
> 
> +static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
> +{
> +       struct guc_ct_buffer_desc *desc = ctb->desc;
> +       u32 head = READ_ONCE(desc->head);
> +       u32 space;
> +
> +       space = CIRC_SPACE(desc->tail, head, ctb->size);
> +
> +       return space >= len_dw;
> +}
> +
> +static int ct_send_nb(struct intel_guc_ct *ct,
> +                     const u32 *action,
> +                     u32 len,
> +                     u32 flags)
> +{
> +       struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> +       unsigned long spin_flags;
> +       u32 fence;
> +       int ret;
> +
> +       spin_lock_irqsave(&ctb->lock, spin_flags);
> +
> +       ret = h2g_has_room(ctb, len + GUC_CTB_HDR_LEN);
> +       if (unlikely(!ret)) {
> +               ret = -EBUSY;
> +               goto out;
> +       }
> +
> +       fence = ct_get_next_fence(ct);
> +       ret = ct_write(ct, action, len, fence, flags);
> +       if (unlikely(ret))
> +               goto out;
> +
> +       intel_guc_notify(ct_to_guc(ct));
> +
> +out:
> +       spin_unlock_irqrestore(&ctb->lock, spin_flags);
> +
> +       return ret;
> +}
> +
>  static int ct_send(struct intel_guc_ct *ct,
>                    const u32 *action,
>                    u32 len,
> @@ -507,8 +555,10 @@ static int ct_send(struct intel_guc_ct *ct,
>                    u32 response_buf_size,
>                    u32 *status)
>  {
> +       struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>         struct ct_request request;
>         unsigned long flags;
> +       unsigned int sleep_period_ms = 1;
>         u32 fence;
>         int err;
> 
> @@ -516,8 +566,24 @@ static int ct_send(struct intel_guc_ct *ct,
>         GEM_BUG_ON(!len);
>         GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>         GEM_BUG_ON(!response_buf && response_buf_size);
> +       might_sleep();
> +
> +       /*
> +        * We use a lazy spin wait loop here as we believe that if the CT
> +        * buffers are sized correctly the flow control condition should be
> +        * rare.
> +        */
> +retry:
> +       spin_lock_irqsave(&ctb->lock, flags);
> +       if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
> +               spin_unlock_irqrestore(&ctb->lock, flags);
> 
> -       spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> +               if (msleep_interruptible(sleep_period_ms))
> +                       return -EINTR;
> +               sleep_period_ms = sleep_period_ms << 1;
> +
> +               goto retry;
> +       }
> 
>         fence = ct_get_next_fence(ct);
>         request.fence = fence;
> @@ -529,9 +595,9 @@ static int ct_send(struct intel_guc_ct *ct,
>         list_add_tail(&request.link, &ct->requests.pending);
>         spin_unlock(&ct->requests.lock);
> 
> -       err = ct_write(ct, action, len, fence);
> +       err = ct_write(ct, action, len, fence, 0);
> 
> -       spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> +       spin_unlock_irqrestore(&ctb->lock, flags);
> 
>         if (unlikely(err))
>                 goto unlink;
> @@ -571,7 +637,7 @@ static int ct_send(struct intel_guc_ct *ct,
>   * Command Transport (CT) buffer based GuC send function.
>   */
>  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> -                     u32 *response_buf, u32 response_buf_size)
> +                     u32 *response_buf, u32 response_buf_size, u32 flags)
>  {
>         u32 status = ~0; /* undefined */
>         int ret;
> @@ -581,6 +647,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *ac
> tion, u32 len,
>                 return -ENODEV;
>         }
> 
> +       if (flags & INTEL_GUC_CT_SEND_NB)
> +               return ct_send_nb(ct, action, len, flags);
> +
>         ret = ct_send(ct, action, len, response_buf, response_buf_size, &status)
> ;
>         if (unlikely(ret < 0)) {
>                 CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt
> /uc/intel_guc_ct.h
> index 1ae2dde6db93..5bb8bef024c8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -42,7 +42,6 @@ struct intel_guc_ct_buffer {
>         bool broken;
>  };
> 
> -
>  /** Top-level structure for Command Transport related data
>   *
>   * Includes a pair of CT buffers for bi-directional communication and tracking
> @@ -87,8 +86,9 @@ static inline bool intel_guc_ct_enabled(struct intel_guc_ct *c
> t)
>         return ct->enabled;
>  }
> 
> +#define INTEL_GUC_CT_SEND_NB           BIT(31)
>  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> -                     u32 *response_buf, u32 response_buf_size);
> +                     u32 *response_buf, u32 response_buf_size, u32 flags);
>  void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
> 
>  #endif /* _INTEL_GUC_CT_H_ */
> 
> References
> 
>    1. mailto:John.C.Harrison@Intel.com
>    2. mailto:matthew.brost@intel.com
>    3. mailto:John.C.Harrison@Intel.com
