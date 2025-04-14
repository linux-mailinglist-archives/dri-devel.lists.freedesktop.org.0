Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C50A87D68
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C4F10E55A;
	Mon, 14 Apr 2025 10:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwHQdDmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466E10E53D;
 Mon, 14 Apr 2025 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744626062; x=1776162062;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NRTyA2oPBXqo+yL9c1QYigI3LXmRHbIoYMh4Lt8Zwzs=;
 b=kwHQdDmLJKFl01jqHWl9mM/3hFKJ2ab27GbOfu+huzfKuMg9CEemPU0F
 zzBhT5ClWwS76XPkshj9UmqVP0HCyK7+O7PwK6tejKpsRKhLBQwdfgZC9
 3+fgDlK5nz98/7nxkALT0hRJgUCwd8afYMWI0Msp845iKXau77LnJif4T
 XMdkFMUx0tE7nTLvMCdY2wTtbfhvc6oNLYXiVqmRucDmGggiNT306MJL3
 iQ10diUm93Htq/gVfhbyp8EY5fHXSFNNbcAqDS9TN42GrkfOF7n88tbFb
 3q1JsIBKJ+TvfbKfJoly2eub7BQO5uxxydj2CYVc3uSaTvDZTttwfe4XZ A==;
X-CSE-ConnectionGUID: 49Lm7K8TSfmu177ej4Lezw==
X-CSE-MsgGUID: xZ1thO55TgmNezlVqIzlgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46000217"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="46000217"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:21:02 -0700
X-CSE-ConnectionGUID: gEsZRX2nRlyPNlDch1qp7A==
X-CSE-MsgGUID: 76/I0z8HRYag5oEcI7jueQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129628140"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:20:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH 13/13] drm/amd/display: move dc_sink from dc_edid to
 drm_edid
In-Reply-To: <20250411201333.151335-14-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-14-mwen@igalia.com>
Date: Mon, 14 Apr 2025 13:20:54 +0300
Message-ID: <87cydft56h.fsf@intel.com>
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

On Fri, 11 Apr 2025, Melissa Wen <mwen@igalia.com> wrote:
> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink)
> +{
> +	const struct edid *edid;
> +	uint32_t edid_length;
> +
> +	edid = drm_edid_raw(sink->drm_edid); // FIXME: Get rid of drm_edid_raw()
> +	edid_length = EDID_LENGTH * (edid->extensions + 1);

I guess none of my concern, really, but here's a hint:

The underlying reason for me to create struct drm_edid to begin with,
make it opaque, and to go through all the trouble of converting tons of
code from struct edid to struct drm_edid was exactly the above statement
being replicated all over the place. It's fundamentally incompatible
with the HF-EEODB EDID extension block.

BR,
Jani.



> +	memcpy(sink->dc_edid.raw_edid, (uint8_t *) edid, edid_length);
> +	sink->dc_edid.length = edid_length;
>  }
>  
>  

-- 
Jani Nikula, Intel
