Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C1857E52
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA1A10EB4A;
	Fri, 16 Feb 2024 13:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHJCYZqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7D310EAEE;
 Fri, 16 Feb 2024 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708091970; x=1739627970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yW9r0Q30BshXjM48S3raf19S6QID4htBM4J1v6hvykU=;
 b=RHJCYZqDJLePZ6Xgzc5PnYg+o1oH6SwvbFQygPrgQzO0TPDLWYRPpikG
 IUWQXt2mWEke2aPPXusR3WqrSiz7G7HyIPM6U0AR+wIwmpo/6k0Yi6dpc
 PEvz/AG1TUBlJozk4BRmtyCNVtXgqwOYYp7esqsSRrDwp1U28StIiZ5vT
 qqBo0zWgOwm6kBohStL1fDdBfjlm5mTyr25eOhaiNsw8RJnPrg/nERNCW
 IyWbICF1+v8oc3Bw1ogvG2zU64wkDE8QtgH6VhWghm/88vx+bYX4Qj5v2
 TYR8XS6HFaHgI92bXF5b9NTMyV81FgAn1LN3MREW7K5ZmuhZeGfIXIrKO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2086179"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2086179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4014272"
Received: from bducamp-mobl.ger.corp.intel.com (HELO [10.249.43.162])
 ([10.249.43.162])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:59:27 -0800
Message-ID: <ac82f1e0-4731-4420-ab57-ff2160a2f3d6@linux.intel.com>
Date: Fri, 16 Feb 2024 14:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/stolen: ignore first page for FBC
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <20240215174431.285069-12-matthew.auld@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240215174431.285069-12-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-02-15 18:44, Matthew Auld wrote:
> Seems like we can potentially hit underruns if the CFB offset is within
> the first page of stolen. Just like i915 skip the first page.
> 
> BSpec: 50214
> Reported-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> index bd233007c1b7..003474cfdf31 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> @@ -19,6 +19,9 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>   	int err;
>   	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
>   
> +	if (start < SZ_4K)
> +		start = SZ_4K;
> +
>   	if (align)
>   		size = ALIGN(size, align);
>   
Should start also be aligned?

If that's taken care of by other code, for both patches:
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
