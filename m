Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHBbFSKEpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:35:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60051D8A89
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB5C10E4BD;
	Mon,  2 Mar 2026 12:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="B7iz3Bd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA72410E4B8;
 Mon,  2 Mar 2026 12:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772454928; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EdM6kuDOOrBMjnk82Ujo+bVjEAXNVDAZBqVU/C5AIUuCTCpiFxwCZcpe03EWauXknbjeD766XJC5tJXnzS73vS3HbLrIVgx4rI/i1umJU3RCWVf4cWtY31b9OEOnDlRP22zfC84VoMNE73XFwNmWC4jeftCBL06vVeerlFo1Mxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772454928;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3BG6NbMJZCakv4h2SAqH1WDhyhJOxLlkoG0+u/X9t+w=; 
 b=TiGFuMZyrE5Ol/sLoQp+n0ByX0Xz2NUfj2Wbg/OGQXHHc+WHNgMxrth2sK/DXaQUgopkpXqtj73ZFd4FpvtZVvJsUOXn5b909FImg8PufyEmX3POJt6RtJLYu6HzjrzyRCD24SyHVJo7YW4IT+h4B294hCJ/oza3vNm3PR0QHA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772454928; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=3BG6NbMJZCakv4h2SAqH1WDhyhJOxLlkoG0+u/X9t+w=;
 b=B7iz3Bd6S3S9gUGiY3IxUc2MxIUugQu7iDZrJ/yyGxTlAtxwtsUGr5Xe5CLIXEGc
 4z1rqx/G6PEKW5Q98G92SaBOZWk7fscOfqGNo1g8UGj3WiRlrlT4fxUNnQkh/ltgEPS
 YLQ2mrmefuTXI3ooJRzKjrWdygiygyjjnqNTQ15g=
Received: by mx.zohomail.com with SMTPS id 1772454925950111.09737166746925;
 Mon, 2 Mar 2026 04:35:25 -0800 (PST)
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
 linux-doc@vger.kernel.org, Andri Yngvason <andri@yngvason.is>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Date: Mon, 02 Mar 2026 13:35:16 +0100
Message-ID: <5081457.31r3eYUQgx@workhorse>
In-Reply-To: <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
 <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
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
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,yngvason.is,tuxedocomputers.com];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yngvason.is:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: C60051D8A89
X-Rspamd-Action: no action

On Sunday, 1 March 2026 17:47:48 Central European Standard Time Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> > From: Andri Yngvason <andri@yngvason.is>
> > 
> > Add a new general DRM property named "color format" which can be used by
> > userspace to request the display driver to output a particular color
> > format.
> > 
> > Possible options are:
> >     - auto (setup by default, driver internally picks the color format)
> >     - rgb
> >     - ycbcr444
> >     - ycbcr422
> >     - ycbcr420
> > 
> > Drivers should advertise from this list which formats they support.
> > Together with this list and EDID data from the sink we should be able
> > to relay a list of usable color formats to users to pick from.
> > 
> > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
> >  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
> >  drivers/gpu/drm/drm_connector.c     | 124 ++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_connector.h         | 103 ++++++++++++++++++++++++++++++
> >  4 files changed, 243 insertions(+)
> 
> It seems and feels that the common code to be used (almost?) everywhere
> would be:
> 
> if (!drm_mode_create_color_format_property(connector, supported_formats))
> 	drm_connector_attach_color_format_property(connector);
> 
> 
> Please mention somewhere the reason to split that into two functions.
> 

There isn't one I can think of, I kept it as-is since I inherited
the code like this and figured this was the expected convention based
on drm_mode_create_hdmi_colorspace_property ->
drm_connector_attach_colorspace_property.

Quite possibly, the idea is that callers can choose to probe whether
a certain set of parameters would allow the property to be created
without attaching it during said probing, but that's speculation on
my part.

Having it work like drm_connector_attach_max_bpc_property may make
more sense here, and I'll refactor it to do this in the next revision
unless anyone has any objections.

Kind regards,
Nicolas Frattaroli


