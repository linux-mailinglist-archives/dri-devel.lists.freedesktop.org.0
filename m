Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D6B3B334A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE606EC4A;
	Thu, 24 Jun 2021 15:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351A6EC4A;
 Thu, 24 Jun 2021 15:57:45 +0000 (UTC)
IronPort-SDR: wFzDWiGK9fk1zZCAgh7xaBH3D9UWDv6FhaO6H5sJcsjsDTD3qXduvhrwHeQo6pycL1AYHasGgR
 DGCNoEH2+p7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207537948"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207537948"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 08:56:29 -0700
IronPort-SDR: T7bIvbxkxvWH0/hSgX6WXYckUfx3Pm3K2JPYr72JrVXzyIPTJNapVIWRo1AaHD4tl7OobUWk2/
 FN4pNLpVT0gw==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="424116914"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 08:56:29 -0700
Date: Thu, 24 Jun 2021 08:49:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH 04/47] drm/i915/guc: Add non blocking CTB
 send function
Message-ID: <20210624154947.GB1629@sdutt-i7>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-5-matthew.brost@intel.com>
 <761f2063-7fe6-518b-d05e-67f8fadb9a9c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <761f2063-7fe6-518b-d05e-67f8fadb9a9c@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 04:48:32PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 24.06.2021 09:04, Matthew Brost wrote:
> > Add non blocking CTB send function, intel_guc_send_nb. GuC submission
> > will send CTBs in the critical path and does not need to wait for these
> > CTBs to complete before moving on, hence the need for this new function.
> > 
> > The non-blocking CTB now must have a flow control mechanism to ensure
> > the buffer isn't overrun. A lazy spin wait is used as we believe the
> > flow control condition should be rare with a properly sized buffer.
> > 
> > The function, intel_guc_send_nb, is exported in this patch but unused.
> > Several patches later in the series make use of this function.
> > 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 12 +++-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 77 +++++++++++++++++++++--
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  3 +-
> >  3 files changed, 82 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 4abc59f6f3cd..24b1df6ad4ae 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -74,7 +74,15 @@ static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> >  static
> >  inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
> >  {
> > -	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0);
> > +	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0, 0);
> > +}
> > +
> > +#define INTEL_GUC_SEND_NB		BIT(31)
> 
> hmm, this flag really belongs to intel_guc_ct_send() so it should be
> defined as CTB flag near that function declaration
> 

I can move this up a few lines.

> > +static
> > +inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
> > +{
> > +	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
> > +				 INTEL_GUC_SEND_NB);
> >  }
> >  
> >  static inline int
> > @@ -82,7 +90,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
> >  			   u32 *response_buf, u32 response_buf_size)
> >  {
> >  	return intel_guc_ct_send(&guc->ct, action, len,
> > -				 response_buf, response_buf_size);
> > +				 response_buf, response_buf_size, 0);
> >  }
> >  
> >  static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index a17215920e58..c9a65d05911f 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -3,6 +3,11 @@
> >   * Copyright © 2016-2019 Intel Corporation
> >   */
> >  
> > +#include <linux/circ_buf.h>
> > +#include <linux/ktime.h>
> > +#include <linux/time64.h>
> > +#include <linux/timekeeping.h>
> > +
> >  #include "i915_drv.h"
> >  #include "intel_guc_ct.h"
> >  #include "gt/intel_gt.h"
> > @@ -373,7 +378,7 @@ static void write_barrier(struct intel_guc_ct *ct)
> >  static int ct_write(struct intel_guc_ct *ct,
> >  		    const u32 *action,
> >  		    u32 len /* in dwords */,
> > -		    u32 fence)
> > +		    u32 fence, u32 flags)
> >  {
> >  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> >  	struct guc_ct_buffer_desc *desc = ctb->desc;
> > @@ -421,9 +426,13 @@ static int ct_write(struct intel_guc_ct *ct,
> >  		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
> >  		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
> >  
> > -	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> > -			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
> > +	hxg = (flags & INTEL_GUC_SEND_NB) ?
> > +		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> > +		 FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > +			    GUC_HXG_EVENT_MSG_0_DATA0, action[0])) :
> > +		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > +		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> > +			    GUC_HXG_REQUEST_MSG_0_DATA0, action[0]));
> 
> or as we already switched to accept and return whole HXG messages in
> guc_send_mmio() maybe we should do the same for CTB variant too and
> instead of using extra flag just let caller to prepare proper HXG header
> with HXG_EVENT type and then in CTB code just look at this type to make
> decision which code path to use
>

Not sure I follow. Anyways could this be done in a follow up by you if
want this change.
 
