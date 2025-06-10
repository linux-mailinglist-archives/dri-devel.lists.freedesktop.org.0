Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3AAD3137
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2710E4C5;
	Tue, 10 Jun 2025 09:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYPF0sY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4698610E4BE;
 Tue, 10 Jun 2025 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749546520; x=1781082520;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6jXPwnz+sz4zW6Pddbe4BeMFQ5ijVNccUXVDz0VS1t8=;
 b=nYPF0sY4/bb2EM/xVib0TC+5AMgSBiWN3llNSJEm+usCGOraRK5y+O7L
 emDlFj9FVhLFgObLGVizxi2AcB1eYPwqNquc37l559Z8DCmaNhMPF1rYb
 pj+vT7ZY954LxsGL6NSbRioP16tiJd84QvhLy5URG0JegZj+troDxeh9L
 K/7HsbKml5XFYR39psWRDtB3hzeot/v/AfcyVt8asdu8dAHPicx5DMB/n
 rlGyujhxEEpmJ+6lZvXuGET5lpQiofO18UPTF8pK6oZcTuhb/3TRfIRQL
 11QdV4yG8IALilJhShZQtuZ1EiHjNNQCjoNw8TnZixGTB0iT342tiIVgZ g==;
X-CSE-ConnectionGUID: IqiQQIJDQ6CY9UHRcWZjkw==
X-CSE-MsgGUID: ewYwozDaQsK/J0Ja7TmprQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50755198"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="50755198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:08:40 -0700
X-CSE-ConnectionGUID: 93DILM3CRJK6dEmyCGeRKA==
X-CSE-MsgGUID: R//kBmubSnyyd6ulVPBTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="151587575"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:08:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>,
 "Yang,
 Simon1" <simon1.yang@intel.com>, Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH 3/4] drm/i915/panel: register drm_panel and call
 prepare/unprepare for ICL+ DSI
In-Reply-To: <CH3PR11MB73009C44BA5A2F9A4A56DCB5BA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1749199013.git.jani.nikula@intel.com>
 <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
 <CH3PR11MB73009C44BA5A2F9A4A56DCB5BA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
Date: Tue, 10 Jun 2025 12:08:33 +0300
Message-ID: <8d17168a6fedb04d74d97bbd8e72289fec84c9d9@intel.com>
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

On Tue, 10 Jun 2025, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani
>> Nikula
>> Sent: Friday, June 6, 2025 2:35 PM
>> To: dri-devel@lists.freedesktop.org
>> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Heikki
>> Krogerus <heikki.krogerus@linux.intel.com>; Wysocki, Rafael J
>> <rafael.j.wysocki@intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>; Yang,
>> Simon1 <simon1.yang@intel.com>; Doug Anderson <dianders@chromium.org>;
>> Maxime Ripard <mripard@kernel.org>; Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH 3/4] drm/i915/panel: register drm_panel and call
>> prepare/unprepare for ICL+ DSI
>> 
>> Allocate and register a drm_panel so that drm_panel_followers can find the
>> panel. Pass the drm_connector::kdev device to drm_panel allocation for
>> matching. That's only available after drm_sysfs_connector_add(), so we need to
>> postpone the drm_panel allocation until .late_register() hook.
>> 
>> The drm_panel framework is moving towards devm_drm_panel_alloc(). It
>> requires a wrapper struct, and struct intel_panel would be the natural
>> candidate. However, we can't postpone its allocation until .late_register(), so we
>> have to use __devm_drm_panel_alloc() directly for now.
>> 
>> Call the drm_panel_prepare() and drm_panel_unprepare() functions for
>> ICL+ DSI, so that followers get notified of the panel power state
>> changes. This can later be expanded to VLV+ DSI and eDP.
>> 
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +
>>  .../drm/i915/display/intel_display_types.h    |  4 +
>>  drivers/gpu/drm/i915/display/intel_panel.c    | 82 ++++++++++++++++++-
>>  drivers/gpu/drm/i915/display/intel_panel.h    |  4 +
>>  4 files changed, 93 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c
>> b/drivers/gpu/drm/i915/display/icl_dsi.c
>> index 026361354e6f..81410b3aed51 100644
>> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
>> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
>> @@ -1276,6 +1276,8 @@ static void gen11_dsi_enable(struct
>> intel_atomic_state *state,
>>  	intel_backlight_enable(crtc_state, conn_state);
>>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_BACKLIGHT_ON);
>> 
>> +	intel_panel_prepare(crtc_state, conn_state);
>> +
> Should this be done before the intel_backlight_enable() ?

I'm just playing it safe and ensuring the panel is fully powered
including backlight before letting followers know we're powered.

