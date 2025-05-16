Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79948AB9BE5
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92D610EAA1;
	Fri, 16 May 2025 12:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juZNzDzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E957710EA7E;
 Fri, 16 May 2025 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747398102; x=1778934102;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4ojXC7ik50H2TK326HYmZyFHAasKbH4mv+ArsdZl0A0=;
 b=juZNzDzmWkI60lvUv7nLK6x40CY0M6d1IkiIAh5mfCInyhzyVuRVz8qH
 UAke++jcuFaukKK+VJMlCN2NS+qDCWfzHSBBJ9QB4qsemv1yFZ/T+hEhu
 M2L2BRvZOqhy1VZHWRA6kKs+BVGXBvHDW65gvA9Kb31W0DvLD8T7sDUeW
 qChSnVXZlcQIZvyOWilz1RipwJ9oqMrsqRSgU6ttBZn6sr4vqFlrRj6sz
 LhxYYUYemRVs2oSIfz7diPCcedRCMlvipoPMOEwHT5Y2JK3tNykxUxG5L
 BKQumCe2zzhQvXNvbVi4wlNU12Bd2fDmVBdDAZJZew9ZGBzbYpKI3aAlN A==;
X-CSE-ConnectionGUID: DgyUm2MARpetItFIlwRILg==
X-CSE-MsgGUID: zPj9yA7bTuO3mkX9ZMusnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60710210"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60710210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:21:42 -0700
X-CSE-ConnectionGUID: Bmt2g5wxRK2maYqAlVmwVA==
X-CSE-MsgGUID: 53srrYjtRJ6fmjG2MygswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138594795"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:21:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Haoxiang Li
 <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/xe/display: Add check for
 alloc_ordered_workqueue()
In-Reply-To: <20250424024015.3499778-1-haoxiang_li2024@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250424024015.3499778-1-haoxiang_li2024@163.com>
Date: Fri, 16 May 2025 15:21:36 +0300
Message-ID: <87a57cwxtb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 24 Apr 2025, Haoxiang Li <haoxiang_li2024@163.com> wrote:
> Add check for the return value of alloc_ordered_workqueue()
> in xe_display_create() to catch potential exception.
>
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

This patch seems to have been neglected, apologies.

I've rebased it and included it as part of a bigger series [1].

Thanks for the patch.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1747397638.git.jani.nikula@intel.com

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0b0aca7a25af..18062cfb265f 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -104,6 +104,8 @@ int xe_display_create(struct xe_device *xe)
>  	spin_lock_init(&xe->display.fb_tracking.lock);
>  
>  	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
> +	if (!xe->display.hotplug.dp_wq)
> +		return -ENOMEM;
>  
>  	return drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
>  }

-- 
Jani Nikula, Intel
