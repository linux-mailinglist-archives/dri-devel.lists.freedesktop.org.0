Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300F213899
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 12:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8716E05A;
	Fri,  3 Jul 2020 10:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BB56E05A;
 Fri,  3 Jul 2020 10:24:37 +0000 (UTC)
IronPort-SDR: TtqZbEkXWAmQQTHieSvEOnZk8jBEOwufc9aidAVq0XrOmcJX1u4nPqVLwtYxLXqhgB/5c7t8vU
 DZZm/01hNIRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="147142837"
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; d="scan'208";a="147142837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2020 03:24:35 -0700
IronPort-SDR: nbmqWXMCk1T4+y4fYtlUwy6gYg7h0S1+N6wpbaAe8O3phu6eJgQ3XSeFx+UjeFZrpmWF+sjn4g
 m/38Q4mQVfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; d="scan'208";a="482333082"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2020 03:24:33 -0700
Date: Fri, 3 Jul 2020 15:43:02 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH v7 14/17] drm/i915: Add connector to
 hdcp_shim->check_link()
Message-ID: <20200703101301.GG15183@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-15-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623155907.22961-15-sean@poorly.run>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-23 at 21:29:04 +0530, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Currently we derive the connector from digital port in check_link(). For
> MST, this isn't sufficient since the digital port passed into the
> function can have multiple connectors downstream. This patch adds
> connector to the check_link() arguments so we have it when we need it.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Looks good to me, this require a rebase on latest drm-tip
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-13-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-14-sean@poorly.run #v5
> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-14-sean@poorly.run #v6
> 
> Changes in v4:
> -Added to the set
> Changes in v5:
> -None
> Changes in v6:
> -None
> Changes in v7:
> -None
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          | 5 ++---
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 811085ef3fba..94211b8fc159 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -318,7 +318,8 @@ struct intel_hdcp_shim {
>  				 bool enable);
>  
>  	/* Ensures the link is still protected */
> -	bool (*check_link)(struct intel_digital_port *intel_dig_port);
> +	bool (*check_link)(struct intel_digital_port *intel_dig_port,
> +			   struct intel_connector *connector);
>  
>  	/* Detects panel's hdcp capability. This is optional for HDMI. */
>  	int (*hdcp_capable)(struct intel_digital_port *intel_dig_port,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index e26a45f880cb..43446a6cae8d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -223,7 +223,8 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
>  }
>  
>  static
> -bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
> +bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> +			      struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
>  	ssize_t ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index d79d4142aea7..6bd0e4616ee1 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -953,7 +953,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  		goto out;
>  	}
>  
> -	if (hdcp->shim->check_link(intel_dig_port)) {
> +	if (hdcp->shim->check_link(intel_dig_port, connector)) {
>  		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>  			intel_hdcp_update_value(connector,
>  				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index ca71ee3dd1c7..b12f1af0611d 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1546,11 +1546,10 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
>  }
>  
>  static
> -bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port)
> +bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> +				struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> -	struct intel_connector *connector =
> -		intel_dig_port->hdmi.attached_connector;
>  	enum port port = intel_dig_port->base.port;
>  	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
>  	int ret;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
