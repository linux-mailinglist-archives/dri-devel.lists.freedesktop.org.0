Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E834EBEDC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78E810E177;
	Wed, 30 Mar 2022 10:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF6010E177
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648636517; x=1680172517;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TJ4iF7krDCMSLNlMJcBFdQvdQLG+FXGE/KWM47ha0fI=;
 b=JrfZx7hnG124GxMvGZhKV8c95vRsXpspd1y99IWGpYiOMhROLxqtJrHY
 8YfTlW3mqY0yCXOwxeyS2/HMn+LLSqwaREPIGfE7pADUkdRcVUMJWw1oC
 7hfXIbfdH/I6PfBpuoq++BDBnlQl6PkM1UpdGYs/vrTd9UgJ/AGJeknlP
 kiNkWBCGEkDLBfUZXGDMnpipjsLlOD19/d+VXfgH1KHJ2o9umHEZ46y0C
 YK4SE6w56GjzLOQELfXu7AzDnqy4Vc3fDPKqgVgeIaI7yGt0T4EL+udng
 FfmEhaCXUx77pITOvzd23NOnIRg36jJMWPTiOuPRw/jcPKlLYU1fB3Jj8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="320209579"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="320209579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 03:35:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565482638"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 03:35:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
In-Reply-To: <20220322192743.14414-8-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de>
Date: Wed, 30 Mar 2022 13:35:11 +0300
Message-ID: <87wngbbue8.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Mar 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..e6e9e4557067 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -391,33 +391,6 @@ drm_load_edid_firmware(struct drm_connector *connector)
>  
>  bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
>  
> -int
> -drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
> -					 const struct drm_connector *connector,
> -					 const struct drm_display_mode *mode);
> -int
> -drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
> -					    const struct drm_connector *connector,
> -					    const struct drm_display_mode *mode);
> -
> -void
> -drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
> -				   const struct drm_connector_state *conn_state);
> -
> -void
> -drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
> -			    const struct drm_connector_state *conn_state);
> -
> -void
> -drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
> -				   const struct drm_connector *connector,
> -				   const struct drm_display_mode *mode,
> -				   enum hdmi_quantization_range rgb_quant_range);
> -
> -int
> -drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
> -				    const struct drm_connector_state *conn_state);
> -
>  /**
>   * drm_eld_mnl - Get ELD monitor name length in bytes.
>   * @eld: pointer to an eld memory structure with mnl set
> @@ -587,6 +560,10 @@ void drm_edid_get_monitor_name(struct edid *edid, char *name,
>  struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>  					   int hsize, int vsize, int fresh,
>  					   bool rb);
> +
> +u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match);
> +enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code);
> +enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 video_code);

I think these were fine as static, but not really great interfaces to
export. There's zero input checking on the vic in the latter, because
internally we could be sure they were fine.

I also wish we could limit the usage to the module you're adding; this
is now available to all drivers which should be discouraged.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
