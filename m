Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B8A9EF70
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 13:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C0E10E476;
	Mon, 28 Apr 2025 11:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fasigyjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B110E476;
 Mon, 28 Apr 2025 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745840429; x=1777376429;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2ljdbjIEAmsAMoG7EZuv5JDe8PK4yJfG5z1oFt03uik=;
 b=FasigyjtRN2+d+XnWcKSeHABurOqwNS0UxQa+kswpFQRCQMU0kArt285
 4TNx/ESwgq5e9ebanr7KFsvNwT9II3KJsldooryekVK5G4W1pc0zUsYAm
 Ep1Kq9HFKlPyP00qbEyJch2vAx3qPSbesEueM95I5g8I8ca76I42CEcP9
 6FhyZeejQWOjK9RKidadKROc3mA9N/0enFQD3nTT6+tlx6/P6sxBkGhXP
 UC9eC+uiR31dW9P+wm9kTOl+9NRSdccP4iQ/kEm1juJ+5bdWvp982/92E
 Tl5G2f4G+ZxT0K+8A8fOYsam3MR8dfpy019WjaA0hKHCZdYgQ5ESCYM3X g==;
X-CSE-ConnectionGUID: he9rimSfQlyoqOwOqRz8ng==
X-CSE-MsgGUID: Q88ySJrlQ/qlBeJp2/sZzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="69925587"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="69925587"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 04:40:29 -0700
X-CSE-ConnectionGUID: 5iHD+CUZTyKAnyN9TDF4lQ==
X-CSE-MsgGUID: pHkfg4rhQkW7AMEaFOTh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="170719838"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 04:40:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <kees@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Gnattu
 OC <gnattuoc@me.com>, Nitin Gote <nitin.r.gote@intel.com>, Ranu Maurya
 <ranu.maurya@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 Angus Chen <angus.chen@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Remove const from struct i915_wa list
 allocation
In-Reply-To: <20250426061357.work.749-kees@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250426061357.work.749-kees@kernel.org>
Date: Mon, 28 Apr 2025 14:40:16 +0300
Message-ID: <874iy8y0nz.fsf@intel.com>
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

On Fri, 25 Apr 2025, Kees Cook <kees@kernel.org> wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
>
> The assigned type is "struct i915_wa *". The returned type, while
> technically matching, will be const qualified. As there is no general
> way to remove const qualifiers, adjust the allocation type to match
> the assignment.
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree you find best; please let us know if you
want us to pick this up via drm-intel.

> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <intel-gfx@lists.freedesktop.org>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 116683ebe074..b37e400f74e5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -156,7 +156,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>  	if (IS_ALIGNED(wal->count, grow)) { /* Either uninitialized or full. */
>  		struct i915_wa *list;
>  
> -		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
> +		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*list),
>  				     GFP_KERNEL);
>  		if (!list) {
>  			drm_err(&i915->drm, "No space for workaround init!\n");

-- 
Jani Nikula, Intel
