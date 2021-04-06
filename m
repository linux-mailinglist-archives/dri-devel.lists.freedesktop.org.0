Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C85B354CD4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E76E89B12;
	Tue,  6 Apr 2021 06:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369EC89220;
 Tue,  6 Apr 2021 05:10:20 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:19 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 22:10:18 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:39:58 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 7B1C021B31; Tue,  6 Apr 2021 10:39:56 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/4] Add display support for SC7280 target 
Date: Tue,  6 Apr 2021 10:39:48 +0530
Message-Id: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The changes in this series adds all the required support for display driver for
SC7280 target. In addition to the basic catalog changes, changes are added to
accommodate new registers for SC7280 target.

SC7280 target comes under next generation targets. The register differences in
SC7280 when compared to SC7180 are mentioned below:

        - SC7280 uses UBWC3.0 and changes are added to program the ubwc static
          registers properly

        - Pingpong dither block offset value has changed for SC7280 family. Separate
          sub block is defined for sc7280 pingpong block and changes are added to
          handle this.

        - Interface offsets are different for SC7280 family. These offset values are
          used to access the interface irq registers. Changes are added to handle
          this based on the target.

        - A new register called CTL_FETCH_PIPE_ACTIVE is introduced in SC7280 family,
          which tells the HW about the active pipes in the CTL path. Changes are
          added to program this register based on the active pipes in the
          current composition.

        - Changes are added to program INTF_CONFIG2 properly since the reset value
          of this register has changed in SC7280 family and we need to explicitly program
          it with correct values to avoid wrong interface configuration.

        - INTF_5 is added to intf configuration to support EDP.

Krishna Manikandan (4):
  drm/msm/disp/dpu1: add support for display for SC7280 target
  drm/msm/disp/dpu1: add intf offsets for SC7280 target
  drm/msm/disp/dpu1: add support to program fetch active in ctl path
  drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 176 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        |  27 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c          |   6 +-
 drivers/gpu/drm/msm/msm_drv.c                     |   4 +-
 10 files changed, 242 insertions(+), 24 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
