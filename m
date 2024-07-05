Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EB9284E6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE8A10E32D;
	Fri,  5 Jul 2024 09:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="mmFiA1f2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865D10E322;
 Fri,  5 Jul 2024 09:15:29 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id 407E5100004;
 Fri,  5 Jul 2024 12:15:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1720170911; bh=YZZrGAtSVIBEGeCYxNknWhYt/yWknwoVJZ3yWZhV1C4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=mmFiA1f25ZpGEnBoUnQu/u05k7rdG2P5YO0z1PzncBwniVfZqkjAEbXuM4lFae4y8
 D7EnQaGLexxhiW5shHEyAGDARt794SJsRa2Glu6BtRuz/uNAXPZWShTkbBw5dsaEmW
 oO0r4nUE7P15s1xf0o3HkJ9yiz63I+lVzkhgdWkyCHhc3sIc12134mBzEd8YlvfedI
 c98ZVghW+jL9sHYzQCvMeOk9W5vDJsbUQWCKtyVP3Zz/4/DtU+rl89DIdHZGk0kjlI
 /07QdvHAWEkcZhqcnsngZsilkoOvHrCE3S5/DwtTR0/kteSSrzweZxvqXuHoJhY1h0
 U3R+YUcwbb24A==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Fri,  5 Jul 2024 12:13:49 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.5) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 5 Jul 2024
 12:13:28 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Rob Clark <robdclark@gmail.com>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Jordan Crouse
 <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/msm: Fix incorrect file name output in
 adreno_request_fw()
Date: Fri, 5 Jul 2024 12:13:12 +0300
Message-ID: <20240705091312.9705-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240704093002.15155-1-amishin@t-argos.ru>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.5]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186342 [Jul 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21
 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05,
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; mx1.t-argos.ru.ru:7.1.1;
 t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/05 07:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/07/05 03:12:00 #25860202
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

Fixes: 2c41ef1b6f7d ("drm/msm/adreno: deal with linux-firmware fw paths")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
v1->v2: Fix incorrect 'Fixes' tag

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

