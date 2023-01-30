Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA56807CB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 09:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FD110E19C;
	Mon, 30 Jan 2023 08:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCE110E18B;
 Mon, 30 Jan 2023 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675068522; x=1706604522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lOm4+KTAtsE9iTgu/MEUd5KpGFoQhToSwXYvMEf4NWk=;
 b=eMtI+/GanS1B44WLF2nDx1tHCQyYmBMnEjHwUdYG5FUn2zFpwqSgnMCm
 42hGQSJUUCSSIO/0bU/u2IQReAtKJqeQ3TEnqP/xk9c9paFxpsrY8qGMl
 Z1xinvMO9P5sD8LK14m0kq5JrL/TejmOtg8Tv+aUc24c3gEU4UbsuVMeL
 1uVVTU+WW4XRGub4DICKMwgJwIJt9itklkN/kQSs7ZXNXaeQoFGTdkjrR
 jX0zlSjYiMK2s/7256LzErhL3E6w2v4eb1reNi8NSlJCo84X9sC6VPdnz
 nOrMpMjSkFTAwjLufW8et+0wryUA2zSopg56vpuLSy+/8F+WoELZnk95e w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="325206199"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="325206199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 00:48:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="727427942"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="727427942"
Received: from mczerwo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.58.44])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 00:48:34 -0800
Date: Mon, 30 Jan 2023 09:48:31 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Message-ID: <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
 <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GG,

thanks for the deep analysis!

> Hi Andi,
> In the call flow invoked by intel_pcode_init(), I've added brief comments
> where further clarification is needed in this scenario, and a description of
> the suspicious scenario at the bottom.
> 
> -------------------------------------------------------------------------
> intel_pcode_init()
>  |
>  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
>                        DG1_UNCORE_GET_INIT_STATUS,
>                        DG1_UNCORE_INIT_STATUS_COMPLETE,
>                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>        |
>        +-> skl_pcode_try_request()
>              |
>              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
>                                            500, 0, true);
> 
> -------------------------------------------------------------------------
> static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
> 		          u32 *val, u32 *val1,
> 			  int fast_timeout_us, int slow_timeout_ms,
> 			  bool is_read)
> {
> ...
>         /* Before writing a value to the GEN6_PCODE_DATA register,
>            check if the bit in the GEN6_PCODE_MAILBOX register indicates
>            BUSY. */
> 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
> 		return -EAGAIN;

what if we fail here because the punit is still initializing and
will be ready, say, in 10 seconds?

GG, without going any further, we fail here! The -EAGAIN we
receive from the test comes from this point. We don't fail with
-ETIMEDOUT, but with -EAGAIN and the reason is because the punit
is not ready to perform the very fist communication and we fail
the probing.

It doesn't mean, though, that there is anything wrong, we just
need to wait a bit before "taking drastic decisions"!

This patch is suggesting to wait up to 10s for the punit to be
ready and eventually try to probe again... and, indeed, it works!

Andi

> 
>         /* write value to GEN6_PCODE_DATA register */
> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
> 
> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
> 
>         /* In this scenario, the value
>            "DG1_PCODE_STATUS | GEN6_PCODE_READY"
>            is written to the GEN6_PCODE_MAILBOX register,
>            so that the Busy status of the GEN6_PCODE_MAILBOX register
>            can be checked later.
>            (When the value of the GEN6_PCODE_READY bit of the
>             GEN6_PCODE_MAILBOX register changes to 0, the operation can
>             be considered completed.) */
> 	intel_uncore_write_fw(uncore,
> 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
> 
>         /* In this scenario, verify that the BUSY status bit in the
>            GEN6_PCODE_MAILBOX register turns off for up to 500us. */
> 	if (__intel_wait_for_register_fw(uncore,
> 					 GEN6_PCODE_MAILBOX,
> 					 GEN6_PCODE_READY, 0,
> 					 fast_timeout_us,
> 					 slow_timeout_ms,
> 					 &mbox))
> 		return -ETIMEDOUT;
>         /* If there is a failure here, it may be considered that the
>            "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
>            completed within 500us */
> ...
> }
> 
> int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> 		      u32 reply_mask, u32 reply, int timeout_base_ms)
> {
> 	u32 status;
> 	int ret;
> 
> 	mutex_lock(&uncore->i915->sb_lock);
> 
> #define COND \
> 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
> 
>         /* the first trial for skl_pcode_try_request() can return
>            -EAGAIN or -ETIMEDOUT. And the code did not check the error
>            code here, so we don't know how far the __snb_pcode_rw()
>            function went. It is not known whether the pcode_mailbox
>            status was busy before writing the value to the
>            GEN6_PCODE_DATA register or after.*/
> 	if (COND) {
> 		ret = 0;
> 		goto out;
> 	}
> 
>         /* In this scenario, skl_pcode_try_request() is invoked every
>            10us for 180 seconds. When skl_pcode_try_request() returns
>            -EAGAIN and -ETIMEDOUT by _wait_for(),
>            -ETIMEDOUT is returned to a variable ret. */
> 
> 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
> 
> 	if (!ret)
> 		goto out;
> 
> 	/*
> 	 * The above can time out if the number of requests was low (2 in the
> 	 * worst case) _and_ PCODE was busy for some reason even after a
> 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
> 	 * the poll with preemption disabled to maximize the number of
> 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
> 	 * account for interrupts that could reduce the number of these
> 	 * requests, and for any quirks of the PCODE firmware that delays
> 	 * the request completion.
> 	 */
> 	drm_dbg_kms(&uncore->i915->drm,
> 		    "PCODE timeout, retrying with preemption disabled\n");
> 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
> 	preempt_disable();
> 	ret = wait_for_atomic(COND, 50);
> 
> 	preempt_enable();
> 
> out:
> 	mutex_unlock(&uncore->i915->sb_lock);
> 	return status ? status : ret;
> #undef COND
> }
> 
> ---------------------------------------------------------
> 
> If you try skl_pcode_try_request() for 180 seconds in skl_pcode_request(),
> and the first "intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) &
> GEN6_PCODE_READY)" call in __snb_pcode_rw() that skl_pcode_try_request()
> invokes always fails. if then it does not make sense to me why this patch
> fixes it by just waiting 10 seconds.This is because if it was called with
> the flow described above, 180 seconds is longer than 10 seconds, so the
> scenario you mentioned is also covered in the existing code.
> 
> To describe in more detail the second scenario I previously commented on:
> skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
>  1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is not
> BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
>  2) skl_pcode_try_request() returns -ETIMEDOUT value because the operation
> of 1) does not complete within 500us.
>  3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as BUSY
> and returns -EAGAIN in the last call of skl_pcode_try_request() invoked by
> skl_pcode_request()
> 
> If the reason why this problem occurred is because of this scenario,
> shouldn't there be an attempt to increase fast_timeout_us used as an
> argument of __snb_pcode_rw() to 500us or more when skl_pcode_try_request()
> returns -ETIMEDOUT?
> 
> Br,
> G.G.
