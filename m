Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4E9E1F42
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8710EA2D;
	Tue,  3 Dec 2024 14:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T48Xjl74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D2010EA37
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733236417; x=1764772417;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t+NELF6Cs3AMXyjLkXGAGVtag15igAgDFRlk6+wOWag=;
 b=T48Xjl74mizV5GSO44PuTRvmQbpK7w2Xp4mNwBpMlwqQ54YvfR5MsCuz
 DZk6F/5bjVGMxjutjwq0gyjN4tlH/CeT2vHtfnluaRKH9zBWsO4IS4WKY
 bnLvL0TSMWXTebT2XugZI2va2aXDWKOtW98iJmpqL7gSlbFSTyaUaD6U6
 S687nKrMUyymKNNL9A0nfKiJxYMUX3p0uMfdn6B+cLEpnuQKiP8mWyu+I
 8iLAxOVdEviaW5MWaaDLYH5rFvjDbPXBGHXTmqOtXG+AZU7XVuCVumLkw
 R2imQeA8ripbLMULLNyKS+Yg+NhIGTHEsGHIbHIp7IwzFhpSfQ3asHeOl Q==;
X-CSE-ConnectionGUID: tKSbbuhsSl2vCSOzyASTzA==
X-CSE-MsgGUID: 9OHKoSfcReKg7Os6pIbf/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33331017"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33331017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:33:37 -0800
X-CSE-ConnectionGUID: qFwNGDLVTlKCszQVkKdgBQ==
X-CSE-MsgGUID: YuyBpSYvSa20R8vswupuDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="98223136"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:32:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
 <20241202-married-bald-raven-7acd83@houat>
 <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>
Date: Tue, 03 Dec 2024 16:32:44 +0200
Message-ID: <877c8g4z1v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 03 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, Dec 02, 2024 at 02:27:49PM +0100, Maxime Ripard wrote:
>> Hi,
>> 
>> On Sun, Dec 01, 2024 at 02:44:13AM +0200, Dmitry Baryshkov wrote:
>> > Use the helper function to update the connector's information. This
>> > makes sure that HDMI-related events are handled in a generic way.
>> > Currently it is limited to the HDMI state reporting to the sound system.
>> > 
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
>> >  1 file changed, 7 insertions(+), 2 deletions(-)
>> > 
>> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> > index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00777f11da8301bc1 100644
>> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> > @@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>> >  	 */
>> >  
>> >  	if (status == connector_status_disconnected) {
>> > +		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
>> >  		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>> >  		return;
>> >  	}
>> >  
>> >  	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
>> >  
>> > -	drm_edid_connector_update(connector, drm_edid);
>> > +	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
>> > +	// CEC support
>> > +	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
>> 
>> So, it's not just about EDID, and I think we shouldn't really focus on
>> that either.
>> 
>> As that patch points out, even if we only consider EDID's, we have
>> different path depending on the connector status. It shouldn't be up to
>> the drivers to get this right.
>> 
>> What I had in mind was something like a
>> drm_atomic_helper_connector_hdmi_hotplug function that would obviously
>> deal with EDID only here, but would expand to CEC, scrambling, etc.
>> later on.
>
> I thought about it, after our discussion, but in the end I had to
> implement the EDID-specific function, using edid == NULL as
> "disconnected" event. The issue is pretty simple: there is no standard
> way to get EDID from the connector. The devices can call
> drm_edid_read(), drm_edid_read_ddc(connector->ddc) or (especially
> embedded bridges) use drm_edid_read_custom().

Lack of EDID may be a good approximation of disconnected for displays
that should have one, but just a reminder that having an EDID should not
be the only approximation for connected.

This is relevant for the debugfs/firmware EDID case. You'll want to be
able to have that, without it implying connected.

BR,
Jani.


>
> Of course we can go with the functional way and add the
> .read_edid(drm_connector) callback to the HDMI funcs. Then the
> drm_atomic_helper_connector_hdmi_hotplug() function can read EDID on its
> own.
>
> Also the function that you proposed perfectly fits the HPD notification
> callbacks, but which function should be called from the .get_modes()?
> The _hdmi_hotplug() doesn't fit there. Do we still end up with both
> drm_atomic_helper_connector_hdmi_hotplug() and
> drm_atomic_helper_connector_hdmi_update_edid()?
>
>> 
>> And would cover both the connected/disconnected cases.
>> 
>> Maxime

-- 
Jani Nikula, Intel
