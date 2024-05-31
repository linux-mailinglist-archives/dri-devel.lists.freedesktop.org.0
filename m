Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80F8D6920
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 20:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2F610E312;
	Fri, 31 May 2024 18:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTEsoS62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4986D10E312
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717181010; x=1748717010;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2998ZpVyEGYSKDxYSM479TmMh5OPYVOX8crtu3Z6n7M=;
 b=CTEsoS624FJb/BCp/Xwn5WHBfwabCbtOzXhn7n/Al6F3128qj9SbhNb2
 O7iAWPq9KIWpM9U5x0GeXG3NKMKvdFrjaoJrcy+0YHglRawZPICEUp+RS
 CML7rzhjFVvcsCEvkMlxiTSxJav/giswcGj3vfLzEIGdqLpAIwsg87lhc
 xtVtt5/TVIpTT9JApSMzd8FlXyTUaodAZFiD7b81mQ8TFXKPDtpOFJF32
 lld6FnM8LyhhTrvqFJviTFPJqa/AABeDRZY91puW704vmBXm2cgm6yqCA
 c8vVGj8r+LdgpO0WgAJiqXWYvPlCA/sTDrd9ks4W9tdUYfg1QEOJwWmm5 g==;
X-CSE-ConnectionGUID: GYZlkDR/Rs2cJV7R85rE4w==
X-CSE-MsgGUID: WEH4wV7cTDOX1viV9H4yiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13906092"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="13906092"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 11:43:30 -0700
X-CSE-ConnectionGUID: XalLKdCvTZiIXlO2BFstSA==
X-CSE-MsgGUID: x6tLlc2wR5SjtXITRwjjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="41322240"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 11:43:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick
 <sebastian.wick@redhat.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, Maxime
 Ripard <mripard@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>, Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
Date: Fri, 31 May 2024 21:43:16 +0300
Message-ID: <874jadesaj.fsf@intel.com>
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

On Mon, 27 May 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Let me know what you think,

Sorry to report that this series generates a bunch of kernel-doc
warnings in include/drm/drm_connector.h. Documenting nested struct
members doesn't work as smoothly as you'd expect:

../include/drm/drm_connector.h:1138: warning: Excess struct member 'broadcast_rgb' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'infoframes' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_drm' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'vendor' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'is_limited_range' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'output_bpc' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'output_format' description in 'drm_connector_state'
../include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_char_rate' description in 'drm_connector_state'
../include/drm/drm_connector.h:2112: warning: Excess struct member 'vendor' description in 'drm_connector'
../include/drm/drm_connector.h:2112: warning: Excess struct member 'product' description in 'drm_connector'
../include/drm/drm_connector.h:2112: warning: Excess struct member 'supported_formats' description in 'drm_connector'
../include/drm/drm_connector.h:2112: warning: Excess struct member 'infoframes' description in 'drm_connector'
../include/drm/drm_connector.h:2112: warning: Excess struct member 'lock' description in 'drm_connector'
../include/drm/drm_connector.h:2112: warning: Excess struct member 'audio' description in 'drm_connector'

Noticed this when I was rebasing [1]. Having that merged would find
issues in headers at build time instead of 'make htmldocs'.

In the mean time, this is the quick reproducer:

$ scripts/kernel-doc -none include/drm/drm_connector.h


BR,
Jani.

[1] https://lore.kernel.org/r/20240402140136.1722533-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
