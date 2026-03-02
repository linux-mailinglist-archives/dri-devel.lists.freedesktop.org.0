Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHvRMHaGpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:45:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710621D8F5C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88A410E4D1;
	Mon,  2 Mar 2026 12:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="NklJGRmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402D210E4CD;
 Mon,  2 Mar 2026 12:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772455528; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gfFgLK0NcN+DF027ztokmuJzLGgp/Kn1kKJQXerb1I9GNL7TP2viyfn7ZsNRBylkQp9ZArN5yoUDZfVQOnHcS1VKyjbKIm7l2ZUlnIeeG1TJTgHXFS5fWyJyERvIGWVbAurIivEeblG+hhFtl+csYmU0AdSVhboLMsxNpoMEsyo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772455528;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FI4iBPbexT5/+OX3ab+TBF6Dku2WJR7GpM9DDHrwsPk=; 
 b=A9R2BAzoJPj4uCGn9AR23la5ihbXVAeayO35kYB7Lj+Cz3KNcjeDodl1UTwoDH+AW3GSjW1QkNS1C1m02AjDdU3RwgkT9kG0X8KMdsUfhaRBbxAbhLFJHbtSylmO9zO0uGCDSrtzs488v983GA/u911rzbevHSGHSLIOiGjj4IE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772455527; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=FI4iBPbexT5/+OX3ab+TBF6Dku2WJR7GpM9DDHrwsPk=;
 b=NklJGRmL7Ht1vVNs25ImFGldSXVhHZfLcvTkHo1UkVwxo+YmvptU5KSwoBLaKwcI
 8F/C/rYOF7LL5uRL3SWft23e8XNCzhZJlF4aT9q/cjC4NR+INLbrCfP48F4ndn/KZ+9
 c0F3vSfOqOkMW+KNDdJL7PAjYQ4ep4meusaEj670=
Received: by mx.zohomail.com with SMTPS id 177245552678992.73586677524838;
 Mon, 2 Mar 2026 04:45:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 03/19] drm/bridge: Act on the DRM color format property
Date: Mon, 02 Mar 2026 13:45:18 +0100
Message-ID: <2254957.irdbgypaU6@workhorse>
In-Reply-To: <unfsi4t4t4wl74zudkq3oeiryvm2xgyiplugcaxhyvjmtn7s2l@72xhl5vrtyt3>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
 <unfsi4t4t4wl74zudkq3oeiryvm2xgyiplugcaxhyvjmtn7s2l@72xhl5vrtyt3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	CTE_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 710621D8F5C
X-Rspamd-Action: no action

On Sunday, 1 March 2026 17:56:08 Central European Standard Time Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 08:20:08PM +0100, Nicolas Frattaroli wrote:
> > The new DRM color format property allows userspace to request a specific
> > color format on a connector. In turn, this fills the connector state's
> > color_format member to switch color formats.
> > 
> > Make drm_bridges consider the color_format set in the connector state
> > during the atomic bridge check. For bridges that represent HDMI bridges,
> > rely on whatever format the HDMI logic set. Reject any output bus
> > formats that do not correspond to the requested color format.
> > 
> > Non-HDMI last bridges with DRM_CONNECTOR_COLOR_FORMAT_AUTO set will end
> > up choosing the first output format that functions to make a whole
> > recursive bridge chain format selection succeed.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 6d8947419940..5938fba0a983 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1117,6 +1117,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  	return ret;
> >  }
> >  
> > +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_connector_color_format fmt)
> > +{
> > +	if (fmt == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> > +		return true;
> > +
> > +	switch (bus_fmt) {
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		return true;
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >  /*
> >   * This function is called by &drm_atomic_bridge_chain_check() just before
> >   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> > @@ -1160,6 +1201,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >  	struct drm_encoder *encoder = bridge->encoder;
> >  	struct drm_bridge_state *last_bridge_state;
> >  	unsigned int i, num_out_bus_fmts = 0;
> > +	enum drm_connector_color_format fmt;
> >  	u32 *out_bus_fmts;
> >  	int ret = 0;
> >  
> > @@ -1201,13 +1243,58 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >  			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> >  	}
> >  
> > +	/*
> > +	 * On HDMI connectors, use the output format chosen by whatever does the
> > +	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
> > +	 * are sorted by preference for %DRM_CONNECTOR_COLOR_FORMAT_AUTO, as
> > +	 * bus_format_is_color_fmt() always returns true for AUTO.
> > +	 */
> > +	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {
> 
> This will break the logic if there is anything after the HDMI bridge.
> For example, if the board has hdmi-connector (yep, it's a bridge without
> DRM_BRIDGE_OP_HDMI, because HDMI connectors don't implement any of the
> HDMI functionality), then the function will go to the second clause.
> 
> This probably needs to be moved to drm_bridge_connector. There is is
> natural to check for bridge_connector->bridge_hdmi.

A few questions:
1. are all HDMI connectors drm_bridge_connectors? Or does the code need
   to handle two HDMI cases?
2. If by "This probably needs to be moved to drm_bridge_connector", do
   you mean the entire recursive bus format selection, or just a check
   for whether it's an HDMI connector that sets some flag on the
   drm_bridge?
3. I don't see any KUnit tests for drm_bridge_connector. Is adding those
   part of the requirements for getting this upstreamed?

Kind regards,
Nicolas Frattaroli

> 
> > +		drm_dbg_kms(last_bridge->dev,
> > +			    "HDMI bridge requests format %s\n",
> > +			    drm_hdmi_connector_get_output_format_name(
> > +				    conn_state->hdmi.output_format));
> > +		switch (conn_state->hdmi.output_format) {
> > +		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> > +			break;
> > +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> > +			break;
> > +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> > +			break;
> > +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> > +			break;
> > +		default:
> > +			ret = -EINVAL;
> > +			goto out_free_bus_fmts;
> > +		}
> > +	} else {
> > +		fmt = conn_state->color_format;
> > +		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %d\n", fmt);
> > +	}
> > +
> >  	for (i = 0; i < num_out_bus_fmts; i++) {
> > +		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
> > +			drm_dbg_kms(last_bridge->dev,
> > +				    "Skipping bus format 0x%04x as it doesn't match format %d\n",
> > +				    out_bus_fmts[i], fmt);
> > +			ret = -ENOTSUPP;
> > +			continue;
> > +		}
> >  		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
> >  					       conn_state, out_bus_fmts[i]);
> > -		if (ret != -ENOTSUPP)
> > +		if (ret != -ENOTSUPP) {
> > +			drm_dbg_kms(last_bridge->dev,
> > +				    "Found bridge chain ending with bus format 0x%04x\n",
> > +				    out_bus_fmts[i]);
> >  			break;
> > +		}
> >  	}
> >  
> > +out_free_bus_fmts:
> >  	kfree(out_bus_fmts);
> >  
> >  	return ret;
> > 
> 
> 




