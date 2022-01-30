Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120AE4A38D4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 20:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C35113820;
	Sun, 30 Jan 2022 19:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE49C11381A;
 Sun, 30 Jan 2022 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643572617; x=1675108617;
 h=from:to:cc:subject:date:message-id;
 bh=s2sELOnPb6T0JSF8MY6fuNvaeEGvsjr9oQdNpy6PSgE=;
 b=pHDa5+QKh/fAZWxGOQ3DOlmAbhGwgbAgWTQ0YOnoqQlm69S/zpOwBxTz
 HTkJZ8BtLex9ebgfA0PljQ6jpOu+w3ghO0POrdJ2PVeiys5d8X0IGKEL+
 CoH98+VUuH4qVlpQdRaF5giVozeCZHsQ8iKi1R1/a4n2TGrwDuxWJsY/8 w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 30 Jan 2022 11:56:57 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 Jan 2022 11:56:56 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 31 Jan 2022 01:26:30 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 4237D21ACE; Mon, 31 Jan 2022 01:26:29 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v4 0/3] drm/msm/dsi: Add 10nm dsi phy tuning configuration support 
Date: Mon, 31 Jan 2022 01:26:23 +0530
Message-Id: <1643572586-21331-1-git-send-email-quic_rajeevny@quicinc.com>
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

Different DSI PHY versions have different configurations to adjust the
drive strength, drive level, de-emphasis, etc. The current series has only
those configuration options supported by 10nm PHY, e.g. drive strength and
drive level. The number of registers to configure the drive strength are
different for 7nm PHY. The design can be extended to other DSI PHY versions
if required, as each PHY version can have its callback to get the input
from DT and prepare register values.

Changes in v2:
 - Addressed dt-bindings comments (Stephen Boyd, Dmitry Baryshkov)
 - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
 - Fix the backward compatibility (Dmitry Baryshkov)

Changes in v3:
 - Addressed dt-bindings comments (Rob Herring, Dmitry Baryshkov)
 - Address comments for phy tuning data structure (Dmitry Baryshkov)
 - s/ops.tuning_cfg_init/ops.parse_dt_properties (Dmitry Baryshkov)

Changes in v4:
 - Fixed dt_binding_check error (Rob Herring's bot)
 - Return error in case of out of range values (Dmitry Baryshkov)
 - Return error if dt property is present but parsing is failing


Rajeev Nandan (3):
  dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
  drm/msm/dsi: Add dsi phy tuning configuration support
  drm/msm/dsi: Add 10nm dsi phy tuning configuration support

 .../bindings/display/msm/dsi-phy-10nm.yaml         |  36 +++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   6 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         | 118 +++++++++++++++++++--
 4 files changed, 158 insertions(+), 6 deletions(-)

-- 
2.7.4

