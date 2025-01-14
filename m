Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF20DA10093
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 06:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97310E865;
	Tue, 14 Jan 2025 05:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rZuguoyc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 50953 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2025 05:56:47 UTC
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ad])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781C410E862
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 05:56:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736834204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zwWUpKykf7XyqFHnTCmMtGNl2LQuU6IaLs3orRVZ/+g=;
 b=rZuguoyc4MioDVcTVCcWYN8hgxtm/ALpOnZwgtqwE7dVh4Y4DcuM8TdfKc2YKGb3R7vlqC
 +T9VKzCinNeCQAXq2WPVr9lu65sx+QLzlRtyiqApJvVxt7dJTRsrto3cvplcuoUVnUuPGh
 UBgZQfatOmhWiC3uv9KgC6rorLUHUUE=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v7 00/12] drm/bridge: cdns-dsi: Fix the color-shift issue
Date: Tue, 14 Jan 2025 11:26:14 +0530
Message-Id: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hello all,

This series provides some crucial fixes and improvements for the Cadence's DSI
TX (cdns-dsi) controller found commonly in Texas Instruments' J7 family of SoCs,
as well as in Sitara AM62P and AM62L SoCs.

Along with that, this series aims to fix the color-shift issue that has been
going on with the DSI controller. This controller requires to be enabled before
the previous entity enables its stream[0]. It's a strict requirement which, if
not followed, causes the colors to "shift" on the display. The fix happens in
2 steps.

    1. The bridge pre_enable calls have been shifted before the crtc_enable and
       the bridge post_disable calls have been shifted after the crtc_disable.
       This has been done as per the definition of bridge pre_enable.

       "The display pipe (i.e. clocks and timing signals) feeding this bridge
       will not yet be running when this callback is called".

       Since CRTC is also a source feeding the bridge, it should not be enabled
       before the bridges in the pipeline are pre_enabled.

       The sequence of enable after this patch will look like:

	        bridge[n]_pre_enable
	        ...
	        bridge[1]_pre_enable

	        crtc_enable
	        encoder_enable

	        bridge[1]_enable
	        ...
	        bridge[n]_enable

       and vice-versa for the bridge chain disable sequence.


    2. The cdns-dsi enable / disable sequences have now been moved to pre_enable
       and post_disable sequences. This is the only way to have cdns-dsi drivers
       be up and ready before the previous entity is enables its streaming.

The DSI also spec requires the Clock and Data Lanes be ready before the DSI TX
enables its stream[0]. A patch has been added to make the code wait for that to
happen. Going ahead with further DSI (and DSS configuration), while the lanes
are not ready, has been found to be another reason for shift in colors.

These patches have been tested with J721E based BeagleboneAI64 along with a
RaspberryPi 7" DSI panel. The extra patches can be found in the
"next_dsi-v7_1_tests" branch of my github fork[1] for anyone who would like
to test them.

Thanks,
Aradhya


* Important note about the authorship of patches *

All the patches in the previous revisions of this series, as well as a majority
of this revision too have been authored when I owned a "ti.com" based email id,
i.e. <a-bhatia1@ti.com>. This email id is not in use anymore, and all the work
done later has been part of my personal work. Since the original patches were
authored using TI's email id, I have maintained the original authorships as they
are, as well as their sign offs.

I have further added another another sign off that uses my current (and
personal) email id, the one that is being used to send this revision,
i.e. <aradhya.bhatia@linux.dev>.


[0]: Section 12.6.5.7.3: "Start-up Procedure" [For DSI TX controller]
     in TDA4VM Technical Reference Manual https://www.ti.com/lit/zip/spruil1

[1]: https://github.com/aradhya07/linux-ab/tree/next_dsi-v7_1_tests


