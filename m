Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJrJMlwIhmkRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:27:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FEBFFBA8
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506E110E813;
	Fri,  6 Feb 2026 15:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="g1rsV09N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C6E10E813;
 Fri,  6 Feb 2026 15:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770391628; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a4h+OMbk0iyCauZRGyFmaHiVxh6Yugm4f32aGLbFhazNxk2AM6aEzKSFJrvmbCkDa1kHpArrcDG9eOr9eKpkJn9go19QxTKOfOKPavc5QP1VZYj/GcgVI6YH6osbBQ4tzee6Ic2DfhF+KQUDs1tmYsAkCdpua4wS0c2x/ZR4Zos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770391628;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vqntc3mGZhsTFj2qn0IsTeoSdqqAdPY47w81CjtIRcU=; 
 b=WhmsIoXPknI/ZfuAJvjw/L+iIZm5YOJgtxfxsCHunsPD5aWHpevT5NdsNfEsw2dpwijkoc7oTtOsPAla8d0ob3+jULGNzZxNoS5vf9OI5QrhioFduAh/oLPT6249tPWOGt2YjRWyWFMe9duEZryJd/xA+ugNdJb9pJso95K6M50=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770391628; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=vqntc3mGZhsTFj2qn0IsTeoSdqqAdPY47w81CjtIRcU=;
 b=g1rsV09NZVeVjM8t7+ErxmMNzCf1eyjSqe3YVJSgOOy2VOoOdHNMsYj8XQqpHLWU
 3nZeRaIXnrlgW9G2ES7zouFMyDRjfDplLgvXSGV33v+UHedcPcFRcrdeC2lBx7/vEqB
 6+UL8ghWEGrqLdtKZUlfBYCyJY/EQ/LEvY4xFERo=
Received: by mx.zohomail.com with SMTPS id 1770391626411181.8997983206183;
 Fri, 6 Feb 2026 07:27:06 -0800 (PST)
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
 Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>, 
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
Date: Fri, 06 Feb 2026 16:26:56 +0100
Message-ID: <6318997.lOV4Wx5bFT@workhorse>
In-Reply-To: <20260206-deft-provocative-perch-6ca9bf@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-2-ef790dae780c@collabora.com>
 <20260206-deft-provocative-perch-6ca9bf@houat>
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
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,yngvason.is,tuxedocomputers.com];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 49FEBFFBA8
X-Rspamd-Action: no action

Hello,

On Friday, 6 February 2026 15:05:08 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Wed, Jan 21, 2026 at 03:45:09PM +0100, Nicolas Frattaroli wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 7eaec37ae1c7..b5604dca728a 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -556,6 +556,16 @@ enum drm_colorspace {
> >  	DRM_MODE_COLORIMETRY_COUNT
> >  };
> >  
> > +enum drm_color_format {
> > +	DRM_COLOR_FORMAT_AUTO			= 0,
> > +	DRM_COLOR_FORMAT_RGB444			= BIT(0),
> > +	DRM_COLOR_FORMAT_YCBCR444		= BIT(1),
> > +	DRM_COLOR_FORMAT_YCBCR422		= BIT(2),
> > +	DRM_COLOR_FORMAT_YCBCR420		= BIT(3),
> > +};
> > +
> > +#define DRM_COLOR_FORMAT_COUNT 5
> > +
> 
> I don't really see a reason to expose an enum, with a bunch of values
> that are all mutually exclusive, as a bitmask. It's pretty inconsistent
> with most (all?) the other similar properties we have.
> 
> I appreciate you did that to avoid fixing up every driver using those
> values, but then maybe we don't have to? We could create a userspace
> facing enum, and convert to DRM_COLOR_FORMAT internally.

This is what the series did at v5 and earlier. IMHO it was kind of
counter-productive, because we then had two different things for the
same purpose, and some conversion logic between them. I think it's more
error prone to do it that way (think: mixing up the two), and doesn't
have a clear benefit. Just to give a picture of how bad things get:

1. we have the HDMI color format (aka "HDMI_COLORSPACE")
2. we have driver specific output color formats, e.g. the intel ones
3. we have DRM_COLOR_FORMAT
4. we have the bus formats (multiple per color format)
5. we have the DRM plane formats (again, multiple per color format)

Adding a sixth into the mix feels a bit bad because we'll then need to
justify why we should have another layer of switch-case statements.

Kind regards,
Nicolas Frattaroli

> 
> Maxime
> 




