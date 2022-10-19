Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047BC605117
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 22:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9188510E18B;
	Wed, 19 Oct 2022 20:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DC810E18B;
 Wed, 19 Oct 2022 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666210358; x=1697746358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=03Y9YLPDYEALjaiYcOkzV4LeG0di0sJk+DHjAYZH3Yk=;
 b=fZalLxOXDBEZsLCy+JO9FPWW7vFkzrK4gLgzp7UJze1i2HsbnASDav1v
 XSTIIy0UCeL2yaI+dl3u7KtS5DSiF8U+vgYVHpH4SH1IIA+wGEpxhZuai
 r4DhkR7RXmV7B1kuX7wQvrn2+rGXZ/VGbLbaur4AC2VgbbFRUNZc1ZjYO
 ZUKnZMDW+fDVS/lwf/xSAKjykf5ThTdJ/B0cWDP1tf1ak1w5nFWEnhjVI
 QWcVEvvqDNetQgu1MybiRNY5P55Vp6KpV/CE4Gu/weBajndFhyklnUPR/
 WtdSnw9OY5Fl2yvg4L28bLdnJdYdotz3XGpaaCZkKDnISZPZ551gT6nGQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289832111"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="289832111"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 13:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="734394105"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="734394105"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 19 Oct 2022 13:12:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 23:12:33 +0300
Date: Wed, 19 Oct 2022 23:12:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 15/15] drm/edid: convert to device specific logging
Message-ID: <Y1BaMeMDAai8jI6+@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <86764202b71c0cff306bb9110c5818a0979c2b23.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86764202b71c0cff306bb9110c5818a0979c2b23.1665496046.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 04:49:49PM +0300, Jani Nikula wrote:
> Convert to drm_kms_dbg/drm_err where possible, and unify the rest of the
> debugs to DRM_DEBUG_KMS.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 105 ++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 935bdf4e6269..09b0b8337382 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1979,7 +1979,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
>  
>  	status = edid_block_check(block, is_base_block);
>  	if (status == EDID_BLOCK_HEADER_REPAIR) {
> -		DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
> +		DRM_DEBUG_KMS("Fixing EDID header, your hardware may be failing\n");
>  		edid_header_fix(block);
>  
>  		/* Retry with fixed header, update status if that worked. */
> @@ -2281,8 +2281,9 @@ int drm_edid_override_connector_update(struct drm_connector *connector)
>  
>  		drm_edid_free(override);
>  
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
> -			      connector->base.id, connector->name, num_modes);
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
> +			    connector->base.id, connector->name, num_modes);
>  	}
>  
>  	return num_modes;
> @@ -3389,17 +3390,16 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>  		return NULL;
>  
>  	if (pt->misc & DRM_EDID_PT_STEREO) {
> -		DRM_DEBUG_KMS("stereo mode not supported\n");
> +		drm_dbg_kms(dev, "Stereo mode not supported\n");
>  		return NULL;
>  	}
>  	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
> -		DRM_DEBUG_KMS("composite sync not supported\n");
> +		drm_dbg_kms(dev, "Composite sync not supported\n");
>  	}
>  
>  	/* it is incorrect if hsync/vsync width is zero */
>  	if (!hsync_pulse_width || !vsync_pulse_width) {
> -		DRM_DEBUG_KMS("Incorrect Detailed timing. "
> -				"Wrong Hsync/Vsync pulse width\n");
> +		drm_dbg_kms(dev, "Incorrect Detailed timing. Wrong Hsync/Vsync pulse width\n");
>  		return NULL;
>  	}
>  
> @@ -4643,7 +4643,7 @@ static int add_hdmi_mode(struct drm_connector *connector, u8 vic)
>  	struct drm_display_mode *newmode;
>  
>  	if (!drm_valid_hdmi_vic(vic)) {
> -		DRM_ERROR("Unknown HDMI VIC: %d\n", vic);
> +		drm_err(connector->dev, "Unknown HDMI VIC: %d\n", vic);

Quit a lot of these could also do the full [CONNECTOR:...] 
thing it seems.

-- 
Ville Syrjälä
Intel
