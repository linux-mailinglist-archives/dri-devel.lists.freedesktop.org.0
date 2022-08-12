Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF2590C8E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D1D112FC5;
	Fri, 12 Aug 2022 07:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168B2A70AA;
 Fri, 12 Aug 2022 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660289357; x=1691825357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FhydQKfgAGhccxPnKjn4WIuYwJ8wNgp0VsrgavjJMZc=;
 b=TROjSmsu/bMbs5uvwuLSEVceXD9lslQvH7UX8kuwCLbgOih9/EedlpAk
 HalnT99RU6SWIKo0l0w/mKtUx+bcBk1SY2XRXpLV7Ee/ksFDSF9z8f697
 Xe8SdfMJhcF9htULKsdcOoIdxizGqL5Ar/jweZ28++WKCs3UQwgB5vDtn
 yo5ArbmyK2WB1qAUhKzDvRDsQvX6s+UEAwnxhrefsI9yZcLxwJNz7vmQz
 8ig0nx/E/GWX5e0nm+/dv3MTiUhqnDlAZqfdsYqYeKjgae3kS/nIpQJ+c
 A6K8S7Y7yabWQRHVAHWeeUqXT8wsy7ifOmB+s8SqFnw64USvYSX79pLkb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="278492424"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="278492424"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 00:29:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="605831179"
Received: from jsalvagx-mobl2.amr.corp.intel.com (HELO [10.212.98.52])
 ([10.212.98.52])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 00:29:13 -0700
Message-ID: <bd3abbb2-f3e8-b143-a19d-2cbf9463f7b3@linux.intel.com>
Date: Fri, 12 Aug 2022 08:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: clear stalled request after a
 reset
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220811210812.3239621-1-daniele.ceraolospurio@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220811210812.3239621-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/08/2022 22:08, Daniele Ceraolo Spurio wrote:
> If the GuC CTs are full and we need to stall the request submission
> while waiting for space, we save the stalled request and where the stall
> occurred; when the CTs have space again we pick up the request submission
> from where we left off.

How serious is it? Statement always was CT buffers can never get full 
outside the pathological IGT test cases. So I am wondering if this is in 
the category of fix for correctness or actually the CT buffers can get 
full in normal use so it is imperative to fix.

Regards,

Tvrtko

> If a full GT reset occurs, the state of all contexts is cleared and all
> non-guilty requests are unsubmitted, therefore we need to restart the
> stalled request submission from scratch. To make sure that we do so,
> clear the saved request after a reset.
> 
> Fixes note: the patch that introduced the bug is in 5.15, but no
> officially supported platform had GuC submission enabled by default
> in that kernel, so the backport to that particular version (and only
> that one) can potentially be skipped.
> 
> Fixes: 925dc1cf58ed ("drm/i915/guc: Implement GuC submission tasklet")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0d17da77e787..0d56b615bf78 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4002,6 +4002,13 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>   	/* make sure all descriptors are clean... */
>   	xa_destroy(&guc->context_lookup);
>   
> +	/*
> +	 * A reset might have occurred while we had a pending stalled request,
> +	 * so make sure we clean that up.
> +	 */
> +	guc->stalled_request = NULL;
> +	guc->submission_stall_reason = STALL_NONE;
> +
>   	/*
>   	 * Some contexts might have been pinned before we enabled GuC
>   	 * submission, so we need to add them to the GuC bookeeping.
