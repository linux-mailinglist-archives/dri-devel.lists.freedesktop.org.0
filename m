Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA14E3771
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 04:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144C510E510;
	Tue, 22 Mar 2022 03:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2D510E506;
 Tue, 22 Mar 2022 03:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647919653; x=1679455653;
 h=from:to:cc:subject:date:message-id;
 bh=eT1svF+SG9LLkAZp1i+Qgs6GpeoPG3FN+cWM/MwUTCQ=;
 b=SOH9+h4kiZOJWejbbqO8dlwWvELrD1agcKFYU0jinfpIqj86fnuZ0mZO
 tzhHXJooLvnQAA7uFzEKKjG4RYmq1Sdax6BjzH5q8M0KXwuKgPJRAX7v7
 kSxFVutqPd9BJsMQZj8198R/rOm8kst1vNTDNV0fT5iiX2BYwO1YvjNP+ M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 20:27:33 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Mar 2022 20:27:31 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 22 Mar 2022 08:57:13 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 24007541F; Tue, 22 Mar 2022 08:57:13 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/5] Update mdp clk to max supported value to support
 higher refresh rates
Date: Tue, 22 Mar 2022 08:57:06 +0530
Message-Id: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the assigned clock rate property and vote on the mdp clock to
max frequency during bind/probe sequence.

Changes in v2:
- Remove assigned-clock-rate property and set mdp clk during
resume sequence.
- Add fixes tag.

Changes in v3:
- Remove extra line after fixes tag.(Stephen Boyd)
- Add similar changes for sc7180, sdm845 which uses opp table for
voting mdp clk.(Stephen Boyd)
- Drop patch: "drm/msm/disp/dpu1: set mdp clk to the maximum
frequency in opp table"

Changes in v4:
- Add similar change for sm8250.(Dmitry)

Changes in v5:
- Add change to set mdp clk to max frequency in opp table
during mdp probe/bind.

Changes in v6:
- Remove change log in dt patch.
- Fix the leak reference for opp by adding dev_pm_opp_put. (Dmitry)

Changes in v7:
- Update commit message and fix tag. (Stephen/Doug)

Vinod Polimera (5):
  drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table
    during probe
  arm64: dts: qcom: sm7280: remove assigned-clock-rate property for mdp
    clk
  arm64: dts: qcom: sm7180: remove assigned-clock-rate property for mdp
    clk
  arm64: dts: qcom: sdm845: remove assigned-clock-rate property for mdp
    clk
  arm64: dts: qcom: sm8250: remove assigned-clock-rate property for mdp
    clk

 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 9 ++-------
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 9 ++-------
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 9 ++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 9 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 5 files changed, 16 insertions(+), 28 deletions(-)

-- 
2.7.4

