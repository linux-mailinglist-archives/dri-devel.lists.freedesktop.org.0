Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F778FAD3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21D110E1DF;
	Fri,  1 Sep 2023 09:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA8F10E1DF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:31:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3819VPAw115637;
 Fri, 1 Sep 2023 04:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693560685;
 bh=x1V7V+7rccucWwQINZ7DbqEzxx71rgWv/A1c94Rd+48=;
 h=From:Date:Subject:To:CC;
 b=XG1ISZYg7fAid36HYnA36icCWZwgTB9bEEeVBbE81GCqUGC+kn8LuxR5AhxoS3JlW
 NoK4zaddHFDLLxgLuMi3r6ktfbI7Kcw7L2ophI1sLw8bkOs+BY9czZ8HoD1Eo1Mw7E
 9UzdLAcHq0RKjloI5qSVvn4wiMmSK4vYM85N1X8M=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3819VPKw088284
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Sep 2023 04:31:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Sep 2023 04:31:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Sep 2023 04:31:25 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3819VOLE087283;
 Fri, 1 Sep 2023 04:31:24 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Fri, 1 Sep 2023 15:01:23 +0530
Subject: [PATCH v2] drm: bridge: it66121: Fix invalid connector dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230901-it66121_edid-v2-1-aa59605336b9@ti.com>
X-B4-Tracking: v=1; b=H4sIAGqv8WQC/3XMQQ6CMBCF4auQWVtDpxSKK+9hiAE6yiykpG0aD
 endrexd/i953w6BPFOAS7WDp8SB3VoCTxXMy7g+SbAtDVijqg1qwbFtJco7WbaiJeqNlp2pzQT
 lsnl68PvgbkPphUN0/nPoSf7WP1CSQgo1TrrpUVHT4TXyeXYvGHLOXzsxHbulAAAA
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Nicolas Belin
 <nbelin@baylibre.com>, "Andy.Hsieh" <Andy.Hsieh@mediatek.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=nUHp2YVQF4quI/iRqN77F62Vmqh3yNL0JAuVezbdwDM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBk8a9tl96xshWxGbou9fVkADDkJotJsvuRJngsP
 gfJUJAucHGJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZPGvbQAKCRBD3pH5JJpx
 RXoOD/9zOmBjj/MJltAv7E/2bNdRKOAlaqUzCUTwWk+Kbki5EnwVSVPFazFmSYegcmNWjxwHBzv
 uZWzVEri3Pbi0eRRiW+q942ZS1d6Z0Jd67mzAazCywXoDjTcqgU43iUUcTZkZAwFvkCkHCHxGEY
 uutcAyHK8wC49DuCQJS4TF2Djub+yJ2oJbwWNFfh3Uqph4t2Jh+FrrOs9aqXa6LuVXFtqU0LQ2r
 7cbUNoQtey2a/4RTSdKTZSZPNz0hDdo5JAh9zpPy2uFNesh7/xy+sZyBbOY/B1rKPZhquv3VPT8
 B+YhXBPRUTuk1gToXu9EeHOXOyBwhOWlmQ/VNROLon9eGhyspDp+dCtvFYhwr+28nNB3yCtTt0x
 HRxJKnAm1SkQBC5J6LyIDFg5Bsud04QP6GGY/8gIwrznwmCDrYmfSX42cCBUCrWtliTNHNTTutU
 DhzXexE7kmGdgraotDzHqn/pR58RstbYqLVBqRiyDOsBWvcm262kkK84I3LDbFAbp+i5fbg3xU7
 TQah3+VvKaicnG/H/DwXOGOrGeEXdofaQ3uYr0jsIfJ/2v+xkOjExw+LO03AU2zJrdc8MOyrvC7
 Sa7SwMBiaCJwE5x4QuYAHY1E5EMF3NEFxplXS59wV76h4BOFRttE8WT8uY08dNuFtalGHSwOr4b
 EVSskY1712MVh+A==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: nm@ti.com, Jai Luthra <j-luthra@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 devarsht@ti.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the NULL pointer dereference when no monitor is connected, and the
sound card is opened from userspace.

Instead return an empty buffer (of zeroes) as the EDID information to
the sound framework if there is no connector attached.

Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
Reported-by: Nishanth Menon <nm@ti.com>
Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@gondola/
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Changes in v2:
- Return an empty buffer of 0s instead of returning an error
- Lock the mutex before accessing ctx->connector
- Link to v1: https://lore.kernel.org/r/20230825-it66121_edid-v1-1-3ab54923e472@ti.com
---
 drivers/gpu/drm/bridge/ite-it66121.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 466641c77fe9..fc7f5ec5fb38 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1447,10 +1447,14 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 	struct it66121_ctx *ctx = dev_get_drvdata(dev);
 
 	mutex_lock(&ctx->lock);
-
-	memcpy(buf, ctx->connector->eld,
-	       min(sizeof(ctx->connector->eld), len));
-
+	if (!ctx->connector) {
+		/* Pass en empty ELD if connector not available */
+		dev_dbg(dev, "No connector present, passing empty EDID data");
+		memset(buf, 0, len);
+	} else {
+		memcpy(buf, ctx->connector->eld,
+		       min(sizeof(ctx->connector->eld), len));
+	}
 	mutex_unlock(&ctx->lock);
 
 	return 0;

---
base-commit: 99d99825fc075fd24b60cc9cf0fb1e20b9c16b0f
change-id: 20230825-it66121_edid-6ee98517808b

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>

