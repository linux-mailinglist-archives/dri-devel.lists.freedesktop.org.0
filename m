Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF9B18B44
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9DE10E116;
	Sat,  2 Aug 2025 08:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="KBKETv+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A052410E32F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 01:49:46 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bv5NR3vbxz9sVv;
 Sat,  2 Aug 2025 03:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1754099383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EzGrUiyur0PDjcm61AO5Pdz6n1eUAx7WVBcJE1M5ghA=;
 b=KBKETv+3sEn4+XGT9mbrJOg0yaagruc0IT5vaeqTj2YVlqYcjzsH7KjETLEXJxPsy1hVwE
 E45fIwXmyhixaxPPKTeL/DQL6bp5OLr4Azj6DhyMTT6rlJ3heU8qh5P79xERxT8TQe++YA
 iNRExyn3f7fEvskBrg6iU+rm1Sx4sXFDCakS97jTyWMoHXDRDvGmgHBJ0LXlGx5/I2KlEZ
 z6fPO09U5Q0SoOtwMUFi8zaPTVSb/ub8uslLDqgfep7DvRr/O7Uzn5vKDOmNWkXa5ff22F
 Kz1yXvRpDxY/NEolfMIqimb/+YntgGVp3FXXpTGjDD8+lTvYk/asjxYXY+l9RQ==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Fri, 01 Aug 2025 21:49:26 -0400
Subject: [PATCH] drm/nouveau/gsp: remove always true if check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAKVujWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwND3bz80rLUxFLdtMy0fF0zY9NkM+M0c/PkxFQloJaCotS0zAqwcdG
 xtbUAKUL4mV4AAAA=
X-Change-ID: 20250801-nouveau-fifo-635c63f77cae
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=AyvojaMUL5GFQ+RGadkxrq01+rU8vIQIordppxfHfyk=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeFpQVG1iZmtseEdmeHQ1Q0h3ZXllcWUyZFdjeHJsdmcvCkUrTFZ1dWprdGRyR3NvWHBW
 bjVIS1F1REdCZURySmdpeS84YzViU0htak1VZHY1MWFZS1p3OG9FTW9TQmkxTUEKSmhMNWlPRi9
 4TzNMUW0vclp3Y0dpcC93RDNBU3FDdlU1UklxaUxHZGU5RFJZTWE4czB4bURQOXNWbjZ0MUZCTQ
 o3SlV1bmY1amJ1Q1U0SjZwRlp3TllsR1Jxcm9OT1FiL1ZaZ0JyYTlHV2c9PQo9a2RtRQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Mailman-Approved-At: Sat, 02 Aug 2025 08:22:22 +0000
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

if (1) always evaluates to true. Remove the unneeded check.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 36 ++++++++++------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 1ac5628c5140e66d306a1aadce10c810886afad3..104c72ec359a07a318ac99f5c217f0b07db2b784 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -188,32 +188,28 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	if (ret)
 		return ret;
 
-	if (1) {
-		NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
+	NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
 
-		if (1) {
-			NVA06F_CTRL_BIND_PARAMS *ctrl;
+	NVA06F_CTRL_BIND_PARAMS *ctrl;
 
-			ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
-						    NVA06F_CTRL_CMD_BIND, sizeof(*ctrl));
-			if (WARN_ON(IS_ERR(ctrl)))
-				return PTR_ERR(ctrl);
+	ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
+						NVA06F_CTRL_CMD_BIND, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
 
-			ctrl->engineType = eT;
+	ctrl->engineType = eT;
 
-			ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
-			if (ret)
-				return ret;
-		}
+	ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
+	if (ret)
+		return ret;
 
-		ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
-					    NVA06F_CTRL_CMD_GPFIFO_SCHEDULE, sizeof(*ctrl));
-		if (WARN_ON(IS_ERR(ctrl)))
-			return PTR_ERR(ctrl);
+	ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
+					NVA06F_CTRL_CMD_GPFIFO_SCHEDULE, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
 
-		ctrl->bEnable = 1;
-		ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
-	}
+	ctrl->bEnable = 1;
+	ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
 
 	return ret;
 }

---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-nouveau-fifo-635c63f77cae

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>

