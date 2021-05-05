Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8786737365A
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D086E44B;
	Wed,  5 May 2021 08:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Wed, 05 May 2021 08:23:23 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF256E0C6;
 Wed,  5 May 2021 08:23:23 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 05 May 2021 01:17:20 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 May 2021 01:17:18 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 05 May 2021 13:46:46 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 4449221D5B; Wed,  5 May 2021 13:46:45 +0530 (IST)
From: Sankeerth Billakanti <sbillaka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
Date: Wed,  5 May 2021 13:46:16 +0530
Message-Id: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 05 May 2021 08:34:34 +0000
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
Cc: mkrishn@codeaurora.org, dianders@chromium.org, abhinavk@codeaurora.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, Sankeerth Billakanti <sbillaka@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches add support for the next generation eDP driver on SnapDragon
with dpu support. The existing eDP driver cannot support the new eDP
hardware. So, to maintain backward compatibility, the older eDP driver is
moved to v200 folder and the new generation eDP driver is added in
the v510 folder.

These are baseline changes with which we can enable display. The new eDP
controller can also support additional features such as backlight control,
PSR etc. which will be enabled in subsequent patch series.

Summary of changes:
DPU driver interface to the new eDP v510 display driver.
New generation eDP controller and phy driver implementation.
A common interface to choose enable the required eDP driver.

Sankeerth Billakanti (3):
  drm/msm/edp: support multiple generations of edp hardware
  drm/msm/edp: add support for next gen edp
  drm/msm/disp/dpu1: add support for edp encoder

 drivers/gpu/drm/msm/Makefile                      |   19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
 drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
 drivers/gpu/drm/msm/edp/edp.h                     |   78 -
 drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
 drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
 drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
 drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
 drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
 drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375 ------------------
 drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
 drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
 drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
 drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375 ++++++++++++++++++
 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
 drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583 +++++++++++++++++++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
 29 files changed, 6207 insertions(+), 2643 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
 create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h

-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
