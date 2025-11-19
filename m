Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20296C6EF20
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D3310E60C;
	Wed, 19 Nov 2025 13:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="lOK0BGrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B6F10E60C;
 Wed, 19 Nov 2025 13:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763559482; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CuwjR2h4Ha6FdX9YcmYJiHsMLW8UhFvlnuR8RsskwaZcOcgRJe+R6sdtnrxYVApCqwS/19y5nZYG42D9Zlo+RPeXtzzCIOhL7xTXZAz0qiAIUDj2DLaCrpAEizra3PiJFw6vLc/o5ZV1QnX+3YBSMP4wjqXjBkQgHjK505A5Xwg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763559482;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7kLvj5qlOUkKcedzN+9zXzz8KHY8mPvxCmgiQNKASC0=; 
 b=BCAuUf7lbq92vuxRMz/1dYjtXKeB4V2AgeLPbEvGKCNo1PsZBEWNnNL2rE/S5OB4m8uvbPJM+mIrekYRF4AgbS0ucOFBSaquhoFf6ZvIn81nZo5B/vh4I3TLFX7c9E3OjY6Hxu74BAGjUte++apzjOfX++EnahUAgYz5w6+dBmE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763559482; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=7kLvj5qlOUkKcedzN+9zXzz8KHY8mPvxCmgiQNKASC0=;
 b=lOK0BGrsyBiEDevslzfJVvrHYzJKW5KQ4sVEUjGezcv3IIJHy5sc4MlGVNfICCIN
 R0Bhi6yfEfVGmx5g0Y392pEDMHk0run1ePP/ik30HEqOq+cQIV0+Y3+9aOcBibP0RjH
 aInqlNcei+5GnD4BbDSIMlOsR2qwk/3VOUtRhD1g=
Received: by mx.zohomail.com with SMTPS id 1763559480451443.4437908471832;
 Wed, 19 Nov 2025 05:38:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
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
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 06/10] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
Date: Wed, 19 Nov 2025 14:37:51 +0100
Message-ID: <11723230.nUPlyArG6x@workhorse>
In-Reply-To: <edc12051-6e50-4ef6-98cf-713abb49dd90@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
 <edc12051-6e50-4ef6-98cf-713abb49dd90@collabora.com>
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

On Tuesday, 18 November 2025 21:14:31 Central European Standard Time Cristian Ciocaltea wrote:
> On 11/17/25 9:11 PM, Nicolas Frattaroli wrote:
> > With the introduction of the supported_formats member in the
> > dw-hdmi-qp platform data struct, drivers that have access to this
> > information should now set it.
> > 
> > Set it in the rockchip dw_hdmi_qp glue driver, where such a bitmask of
> > supported color formats already exists. It just needs to be converted to
> > the appropriate HDMI_COLORSPACE_ mask.
> > 
> > This allows this information to be passed down to the dw-hdmi-qp core,
> > which sets it in the bridge it creates, and consequently will allow the
> > common HDMI bridge code to act on it.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > index c9fe6aa3e3e3..7c294751de19 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > @@ -468,6 +468,28 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
> >  
> > +static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
> > +					  DRM_COLOR_FORMAT_RGB444 |
> > +					  DRM_COLOR_FORMAT_YCBCR444;
> > +
> > +static unsigned int __pure drm_to_hdmi_fmts(const u32 fmt)
> > +{
> > +	unsigned int res = 0;
> > +
> > +	if (fmt & DRM_COLOR_FORMAT_AUTO)
> > +		res |= BIT(HDMI_COLORSPACE_RGB);
> > +	if (fmt & DRM_COLOR_FORMAT_RGB444)
> > +		res |= BIT(HDMI_COLORSPACE_RGB);
> > +	if (fmt & DRM_COLOR_FORMAT_YCBCR444)
> > +		res |= BIT(HDMI_COLORSPACE_YUV444);
> > +	if (fmt & DRM_COLOR_FORMAT_YCBCR422)
> > +		res |= BIT(HDMI_COLORSPACE_YUV422);
> > +	if (fmt & DRM_COLOR_FORMAT_YCBCR420)
> > +		res |= BIT(HDMI_COLORSPACE_YUV420);
> > +
> > +	return res;
> > +}
> > +
> >  static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
> >  				    void *data)
> >  {
> > @@ -521,6 +543,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
> >  	plat_data.phy_data = hdmi;
> >  	plat_data.max_bpc = 10;
> >  
> > +	plat_data.supported_formats = drm_to_hdmi_fmts(supported_colorformats);
> 
> Any reason why this cannot be simply set as
> 
>   BIT(HDMI_COLORSPACE_RGB) | BIT(HDMI_COLORSPACE_YUV444) | BIT(HDMI_COLORSPACE_YUV422)
> 
> and get rid of the unnecessary conversion?

My gut feeling lead me towards trying to have a single source of
truth for the supported color formats, but upon further reflection
this is indeed way too verbose and lead me to move the
supported_colorformats definition into this patch rather than the
one where it's needed for registering the property.

So I agree with you here and will simplify this by just setting
these as you described.

Kind regards,
Nicolas Frattaroli

> 
> > +
> >  	encoder = &hdmi->encoder.encoder;
> >  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> >  
> > 
> 
> 




