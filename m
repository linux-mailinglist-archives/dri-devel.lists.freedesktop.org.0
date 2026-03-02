Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKOtOmqIpWmWDQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:54:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980311D938A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BE010E4D3;
	Mon,  2 Mar 2026 12:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="czCH1Pwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664BB10E4CF;
 Mon,  2 Mar 2026 12:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772456025; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GMp6+xRMNwgsTM8iGKy0G8y6GkFeXPgakJzLr4g7v95spFf1QZd6gihYWQLeJL3rhTD72V5ksZSGquVESfiNqgKeGzY50/q6h8v1bi60drZGMwODJVl5oWq2gscFuxM8XEzd0q5iQhjpvN7xPzvuZds5ioTLzjp+OL7gf+moM5U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772456025;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lPQKUxtVjexxEX4A7XuYCfJhBt0aFJEhGTj3wOuGAak=; 
 b=A8n4m9TSHOWSTtoNn2W97tLnoFen+A2T+MHjlMc1Fy2Osrzwbvz5wXokklGhxewaXenze4bkNrKTYl8owJrBUJ5XF9C1NhbLaSeq6TvYARrjCjqRSAlPfwuHpfzYaBKPOAlJuENarffaJUdtReMw0Vc+oQzIvMJ9+Pn+0UGA/IA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772456025; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=lPQKUxtVjexxEX4A7XuYCfJhBt0aFJEhGTj3wOuGAak=;
 b=czCH1PwnW/CNSDoAUO7w4zjpsIwnu75I4YmbkTsbzGgEvfX7ryNg9YU9rmvgEoUo
 y3p5/qdnQXH9dJ1dsu7mEMvGlvt+UzU3mJRc0wVN7PDPDV0PuEoHXkeE5lIglxjq8Ht
 E9oAQ8KmXt0DU/LN72eVoyq0jW1mxhcUOCti0jF4=
Received: by mx.zohomail.com with SMTPS id 1772456023924351.0985024371805;
 Mon, 2 Mar 2026 04:53:43 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Date: Mon, 02 Mar 2026 13:53:34 +0100
Message-ID: <8648916.T7Z3S40VBb@workhorse>
In-Reply-To: <20260302-literate-shrew-of-health-ec19d2@houat>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
 <20260302-literate-shrew-of-health-ec19d2@houat>
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
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 980311D938A
X-Rspamd-Action: no action

On Monday, 2 March 2026 09:46:06 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> > With the introduction of the "color format" DRM property, which allows
> > userspace to request a specific color format, the HDMI state helper
> > should implement this.
> > 
> > Implement it by translating the requested drm_connector_color_format to
> > a drm_output_color_format enum value as per the logic HDMI should use
> > for this: Auto is translated to RGB, and a fallback to YUV420 is only
> > performed if the original color format was auto.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 9f3b696aceeb..31c6d55fa995 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector *connector,
> >  	unsigned int max_bpc = clamp_t(unsigned int,
> >  				       conn_state->max_bpc,
> >  				       8, connector->max_bpc);
> > +	enum drm_output_color_format fmt;
> >  	int ret;
> >  
> > -	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> > -				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
> > +	switch (conn_state->color_format) {
> > +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> > +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> > +		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
> > +		break;
> > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> > +		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
> > +		break;
> > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> > +		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
> > +		break;
> > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> > +		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
> > +		break;
> > +	default:
> > +		drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
> > +			    conn_state->color_format);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
> > +
> > +	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> > +		return ret;
> > +
> 
> We discussed it before, and it wasn't as trivial as it should have been,
> but now, I really feel something like the following would be simpler:
> 
> if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
> 	enum drm_output_color_format fmt;
> 
> 	switch (conn_state->color_format) {
> 	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> 	     drm_warn(connector->dev, "The format shouldn't be auto here"); // or any better message
> 	     fallthrough;

Why shouldn't it be auto there? This is the function where the auto->rgb
mapping is explicitly handled.

> 	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> 	     fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
> 	     break;
> 	....
> 	}
> 
> 	return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
> }
> 
> ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> 			      DRM_OUTPUT_COLOR_FORMAT_RGB444);
> 
> It makes it much clearer what the two branches are, and we don't have to
> test for auto multiple times.

Testing for auto multiple times is done for the "4:2:0 fallback on
AUTO only" case. If you fall through from AUTO to RGB and then return
the result of hdmi_compute_format_bpc on RGB, then you will not let
AUTO fall back to 4:2:0. hdmi_compute_format_bpc only does a fallback
for lower bit depths, not different color formats.

As far as I can tell, you're requesting a change of behaviour here that
would require me to adjust the behaviour of every single other HDMI
implementation and modify all the tests that you already gave a reviewed-by,
so I assume this wasn't the intent?

Kind regards,
Nicolas Frattaroli

> 
> Maxime
> 




