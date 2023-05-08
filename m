Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05076FB847
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 22:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EC010E2F2;
	Mon,  8 May 2023 20:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7415910E2F2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 20:27:42 +0000 (UTC)
Received: from [192.168.178.23] (unknown [62.108.10.64])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id E7CE8C6FC8;
 Mon,  8 May 2023 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1683577630; bh=i3ziI4n/VJMkmN4CQuT4LcsoHjXnkwxHSzv/FcCqPXM=;
 h=From:Date:Subject:To:Cc;
 b=Lpt3AKszZNsZgGyv7T9VdUROwSWU85GxH0HVFkBkANe5BOYAFV4RmKJipoj3Ogm15
 0z6wR3RzmvhN6cUpJcf2yPeQ4HPXOwAnvIiQ1pn9X+DOs8KQLYgcXwAhWwh7Zq9/hw
 jslEgVoSMvEVROnCC0VYTi17KyeipBUQ35ayY9xw=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 08 May 2023 22:26:45 +0200
Subject: [PATCH] drm/msm/iommu: Fix null pointer dereference in no-IOMMU case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230508-6-4-drm-msm-iommu-fixup-v1-1-a7a21ec94f5b@z3ntu.xyz>
X-B4-Tracking: v=1; b=H4sIAARbWWQC/x3Nyw6CMBCF4Vchs3ZIiwVbX8W46GWUWZRCG4yG8
 O4Wln9yvpwNCmWmAvdmg0wfLpymGvLSgB/t9CbkUBs60V1FLzQOqDDkiLFE5BTjii/+rjMaI7X
 xoTfSOqja2ULosp38ePjFp9Noc1M4tKr9HaM5U9Xn/eO573+NpZaEjgAAAA==
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=i3ziI4n/VJMkmN4CQuT4LcsoHjXnkwxHSzv/FcCqPXM=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkWVsH76PYisOQFUw10ifIhqeDXbL1+/ISX76uE
 6m6P7wwmXSJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZFlbBwAKCRBy2EO4nU3X
 VvTXEAClT70XPbhJ6yBBJ/+8UOrhJ4gbYP8+CjIS1sKARyCu773chJmc2sOglCnrIMnT332moyT
 3KJiRgKgUpx+6dz/Jx+a8VxkCx9WkC8X3u9bg5IzxTIkqNfAKqiL5oh2rBAlcUlsPNaRC1ckruD
 xUC9Ce1sas4v1Drx81+b/E+0eULMRo86pIc1Ugb71/PGZtyqrDkIqIU1EfqsO+nJ3PwaEng3W4K
 irV5lpHFavXtPIIIgz35VM+sWRyIzD7/llpyZiKZIdiD0kMy975CiQrdL8q/5+8k8U6tS4pG7vv
 QqUNTr55pvhhyhdLaSEHKvBMJZRj/+YwEGarn1S4+FY66YuEqUOKNguZQrNVqjJ41KTPKV3Nqla
 grhQ/XmNv5UJzNmuc1sbq69eXfo2csRbd27x5baEn8VxNiTTiIe8usTlLeplyaP+0Ye0YufSGnp
 9MQsHnJIwYSGu5AGr82BXI14cUMziM76MSdXgt1DIBWurin5DcklVr0Pznnt7P/ZWZbAo7Iu1xP
 1pTbLOmT33rqc3y7QpU5c0PXYTDPC01V9lPQZJYABf9dGky5JOdUel9xMr5jaD+9mJcJBXGxljp
 lF2QwdrbOETBkTgHI5NtL6moUaOIfgedqYG43hKJ98KCFXj3CE3psyaMeWHFjuehZ9Rjl8WPTjN
 r+4KVakFf1VCc9Q==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the case that no IOMMU is available, msm_iommu_new can return NULL
which should be handled. Without we will get a NULL pointer dereference
in the next statement when we try to use the mmu variable.

Fixes: 8cceb773f565 ("drm/msm/adreno: stall translation on fault for all GPU families")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 418e1e06cdde..5080319ae4cf 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -410,7 +410,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 	struct msm_mmu *mmu;
 
 	mmu = msm_iommu_new(dev, quirks);
-	if (IS_ERR(mmu))
+	if (IS_ERR_OR_NULL(mmu))
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);

---
base-commit: ba0ad6ed89fd5dada3b7b65ef2b08e95d449d4ab
change-id: 20230508-6-4-drm-msm-iommu-fixup-99189cd591ab

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

