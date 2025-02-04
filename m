Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A04A2772D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 17:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ADB10E358;
	Tue,  4 Feb 2025 16:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK6hUm4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6810E042;
 Tue,  4 Feb 2025 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738686637; x=1770222637;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PkwZmtUC3B140391/0DBQB0PbujszBKzTRZVGrCKXN4=;
 b=NK6hUm4rvXIIFBOX8Zf7dLPBNbIb++C8EqV5BmbOquznBwI6XWPNEyM0
 vugRTUcJxKFWNJFREBfpDQtxkjS21mzYxsAYSo0qJmrwTYuPv/XoVff0a
 POyIZGbicUV2airV0dRQDpPld84i0nZGDaqe3KHSZk8wCygJy/LUjMD3c
 iXUPrqx3UTrM4bfV1aiPd3Ls1RcRcsds6/L8vZHuHKsfum9z25+Ov1Ozq
 Zm+xwg7aYu0L+Cgr7t//kPv/9A8uxt3w+fJN9c4irvRrhOhh1J1V/ofPY
 0mz9jjL1E7BaSRxeWSCgPca/G06f9WG39tIRlOANRbnXC5FVFJxeHvYnu g==;
X-CSE-ConnectionGUID: FtHp0SI1RI6ACrzng+iPuA==
X-CSE-MsgGUID: ewLirTLARKy7w9oEkIM0Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61696065"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="61696065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 08:30:37 -0800
X-CSE-ConnectionGUID: 5hE16gUPSIS5fAxF0O7Nlw==
X-CSE-MsgGUID: jglkcohLRWKUEnKdW4aabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110520737"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2025 08:30:34 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2AEAF32EA2;
 Tue,  4 Feb 2025 16:30:33 +0000 (GMT)
Message-ID: <2ced99ce-fd3e-4966-b093-c193b6c8b400@intel.com>
Date: Tue, 4 Feb 2025 17:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for
 xe_force_wake
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-4-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250204132238.162608-4-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maarten,

On 04.02.2025 14:22, Maarten Lankhorst wrote:
> Instead of finding bugs where we may or may not release force_wake, I've
> decided to be inspired by the spinlock guards, and use the same ones to
> do xe_force_wake handling.

You may want to take a look at [1], which was based on [2], that
introduce fw guard class (and it was already acked and reviewed).
Merging was postponed only due to a request to prepare larger series
that would convert all existing usages to the new model.

And similar guard approach for our RPM was proposed in [3]

Michal

[1] https://patchwork.freedesktop.org/series/141516/
[2] https://patchwork.freedesktop.org/series/134958/
[3] https://patchwork.freedesktop.org/series/134955/

> 
> Examples are added as documentation in xe_force_wake.c
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 51 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_force_wake.h | 15 +++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 4f6784e5abf88..805c19f6de9e7 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -16,6 +16,57 @@
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
> +/**
> + * DOC: Force wake handling
> + *
> + * Traditionally, the force wake handling has been done using the error prone
> + * set of calls:
> + *
> + * int func(struct xe_force_wake *fw)
> + * {
> + * 	unsigned int fw_ref = xe_force_wake_get(fw, XE_FORCEWAKE_ALL);
> + * 	if (!fw_ref)
> + * 		return -ETIMEDOUT;
> + *
> + * 	err = do_something();
> + *
> + * 	xe_force_wake_put(fw, fw_ref);
> + * 	return err;
> + * }
> + *
> + * A new, failure-safe approach is by using the scoped helpers,
> + * which changes the function to this:
> + *
> + * int func(struct xe_force_wake *fw)
> + * {
> + * 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, XE_FORCEWAKE_ALL) {
> + * 		return do_something();
> + * 	}
> + * }
> + *
> + * For completeness, the following options also work:
> + * void func(struct xe_force_wake *fw)
> + * {
> + * 	scoped_guard(xe_force_wake_get, fw, XE_FORCEWAKE_ALL) {
> + * 		do_something_only_if_fw_acquired();
> + * 	}
> + * }
> + *
> + * You can use xe_force_wake instead of force_wake_get, if the code
> + * must run but errors acquiring ignored:
> + * void func(struct xe_force_wake *fw)
> + * {
> + * 	scoped_guard(xe_force_wake, fw, XE_FORCEWAKE_ALL) {
> + * 		always_do_something_maybe_fw();
> + * 	}
> + *
> + * 	do_something_no_fw();
> + *
> + * 	guard(xe_force_wake)(fw, XE_FORCEWAKE_ALL);
> + * 	always_do_something_maybe_fw();
> + * }
> + */
> +
>  static const char *str_wake_sleep(bool wake)
>  {
>  	return wake ? "wake" : "sleep";
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 0e3e84bfa51c3..0fb1baae0a3a3 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -9,6 +9,8 @@
>  #include "xe_assert.h"
>  #include "xe_force_wake_types.h"
>  
> +#include <linux/cleanup.h>
> +
>  struct xe_gt;
>  
>  void xe_force_wake_init_gt(struct xe_gt *gt,
> @@ -61,4 +63,17 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
>  	return fw_ref & domain;
>  }
>  
> +DEFINE_LOCK_GUARD_1(xe_force_wake, struct xe_force_wake,
> +		    _T->fw_ref = xe_force_wake_get(_T->lock, domain),
> +		    xe_force_wake_put(_T->lock, _T->fw_ref),
> +		    unsigned int fw_ref, enum xe_force_wake_domains domain);
> +
> +DEFINE_LOCK_GUARD_1_COND(xe_force_wake, _get,
> +			 _T->fw_ref = xe_force_wake_get_all(_T->lock, domain),
> +			 enum xe_force_wake_domains domain);
> +
> +/* Only useful for guard xe_force_wake, guard xe_force_wake_get gets all or nothing */
> +#define xe_force_wake_scope_has_domain(domain) \
> +	(xe_force_wake_ref_has_domain(scope.fw_ref, domain))
> +
>  #endif

