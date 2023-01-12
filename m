Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D8666F24
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A76F10E8CA;
	Thu, 12 Jan 2023 10:11:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E967010E8C7;
 Thu, 12 Jan 2023 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673518270; x=1705054270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yp6uz/B6mYsXoBwewg6ipiPx3L9acizQ5vtWpC3Qel8=;
 b=LSl/Rvk4h1nmuf69hXGFRPfZrDy137CcPmxViS2mqu39dPeVaVm973iJ
 qoGWbGh7BdoHq1CpuoSEKUOg2rSYN4xE61jsRhYX6Imtou8/Sse0TxBFr
 adp/YY3f2l1QbDDrXMSKQX3pkFPl/lcLA1XKiP3/zVFJrMFp4/tC2/jym
 ASjxOqxQpcTrpkP820gnJC/ZikbWuYgrmzUjEn6QLCJ3i1Mzujr/6MU5g
 uUAdA8+equpi6vA9Yv99Os8wuS5NL/eX9lo5Pm3qferyx7k4gp2Je7UBP
 dycTmiB2SJ0ce5gsuksd60U5/bmVV82BqebDh9oVdV0sZp2BuEpJR+opR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350891371"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="350891371"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:11:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="726245650"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="726245650"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:11:09 -0800
Message-ID: <674d7492-97fd-172a-4e7d-36092cd47177@linux.intel.com>
Date: Thu, 12 Jan 2023 10:11:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Add a debug print on GuC
 triggered reset
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-5-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230112025311.2577084-5-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> For understanding bug reports, it can be useful to have an explicit
> dmesg print when a reset notification is received from GuC. As opposed
> to simply inferring that this happened from other messages.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 99d09e3394597..0be7c27a436dd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4665,6 +4665,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   {
>   	trace_intel_context_reset(ce);
>   
> +	drm_dbg(&guc_to_gt(guc)->i915->drm, "Got GuC reset of 0x%04X, exiting = %d, banned = %d\n",
> +		ce->guc_id.id, test_bit(CONTEXT_EXITING, &ce->flags),
> +		test_bit(CONTEXT_BANNED, &ce->flags));
> +
>   	if (likely(intel_context_is_schedulable(ce))) {
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