>
>>  	intel_crtc_vblank_on(crtc_state);
>>  }
>> 
>> @@ -1409,6 +1411,8 @@ static void gen11_dsi_disable(struct
>> intel_atomic_state *state,  {
>>  	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
>> 
>> +	intel_panel_unprepare(old_conn_state);
>> +
>>  	/* step1: turn off backlight */
>>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_BACKLIGHT_OFF);
>>  	intel_backlight_disable(old_conn_state);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index ed4d743fc7c5..30c7315fc25e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -37,6 +37,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_encoder.h>
>>  #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_panel.h>
>>  #include <drm/drm_rect.h>
>>  #include <drm/drm_vblank_work.h>
>>  #include <drm/intel/i915_hdcp_interface.h> @@ -384,6 +385,9 @@ struct
>> intel_vbt_panel_data {  };
>> 
>>  struct intel_panel {
>> +	/* Simple drm_panel */
>> +	struct drm_panel *base;
>> +
>>  	/* Fixed EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
>>  	const struct drm_edid *fixed_edid;
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c
>> b/drivers/gpu/drm/i915/display/intel_panel.c
>> index 5ae302bee191..b1d549e6cf53 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.c
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
>> @@ -463,12 +463,92 @@ void intel_panel_fini(struct intel_connector
>> *connector)
>>  	}
>>  }
>> 
>> +const struct drm_panel_funcs dummy_panel_funcs = { };
>> +
>>  int intel_panel_register(struct intel_connector *connector)  {
>> -	return intel_backlight_device_register(connector);
>> +	struct intel_display *display = to_intel_display(connector);
>> +	struct intel_panel *panel = &connector->panel;
>> +	int ret;
>> +
>> +	ret = intel_backlight_device_register(connector);
>> +	if (ret)
>> +		return ret;
>> +
> Do we need to assign the backlight_device created in intel_backlight_device_register() to the element backlight in struct drm_panel, so as to use the drm_panel framework for panel backlight control?

For now, we only use drm_panel framework for prepare/unprepare
notifications to followers. Plugging in enable/disable with backlight
doesn't seem trivial, and needs careful thought and refactoring. So
better not mix the two for the time being.

BR,
Jani.

>
> Thanks and Regards,
> Arun R Murthy
> -------------------
>
>> +	if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI)
>> {
>> +		struct device *dev = connector->base.kdev;
>> +		struct drm_panel *base;
>> +
>> +		/* Sanity check. */
>> +		if (drm_WARN_ON(display->drm, !dev))
>> +			goto out;
>> +
>> +		/*
>> +		 * We need drm_connector::kdev for allocating the panel, to
>> make
>> +		 * drm_panel_add_follower() lookups work. The kdev is
>> +		 * initialized in drm_sysfs_connector_add(), just before the
>> +		 * connector .late_register() hooks. So we can't allocate the
>> +		 * panel at connector init time, and can't allocate struct
>> +		 * intel_panel with a drm_panel sub-struct. For now, use
>> +		 * __devm_drm_panel_alloc() directly.
>> +		 *
>> +		 * The lookups also depend on drm_connector::fwnode being
>> set in
>> +		 * intel_acpi_assign_connector_fwnodes(). However, if that's
>> +		 * missing, it will gracefully lead to -EPROBE_DEFER in
>> +		 * drm_panel_add_follower().
>> +		 */
>> +		base = __devm_drm_panel_alloc(dev, sizeof(*base), 0,
>> +					      &dummy_panel_funcs,
>> +					      connector->base.connector_type);
>> +		if (IS_ERR(base)) {
>> +			ret = PTR_ERR(base);
>> +			goto err;
>> +		}
>> +
>> +		panel->base = base;
>> +
>> +		drm_panel_add(panel->base);
>> +
>> +		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Registered
>> panel device '%s', has fwnode: %s\n",
>> +			    connector->base.base.id, connector->base.name,
>> +			    dev_name(dev), str_yes_no(dev_fwnode(dev)));
>> +	}
>> +
>> +out:
>> +	return 0;
>> +
>> +err:
>> +	intel_backlight_device_unregister(connector);
>> +
>> +	return ret;
>>  }
>> 
>>  void intel_panel_unregister(struct intel_connector *connector)  {
>> +	struct intel_panel *panel = &connector->panel;
>> +
>> +	if (panel->base)
>> +		drm_panel_remove(panel->base);
>> +
>>  	intel_backlight_device_unregister(connector);
>>  }
>> +
>> +/* Notify followers, if any, about power being up. */ void
>> +intel_panel_prepare(const struct intel_crtc_state *crtc_state,
>> +			 const struct drm_connector_state *conn_state) {
>> +	struct intel_connector *connector = to_intel_connector(conn_state-
>> >connector);
>> +	struct intel_panel *panel = &connector->panel;
>> +
>> +	drm_panel_prepare(panel->base);
>> +}
>> +
>> +/* Notify followers, if any, about power going down. */ void
>> +intel_panel_unprepare(const struct drm_connector_state *old_conn_state)
>> +{
>> +	struct intel_connector *connector = to_intel_connector(old_conn_state-
>> >connector);
>> +	struct intel_panel *panel = &connector->panel;
>> +
>> +	drm_panel_unprepare(panel->base);
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h
>> b/drivers/gpu/drm/i915/display/intel_panel.h
>> index 3d592a4404f3..56a6412cf0fb 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.h
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
>> @@ -53,4 +53,8 @@ void intel_panel_add_vbt_sdvo_fixed_mode(struct
>> intel_connector *connector);  void intel_panel_add_encoder_fixed_mode(struct
>> intel_connector *connector,
>>  					struct intel_encoder *encoder);
>> 
>> +void intel_panel_prepare(const struct intel_crtc_state *crtc_state,
>> +			 const struct drm_connector_state *conn_state); void
>> +intel_panel_unprepare(const struct drm_connector_state
>> +*old_conn_state);
>> +
>>  #endif /* __INTEL_PANEL_H__ */
>> --
>> 2.39.5
>

-- 
Jani Nikula, Intel
