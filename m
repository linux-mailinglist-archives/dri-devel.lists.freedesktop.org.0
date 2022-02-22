Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B727C4BEEF2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 02:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E01A10E5D5;
	Tue, 22 Feb 2022 01:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E32210E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 01:35:55 +0000 (UTC)
Received: from localhost.localdomain (abxh33.neoplus.adsl.tpnet.pl [83.9.1.33])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 27A8C3F5D8;
 Tue, 22 Feb 2022 02:26:45 +0100 (CET)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [RFC PATCH] drm/msm/dpu1: Add a common DPU1 compatible
Date: Tue, 22 Feb 2022 02:26:37 +0100
Message-Id: <20220222012638.6650-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@somainline.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is *almost no reason* to keep separate compatibles for different
SoCs utilizing the DPU1 driver, as it checks the HW version at runtime.

Introduce a common compatible, while not removing the old ones to keep
old DT compatibility.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Bar some very very very unlikely edge cases (such as need for some random
quick being applied to one SoC from a family that shares DPU hw rev, but
not the others, there is little to no reason to keep adding compatibles
that don't mean anything.

If this change is cool, then the question about what to do with
dt-bindings arises...

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..335018542a3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1348,6 +1348,9 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,dpu1" },
+
+	/* Legacy compatibles for old DTs */
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
 	{ .compatible = "qcom,sc7280-dpu", },
-- 
2.35.1

