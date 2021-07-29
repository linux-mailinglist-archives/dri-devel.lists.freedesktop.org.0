Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17053DAC1D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC12E6EE27;
	Thu, 29 Jul 2021 19:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A456EE27
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 19:51:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627588304; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iM1KdIaqnabu/y7ApCsLdG5yOlR2tEATwMcy7eTsEI0=;
 b=F4+OCRDH6LxncG1hXz6vQLNpPNfGvWz3Z6bIypqbp2LOnRsAIJIgrlklgEcpAvJiHTJ1ubAo
 1KtS7o0HYT1UM+WuhXGf2vJ55i+bzP3d9jMKoINyKk6o0yYUU+tuHOhChy0HdrafubFISC47
 7lf5pVvQEYkPsykHo9lErSinrLg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 610306cae81205dd0ae745df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 19:51:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29AE8C4338A; Thu, 29 Jul 2021 19:51:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44EE7C4338A;
 Thu, 29 Jul 2021 19:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44EE7C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v4 0/3] Support Adreno 7c Gen 3 gpu
Date: Fri, 30 Jul 2021 01:21:22 +0530
Message-Id: <1627588286-30520-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Matthias Kaehlcke <mka@chromium.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the gpu found in the Snapdragon 7c Gen 3
compute platform. This gpu is similar to the exisiting a660 gpu with
minor delta in the programing sequence. As the Adreno GPUs are moving
away from a numeric chipid based naming scheme to a string, it was
decided to use 0x06030500 as the chip id of this gpu to communicate
to the userspace driver.

Changes in v4:
- Move adreno_cmp_rev() to patch-2/3 to fix compilation
- Minor updates to commit msg (Rob)

Changes in v3:
- Add a cover letter.

Changes in v2:
- Use rev to identify SKU
- Introduce adreno_is_a660_family() (Rob)
- Remove revn for 7c3 (Rob)
- Remove CPR register programing since they are not required for 7c3

Akhil P Oommen (3):
  drm/msm/a6xx: Fix llcc configuration for a660 gpu
  drm/msm/a6xx: Use rev to identify SKU
  drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  8 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 87 ++++++++++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 32 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 27 +++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 18 ++++++-
 6 files changed, 129 insertions(+), 44 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

