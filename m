Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621F219EA9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 13:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BC26E08A;
	Thu,  9 Jul 2020 11:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FD46E08A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 11:05:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594292702; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jsDFDs4zDabaEWDbeRx/lyIO/1u6Uzt/XQpS5ikRQHw=;
 b=vMXUuSrBtSyPn0c6y1/CY/HzvZYgo+Apr5rIWSrfdZbK7rxAYMtnjpcxN7XKhagczPmJvuLT
 sJVhFc/+CeBGlAIJ4y12MZZ2jNWY1TKQKgEjBFVhnITJp8Bs6Z19VlKDO1QNZmbBqoKnDDuJ
 IP2n80bqIvmEYjWXghUM6YEBtfE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f06f9dc0082b278484937f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 11:05:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EEE1AC433CA; Thu,  9 Jul 2020 11:04:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 83C1DC433C6;
 Thu,  9 Jul 2020 11:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83C1DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
 bjorn.andersson@linaro.org
Subject: [PATCH v3 0/4] DVFS support for dpu and dsi
Date: Thu,  9 Jul 2020 16:34:30 +0530
Message-Id: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mka@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v3
- Added dev_pm_opp_put_clkname() in the error path

Changes in v2
- Patch 2: Dropped dsi_link_clk_set_rate_6g_v2 and dsi_link_clk_disable_6g_v2 as suggested by Matthias

These patches add DVFS support for DPU and DSI.

These patches have no other dependency. Patch 1 and 2 will need to be merged in
via the MSM DRM tree.

DT patches will need to land via the msm tree.

Rajendra Nayak (4):
  drm/msm/dpu: Use OPP API to set clk/perf state
  drm/msm: dsi: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add DSI and MDP OPP tables and power-domains
  arm64: dts: sc7180: Add DSI and MDP OPP tables and power-domains

 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 49 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 59 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 27 +++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 27 +++++++++++-
 6 files changed, 165 insertions(+), 4 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
