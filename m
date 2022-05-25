Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54853470C
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 01:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECB310E33B;
	Wed, 25 May 2022 23:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F3F10E2E5;
 Wed, 25 May 2022 23:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653522456; x=1685058456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+1StdJE03LcIYnT3PGtasawU35+MjgHuRxmj/a7neLY=;
 b=NSLGuQjH5I8OjuLgiLf6k6u+cKU2S1XiKMThIiHutuUWJdKnuA7GmEqI
 QkSoXpcWFCH9Wau71vH96gXFhvAAmFKdFG4Ej8oafcA939zNQmCYGsxW2
 bT53r5wHu1qC68eTLX33h66xlFJok/WEd20+g2ybKIKQ6v0DVurhvByM2
 1NXwu0P56gG0T+JIGATWrk2Rs+KwZPItTvR0hJFYeiRUPzGqCqRGhaQ2H
 Tuz+xwc+EWclfgZPbBPIDJ8khiJBgL0IynIlKieadIQAL+A6OE4VIWFRF
 lYmyEeBUXXT1CI04SORgxi0AFbCOkcNkjtZySBwW+Hedxq3qK461YrUNi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="261576913"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="261576913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 16:47:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="549264421"
Received: from nazirhos-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.165.86])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 16:47:35 -0700
Date: Wed, 25 May 2022 16:47:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hwconfig: Future-proof platform
 checks
Message-ID: <20220525234735.plbjjpvympaczfmx@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220524235906.529771-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220524235906.529771-1-matthew.d.roper@intel.com>
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

On Tue, May 24, 2022 at 04:59:06PM -0700, Matt Roper wrote:
>PVC also has a hwconfig table.  Actually the current expectation is that
>all future platforms will have hwconfig, so let's just change the
>condition to an IP version check so that we don't need to keep updating
>this for each new platform that shows up.
>
>Cc: John Harrison <john.c.harrison@intel.com>
>Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>index 5aaa3948de74..4781fccc2687 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>@@ -96,7 +96,7 @@ static bool has_table(struct drm_i915_private *i915)
> {
> 	if (IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915))
> 		return true;
>-	if (IS_DG2(i915))
>+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55))
> 		return true;

probably a matter of taste, but given gcc's history on how to decide
when to inline[1], could be better as

	return GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55) ||
		(IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915));

Lucas De Marchi

[1] https://lwn.net/Articles/767884/

>
> 	return false;
>-- 
>2.35.3
>
