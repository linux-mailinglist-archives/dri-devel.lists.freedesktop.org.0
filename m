Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D6354CCE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FF26E5C6;
	Tue,  6 Apr 2021 06:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A0289F55;
 Tue,  6 Apr 2021 06:02:02 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 23:02:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 23:01:59 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 11:31:39 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 0459B21B31; Tue,  6 Apr 2021 11:31:37 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/3] Add irq support to accommodate SC7280 target 
Date: Tue,  6 Apr 2021 11:31:32 +0530
Message-Id: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
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

The changes in this series adds all the irq related changes which are needed to
support EDP interface coming on sc7280 target.

Changes in this series:
        - Currently each interrupt register has a range of 32 indexes only.
          But with the introduction of VSYNC and UNDERRUN irq for INTF_5,
          the number of irqs under INTR_STATUS will exceed this value.
          Increase the range of each interrupt register to 64 indexes
          to handle this.

        - Changes are added to enable the vsync and underrun irqs for INTF_5 which
          is required for edp panel.

        - Some irqs which are applicable for sdm845 target are obsolete for sc7180
          and sc7280 targets. Support is added to skip all the obsolete irqs based on
          the target.

Krishna Manikandan (3):
  drm/msm/disp/dpu1: increase the range of interrupts in dpu_irq_map
  drm/msm/disp/dpu1: add vsync and underrun irqs for INTF_5
  drm/msm/disp/dpu1: add flags to indicate obsolete irqs

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 773 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   5 +-
 5 files changed, 692 insertions(+), 101 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
