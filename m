Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C24884B9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 17:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3910EF27;
	Sat,  8 Jan 2022 16:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE4D10EF27
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s1so17617006wra.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jan 2022 08:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbP6l9e9WPV7+5ZHWs4pOKGgGXLLRP9ERXDPMtE742M=;
 b=ijB1mmORd5xw+l7Hxh3xST5FVoqGTx9yCeIHp7jV0qngf8E00G3RxEs1Jdh7zIvCev
 lMv9phcfD4cDeTSQ/RYXPqyJjGyz0BVe+/1e6USleTvyACydxUDPlcgQu8dWrNuhNC4r
 qvr8eMznhyQcgQwbTY4cxBYnriLwKyR57Ihzp2GxJ2nnd9BdANjIiyVNtpf5NFrMJ+Z2
 7uNPH+UnZyqu9cYnLxto6D/wV6ZBg4y8dGBur0rNtd5Rbwynzy0YZwCTZDfkIHed1G77
 tyLQ/FcE7TnWD2EPQeGOckiQ+Gn9M+jBBC4O7JYsFSvft3xKt/5smy9cXuu9mjJv0sV3
 MTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbP6l9e9WPV7+5ZHWs4pOKGgGXLLRP9ERXDPMtE742M=;
 b=7Hm0/xkDWrbeMayWtpiUSvyD/ECkWf5zy+JBCW84vufqbnL0fCm5EVQAlVUfS+W5ZV
 1zRVlSeEyfXcvlrtoGDGrsy2/EWnlQjN5itaaDQnRka4Tx8cbFKNQ6uy31WxqpSrS1oA
 tNYZR9spLegHf+TzgZTZpkLaT1Ckyu4aUqR2Tq39MfLlubg8jpMABH6mUiOpwU2t1EWa
 8syrqwQ7qM2aYjvpfYU5y1rnpZgY0J5QgaOtHeHzatDeSUpgLTT2vT8e5mYmgnuas7Sv
 CRVfH9DyRaX4s7SMI9/GVA2sEIe10OjZbxgxoC63MQtyiciUWY3S7HdY3pHPqN9SWFRW
 gwZQ==
X-Gm-Message-State: AOAM532ilNqO7+Wf2nyMw0cOArGHy/uuRKn8CCJTtNAtEiB8J1gF9MeZ
 E26TR3iN3on22apQ5tBCvEI=
X-Google-Smtp-Source: ABdhPJyP3K2xyfHsiOTYzsNlxEQq1yvbgeoIsW8mx3C8Bd5U5lyhs6OogxOaB9jsymdj5SYPzdyWOg==
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr60144131wrw.696.1641660754296; 
 Sat, 08 Jan 2022 08:52:34 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id p21sm1994610wmq.20.2022.01.08.08.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:52:33 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: LW@karo-electronics.de
Subject: [PATCH v2] drm/imx: Fix memory leak in imx_pd_connector_get_modes
Date: Sat,  8 Jan 2022 17:52:30 +0100
Message-Id: <20220108165230.44610-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid leaking the display mode variable if of_get_drm_display_mode
fails.

Fixes: 76ecd9c9fb24 ("drm/imx: parallel-display: check return code from of_get_drm_display_mode()")
Addresses-Coverity-ID: 1443943 ("Resource leak")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: Improve commit message
---
 drivers/gpu/drm/imx/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index a8aba0141ce7..3bf8e0a4803a 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -75,8 +75,10 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 		ret = of_get_drm_display_mode(np, &imxpd->mode,
 					      &imxpd->bus_flags,
 					      OF_USE_NATIVE_MODE);
-		if (ret)
+		if (ret) {
+			drm_mode_destroy(connector->dev, mode);
 			return ret;
+		}
 
 		drm_mode_copy(mode, &imxpd->mode);
 		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-- 
2.25.1

