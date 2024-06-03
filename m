Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8C8D7E81
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DD710E0C3;
	Mon,  3 Jun 2024 09:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFilpSOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2940710E0C3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717406945; x=1748942945;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j4w9K5djQp5xn5C5Ueh22RoGjSGi1Sn90cfAUmAMli4=;
 b=lFilpSOGxrfLNOKxpc/CNnfBwzqocMvPZR4dSypSOU3DjhubFaCLzd8N
 4Z7n5+YKAuLe4z8KUXvdYUTBQ6Yvk3JcUwQZ/6gzH2Pay74xm22hd4s4F
 csy/NN8tK+Gwao6uYf4N1+Uv85fh3m5aNklZ7uyAKdkW1nLr+joPJhgpN
 CFFEqfIpPUrYqJCNkfDwWRn0uXfaFAR15xWRj5ktXGkAcmhNPS6hGyqgJ
 RnKUU2uifJm+4SB4ysKZS1a0CpdEhoqeCFFo5aq5IPt5+GEr/wLBkF01d
 GemgXgIKWj7isaMD0wROVkhlCKy33U3qOeOD8KdOFBAAffA+cQ8FVfAjx w==;
X-CSE-ConnectionGUID: OiDHd53VRy+deAe+jCg3DA==
X-CSE-MsgGUID: fm7tC40SRhGbyPCxHCSdzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17731600"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17731600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 02:29:04 -0700
X-CSE-ConnectionGUID: eWA6METETtCUr4cLJQgSJw==
X-CSE-MsgGUID: MRakdQpsR5CfCmhg/Ux7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37444940"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 02:28:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, Sui Jingfeng
 <sui.jingfeng@linux.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>, Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
In-Reply-To: <20240603-nippy-ludicrous-caracara-e02e3c@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <874jadesaj.fsf@intel.com>
 <20240603-nippy-ludicrous-caracara-e02e3c@houat>
Date: Mon, 03 Jun 2024 12:28:51 +0300
Message-ID: <87zfs2cr3g.fsf@intel.com>
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

On Mon, 03 Jun 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Hi Jani,
>
> On Fri, May 31, 2024 at 09:43:16PM GMT, Jani Nikula wrote:
>> On Mon, 27 May 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > Let me know what you think,
>> 
>> Sorry to report that this series generates a bunch of kernel-doc
>> warnings in include/drm/drm_connector.h. Documenting nested struct
>> members doesn't work as smoothly as you'd expect:
>>
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'broadcast_rgb' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'infoframes' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_drm' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'vendor' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'is_limited_range' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'output_bpc' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'output_format' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_char_rate' description in 'drm_connector_state'
>> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'vendor' description in 'drm_connector'
>> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'product' description in 'drm_connector'
>> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'supported_formats' description in 'drm_connector'
>> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'infoframes' description in 'drm_connector'
>> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'lock' description in 'drm_connector'
>> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'audio' description in 'drm_connector'
>> 
>> Noticed this when I was rebasing [1]. Having that merged would find
>> issues in headers at build time instead of 'make htmldocs'.
>> 
>> In the mean time, this is the quick reproducer:
>> 
>> $ scripts/kernel-doc -none include/drm/drm_connector.h
>
> Thanks for the report and the reproducer. I have to admit I have no idea
> how to fix it, do you have a suggestion?

Some of them can be fixed by adding the parent struct name, like so:

-                * @broadcast_rgb: Connector property to pass the
+                * @hdmi.broadcast_rgb: Connector property to pass the

but I think even that falls apart at some point. :(

In the end might be easier to separate the struct definitions to reduce
nesting.


BR,
Jani.


-- 
Jani Nikula, Intel
