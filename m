Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0E4706EF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA71A10EBF1;
	Fri, 10 Dec 2021 17:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D5610EBF1;
 Fri, 10 Dec 2021 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639157109; x=1670693109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U5UuDcLlUBY6hNX9XfK3sNQ4qtaq14yyKEoZ4SuQcqo=;
 b=ZRTq3ue6rpvrK4BmWTuOgeneHYrY1qe2IRBQsE4V3yLRCu5JbkXNZwHE
 c01lGnHnwOCzXkmUZmolQLBGiA9q9yLgn8YaYj/lPrDxCOVLIvjm8DC4N
 HvM6l4CTTOzs/Lf7Cv4YK6XUSybTxG/uPaPC4WTkZFLPvEY9LkDStZb95
 SjnMD1GK0E43wlp0sE6pC8wgN/6TkeHngXsyJeoL7TM4MkcpfXSijSQ8u
 q2J/G7LlqNBYgMccjaoPTBo7om254k4uqVaR4A0d2mj9+VbdpUDtAfWjs
 i3onv+gqyacduzpUFJ+lcPan6m0JS0a1/YSHu7Brli50Eqf5lRcP09csh A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="225256199"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="225256199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 09:25:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="612993405"
Received: from lgfecara-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.84.224])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 09:25:06 -0800
Date: Fri, 10 Dec 2021 09:25:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] drm: i915: display: intel_dmc: Fixes an unsigned
 subtraction which can never be negative.
Message-ID: <20211210172505.vdjhyvawwvte3lp7@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211210044129.12422-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211210044129.12422-1-harshit.m.mogalapalli@oracle.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 08:41:24PM -0800, Harshit Mogalapalli wrote:
>smatch warning:
>drivers/gpu/drm/i915/display/intel_dmc.c:601 parse_dmc_fw() warn:
>unsigned 'fw->size - offset' is never less than zero
>
>Firmware size is size_t and offset is u32. So the subtraction is
>unsigned which can never be less than zero.
>
>Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
>Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

"s|drm: i915: display: Fixes|drm/i915/display: Fix|" in the subject,
that I will do when applying after we have the CI results.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
>index 0cab18f972d1..2f477c298b00 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc.c
>+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
>@@ -598,7 +598,7 @@ static void parse_dmc_fw(struct drm_i915_private *dev_priv,
> 			continue;
>
> 		offset = readcount + dmc->dmc_info[id].dmc_offset * 4;
>-		if (fw->size - offset < 0) {
>+		if (offset > fw->size) {
> 			drm_err(&dev_priv->drm, "Reading beyond the fw_size\n");
> 			continue;
> 		}
>-- 
>2.27.0
>
