Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39F65EA0E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1810E6ED;
	Thu,  5 Jan 2023 11:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 11043 seconds by postgrey-1.36 at gabe;
 Thu, 05 Jan 2023 11:37:44 UTC
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F4610E6ED
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:37:43 +0000 (UTC)
X-QQ-mid: bizesmtp73t1672907600t7kiowh9
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 05 Jan 2023 16:33:11 +0800 (CST)
X-QQ-SSF: 01400000000000C0N000000A0000000
X-QQ-FEAT: D2GZf6M6C/iCwLhI5s4pAMrmi3WaBAl8232OajtLA+18VBi+HhOkSrocauFMs
 FPY+2WP+fpkQ7ThDF3rVWoeFrwR1RcPBZOQVoaVf5Mk07xz1816dAz+kthCZhpAGDTXooy9
 AJDYGUmctSY6GAL8O0cbCtnrM2lcFMjACfPnDivoxiPNgMZ4hsoC4Kjj4BqhwNeZ/kW6GdW
 o+ELXD1SaWXQaytCqpCRZe8+pnRe6HZ9F9uk6UUZ9lTH/wZa90Eeq1HSZF5BOuKRN1WcC+P
 uTa+Dpfl4VqsFh7RU2tJfDHhhgaCGachH9l2KeaHqIhC9eg2efPaZYHxG6TAMpj8hxvL0Zg
 ev4VnH3dWQ0L9LznFzgSAmRsVHmLNIzrgW7sSllwr3nDKwIUJNRbi49Rp0Le+dONQ9Qwkny
 q5aRa0zFAUQ=
X-QQ-GoodBg: 1
From: Zhen Ni <nizhen@uniontech.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, airlied@gmail.com
Subject: [PATCH] drm: msm: Fix error check return value of
 irq_of_parse_and_map()
Date: Thu,  5 Jan 2023 16:33:06 +0800
Message-Id: <20230105083306.1638656-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr5
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
Cc: Zhen Ni <nizhen@uniontech.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202..3891d9d4a602 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1953,9 +1953,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
+	if (!msm_host->irq) {
+		ret = -EINVAL;
+		dev_err(&pdev->dev, "failed to get irq\n");
 		return ret;
 	}
 
-- 
2.20.1

