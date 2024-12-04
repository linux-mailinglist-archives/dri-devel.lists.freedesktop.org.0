Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C29E3437
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 08:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD6710EC1B;
	Wed,  4 Dec 2024 07:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Osxe82UM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D576810EC1B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733298148; x=1764834148;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gK06+f1C0mBtgYKTZ09XhG1sOVFjumSjIgGeM6ZwmU0=;
 b=Osxe82UMA0/+tDgr4m6z0FXgTbo2XV3j8+ZfJPS2CZ8HjnjfSlALA3Ds
 RZU3eckiQPILV1f2qOjAduPx24zC5Wz9f9F9mip5EW+kFL9UxPg0qafkC
 mRzYG0QoC4IcJTSWMuGCmuFkw9smL+lJvvvPxcKxz4bXw5Kq5D4FSSpoI
 A47yV+EK1QG6DwadQrpK5+VeRGT+K/Oq4w1tUtsD+LOnmRnWL96LfIW+1
 POzFaSbnjN5B/pHgnpd5SRcr7EvpL0u9N6cssVl1e5DwuVxZP/j3kKXY0
 qeX3dWowUL5nk33P8DRacBtnWEuCkoVefsQxnMlGAuM1eR3uNBqD8NDKv Q==;
X-CSE-ConnectionGUID: v3SWdENJTW6XcNduDIpAcQ==
X-CSE-MsgGUID: TmKHVPGfT3Gst0uboHWmYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21132189"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="21132189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 23:42:27 -0800
X-CSE-ConnectionGUID: ztyXjIeiR26vOG8EeEOB9Q==
X-CSE-MsgGUID: MiRNI+71Qr6pKR5u1cWLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="131139278"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 23:42:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE
 <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
Date: Wed, 04 Dec 2024 09:42:11 +0200
Message-ID: <87v7vz3ne4.fsf@intel.com>
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

On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
>> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
>> > +	if (!drm_edid_valid(drm_edid)) {
>> 
>> What's the case this check is for?
>> 
>> My preference would be that bridge->funcs->edid_read() uses
>> drm_edid_read*() family of functions that do the checks and return the
>> EDID.
>> 
>> There are some cases that just allocate a blob and return it. Would be
>> nice if they could be converted, but in the mean time could use
>> drm_edid_valid() right there. Additional validity checks are redundant.
>
> This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> that the check is redundant, could you please send a patch dropping the
> check?

Mmmh. It's just scary to *remove* them, and that's the reason I didn't
want you to add one in the first place! :)

BR,
Jani.


-- 
Jani Nikula, Intel
