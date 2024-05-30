Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A68D48B1
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8211B1B7;
	Thu, 30 May 2024 09:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="pClAn1Rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F58911ABA3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:36:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U9aMF2030955;
 Thu, 30 May 2024 04:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717061782;
 bh=UN1L18c2L70RVnj8ty7PuC8IR8Rs+mPpa5aDuyktMpg=;
 h=From:To:CC:Subject:Date;
 b=pClAn1Rj4YALL0PcWoUPmG04wgM4LU9372Q64G+JzC6W4vU7sIoZGe30W4p8pHhI3
 eCAcGCKZpccOd7McufbVRXRsBPCB9Fb6Jc8OY4ytbbqSxXhYdy0BJQqK9HnKUY/f28
 8bMQgtTQrGkx5L4H1YvUx2rhFFND8hjPguY//Fuk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U9aMcZ020157
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 04:36:22 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:36:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:36:22 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U9aLSU000389;
 Thu, 30 May 2024 04:36:22 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Thierry
 Reding <treding@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh
 Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v2 0/9] drm/bridge: cdns-dsi: Fix the color-shift issue
Date: Thu, 30 May 2024 15:06:12 +0530
Message-ID: <20240530093621.1925863-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
TX (cdns-dsi) controller found commonly in Texas Instruments' J7 family of SoCs
as well as in AM62P.

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

All these patches have been tested on TI's vendor tree kernel with more devices,
but for the mainline, these patches have been tested with J721E based
BeagleboneAI64 along with a RaspberryPi 7" DSI panel. The extra patches can be
found in the "next_dsi-v2-tests" branch of my github fork[1] for anyone who
would like to test them.

Thanks,
Aradhya


[0]: Section 12.6.5.7.3: "Start-up Procedure" [For DSI TX controller]
     in TDA4VM Technical Reference Manual https://www.ti.com/lit/zip/spruil1

[1]: https://github.com/aradhya07/linux-ab/tree/next_dsi-v2-tests

Change Log:

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

Aradhya Bhatia (9):
  drm/bridge: cdns-dsi: Fix OF node pointer
  drm/bridge: cdns-dsi: Fix the phy_initialized variable
  drm/bridge: cdns-dsi: Fix the link and phy init order
  drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
  drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
  drm/bridge: cdns-dsi: Reset the DCS write FIFO
  drm/bridge: cdns-dsi: Support atomic bridge APIs
  drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
  drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable

 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 91 ++++++++++++++-----
 drivers/gpu/drm/drm_atomic_helper.c           | 70 +++++++++++++-
 2 files changed, 135 insertions(+), 26 deletions(-)


base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
-- 
2.34.1

