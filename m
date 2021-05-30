Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562C3951DE
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 17:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513B6E1BE;
	Sun, 30 May 2021 15:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FE56E13C;
 Sun, 30 May 2021 15:57:25 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 30 May 2021 08:57:25 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 May 2021 08:57:24 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 30 May 2021 21:26:31 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id DD66821481; Sun, 30 May 2021 21:26:29 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v5 0/5] drm: Support basic DPCD backlight in panel-simple and add a
 new panel ATNA33XC20
Date: Sun, 30 May 2021 21:26:07 +0530
Message-Id: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: daniel.thompson@linaro.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dianders@chromium.org, a.hajda@samsung.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the support for the eDP panel that needs the backlight
controlling over the DP AUX channel using DPCD registers of the panel
as per the VESA's standard.

This series also adds support for the Samsung eDP AMOLED panel that
needs DP AUX to control the backlight, and introduces new delays in the
@panel_desc.delay to support this panel.

This patch series depends on the following two series:
- Doug's series [1], exposed the DP AUX channel to the panel-simple.
- Lyude's series [2], introduced new drm helper functions for DPCD
  backlight.

This series is the logical successor to the series [3].

Changes in v1:
- Created dpcd backlight helper with very basic functionality, added
  backlight registration in the ti-sn65dsi86 bridge driver.

Changes in v2:
- Created a new DisplayPort aux backlight driver and moved the code from
  drm_dp_aux_backlight.c (v1) to the new driver.

Changes in v3:
- Fixed module compilation (kernel test bot).

Changes in v4:
- Added basic DPCD backlight support in panel-simple.
- Added support for a new Samsung panel ATNA33XC20 that needs DPCD
  backlight controlling and has a requirement of delays between enable
  GPIO and regulator.

Changes in v5:
Addressed review suggestions from Douglas:
- Created a new API drm_panel_dp_aux_backlight() in drm_panel.c
- Moved DP AUX backlight functions from panel-simple.c to drm_panel.c
- panel-simple probe() calls drm_panel_dp_aux_backlight() to create
  backlight when the backlight phandle is not specified in panel DT
  and DP AUX channel is present.
- Added check for drm_edp_backlight_supported() before registering.
- Removed the @uses_dpcd_backlight flag from panel_desc as this
  should be auto-detected.
- Updated comments/descriptions.  

[1] https://lore.kernel.org/dri-devel/20210525000159.3384921-1-dianders@chromium.org/
[2] https://lore.kernel.org/dri-devel/20210514181504.565252-1-lyude@redhat.com/
[3] https://lore.kernel.org/dri-devel/1619416756-3533-1-git-send-email-rajeevny@codeaurora.org/

Rajeev Nandan (5):
  drm/panel: add basic DP AUX backlight support
  drm/panel-simple: Support DP AUX backlight
  drm/panel-simple: Support for delays between GPIO & regulator
  dt-bindings: display: simple: Add Samsung ATNA33XC20
  drm/panel-simple: Add Samsung ATNA33XC20

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 drivers/gpu/drm/drm_panel.c                        | 108 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  67 +++++++++++++
 include/drm/drm_panel.h                            |  15 ++-
 4 files changed, 188 insertions(+), 4 deletions(-)

-- 
2.7.4

