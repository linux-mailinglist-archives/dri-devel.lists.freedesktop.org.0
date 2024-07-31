Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD34E943515
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 19:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF3210E64C;
	Wed, 31 Jul 2024 17:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8wftGCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691C610E64C;
 Wed, 31 Jul 2024 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722447624; x=1753983624;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YGB5pJc3ndjG2MKoPuf30zjg6eQqFwcL3FK7Idj61Cg=;
 b=b8wftGCHuuOotTbz6HyXoQY+INWkp79kGm8/X3pyj+Xy8/sYVoGuvjI5
 3LlCPmi5WqrjF/W7BCp/AlboCmcStoevWypMWMy5jZlD9N5k/JA4GhI0L
 ctCNcrmCqEtrtczMHYaqoBzrYg94ZAzDnuyj9+H5i5bJHLTiTxWUJIO7N
 UXLWnNte8h9CtYrnLUOhSctebhh/bL1hBokcvd3UkO4BWfLU0A0UbLB+K
 fXch33y+ui9fviEei4XWSUkxQNdnT1MQXrOOLSK/OefSA5ymBUi4RAqhL
 UAC0E7sl5qhQ1/RZoC6+RJgFFtuayRZFG5gUwiU1eFngCoG2RrrX0C6L8 A==;
X-CSE-ConnectionGUID: E/rQySDBTFSor7ojKC7rWw==
X-CSE-MsgGUID: BZcGm2fuSTS6q9ZCQ4wUdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31497653"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31497653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 10:40:23 -0700
X-CSE-ConnectionGUID: SGgE4PnRQViOi+BRTMk+4w==
X-CSE-MsgGUID: uXFphPNLQxetv2IQGunkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59397678"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.183])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 10:40:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Matt Hartley <matt.hartley@gmail.com>, Kieran
 Levin <ktl@framework.net>, Hans de Goede <hdegoede@redhat.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v3 0/2] drm: minimum backlight overrides and
 implementation for amdgpu
In-Reply-To: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
Date: Wed, 31 Jul 2024 20:40:12 +0300
Message-ID: <87v80lwjcz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 31 Jul 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
>
> Add a generic override helper for the user to override the settings
> provided by the firmware through the kernel cmdline.
> Also add amdgpu as a user of that helper.
>
> One solution would be a fixed firmware version, which was announced but
> has no timeline.

The flip side is that if we add this now, it pretty much has a timeline:
We'll have to carry and support it forever.

It's not a great prospect for something so specific. Not to mention that
the limits are generally there for electrical minimums that should not
be overridden. And before you know it, we'll have bug reports about
flickering screens...

BR,
Jani.


>
> This helper does conflict with the mode override via the cmdline.
> Only one can be specified.
> IMO the mode override can be extended to also handle "min-brightness"
> when that becomes necessary.
>
> ---
> Changes in v3:
> - Switch to cmdline override parameter
> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-qui=
rk-v2-0-cecf7f49da9b@weissschuh.net
>
> Changes in v2:
> - Introduce proper drm backlight quirk infrastructure
> - Quirk by EDID and DMI instead of only DMI
> - Limit quirk to only single Framework 13 matte panel
> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-qui=
rk-v1-1-8459895a5b2a@weissschuh.net
>
> ---
> Thomas Wei=C3=9Fschuh (2):
>       drm/connector: add drm_connector_get_cmdline_min_brightness_overrid=
e()
>       drm/amd/display: implement minimum brightness override
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++++
>  drivers/gpu/drm/drm_connector.c                   | 34 +++++++++++++++++=
++++++
>  include/drm/drm_connector.h                       |  2 ++
>  3 files changed, 42 insertions(+)
> ---
> base-commit: 36821612eb3091a21f7f4a907b497064725080c3
> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
>
> Best regards,

--=20
Jani Nikula, Intel
