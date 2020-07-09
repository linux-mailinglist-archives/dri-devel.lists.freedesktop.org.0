Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554821A86D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 22:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC2C6EB20;
	Thu,  9 Jul 2020 20:01:52 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817D46EB2A
 for <dri-devel@freedesktop.org>; Thu,  9 Jul 2020 20:01:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594324911; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PNOP+bZPHesDULINFSwcTHhksYZyEMphqAZ0RdLbWck=;
 b=Kpd0zzIS4pE8i2kHE606CBiHizl4CWmHeZnKTSsTMT9nV8eP3uy+fy/1mcXVcNA0YN3kTtPW
 mmv8yMNLmogPvauxUwVXl6IP/LQH2e2RKQWejTD//xmujBIiYVuMwoZINVxq5SkESwTefBn4
 D544UX1n2Aj24SnGqWSP28CFbik=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f07777355886724ff430623 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:00:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 34475C43395; Thu,  9 Jul 2020 20:00:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 068C8C433C8;
 Thu,  9 Jul 2020 20:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 068C8C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/7] Add support for GPU DDR BW scaling
Date: Fri, 10 Jul 2020 01:30:20 +0530
Message-Id: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, jonathan@marek.ca, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 viresh.kumar@linaro.org, sibis@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is mostly a rebase of Sharat's patches [1] on the tip of msm-next branch.
Changes compared to v3:
	1. Rebased on top of Jonathan's patch which adds support for changing
	gpu freq through hfi on newer targets. Created patch 1 to make
	this the generic approach of setting gpu freq on newer targets.
	2. As suggested by Rob, left the icc_path intact for pre-a6xx
	GPUs.

As mentioned in [1], these patches have dependency on Georgi's series from
opp/linux-next [2] and also Sibi's patch which adds a helper function to
set and clear ddr bandwidth vote [2].

[1] https://patchwork.freedesktop.org/series/75291/
[2] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/

Akhil P Oommen (1):
  drm: msm: a6xx: set gpu freq through hfi

Sharat Masetty (6):
  dt-bindings: drm/msm/gpu: Document gpu opp table
  drm: msm: a6xx: send opp instead of a frequency
  drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
  arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
  arm64: dts: qcom: sc7180: Add interconnects property for GPU
  arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

 .../devicetree/bindings/display/msm/gpu.txt        |  28 ++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 105 +++++++++++----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   3 +-
 7 files changed, 106 insertions(+), 53 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
