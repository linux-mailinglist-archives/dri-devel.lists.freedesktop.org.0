Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9C49B0FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 11:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530CC10E4F2;
	Tue, 25 Jan 2022 10:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317710E4F2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643104960; x=1674640960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n6dpGMEk/a452q54nwM/G3sTPBT7XxG4hC3H2UKNfZ0=;
 b=Xu1mI5hDFErn5jJbutxHoPb8mNoA+rQ8pjM972U4S7Z4cwWVjmGeni2I
 xoQqUPx3Dx1Y5aUP6EnWXpgFglpc9uLk0QhlD8EeWRN4GdRrCjeTKFMSR
 BuR+4LSpOfdNZG3OI+8G5MKl8u0HodaoaHldXRNUFk0gmpx+RAyYG0SMh
 UcpMJAw+Lyly2gywCHx+5DTeJgN0KokN3qR4o9hyI1J/ubr1gBX9ZiIg2
 yUQ89UOOgc1BYfmanRkbp5A2rOQNcJeELJyqroSVlpaHjuSiEvUBg+06L
 E1skMq6GG9elBuUiQFXqCKUvfEjnsQVFf3JAwW9qouqeZ0ig8+uLLL8c5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="226939330"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="226939330"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 02:02:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="624416000"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga002.fm.intel.com with SMTP; 25 Jan 2022 02:02:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 12:02:36 +0200
Date: Tue, 25 Jan 2022 12:02:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/edid: Clear EDID Deep Color Modes in
 drm_reset_display_info()
Message-ID: <Ye/KvGlX+vBc01s0@intel.com>
References: <20220125093251.594772-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220125093251.594772-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 10:32:51AM +0100, Maxime Ripard wrote:
> Even though we have the other drm_display_info fields reset, the DC
> modes are missing.
> 
> This shouldn't be an issue since it's explicitely reset every time a new
> EDID is parsed.

It's not really obvious that it can't be an issue. I think we might
be saved by info->bpc getting reset to 8 by drm_parse_hdmi_vsdb_video().
But the dc_modes bitfields themselves may be left with stale values.

Hmm, actually drm_add_display_info() re-populates info->bpc *after* 
drm_parse_hdmi_vsdb_video() so we could in theory end up with bpc>8 
and dc_modes!=0 even if the display doesn't support any HDMI deep 
color modes. Though I suppose a display that doesn't do deep color
but declares its max bpc as >8 is a bit nuts. I could maybe imagine
it happening if the display supports >8 bpc with DP but not with 
HDMI, and doesn't bother customizing the EDID sufficiently for
each interface.

> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5251925e3b92..a76224653e6f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5340,6 +5340,9 @@ drm_reset_display_info(struct drm_connector *connector)
>  	info->rgb_quant_range_selectable = false;
>  	memset(&info->hdmi, 0, sizeof(info->hdmi));

We should probably just move more stuff into that .hdmi struct...

>  
> +	info->edid_hdmi_rgb444_dc_modes = 0;
> +	info->edid_hdmi_ycbcr444_dc_modes = 0;
> +
>  	info->non_desktop = 0;
>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
