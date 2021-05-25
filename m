Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2538F8C9
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 05:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2305F6E826;
	Tue, 25 May 2021 03:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DFF6E3E5;
 Tue, 25 May 2021 03:28:35 +0000 (UTC)
IronPort-SDR: r8mJZRDYeOY0CH3i5eUguP3QBzcKlUZ3S6Wda4KJhSV9PMZ6Sxuc6F+ODPFR97RRIFsgNu5IGH
 Zx4Ly4ZMw1GA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="182413331"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="182413331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 20:28:35 -0700
IronPort-SDR: XqsW9h5aZpjmlbXTfkvCPXGkMW/G/4cC6/Pm4Fs+Z69Bkwlgw0KnXXcNH4B2PGItPqp8ndyK0n
 JLurZQOxZf5g==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546330332"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 20:28:34 -0700
Date: Mon, 24 May 2021 20:21:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 16/97] drm/i915/guc: Start protecting access to CTB
 descriptors
Message-ID: <20210525032125.GA12961@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-17-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-17-matthew.brost@intel.com>
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

On Thu, May 06, 2021 at 12:13:30PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> We want to stop using guc.send_mutex while sending CTB messages
> so we have to start protecting access to CTB send descriptor.
> 
> For completeness protect also CTB send descriptor.

Michal I think you have a typo here, receive descriptor, right? Again
this is going to get squashed in the firmware update patch but thought
I'd mention this.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> 
> Add spinlock to struct intel_guc_ct_buffer and start using it.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 14 ++++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index a4b2e7fe318b..bee0958d8bae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -89,6 +89,8 @@ static void ct_incoming_request_worker_func(struct work_struct *w);
>   */
>  void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>  {
> +	spin_lock_init(&ct->ctbs.send.lock);
> +	spin_lock_init(&ct->ctbs.recv.lock);
>  	spin_lock_init(&ct->requests.lock);
>  	INIT_LIST_HEAD(&ct->requests.pending);
>  	INIT_LIST_HEAD(&ct->requests.incoming);
> @@ -479,17 +481,22 @@ static int ct_send(struct intel_guc_ct *ct,
>  	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>  	GEM_BUG_ON(!response_buf && response_buf_size);
>  
> +	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> +
>  	fence = ct_get_next_fence(ct);
>  	request.fence = fence;
>  	request.status = 0;
>  	request.response_len = response_buf_size;
>  	request.response_buf = response_buf;
>  
> -	spin_lock_irqsave(&ct->requests.lock, flags);
> +	spin_lock(&ct->requests.lock);
>  	list_add_tail(&request.link, &ct->requests.pending);
> -	spin_unlock_irqrestore(&ct->requests.lock, flags);
> +	spin_unlock(&ct->requests.lock);
>  
>  	err = ct_write(ct, action, len, fence);
> +
> +	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> +
>  	if (unlikely(err))
>  		goto unlink;
>  
> @@ -825,6 +832,7 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
>  void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
>  {
>  	u32 msg[GUC_CT_MSG_LEN_MASK + 1]; /* one extra dw for the header */
> +	unsigned long flags;
>  	int err = 0;
>  
>  	if (unlikely(!ct->enabled)) {
> @@ -833,7 +841,9 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
>  	}
>  
>  	do {
> +		spin_lock_irqsave(&ct->ctbs.recv.lock, flags);
>  		err = ct_read(ct, msg);
> +		spin_unlock_irqrestore(&ct->ctbs.recv.lock, flags);
>  		if (err)
>  			break;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index fc9486779e87..bc52dc479a14 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -27,11 +27,13 @@ struct intel_guc;
>   * record (command transport buffer descriptor) and the actual buffer which
>   * holds the commands.
>   *
> + * @lock: protects access to the commands buffer and buffer descriptor
>   * @desc: pointer to the buffer descriptor
>   * @cmds: pointer to the commands buffer
>   * @size: size of the commands buffer
>   */
>  struct intel_guc_ct_buffer {
> +	spinlock_t lock;
>  	struct guc_ct_buffer_desc *desc;
>  	u32 *cmds;
>  	u32 size;
> -- 
> 2.28.0
> 
