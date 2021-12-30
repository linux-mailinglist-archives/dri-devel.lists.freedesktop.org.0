Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B7481E8C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D28C10E2CA;
	Thu, 30 Dec 2021 17:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44810E338;
 Thu, 30 Dec 2021 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640856321; x=1672392321;
 h=from:to:cc:subject:date:message-id;
 bh=BpEobsZ/b/K/3YVxXHJaiZChYj2QRS7Lv13kRYuC46o=;
 b=LHC9J6/Wr+ndAwbDI8+2Z8UKYDt/RyW4Evog94+yMT/K/Vcdw9j5RMxl
 BWSyKNlLN9Vr2YCxIvQlO4oCjiq3Alw6b5vm+chbkWg44hTScC+dA206R
 6z8hgg9eqHu3moJm/53qnL/k1SnDLBWvrRyOOfAK/sqIi5H5A2V27S+Wo k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 30 Dec 2021 01:25:21 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 Dec 2021 01:25:19 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 30 Dec 2021 14:54:56 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id B7F3B21A28; Thu, 30 Dec 2021 14:54:54 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 0/2] drm/msm/dsi: Add 10nm dsi phy tuning configuration support
Date: Thu, 30 Dec 2021 14:54:34 +0530
Message-Id: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is to add DSI PHY tuning support in Qualcomm Snapdragon
SoCs with 10nm DSI PHY e.g. SC7180

In most cases the default values of DSI PHY tuning registers
should be sufficient as they are fully optimized. However, in
some cases (for example, where extreme board parasitics cause
the eye shape to degrade), the override bits can be used to
improve the signal quality.

As per the MSM DSI PHY (10nm) tuning guideline, the drive strength
can be adjusted using DSIPHY_RESCODE_OFFSET_TOP & DSIPHY_RESCODE_OFFSET_BOT
registers, and the drive level can be adjusted using DSIPHY_CMN_VREG_CTRL
register.

Add DSI PHY tuning support for 10nm PHY. This can be extended to other
DSI PHY versions if needed. Number of registers to configure the PHY
tuning per lane can be different for different versions of the DSI PHY.
I tried to make it generic so that it can be extended to other versions.

Rajeev Nandan (2):
  dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
  drm/msm/dsi: Add 10nm dsi phy tuning configuration support

 .../bindings/display/msm/dsi-phy-10nm.yaml         | 19 ++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              | 55 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              | 23 +++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         | 31 +++++++++---
 4 files changed, 122 insertions(+), 6 deletions(-)

-- 
2.7.4