> note that existing callers should not be impacted, as full HXG header
> for the REQUEST message looks exactly the same as "action" code alone.
> 
> >  
> >  	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
> >  		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
> > @@ -498,6 +507,46 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> >  	return err;
> >  }
> >  
> > +static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
> > +{
> > +	struct guc_ct_buffer_desc *desc = ctb->desc;
> > +	u32 head = READ_ONCE(desc->head);
> > +	u32 space;
> > +
> > +	space = CIRC_SPACE(desc->tail, head, ctb->size);
> > +
> > +	return space >= len_dw;
> 
> here you are returning true(1) as has room
>

See below.
 
> > +}
> > +
> > +static int ct_send_nb(struct intel_guc_ct *ct,
> > +		      const u32 *action,
> > +		      u32 len,
> > +		      u32 flags)
> > +{
> > +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > +	unsigned long spin_flags;
> > +	u32 fence;
> > +	int ret;
> > +
> > +	spin_lock_irqsave(&ctb->lock, spin_flags);
> > +
> > +	ret = h2g_has_room(ctb, len + 1);
> 
> but here you treat "1" it as en error
> 

Yes, this patch is broken but fixed in a follow up one. Regardless I'll
fix this patch in place.

> and this "1" is GUC_HXG_MSG_MIN_LEN, right ?
>

Not exactly. This is following how ct_send() uses the action + len
field. Action[0] field goes in the HXG header and extra + 1 is for the
CT header.

> > +	if (unlikely(ret))
> > +		goto out;
> > +
> > +	fence = ct_get_next_fence(ct);
> > +	ret = ct_write(ct, action, len, fence, flags);
> > +	if (unlikely(ret))
> > +		goto out;
> > +
> > +	intel_guc_notify(ct_to_guc(ct));
> > +
> > +out:
> > +	spin_unlock_irqrestore(&ctb->lock, spin_flags);
> > +
> > +	return ret;
> > +}
> > +
> >  static int ct_send(struct intel_guc_ct *ct,
> >  		   const u32 *action,
> >  		   u32 len,
> > @@ -505,6 +554,7 @@ static int ct_send(struct intel_guc_ct *ct,
> >  		   u32 response_buf_size,
> >  		   u32 *status)
> >  {
> > +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> >  	struct ct_request request;
> >  	unsigned long flags;
> >  	u32 fence;
> > @@ -514,8 +564,20 @@ static int ct_send(struct intel_guc_ct *ct,
> >  	GEM_BUG_ON(!len);
> >  	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> >  	GEM_BUG_ON(!response_buf && response_buf_size);
> > +	might_sleep();
> >  
> > +	/*
> > +	 * We use a lazy spin wait loop here as we believe that if the CT
> > +	 * buffers are sized correctly the flow control condition should be
> > +	 * rare.
> 
> shouldn't we at least try to log such cases with RATE_LIMITED to find
> out how "rare" it is, or if really unlikely just return -EBUSY as in
> case of non-blocking send ?
>

Definitely not return -EBUSY as this a blocking call. Perhaps we can log
this, but IGTs likely can hit rather easily. It really is only
interesting if real workloads hit this. Regardless that can be a follow
up.

Matt
 
> > +	 */
> > +retry:
> >  	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> > +	if (unlikely(!h2g_has_room(ctb, len + 1))) {
> > +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> > +		cond_resched();
> > +		goto retry;
> > +	}
> >  
> >  	fence = ct_get_next_fence(ct);
> >  	request.fence = fence;
> > @@ -527,7 +589,7 @@ static int ct_send(struct intel_guc_ct *ct,
> >  	list_add_tail(&request.link, &ct->requests.pending);
> >  	spin_unlock(&ct->requests.lock);
> >  
> > -	err = ct_write(ct, action, len, fence);
> > +	err = ct_write(ct, action, len, fence, 0);
> >  
> >  	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> >  
> > @@ -569,7 +631,7 @@ static int ct_send(struct intel_guc_ct *ct,
> >   * Command Transport (CT) buffer based GuC send function.
> >   */
> >  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> > -		      u32 *response_buf, u32 response_buf_size)
> > +		      u32 *response_buf, u32 response_buf_size, u32 flags)
> >  {
> >  	u32 status = ~0; /* undefined */
> >  	int ret;
> > @@ -579,6 +641,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> >  		return -ENODEV;
> >  	}
> >  
> > +	if (flags & INTEL_GUC_SEND_NB)
> > +		return ct_send_nb(ct, action, len, flags);
> > +
> >  	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
> >  	if (unlikely(ret < 0)) {
> >  		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> > index 1ae2dde6db93..eb69263324ba 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> > @@ -42,7 +42,6 @@ struct intel_guc_ct_buffer {
> >  	bool broken;
> >  };
> >  
> > -
> >  /** Top-level structure for Command Transport related data
> >   *
> >   * Includes a pair of CT buffers for bi-directional communication and tracking
> > @@ -88,7 +87,7 @@ static inline bool intel_guc_ct_enabled(struct intel_guc_ct *ct)
> >  }
> >  
> >  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> > -		      u32 *response_buf, u32 response_buf_size);
> > +		      u32 *response_buf, u32 response_buf_size, u32 flags);
> >  void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
> >  
> >  #endif /* _INTEL_GUC_CT_H_ */
> > 
