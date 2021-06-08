Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A639EA8C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 02:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80696EA54;
	Tue,  8 Jun 2021 00:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECBB6E57A;
 Tue,  8 Jun 2021 00:05:08 +0000 (UTC)
IronPort-SDR: PmZVZmOpoQ3OLF+uJHKf7InDNsvO2ncvOqLCXCWS4oq2QFY0Yr2CKg8j31JfgMCp7ukkK+If/K
 NZSeWDgm+TtA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204764357"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="204764357"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:05:07 -0700
IronPort-SDR: MruJggyfvZ6EfeCTWJEC6zkG3o20EHxaJjzSAMsDutzmHpxgjouFa91GI+btWbfCcUP9PCXN8L
 1anZcP2A8chQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="476400950"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.209.129.6])
 ([10.209.129.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:05:06 -0700
Subject: Re: [PATCH 03/13] drm/i915/guc: Update CTB response status definition
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-4-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <6a89048d-4075-ccdc-1bc7-cbcc06c0e972@intel.com>
Date: Mon, 7 Jun 2021 17:05:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607180356.165785-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: john.c.harrison@intel.com, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/7/2021 11:03 AM, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> Format of the STATUS dword in CTB response message now follows
> definition of the HXG header. Update our code and remove any
> obsolete legacy definitions.

This is kind of hard to review on its own against the specs, because 
there are larger changes to the CTB flows which AFAICS are part of patch 
8. If what you wanted to do here was a simple replacement of defines to 
keep the later patch simpler, then, considering all patches are going to 
be squashed anyway:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

One suggestion below.

>
> GuC: 55.0.0
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c   | 14 ++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 17 -----------------
>   2 files changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 8f7b148fef58..3f7f48611487 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -477,7 +477,9 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>   	 * up to that length of time, then switch to a slower sleep-wait loop.
>   	 * No GuC command should ever take longer than 10ms.
>   	 */
> -#define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
> +#define done \
> +	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
> +	 GUC_HXG_ORIGIN_GUC)
>   	err = wait_for_us(done, 10);
>   	if (err)
>   		err = wait_for(done, 10);
> @@ -532,21 +534,21 @@ static int ct_send(struct intel_guc_ct *ct,
>   	if (unlikely(err))
>   		goto unlink;
>   
> -	if (!INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(*status)) {
> +	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>   		err = -EIO;
>   		goto unlink;
>   	}
>   
>   	if (response_buf) {
>   		/* There shall be no data in the status */
> -		WARN_ON(INTEL_GUC_MSG_TO_DATA(request.status));
> +		WARN_ON(FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, request.status));
>   		/* Return actual response len */
>   		err = request.response_len;
>   	} else {
>   		/* There shall be no response payload */
>   		WARN_ON(request.response_len);
>   		/* Return data decoded from the status dword */
> -		err = INTEL_GUC_MSG_TO_DATA(*status);
> +		err = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, *status);

Given that the same FIELD_GET() are repeated multiple times, IMO we 
could've kept some helper macros, something like:

INTEL_GUC_HXG_RESPONSE_TO_DATA(hxg) \
	FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg)

INTEL_GUC_HXG_ORIGIN_IS_GUC(hxg) \
	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg) == GUC_HXG_ORIGIN_GUC)

INTEL_GUC_HXG_TYPE(hxg) \
	FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg)

Which could be useful in the mmio code as well.
Not sure how this changes in patch 8 though, I might put some more 
comments on that patch.

Daniele

>   	}
>   
>   unlink:
> @@ -741,8 +743,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   	status = response->msg[2];
>   	datalen = len - 2;
>   
> -	/* Format of the status follows RESPONSE message */
> -	if (unlikely(!INTEL_GUC_MSG_IS_RESPONSE(status))) {
> +	/* Format of the status dword follows HXG header */
> +	if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, status) != GUC_HXG_ORIGIN_GUC)) {
>   		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
>   		return -EPROTO;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index e9a9d85e2aa3..fb04e2211b79 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -414,23 +414,6 @@ struct guc_shared_ctx_data {
>   	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
>   } __packed;
>   
> -#define __INTEL_GUC_MSG_GET(T, m) \
> -	(((m) & INTEL_GUC_MSG_ ## T ## _MASK) >> INTEL_GUC_MSG_ ## T ## _SHIFT)
> -#define INTEL_GUC_MSG_TO_TYPE(m)	__INTEL_GUC_MSG_GET(TYPE, m)
> -#define INTEL_GUC_MSG_TO_DATA(m)	__INTEL_GUC_MSG_GET(DATA, m)
> -#define INTEL_GUC_MSG_TO_CODE(m)	__INTEL_GUC_MSG_GET(CODE, m)
> -
> -#define __INTEL_GUC_MSG_TYPE_IS(T, m) \
> -	(INTEL_GUC_MSG_TO_TYPE(m) == INTEL_GUC_MSG_TYPE_ ## T)
> -#define INTEL_GUC_MSG_IS_REQUEST(m)	__INTEL_GUC_MSG_TYPE_IS(REQUEST, m)
> -#define INTEL_GUC_MSG_IS_RESPONSE(m)	__INTEL_GUC_MSG_TYPE_IS(RESPONSE, m)
> -
> -#define INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(m) \
> -	 (typecheck(u32, (m)) && \
> -	  ((m) & (INTEL_GUC_MSG_TYPE_MASK | INTEL_GUC_MSG_CODE_MASK)) == \
> -	  ((INTEL_GUC_MSG_TYPE_RESPONSE << INTEL_GUC_MSG_TYPE_SHIFT) | \
> -	   (INTEL_GUC_RESPONSE_STATUS_SUCCESS << INTEL_GUC_MSG_CODE_SHIFT)))
> -
>   /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>   enum intel_guc_recv_message {
>   	INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),

