Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86316B1C2DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D3810E72D;
	Wed,  6 Aug 2025 09:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTURwzhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C0C10E49B;
 Wed,  6 Aug 2025 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754471204; x=1786007204;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DNlEmhRh7Ji8rBq1eQK+XyzmdVENQtqQISuQMMiJ6SA=;
 b=OTURwzhEIKQnX15vbsYBqGsL9AeEow1/B8AoJpSBDQ4Ukz5+gababXT5
 aW43LBlucLO1zOSCRR3RLkzc46aKZOEciAvuzIf1IryqdRdvdRweaBUza
 KG3u3mmTqYzd7ndE2Mh+84l+ReE2JIdQ9+AQquCLziIXa12NpHhAYp+Rj
 ubWmQilItrmd7P8V/Hd/6ykWu+FOUHNnzUaki8WLEJPpP9MWrPV/Tb0ew
 3+EVGuXdauNvMYAXAptOUMnpDWfwov03C363Rlen99uUkLoyhzhLx+Mic
 NYbhMdf6jwFIKVlzt8hrmtPHvY44sJRknHsZJzFdXRWdhXdh27ObupP4P Q==;
X-CSE-ConnectionGUID: PC7AQs9vRA+HPROHaX9HZA==
X-CSE-MsgGUID: HAamXNn6QHG1xeOIrEp+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56918548"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56918548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 02:06:43 -0700
X-CSE-ConnectionGUID: yWcqfmwISgOMZbJDNHNJHg==
X-CSE-MsgGUID: sVcgwNU4QZ6qpn7wb2Y9ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="163946606"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 02:06:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: Re: [PATCH 3/9] drm/i915: Change mutex initialization in intel_guc_log
In-Reply-To: <20250805143908.32343-4-luiz.mello@estudante.ufscar.br>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
 <20250805143908.32343-4-luiz.mello@estudante.ufscar.br>
Date: Wed, 06 Aug 2025 12:06:36 +0300
Message-ID: <b56a660a9b54de4895107b68104b79a747896109@intel.com>
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

On Tue, 05 Aug 2025, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br> wrote:
> The intel_guc_log->relay.lock is currently initialized in
> intel_guc_log_init_early(), but it lacks a corresponding destructor,
> which can lead to a memory leak.

That's not quite accurate. The destructor is only relevant for
CONFIG_DEBUG_MUTEXES=y, which ensures the lock is not used after it's
been destroyed. Otherwise it's a nop.

The patch itself makes sense.

BR,
Jani.

>
> This patch replaces the use of mutex_init() with drmm_mutex_init(),
> which ensures the lock is properly destroyed when the driver is
> unloaded.
>
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 7135fdb0ebb4..469173791394 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -6,6 +6,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/string_helpers.h>
>  
> +#include <drm/drm_managed.h>
> +
>  #include "gt/intel_gt.h"
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> @@ -512,7 +514,10 @@ static void guc_log_relay_unmap(struct intel_guc_log *log)
>  
>  void intel_guc_log_init_early(struct intel_guc_log *log)
>  {
> -	mutex_init(&log->relay.lock);
> +	struct intel_guc *guc = log_to_guc(log);
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
> +
> +	drmm_mutex_init(&i915->drm, &log->relay.lock);
>  	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
>  	log->relay.started = false;
>  }

-- 
Jani Nikula, Intel
