Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE1C1F5DD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883B610E94B;
	Thu, 30 Oct 2025 09:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbtYEEaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2A10E94B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761817458; x=1793353458;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EGglB+ODiW1tXjkIyvNcuCGOQsXWhcqgGRKRweC9pH4=;
 b=dbtYEEaqnt6JYF+Z/yyFjx7hITNoJieYXOS7mC0dyN+uRFGwO6DOUxuP
 cdUALtiuNzmNmLiEKpQpFEUvG6w9h7FaOD5IxEgB9b6CFpvmbPQuScG33
 z42UMveLwQleS7+TwtL6Hv/TEXmuwJd5GAa/azdkP5LNME5xPO5h38r/G
 btAjA9ruzj9lfYHRBOYSQuHjmhv+0WXDQeed3wfvEU9DwwqHT1AN9klzF
 LROmx0hYQYwSQm7zV8id+RCiX6Ufm+Sg59uX/b1q7wEnt43JBr4kX7jYU
 Bi+HIyfsaVCyCpl9iJUM1F4D/FXnhKVCKp/LXGlSHdw7MTNHfYfuV9aID A==;
X-CSE-ConnectionGUID: NxryJbxrQ5akxa4zvz1pNg==
X-CSE-MsgGUID: ZCyZqcLJRda/6dlJA9T1Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67605736"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="67605736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:44:18 -0700
X-CSE-ConnectionGUID: n92aF8nQSX+/JFJuViGYsQ==
X-CSE-MsgGUID: YfQ6aFAJSFi3hQqXqaEaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185104305"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:44:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Ajye Huang
 <ajye_huang@compal.corp-partner.google.com>, jazhan@google.com
Subject: Re: [PATCH v1 1/2] drm/panel-edp: Add override bpc quirk for
 generic edp
In-Reply-To: <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
Date: Thu, 30 Oct 2025 11:44:11 +0200
Message-ID: <d6fe55b210888b9279c776b2bbfeaf38bfc44dcb@intel.com>
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

On Wed, 29 Oct 2025, Ajye Huang <ajye_huang@compal.corp-partner.google.com> wrote:
> Adding override bpc to EDP_PANEL_ENTRY3 quirk.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 944c7c70de55..da3e8f223ec3 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -218,6 +218,9 @@ struct edp_panel_entry {
>  
>  	/** @override_edid_mode: Override the mode obtained by edid. */
>  	const struct drm_display_mode *override_edid_mode;
> +
> +	/** @override_bpc: Override the Bits per color obtained by edid. */
> +	unsigned int override_bpc;
>  };
>  
>  struct panel_edp {
> @@ -586,6 +589,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>  	bool has_override_edid_mode = p->detected_panel &&
>  				      p->detected_panel != ERR_PTR(-EINVAL) &&
>  				      p->detected_panel->override_edid_mode;

Unrelated to the patch at hand, since the pattern is there already, but
something like this should be more reliable:

bool has_override_edid_mode = !IS_ERR_OR_NULL(p->detected_panel) &&
	p->detected_panel->override_edid_mode;

It does not look like p->detected_panel could have other error pointer
values than -EINVAL, but it looks awkward to check for NULL and one
error pointer value, and then go on to dereference it.

I guess even better would be to always use either NULL *or* error
pointers, not a mix, but I digress.

BR,
Jani.


> +	bool has_override_bpc = p->detected_panel &&
> +				      p->detected_panel != ERR_PTR(-EINVAL) &&
> +				      p->detected_panel->override_bpc;
>  
>  	/* probe EDID if a DDC bus is available */
>  	if (p->ddc) {
> @@ -611,6 +617,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>  			} else {
>  				num += drm_edid_connector_add_modes(connector);
>  			}
> +
> +			if (has_override_bpc)
> +				connector->display_info.bpc = p->detected_panel->override_bpc;
>  		}
>  
>  		pm_runtime_mark_last_busy(panel->dev);
> @@ -1871,6 +1880,17 @@ static const struct panel_delay delay_80_500_e50_d50 = {
>  	.override_edid_mode = _mode \
>  }
>  
> +#define EDP_PANEL_ENTRY3(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _bpc) \
> +{ \
> +	.ident = { \
> +		.name = _name, \
> +		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
> +						     product_id), \
> +	}, \
> +	.delay = _delay, \
> +	.override_bpc = _bpc \
> +}
> +
>  /*
>   * This table is used to figure out power sequencing delays for panels that
>   * are detected by EDID. Entries here may point to entries in the

-- 
Jani Nikula, Intel
