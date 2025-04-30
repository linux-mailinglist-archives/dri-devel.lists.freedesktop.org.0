Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7AAA49C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 13:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2010E294;
	Wed, 30 Apr 2025 11:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmH9caWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0402010E294
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746012338; x=1777548338;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JnmBo6iTDvcJ3v3cqSYz+bAFnCuB7hiplr07wZ4j0Rg=;
 b=JmH9caWHdrzmHl4ASq7jThY9tfND4uyT03P09lkkxPI4WlR53yt4XCFX
 DHrjSk8rWWjH9sgu2EuywmZB2TZZtu4TY+/DCHgtfvHy7xqAHhFcZfF0i
 fg8s7/skNZcdTKQ40cXbFUQNf4mWBcf1jffh8b/9MI8u+RAJcX9QQy3X7
 q8jK7khI+oDTn48rXsVNfk/YxXDCXk6QsT+KJKsZ35yTobcZiAc7RSCa9
 M78rng0ZvUUBw9xLina4+wRH6J359KuT26BLeSwraOR/wXVqeHn1J9Ub4
 vuHWZMbPRljFYgOITOpNBxEA8p9PueZJgCtQYOywcvI+yt4duwMVzea7Q w==;
X-CSE-ConnectionGUID: f8x8j2RyTVGs2dv81/t4cQ==
X-CSE-MsgGUID: RQd0QlEgTd2xx+dLPfWuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47799077"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47799077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:25:28 -0700
X-CSE-ConnectionGUID: fO9WqGgIQWiM4RP/anI7PQ==
X-CSE-MsgGUID: QTyvYmOeRMeqDaKbsXKhtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133994118"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:25:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 06/11] drm/display: add CEC helpers code
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:25:21 +0300
Message-ID: <87plgtvqla.fsf@intel.com>
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

On Mon, 07 Apr 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..39bb6d12acb35f539a4a6cd1b61ce97bf4e063ab
> --- /dev/null
> +++ b/include/drm/display/drm_hdmi_cec_helper.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
> +#define DRM_DISPLAY_HDMI_CEC_HELPER
> +
> +#include <drm/drm_connector.h>

Is there anything in this file that requires that include?

> +
> +#include <linux/types.h>
> +
> +struct drm_connector;
> +
> +struct cec_msg;
> +struct device;
> +
> +struct drm_connector_hdmi_cec_funcs {
> +	/**
> +	 * @init: perform hardware-specific initialization before registering the CEC adapter
> +	 */
> +	int (*init)(struct drm_connector *connector);
> +
> +	/**
> +	 * @uninit: perform hardware-specific teardown for the CEC adapter
> +	 */
> +	void (*uninit)(struct drm_connector *connector);
> +
> +	/**
> +	 * @enable: enable or disable CEC adapter
> +	 */
> +	int (*enable)(struct drm_connector *connector, bool enable);
> +
> +	/**
> +	 * @log_addr: set adapter's logical address, can be called multiple
> +	 * times if adapter supports several LAs
> +	 */
> +	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
> +
> +	/**
> +	 * @transmit: start transmission of the specified CEC message
> +	 */
> +	int (*transmit)(struct drm_connector *connector, u8 attempts,
> +			u32 signal_free_time, struct cec_msg *msg);
> +};
> +
> +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
> +				    const struct drm_connector_hdmi_cec_funcs *funcs,
> +				    const char *name,
> +				    u8 available_las,
> +				    struct device *dev);
> +
> +void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
> +					 struct cec_msg *msg);
> +
> +void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
> +					  u8 status,
> +					  u8 arb_lost_cnt, u8 nack_cnt,
> +					  u8 low_drive_cnt, u8 error_cnt);
> +
> +void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
> +						  u8 status);
> +
> +#if IS_ENABLED(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER)
> +int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
> +					     const char *port_name,
> +					     struct device *dev);
> +#else
> +static inline int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
> +							   const char *port_name,
> +							   struct device *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif

-- 
Jani Nikula, Intel
