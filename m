Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EAAD3111
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE4C10E4BB;
	Tue, 10 Jun 2025 09:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZ1ragm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0591C10E4A1;
 Tue, 10 Jun 2025 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749546076; x=1781082076;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+7Cjjzil9J0qbebsqsHnMgMaKLbMVSeP+LY3DIuLYaE=;
 b=nZ1ragm5taE5SYznD/+QQZDp+MSncDrZ+ZL9haXWOfqXoT9hrzTT8agu
 IVoQt0l5Tb82XS+XSI1AL17FapDK3nt4z5SefmEqWPhwlH2LDFkzeZuXQ
 QEJAy557IBO0/vJUSn1xhD3ejmKHhb8KBPOIQE4XrAqrxUxOMaOWjb+ma
 HgQEzkh/rSr5wThyoowl4rA5EOjSY5ZtyeR9L4UsVmuOSn8gm8/u9A6FG
 z6USz3oJjEte85OETtAXpAldz+3ZHCFxX4BNlaV0aA4IAqy7sQ8S45XSp
 5r3jMH9Jg2YGCFShiTWWO0pYu5rLhODQLaz9sjRdKLAaNmmAsmvlPHMMx w==;
X-CSE-ConnectionGUID: UbVw9PkbQDCq2oqq8hFN8g==
X-CSE-MsgGUID: PAOfq7NXSTaMcI5v45ejTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62259414"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="62259414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:01:02 -0700
X-CSE-ConnectionGUID: W4s5YNPXT/C/Sm/+cp4D/A==
X-CSE-MsgGUID: Jjbeb9RaQ2i7HTKC2Y8n1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147743059"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:00:59 -0700
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
Subject: RE: [PATCH 2/4] drm/i915/panel: add panel register/unregister
In-Reply-To: <CH3PR11MB7300BA6615F69441C62DCB1FBA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1749199013.git.jani.nikula@intel.com>
 <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
 <CH3PR11MB7300BA6615F69441C62DCB1FBA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
Date: Tue, 10 Jun 2025 12:00:55 +0300
Message-ID: <b68a90a5a3b6514172076d6782310398bb5233df@intel.com>
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
>> Subject: [PATCH 2/4] drm/i915/panel: add panel register/unregister
>> 
>> Add panel register/unregister functions, and handle backlight
>> register/unregister from there. This is in preparation for adding more panel
>> specific register/unregister functionality.
>> 
>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  .../gpu/drm/i915/display/intel_connector.c    | 23 +++++++++----------
>>  drivers/gpu/drm/i915/display/intel_panel.c    | 10 ++++++++
>>  drivers/gpu/drm/i915/display/intel_panel.h    |  2 ++
>>  3 files changed, 23 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c
>> b/drivers/gpu/drm/i915/display/intel_connector.c
>> index 9a61c972dce9..2867d76d1a5e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_connector.c
>> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
>> @@ -32,7 +32,6 @@
>> 
>>  #include "i915_drv.h"
>>  #include "i915_utils.h"
>> -#include "intel_backlight.h"
>>  #include "intel_connector.h"
>>  #include "intel_display_core.h"
>>  #include "intel_display_debugfs.h"
>> @@ -153,36 +152,36 @@ void intel_connector_destroy(struct drm_connector
>> *connector)
>>  	kfree(connector);
>>  }
>> 
>> -int intel_connector_register(struct drm_connector *connector)
>> +int intel_connector_register(struct drm_connector *_connector)
>>  {
>> -	struct intel_connector *intel_connector =
>> to_intel_connector(connector);
>> -	struct drm_i915_private *i915 = to_i915(connector->dev);
>> +	struct intel_connector *connector = to_intel_connector(_connector);
>> +	struct drm_i915_private *i915 = to_i915(_connector->dev);
> Can intel_display be used over here?

i915 is passed to i915_inject_probe_failure() below, so no.

BR,
Jani.

>
> Apart from the above one, patch looks good to me.
> Reviewed-by: Arun R Murthy <arun.r.murthy@gmail.com>
>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>
>>  	int ret;
>> 
>> -	ret = intel_backlight_device_register(intel_connector);
>> +	ret = intel_panel_register(connector);
>>  	if (ret)
>>  		goto err;
>> 
>>  	if (i915_inject_probe_failure(i915)) {
>>  		ret = -EFAULT;
>> -		goto err_backlight;
>> +		goto err_panel;
>>  	}
>> 
>> -	intel_connector_debugfs_add(intel_connector);
>> +	intel_connector_debugfs_add(connector);
>> 
>>  	return 0;
>> 
>> -err_backlight:
>> -	intel_backlight_device_unregister(intel_connector);
>> +err_panel:
>> +	intel_panel_unregister(connector);
>>  err:
>>  	return ret;
>>  }
>> 
>> -void intel_connector_unregister(struct drm_connector *connector)
>> +void intel_connector_unregister(struct drm_connector *_connector)
>>  {
>> -	struct intel_connector *intel_connector =
>> to_intel_connector(connector);
>> +	struct intel_connector *connector = to_intel_connector(_connector);
>> 
>> -	intel_backlight_device_unregister(intel_connector);
>> +	intel_panel_unregister(connector);
>>  }
>> 
>>  void intel_connector_attach_encoder(struct intel_connector *connector, diff --
>> git a/drivers/gpu/drm/i915/display/intel_panel.c
>> b/drivers/gpu/drm/i915/display/intel_panel.c
>> index f5c972880391..5ae302bee191 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.c
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
>> @@ -462,3 +462,13 @@ void intel_panel_fini(struct intel_connector
>> *connector)
>>  		drm_mode_destroy(connector->base.dev, fixed_mode);
>>  	}
>>  }
>> +
>> +int intel_panel_register(struct intel_connector *connector) {
>> +	return intel_backlight_device_register(connector);
>> +}
>> +
>> +void intel_panel_unregister(struct intel_connector *connector) {
>> +	intel_backlight_device_unregister(connector);
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h
>> b/drivers/gpu/drm/i915/display/intel_panel.h
>> index b60d12322e5d..3d592a4404f3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.h
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
>> @@ -23,6 +23,8 @@ void intel_panel_init_alloc(struct intel_connector
>> *connector);  int intel_panel_init(struct intel_connector *connector,
>>  		     const struct drm_edid *fixed_edid);  void
>> intel_panel_fini(struct intel_connector *connector);
>> +int intel_panel_register(struct intel_connector *connector); void
>> +intel_panel_unregister(struct intel_connector *connector);
>>  enum drm_connector_status
>>  intel_panel_detect(struct drm_connector *connector, bool force);  bool
>> intel_panel_use_ssc(struct intel_display *display);
>> --
>> 2.39.5
>

-- 
Jani Nikula, Intel