Change Log:
  - Changes in v7:
    - phy_init()/exit() were called from the PM path in v6. Change it back to
      the bridge enable/disable path in patch-3, so that the phy_init() can go
      back to being called after D-Phy reset assert.
    - Reword commit text in patch-5 to explain the need of the fix.
    - Drop the stray code in patch-10.
    - Add R-b tag of Dmitry Baryshkov in patch-6.

  - Changes in v6:
    - Reword patch 3 to better explain the fixes around phy de-init.
    - Fix the Lane ready timeout condition in patch 7.
    - Fix the dsi _bridge_atomic_check() implementation by adding a new
      bridge state structure in patch 10.
    - Rework and combine patches v5:11/13 and v5:12/13 to v6:11/12.
    - Generate the patches of these series using the "patience" algorithm.
      Note: All patches, except v6:11/12, *do not* differ from their default
      (greedy) algorithm variants.
      For patch 11, the patience algorithm significantly improves the readability.
    - Rename and move the Bridge enable/disable enums from public to private
      in patch 11.
    - Add R-b tags of Tomi Valkeinen in patch 6, and Dmitry Baryshkov in patch 2.

  - Changes in v5:
    - Fix subject and description in patch 1/13.
    - Add patch to check the return value of
      phy_mipi_dphy_get_default_config() (patch: 6/13).
    - Change the Clk and Data Lane ready timeout from forever to 5s.
    - Print an error instead of calling WARN_ON_ONCE in patch 7/13.
    - Drop patch v4-07/11: "drm/bridge: cdns-dsi: Reset the DCS write FIFO".
      There has been some inconsistencies found with this patch upon further
      testing. This patch was being used to enable a DSI panel based on ILITEK
      ILI9881C bridge. This will be debugged separately.
    - Add patch to move the DSI mode check from _atomic_enable() to
      _atomic_check() (patch: 10/13).
    - Split patch v4-10/11 into 2 patches - 11/13 and 12/13.
      Patch 11/13 separates out the Encoder-Bridge operations into a helper
      function *without* changing the logic. Patch 12/13 then changes the order
      of the encoder-bridge operations as was intended in the original patch.
    - Add detailed comment for patch 13/13.
    - Add Tomi Valkeinen's R-b in patches 1, 2, 4, 5, 7, 8, 9, 13.

  - Changes in v4:
    - Add new patch, "drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()",
      to update to an auto-managed way of finding next bridge in the chain.
    - Drop patch "drm/bridge: cdns-dsi: Fix the phy_initialized variable" and
      add "drm/bridge: cdns-dsi: Fix Phy _init() and _exit()" that properly
      de-initializes the Phy and maintains the initialization state.
    - Reword patch "drm/bridge: cdns-dsi: Reset the DCS write FIFO" to explain
      the HW concerns better.
    - Add R-b tag from Dmitry Baryshkov for patches 1/11 and 8/11.

  - Changes in v3:
    - Reword the commit message for patch "drm/bridge: cdns-dsi: Fix OF node
      pointer".
    - Add a new helper API to figure out DSI host input pixel format
      in patch "drm/mipi-dsi: Add helper to find input format".
    - Use a common function for bridge pre-enable and enable, and bridge disable
      and post-disable, to avoid code duplication.
    - Add T-b tag from Dominik Haller in patch 5/10. (Missed to add it in v2).
    - Add R-b tag from Dmitry Baryshkov for patch 8/10.

  - Changes in v2:
    - Drop patch "drm/tidss: Add CRTC mode_fixup"
    - Split patch "drm/bridge: cdns-dsi: Fix minor bugs" into 4 separate ones
    - Drop support for early_enable/late_disable APIs and instead re-order the
      pre_enable / post_disable APIs to be called before / after crtc_enable /
      crtc_disable.
    - Drop support for early_enable/late_disable in cdns-dsi and use
      pre_enable/post_disable APIs instead to do bridge enable/disable.


Previous versions:

v1: https://lore.kernel.org/all/20240511153051.1355825-1-a-bhatia1@ti.com/
v2: https://lore.kernel.org/all/20240530093621.1925863-1-a-bhatia1@ti.com/
v3: https://lore.kernel.org/all/20240617105311.1587489-1-a-bhatia1@ti.com/
v4: https://lore.kernel.org/all/20240622110929.3115714-1-a-bhatia1@ti.com/
v5: https://lore.kernel.org/all/20241019195411.266860-1-aradhya.bhatia@linux.dev/
v6: https://lore.kernel.org/all/20250111192738.308889-1-aradhya.bhatia@linux.dev/


Aradhya Bhatia (12):
  drm/bridge: cdns-dsi: Fix connecting to next bridge
  drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
  drm/bridge: cdns-dsi: Fix phy de-init and flag it so
  drm/bridge: cdns-dsi: Fix the link and phy init order
  drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
  drm/bridge: cdns-dsi: Check return value when getting default PHY
    config
  drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
  drm/mipi-dsi: Add helper to find input format
  drm/bridge: cdns-dsi: Support atomic bridge APIs
  drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()
  drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
  drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable

 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 218 ++++++++++---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |   2 -
 drivers/gpu/drm/drm_atomic_helper.c           | 300 +++++++++++-------
 drivers/gpu/drm/drm_mipi_dsi.c                |  37 +++
 include/drm/drm_mipi_dsi.h                    |   1 +
 5 files changed, 386 insertions(+), 172 deletions(-)


base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
-- 
2.34.1

