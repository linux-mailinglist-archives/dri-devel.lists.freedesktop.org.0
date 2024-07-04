Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E0292733B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A56F10EA69;
	Thu,  4 Jul 2024 09:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="MWWbtqKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jul 2024 09:40:48 UTC
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AB210EA69;
 Thu,  4 Jul 2024 09:40:47 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id 0380F100004;
 Thu,  4 Jul 2024 12:31:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1720085517; bh=+/C+JViDMgPfxW69NIXMldo08NxYAJ+C72fKQYsFUQU=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=MWWbtqKmCW5J3SPoHR3qV/qQfQM/X3eJMMsffsZtWbA1jmVejivQ/7fhjddIzHPOD
 lEg3xwDxx5mzaPL/IkyoewvUF0nseObL/gtbJZza5CrHzl7hhe1Pos2lXb9NopzpEK
 5sxHDkENwPC/PBLJSnZqf+hwnBIMlpgdHC+ZXzIOw8rtGbRRno9QnaXZYAZLohtBP2
 yOZPFhUGHRa8hC1farLmPYuMq3K5P94JMeBwrj/Ag3f3XRtAk/8uIznMqYo21iUmKa
 zVluOE3qkiGGE7IEkqfABEPshz4TY+k0jmz19+DQ91L8SrlqyftfAliN4Bga3vQF/C
 Nhqg/YZwQa60g==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Thu,  4 Jul 2024 12:30:36 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.5) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 4 Jul 2024
 12:30:15 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Jordan Crouse <jordan@cosmicpenguin.net>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/msm: Fix incorrect file name output in adreno_request_fw()
Date: Thu, 4 Jul 2024 12:30:02 +0300
Message-ID: <20240704093002.15155-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.5]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186323 [Jul 04 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21
 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05,
 {Tracking_from_domain_doesnt_match_to}, mx1.t-argos.ru.ru:7.1.1;
 127.0.0.199:7.1.2; t-argos.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/04 08:06:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/07/04 08:45:00 #25843417
X-KSMG-AntiVirus-Status: Clean, skipped
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

In adreno_request_fw() when debugging information is printed to the log
after firmware load, an incorrect filename is printed. 'newname' is used
instead of 'fwname', so prefix "qcom/" is being added to filename.
Looks like "copy-paste" mistake.

Fix this mistake by replacing 'newname' with 'fwname'.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9fe041f6fdfe ("drm/msm: Add msm_gem_get_and_pin_iova()")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..0bb7d66047f8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -475,7 +475,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 		ret = request_firmware_direct(&fw, fwname, drm->dev);
 		if (!ret) {
 			DRM_DEV_INFO(drm->dev, "loaded %s from legacy location\n",
-				newname);
+				fwname);
 			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-- 
2.30.2

