Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2CC6E85B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 13:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3131210E117;
	Wed, 19 Nov 2025 12:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Hvyo7taZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 149350 seconds by postgrey-1.36 at gabe;
 Wed, 19 Nov 2025 12:41:44 UTC
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3710E117;
 Wed, 19 Nov 2025 12:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763556090; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=efAGdgdlLCmUjUiCUN+88ikUtvP8E+gBXE8iOqgiH9/f4gYzd0gr8lweUEbd3ZFRD+ZiqSuuV6xP+sZGKES92se5zLTUVxCvnkOeLTgwKWwsrJetJMgUwELe/8/ll9gxR0l7fAMLpdu4UqFRY1E3v1MFP/e1FTQRkOHIX+/NYvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763556090;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qkp5pM4kPUn4Z6RS327lCOqrGmM6PpBeTOuTvzIeNwc=; 
 b=OuztPRTlii3euM5FvuVgPFtTPcHctPj4sm+4mCNQmbk01+4clywpxZjFBSlRiHbmx9uqILeTnT1X+ErlmtVJcEszZ55rNhF5DH3cn96jNTMoMGvT2cNd/coVnVISVDDivzhjCgDfBhaKzsaVmfJYtWneNpj4czpNxuG7yhp9r8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763556090; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=qkp5pM4kPUn4Z6RS327lCOqrGmM6PpBeTOuTvzIeNwc=;
 b=Hvyo7taZPEolTW7Q7dLQLL/uX2K0MI7p7QAQJLQEAbXYw5eFq6ofNe5beUBpEd12
 1/y0p4GyB6eSbpZp5CYbpjl3VeOiXJWyQF07RqM8SnEM91fxbYGFwkvPO+vEcfw7E6J
 EjXEYgUF2NAl6dXlaOaFH32IGvWQZQLMQ964umEE=
Received: by mx.zohomail.com with SMTPS id 1763556087174897.1379263947298;
 Wed, 19 Nov 2025 04:41:27 -0800 (PST)
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
 Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 07/10] drm/display: hdmi-state-helper: Act on color
 format DRM property
Date: Wed, 19 Nov 2025 13:41:18 +0100
Message-ID: <7179523.lOV4Wx5bFT@workhorse>
In-Reply-To: <4wt5dbvseauo2bvi66ohtk445zsfjtpjwgvochwwlyk4uugcmy@5ubwtkxyy2ax>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-7-0ded72bd1b00@collabora.com>
 <4wt5dbvseauo2bvi66ohtk445zsfjtpjwgvochwwlyk4uugcmy@5ubwtkxyy2ax>
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

On Wednesday, 19 November 2025 10:09:12 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Mon, Nov 17, 2025 at 08:11:51PM +0100, Nicolas Frattaroli wrote:
> > With the introduction of the "color format" DRM property, which allows
> > userspace to request a specific color format, the HDMI state helper
> > should implement this.
> > 
> > Implement it by checking whether the property is set and set to
> > something other than auto. If so, pass the requested color format, and
> > otherwise set RGB.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index a561f124be99..add0d51fce33 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -650,9 +650,15 @@ hdmi_compute_config(const struct drm_connector *connector,
> >  				       conn_state->max_bpc,
> >  				       8, connector->max_bpc);
> >  	int ret;
> > +	enum hdmi_colorspace hdmi_colorspace;
> > +
> > +	if (conn_state->color_format && conn_state->color_format != DRM_COLOR_FORMAT_AUTO)
> > +		hdmi_colorspace = color_format_to_hdmi_colorspace(conn_state->color_format);
> > +	else
> > +		hdmi_colorspace = HDMI_COLORSPACE_RGB;
> >  
> >  	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> > -				      HDMI_COLORSPACE_RGB);
> > +				      hdmi_colorspace);
> 
> I don't think we want the fallback to yuv420 for anything but auto, so

Okay. Changing all the non-hdmi-state-helper drivers (amdgpu, i915)
to do this as well would require some more work however, especially
in the case of amdgpu where the code flow is not always obvious.

> I'd rather have something like
> 
> if (conn_state->color_format != DRM_COLOR_FORMAT_AUTO)
>    return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>                                   color_format_to_hdmi_colorspace(conn_state->color_format))
> 
> We'll also need unit tests.

Sure, am I guessing correctly that they'd go in
drm_hdmi_state_helper_test.c?

> Maxime
> 




