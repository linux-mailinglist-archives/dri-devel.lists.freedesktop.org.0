Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A18A4E23
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED0110E5D2;
	Mon, 15 Apr 2024 11:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNwvyHO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398B1124CB;
 Mon, 15 Apr 2024 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713181996; x=1744717996;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GoClg5dm8zQo3lW3Gj59HBt5MYgBwRz4kg3WnAuhv80=;
 b=mNwvyHO6LA355SdcUx8zKnydKsqQ4xyZIoCCYTJtyMbx0zcCS1+XsgZD
 OnumWC0G5xncuX99L9+lp7QrnyuXN8DknY0a8SCOyS93uG9RAJKIx8Fod
 SD5Hgrz+adzcWACOiQ8lo1oZcHUC+rDiCAYDByPFBz8eRviw7Kn0pPE43
 GQl/spFZO6gRLIe0vgSvjHx9ozU5PJBu8SYaMyvjt6W+rRYyHh/WJ8qtP
 XJDEN7PKrRRXcEPJ22hVJdnTeEgNV6WUpCJ/gRY8rV3V6fHGnf4ec+W4M
 4EMZt1gcAHqLOg71N3dlSCp+0ZQ39MC8PEAY2ErDzV74VlwbSmJPJnMqt Q==;
X-CSE-ConnectionGUID: L8D+/9xmQXi4+NRbZfP9Kw==
X-CSE-MsgGUID: WtwXGU77QQS7LE/B5ToZWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8689530"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8689530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:53:15 -0700
X-CSE-ConnectionGUID: /Sz0s3ZuQ9ahymif187fjQ==
X-CSE-MsgGUID: AtFSPDvsTzyKTpVI98l+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="53095346"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:53:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jouni.hogander@intel.com,
 arun.r.murthy@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
In-Reply-To: <20240412155243.2891996-7-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-7-animesh.manna@intel.com>
Date: Mon, 15 Apr 2024 14:53:02 +0300
Message-ID: <87sezm3krl.fsf@intel.com>
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

On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> For validation purpose add debugfs for LOBF.
>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c     | 47 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_alpm.h     |  2 +
>  .../drm/i915/display/intel_display_debugfs.c  |  2 +
>  3 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index ae894c85233c..21dfc06952d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -339,3 +339,50 @@ void intel_alpm_configure(struct intel_dp *intel_dp)
>  {
>  	lnl_alpm_configure(intel_dp);
>  }
> +
> +static int i915_edp_lobf_support_show(struct seq_file *m, void *data)
> +{
> +	struct intel_connector *connector = m->private;
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
> +
> +	seq_printf(m, "LOBF support: = %s",
> +		   str_yes_no(intel_dp->lobf_supported));

If you have individual debugfs files, where the name tells you what it's
about, what's the point in printing "LOBF support" here?

Moreover, please be more careful, this now prints "LOBF support: =
yes". And you'll want the \n in the end.

> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_support);
> +
> +static int i915_edp_lobf_status_show(struct seq_file *m, void *data)
> +{
> +	struct intel_connector *connector = m->private;
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
> +	const char *status;
> +
> +	if (intel_dp->lobf_enabled)
> +		status = "enabled";
> +	else
> +		status = "disabled";
> +
> +	seq_printf(m, "LOBF: %s\n", status);

Ditto. But there's also str_enabled_disabled().

I mean you could have a read-only info file which prints all of this
info with the prefixes. But if it's one attribute per file, why have the
extra prints? Maybe it should be just alpm info? Idk.

BR,
Jani.

> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(i915_edp_lobf_status);
> +
> +void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
> +{
> +	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> +	struct dentry *root = connector->base.debugfs_entry;
> +
> +	if (DISPLAY_VER(i915) >= 20 &&
> +	    connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
> +		return;
> +
> +	debugfs_create_file("i915_edp_lobf_supported", 0444, root,
> +			    connector, &i915_edp_lobf_support_fops);
> +
> +	debugfs_create_file("i915_edp_lobf_status", 0444, root,
> +			    connector, &i915_edp_lobf_status_fops);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index c341d2c2b7f7..66e81ed8b2fb 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -11,6 +11,7 @@
>  struct intel_dp;
>  struct intel_crtc_state;
>  struct drm_connector_state;
> +struct intel_connector;
>  
>  bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp);
>  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
> @@ -19,5 +20,6 @@ void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
>  				    struct intel_crtc_state *crtc_state,
>  				    struct drm_connector_state *conn_state);
>  void intel_alpm_configure(struct intel_dp *intel_dp);
> +void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 0feffe8d4e45..ba1530149836 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "i915_debugfs.h"
>  #include "i915_irq.h"
>  #include "i915_reg.h"
> +#include "intel_alpm.h"
>  #include "intel_crtc.h"
>  #include "intel_de.h"
>  #include "intel_crtc_state_dump.h"
> @@ -1542,6 +1543,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>  	intel_drrs_connector_debugfs_add(connector);
>  	intel_pps_connector_debugfs_add(connector);
>  	intel_psr_connector_debugfs_add(connector);
> +	intel_alpm_lobf_debugfs_add(connector);
>  
>  	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
>  	    connector_type == DRM_MODE_CONNECTOR_HDMIA ||

-- 
Jani Nikula, Intel
