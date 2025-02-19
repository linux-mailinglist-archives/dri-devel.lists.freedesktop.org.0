Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D4A3B3E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 09:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B2610E485;
	Wed, 19 Feb 2025 08:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="PJG0W018";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 973 seconds by postgrey-1.36 at gabe;
 Wed, 19 Feb 2025 04:23:52 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24B7810E195;
 Wed, 19 Feb 2025 04:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=up4oV
 Pi+blECBbrnd4T1e6VKTPf3P8EZCAss6qkrV/0=; b=PJG0W018kemkmYJXkR3jD
 ijqMuKCb7r0I0Zde4PsxuxoRVUVBivHiMnCM4cSVGB8rNF6ngN5K1RPpoPvdTdrn
 PabrRoYCA+ypoyrktG5sSIsS7D1otVJBpZL+XmiuZ9OEk9IJ2bP7PYrAgtNNZCJG
 3vHrqu3UR2M/3AwDx/Paeg=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAHiij0WLVnLIlmNA--.661S4;
 Wed, 19 Feb 2025 12:07:17 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 jonathan@marek.ca, quic_jesszhan@quicinc.com, konradybcio@kernel.org,
 haoxiang_li2024@163.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Date: Wed, 19 Feb 2025 12:07:12 +0800
Message-Id: <20250219040712.2598161-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAHiij0WLVnLIlmNA--.661S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw13Ww47WFWkJry8XF4rGrg_yoWDCFb_uF
 yqqrnxXrsIyFsrKa4jyF1IyrW2kan0gF4rZ3W8tasay34jqr1FqwnavrZYvr4qvr18JF92
 kanFqF15XrsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuBTYDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkBT4bme1Uc0AhgABsb
X-Mailman-Approved-At: Wed, 19 Feb 2025 08:31:48 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add check for the return value of devm_kstrdup() in
dsi_host_parse_dt() to catch potential exception.

Fixes: 958d8d99ccb3 ("drm/msm/dsi: parse vsync source from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fda..6dd1e10d8014 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1827,8 +1827,15 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 			__func__, ret);
 		goto err;
 	}
-	if (!ret)
+	if (!ret) {
 		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
+		if (!msm_dsi->te_source) {
+			DRM_DEV_ERROR(dev, "%s: failed to allocate te_source\n",
+				__func__);
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
 	ret = 0;
 
 	if (of_property_present(np, "syscon-sfpb")) {
-- 
2.25.1

