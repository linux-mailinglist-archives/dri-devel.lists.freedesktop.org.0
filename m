Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F2AE601E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E1510E35D;
	Tue, 24 Jun 2025 09:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="SpH1YQA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD7C10E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:01:30 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O90ZDm1122333;
 Tue, 24 Jun 2025 04:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750755635;
 bh=esswBLe6SIahZaBqrIk0DlQE/Zgu8U6weX3OQF3nSyM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=SpH1YQA5UvGl5uBkOa3frH6j1qInLDq3/EXLsaL20MY997EVXlUDalMGfBShloSTK
 8Pgy9Z+ef2FXouM6XsJ2U1iRP3/IEmHmP0PNfVXci3tKpdbfSMumTOI3Vb3mZVpjSU
 700ggn7Q25vKM++enEhHcSs/DNGgYAWF9O4zUqc0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O90YIa127208
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 24 Jun 2025 04:00:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 04:00:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 04:00:34 -0500
Received: from [172.24.227.214] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.214])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O90RJs1232253;
 Tue, 24 Jun 2025 04:00:28 -0500
Message-ID: <c36bd142-7a13-43e2-a392-cdbd45b4a66b@ti.com>
Date: Tue, 24 Jun 2025 14:30:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] drm/bridge: cdns-dsi: Make it work a bit better
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, Francesco Dolcini <francesco@dolcini.it>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Devarsh Thakkar <devarsht@ti.com>,
 Parth Pancholi <parth.pancholi@toradex.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Tomi,

On 18/06/25 15:29, Tomi Valkeinen wrote:
> While trying to get the cdns-dsi to work on Toradex's AM69 Aquila
> platform, I hit multiple issues in the driver. Basicaly nothing worked
> for with the board.
> 
> This series fixes those issues. While I itch to make much larger changes
> to the cdns-dsi driver, I opted to keep this series relatively simple to
> make the fixes more clear and possibly help with backporting.
> 
> The series also touches tidss, but those changes are not strictly
> needed, and can be merged separately. And the series also touches
> cdns-dphy, and those changes are needed.
> 
> This has been tested on Toradex AM69 Aquila (upstream) and AM62P Verdin
> (Toradex's BSP), with:
> - HDMI output using lontium lt8912b
> - LVDS panel (sn65dsi84 + panel-lvds)
> 
>   Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v4:
> - Rebased on top of drm-misc-next, which has most of the dependencies
>    merged
> - Moved one dependency, "drm/bridge: cdns-dsi: Fix the _atomic_check()"
>    into this series
> - Dropped "drm/tidss: Adjust the pclk based on the HW capabilities".
>    This causes a regression with OLDI outputs, and is not strictly
>    required. Fixing this needs restructuring tidss clock handling.

Here upon further investigating the issue for OLDI, that caused this
patch to be dropped, I saw that it was due to the VP clock owned by
OLDI driver. It does not actually go into the determine_rate() call
like we would expect it to.

Tested on J784S4-EVM platform (along with the DSI support as posted in
https://lore.kernel.org/all/20250624082619.324851-1-j-choudhary@ti.com/)
I can see that display comes up for 800x600 and 1280x1024 resolution.


Tested-by: Jayesh Choudhary <j-choudhary@ti.com>


I observed that we still need something like drm_mode_set_crtcinfo()
to propagate correct crtc_* fields even when we do not call round_rate()
Since mode_fixup() is not preferred now, we need it in atomic_check()
like you had it in v3:[3/17]

I have posted a delta patch on top of this series:
https://lore.kernel.org/all/20250624080402.302526-1-j-choudhary@ti.com/
that doe sit and helps in further enabling other modes.

Warm Regards,
Jayesh



> - Link to v3: https://lore.kernel.org/r/20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com
> 
> Changes in v3:
> - Add Aradhya's "drm/bridge: cdns-dsi: Fix the _atomic_check()" to the
>    dependencies
> - The above patch from Aradhya allowed adding "drm/bridge: cdns-dsi:
>    Drop crtc_* code", which resulted in quite large changes in the
>    commits, even if the end result doesn't really differ.
> - Reordered commits to decrease back-and-forth (e.g. fixing something in
>    a a code that will be removed in the next commits)
> - The reordering caused quite big changes in the commits (even if the
>    final end result is more or less the same), so I chose not to add
>    tested-by tags.
> - Rename 'cdns_get_dphy_pll_cfg' to 'cdns_dphy_get_pll_cfg'
> - Use div_u64() instead of div64_u64()
> - Drop "Fail if HS rate changed when validating PHY config". This was
>    too strict, as clock rounding (especially with DRM's 1kHz
>    resolution...) leads to clock rates that do not match exactly.
>    However, the rate mismatch should be fine as the commits adjust the
>    pixel clock, and the resulting differences should be so small that we
>    can't even improve the timings match by adjusting the DSI HFP, as the
>    adjustment rounds to 0.
> - Link to v2: https://lore.kernel.org/r/20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com
> 
> Changes in v2:
> - Change the tidss clock adjustment from mode_fixup() to atomic_check()
> - Link to v1: https://lore.kernel.org/r/20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com
> 
> ---
> Aradhya Bhatia (1):
>        drm/bridge: cdns-dsi: Fix the _atomic_check()
> 
> Tomi Valkeinen (16):
>        drm/tidss: Fix missing includes and struct decls
>        drm/tidss: Use the crtc_* timings when programming the HW
>        phy: cdns-dphy: Store hs_clk_rate and return it
>        phy: cdns-dphy: Remove leftover code
>        drm/bridge: cdns-dsi: Remove extra line at the end of the file
>        drm/bridge: cdns-dsi: Drop crtc_* code
>        drm/bridge: cdns-dsi: Remove broken fifo emptying check
>        drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
>        drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
>        drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
>        drm/bridge: cdns-dsi: Adjust mode to negative syncs
>        drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
>        drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()
>        drm/bridge: cdns-dsi: Fix event mode
>        drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi needs
>        drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
> 
>   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 211 +++++++++++--------------
>   drivers/gpu/drm/tidss/tidss_crtc.c             |   2 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c            |  16 +-
>   drivers/gpu/drm/tidss/tidss_dispc.h            |   3 +
>   drivers/gpu/drm/tidss/tidss_drv.h              |   2 +
>   drivers/gpu/drm/tidss/tidss_plane.h            |   2 +
>   drivers/gpu/drm/tidss/tidss_scale_coefs.h      |   2 +
>   drivers/phy/cadence/cdns-dphy.c                |  24 ++-
>   8 files changed, 115 insertions(+), 147 deletions(-)
> ---
> base-commit: 261a603062a87bad0b54904c76dacb15fa126c74
> change-id: 20250320-cdns-dsi-impro-3d8fbd7848d1
> 
> Best regards,
