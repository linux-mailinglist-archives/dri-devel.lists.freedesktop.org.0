Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78D97A744
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 20:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F86610E088;
	Mon, 16 Sep 2024 18:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="ELtUFwHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FDA10E088;
 Mon, 16 Sep 2024 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1726511027;
 bh=vSu8t8Qbu000oREFKVL1jU2sAeGEYw6cm8ooSW1AZhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ELtUFwHDSFx5eeDybuOOUSW5DVL2JFuGivZAJKCNg2PY8iT9wneukXOqoxdxog5rv
 Rzzlw/nFfvCPKWhuL+gOXOx/oIniHI9Bqk1PvtSStac2w6SQpNaTYTHxm2SY2LGFt5
 HKdq3dQJMz8y4ePhYYsZA/VtMDnTE8fHPhT0dOTk=
Date: Mon, 16 Sep 2024 20:23:47 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/4] drm: Minimum backlight overrides and
 implementation for amdgpu
Message-ID: <cfec358a-ff42-49c3-a174-149bee7a461c@t-8ch.de>
References: <20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net>
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

Hi Harry, Leo and other amdgpu maintainers,

On 2024-08-24 20:33:53+0000, Thomas Weißschuh wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
> 
> Introduce a quirk to override "min_input_signal" to "0" which leads to a
> much lower minimum brightness, which is still readable even in daylight.

could you take another look at the series?
The issues around panel power are not specific to the low pwm values,
so shouldn't have an impact on this series.
(And are nearly imperceptible anyways)

> One solution would be a fixed firmware version, which was announced but
> has no timeline.
> 
> ---
> Changes in v6:
> - Clean up cover letter and commit messages
> - Add my S-o-b to patch from Dustin
> - Mention testing in combination with "panel_power_savings"
> - Link to v5: https://lore.kernel.org/r/20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net
> 
> Changes in v5:
> - Forward-declare struct drm_edid
> - Reorder patches, quirk entries are last
> - Add patch from Dustin for additional quirk entries
> - Link to v4: https://lore.kernel.org/r/20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net
> 
> Changes in v4:
> - Switch back to v2 implementation
> - Add MODULE_DESCRIPTION()
> - Simplify quirk infrastructure to only handle min backlight quirks.
>   It can be extended if necessary.
> - Expand documentation.
> - Link to v3: https://lore.kernel.org/r/20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net
> 
> Changes in v3:
> - Switch to cmdline override parameter
> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
> 
> Changes in v2:
> - Introduce proper drm backlight quirk infrastructure
> - Quirk by EDID and DMI instead of only DMI
> - Limit quirk to only single Framework 13 matte panel
> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> 
> ---
> Dustin L. Howett (1):
>       drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels
> 
> Thomas Weißschuh (3):
>       drm: Add panel backlight quirks
>       drm/amd/display: Add support for minimum backlight quirk
>       drm: panel-backlight-quirks: Add Framework 13 matte panel
> 
>  Documentation/gpu/drm-kms-helpers.rst             |  3 +
>  drivers/gpu/drm/Kconfig                           |  4 +
>  drivers/gpu/drm/Makefile                          |  1 +
>  drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++
>  drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 +++++++++++++++++++++++
>  include/drm/drm_utils.h                           |  4 +
>  7 files changed, 117 insertions(+)
> ---
> base-commit: d2bafcf224f3911b183113b2fcb536c9e90684a3
> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 
