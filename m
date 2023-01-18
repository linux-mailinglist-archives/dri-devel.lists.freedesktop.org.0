Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E736720F9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2F210E770;
	Wed, 18 Jan 2023 15:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C226410E76B;
 Wed, 18 Jan 2023 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674055132; x=1705591132;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=20H7Om82F7MOSKcLF/cfzUH1vbKRnqq8dlc/4ggLgbY=;
 b=OKzwxeW2S/ksEDy3UG0FtchisZCv6GOSsQlALXN6Uf7ASLiFtqUwK2Xf
 4hVTiRT52rZoffHvQlrBRETNcpE5Hj75+mQJ1h8ctUAbLSBnv+npiqvE1
 W43HxY9kjHGoQUzJP1OCiSvRlBlrgfguuEiSs9zFC7NU2FlVx1hFUutfj
 888pB+tUtsdkmNIyhYQ1VFT9jUxXTldYX8JB/1lMs0UV8Frd028umeYTq
 xjM0ovUMgQzx+lnD2lkYhPWzGT4YMYOVV0Kn1SaZqADelRnQDxyN3bCaB
 HJu2C1FUfVNqRuZiFdjtDHY/8XWKRheYuYHcCeO7N4i+WKE8HPDVxsUN9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387353288"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387353288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="690226951"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690226951"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:18:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:18:49 +0200
Date: Wed, 18 Jan 2023 17:18:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 05/22] drm/edid: use VIC in AVI infoframe if sink
 lists it in CTA VDB
Message-ID: <Y8gN2ZrovuJQqUG0@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <775124fd07a5b7892e869becc3dd8dadb328ae5f.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <775124fd07a5b7892e869becc3dd8dadb328ae5f.1672826282.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, William Tseng <william.tseng@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 12:05:20PM +0200, Jani Nikula wrote:
> Apparently there are HDMI 1.4 compatible displays out there that support
> VICs from specs later than CTA-861-D, i.e. VIC > 64, although HDMI 1.4
> references CTA-861-D only.

Not 100% this is a real issue or not. IIRC we decided to 
play it safe regardless.

However later CTA specs do clarify the handling of VIC >=128 which
apparently are known to have issues, and we're even supposed to
use the presence of such SVDs to determine which version of the
AVI infoframe to transmit. Currently we don't handle that stuff
correctly, but looks like it'll be much easier to remedy now.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> We try to avoid using VICs from the later specs in the AVI infoframes to
> avoid upsetting sinks that conform to earlier specs.
> 
> However, it seems reasonable to do this when the sink claims it supports
> the VIC. With the pre-parsed list of VICs handy, this is now trivial.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6153
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: William Tseng <william.tseng@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 7f0386175230..3dfcd6450f10 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5864,6 +5864,22 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
>  	}
>  }
>  
> +static bool cta_vdb_has_vic(const struct drm_connector *connector, u8 vic)
> +{
> +	const struct drm_display_info *info = &connector->display_info;
> +	int i;
> +
> +	if (!vic || !info->vics)
> +		return false;
> +
> +	for (i = 0; i < info->vics_len; i++) {
> +		if (info->vics[i] == vic)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> @@ -6909,10 +6925,14 @@ static u8 drm_mode_cea_vic(const struct drm_connector *connector,
>   *
>   * HDMI 1.4 (CTA-861-D) VIC range: [1..64]
>   * HDMI 2.0 (CTA-861-F) VIC range: [1..107]
> + *
> + * If the sink lists the VIC in CTA VDB, assume it's fine, regardless of HDMI
> + * version.
>   */
>  static u8 vic_for_avi_infoframe(const struct drm_connector *connector, u8 vic)
>  {
> -	if (!is_hdmi2_sink(connector) && vic > 64)
> +	if (!is_hdmi2_sink(connector) && vic > 64 &&
> +	    !cta_vdb_has_vic(connector, vic))
>  		return 0;
>  
>  	return vic;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
