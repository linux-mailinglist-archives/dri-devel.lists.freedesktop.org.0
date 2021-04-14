Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6035FB6A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 21:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1C26E4DE;
	Wed, 14 Apr 2021 19:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D536E4B0;
 Wed, 14 Apr 2021 16:47:29 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 09:41:25 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Apr 2021 09:41:24 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 22:10:49 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id DA47121351; Wed, 14 Apr 2021 22:10:47 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 0/3] drm: Add support for backlight control of eDP panel on
 ti-sn65dsi86 bridge
Date: Wed, 14 Apr 2021 22:09:47 +0530
Message-Id: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 14 Apr 2021 19:14:23 +0000
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
Cc: mkrishn@codeaurora.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The backlight level of an eDP panel can be controlled through the AUX
channel using DPCD registers of the panel.

The capability for the Source device to adjust backlight characteristics
within the panel, using the Sink device DPCD registers is indicated by
the TCON_BACKLIGHT_ADJUSTMENT_CAPABLE bit in the EDP_GENERAL_CAPABILITY_1
register (DPCD Address 701h, bit0). In this configuration, the eDP TCON
receives the backlight level information from the host, through the AUX
channel.

The changes in this patch series do the following:
- Add drm_dp_aux_backlight_ APIs to support backlight control using DPCD
  registers on the DisplayPort AUX channel.
  The current version only supports backlight brightness control by the
  EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB registers (DPCD Addresses 722h-723h).
- Add support for backlight control of the eDP panel connected to the
  ti-sn65dsi86 bridge.

Rajeev Nandan (3):
  drm/dp: Add DisplayPort aux backlight control support
  dt-bindings: drm/bridge: ti-sn65dsi86: Document use-aux-backlight
  drm/bridge: ti-sn65dsi86: Add DisplayPort aux backlight support

 .../bindings/display/bridge/ti,sn65dsi86.yaml      |   8 +
 drivers/gpu/drm/Kconfig                            |   8 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  26 +++
 drivers/gpu/drm/drm_dp_aux_backlight.c             | 191 +++++++++++++++++++++
 include/drm/drm_dp_aux_backlight.h                 |  29 ++++
 7 files changed, 264 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dp_aux_backlight.c
 create mode 100644 include/drm/drm_dp_aux_backlight.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
