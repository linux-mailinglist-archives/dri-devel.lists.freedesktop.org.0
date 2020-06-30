Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28D20F3ED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 13:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE576E0F1;
	Tue, 30 Jun 2020 11:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034556E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:56:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593518215; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SmYTLnNpkoDIf6PQYp/bYgNnjLKYi/RBNugVXmRrIRU=;
 b=ER7FjP7FxVw0xT564XqJF3ZI3ppKcYOJGxIzwSTQe57R/HGBHOWIhaMaZO59CjYQCUvmIlq6
 V+1HMgRaP1t7RmIiUibZ556LtSHVf34bJ8ILNYPzwUxqpPqcF72Q8PEIdlcYzBRin7yN8UWx
 sYnxpVP2LGs6MhZi49RbctwbDPs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-west-2.postgun.com with SMTP id
 5efb287d5866879c76e01fec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 11:56:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 87BFAC4339C; Tue, 30 Jun 2020 11:56:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 30920C433C6;
 Tue, 30 Jun 2020 11:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30920C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
 bjorn.andersson@linaro.org
Subject: [PATCH 0/4] DVFS support for dpu and dsi
Date: Tue, 30 Jun 2020 17:26:12 +0530
Message-Id: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
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

These patches add DVFS support for DPU and DSI. Where posted
earlier as part of a series with multiple different drivers [1]
I have split them into specific driver changes in order to avoid
confusion on dependencies. Also added the corresponding device tree
changes for sdm845 and sc7180 platforms.

These patches have no other dependency and will need to be merged in
via the MSM DRM tree.

DT patches will need to land via the msm tree.

[1] https://lkml.org/lkml/2020/6/15/535

Rajendra Nayak (4):
  drm/msm/dpu: Use OPP API to set clk/perf state
  drm/msm: dsi: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add DSI and MDP OPP tables and power-domains
  arm64: dts: sc7180: Add DSI and MDP OPP tables and power-domains

 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 49 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 59 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 26 +++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++
 drivers/gpu/drm/msm/dsi/dsi.h                 |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 58 ++++++++++++++++++++++++++
 8 files changed, 201 insertions(+), 4 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
