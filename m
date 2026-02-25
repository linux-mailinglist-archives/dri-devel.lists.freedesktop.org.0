Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGeEKcIvn2lXZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:22:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22719B7B3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3705B10E368;
	Wed, 25 Feb 2026 17:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ErAUL623";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8E10E368;
 Wed, 25 Feb 2026 17:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772040118; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MIpYrwNHTEw1tzZw977bIojdnx+74FWfwIXNhnMSYlTbsSYdvxH+g+QrY4zGMoh0X/3DZPjW1oer4HYTWBAn3lHZ9vLlIC3a8s4C7BO5iCugtzNhaFJrnUwkM4F1mExYqN8mBQfAqYu79QXEyyAM+uYUflDsTia6C1LizlG0obI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772040118;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=uYQZEmr31PuQ1YWmsWAZzNu809ry9o0BpCJyD6e+hII=; 
 b=DKXVLTbsR+l5XSAncNafwzlzKwZJFdTzPP+h8McRV7E6gSiuqKAo0gab2+6Otdbc1isGUCYTJhxZGjcI7vh1AKsaUvskimpYwdXSRNnYQtDyLKFoTUrS8qniU722QaJ0PXBYYRRWbog7c79LA+nOvzfEoo9YVcVTtTTZ1JP99N8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772040117; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=uYQZEmr31PuQ1YWmsWAZzNu809ry9o0BpCJyD6e+hII=;
 b=ErAUL623uvHeppqsgHQm+m4bSxj92drF5CKI08sbgfF9ao4z5nFAf0OhjrZ2uhfe
 0v2t1b+qb/J6N/g3FbcMj9+VjuVo7d9MRM3n8M4cbxm+P7AbP4Ia+AVf6vI7b8b0tHG
 1mpKX6ssj7z59PMyMJjE6UKb4r8TkFnimhIKEEf0=
Received: by mx.zohomail.com with SMTPS id 1772040115678826.0329473998504;
 Wed, 25 Feb 2026 09:21:55 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
Date: Wed, 25 Feb 2026 18:21:46 +0100
Message-ID: <3999997.iIbC2pHGDl@workhorse>
In-Reply-To: <8234454.EvYhyI6sBW@workhorse>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
 <20260224-drm-rework-color-formats-v1-14-bebc76604ada@kernel.org>
 <8234454.EvYhyI6sBW@workhorse>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,collabora.com,sntech.de,nxp.com,sholland.org,raspberrypi.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim]
X-Rspamd-Queue-Id: EE22719B7B3
X-Rspamd-Action: no action

On Wednesday, 25 February 2026 18:03:00 Central European Standard Time Nicolas Frattaroli wrote:
> On Tuesday, 24 February 2026 11:58:53 Central European Standard Time Maxime Ripard wrote:
> > The hdmi_colorspace enum was defined to represent the colorspace value
> > of the HDMI infoframes. It was later used by some HDMI drivers to
> > express the output format they should be setting up.
> > 
> > During the introduction of the HDMI helpers, it then was used to
> > represent it in the drm_connector_hdmi_state structure.
> > 
> > However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> > defines, and now with the drm_output_color_format enum. Let's
> > consolidate around drm_output_color_format in drm_connector_hdmi_state
> > to facilitate the current effort to provide a global output format
> > selection mechanism.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
> >  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
> >  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
> >  drivers/gpu/drm/drm_bridge.c                       |   2 +-
> >  drivers/gpu/drm/drm_connector.c                    |  14 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
> >  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
> >  include/drm/display/drm_hdmi_helper.h              |   3 +-
> >  include/drm/drm_connector.h                        |   7 +-
> >  14 files changed, 205 insertions(+), 180 deletions(-)
> > 
> > [... snip ...]
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 4f5b27fab475c7c733622eb8727927571f3fb8fe..171cd495976a3e16f201fd339d3d42a09dc3b63f 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > [... snip ...]
> >  
> > @@ -1424,25 +1424,25 @@ drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_
> >  	return broadcast_rgb_names[broadcast_rgb].name;
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> >  
> >  static const char * const output_format_str[] = {
> > -	[HDMI_COLORSPACE_RGB]		= "RGB",
> > -	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
> > -	[HDMI_COLORSPACE_YUV422]	= "YUV 4:2:2",
> > -	[HDMI_COLORSPACE_YUV444]	= "YUV 4:4:4",
> > +	[DRM_OUTPUT_COLOR_FORMAT_RGB444]	= "RGB",
> > +	[DRM_OUTPUT_COLOR_FORMAT_YCBCR420]	= "YUV 4:2:0",
> > +	[DRM_OUTPUT_COLOR_FORMAT_YCBCR422]	= "YUV 4:2:2",
> > +	[DRM_OUTPUT_COLOR_FORMAT_YCBCR444]	= "YUV 4:4:4",
> >  };
> >  
> >  /*
> >   * drm_hdmi_connector_get_output_format_name() - Return a string for HDMI connector output format
> >   * @fmt: Output format to compute name of
> >   *
> >   * Returns: the name of the output format, or NULL if the type is not
> >   * valid.
> >   */
> >  const char *
> > -drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt)
> > +drm_hdmi_connector_get_output_format_name(enum drm_output_color_format fmt)
> >  {
> >  	if (fmt >= ARRAY_SIZE(output_format_str))
> >  		return NULL;
> 
> Almost unrelated nit: we might want to also `fmt < 0 ||` here, since the
> base type of enums is a signed int. I almost caught myself using this function
> as a way to quickly check if a supplied color format property from userspace
> was valid, which would've had some unpleasant consequences for the kernel's
> memory.
> 
> Alternatively, I make my own switch-case based "is this a valid enum value"
> function. I probably should do that actually, but my laziness lead me to
> make sure we only have a single source of truth of what counts as a valid
> enum value.

Gah, disregard this, I just realised that this enum shouldn't be used as
the one in the property anyway, because of AUTO, as you already pointed out
in your reply to my series as well.

> 
> >  
> >  	return output_format_str[fmt];
> > [... snip ...]
> 
> Thanks for your work on this series, I was afraid of getting rid of
> DRM_COLOR_FORMAT_* myself because I suspected it was going to be a
> fairly large refactor across every driver. Guess I was both right
> and wrong: it touches many files, but all the replacements are
> fairly simple. :)
> 
> Kind regards,
> Nicolas Frattaroli




