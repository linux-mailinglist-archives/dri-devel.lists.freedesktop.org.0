Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B0371A18
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAF16E958;
	Mon,  3 May 2021 16:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA656E95A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:38:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A77ED6142F;
 Mon,  3 May 2021 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059879;
 bh=bgsQ4C6uIetDSOq7p3giD0blDWPX1UU1oDNWpWVUFGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jyzY4labV67mPeVkHedt08zDVtGuWkZXPtjWs9SF25jUwcNshOIzSROTn7PxlOGxl
 sGrzryFzingFucudcHSIZ/uxIGfUp2lwFxxdZJsCiiraqPwedaqxocVaaGnnTNirvk
 lhs+4zIR5nLzWb+AlAH7oYbkKf1CvQ0kUCwVw+XheWqj1XcWdE2zeZUa/j0CuwY40N
 IzGildgYEroCfdCb8O3fwbZRltRr8k8bdjf9ypYewF2VRFbO+aefwH2d0wR27ZAF06
 QOzqi0ES2+KQdcJZYtGSX7Abo1J8Co8QFEt6+5tEpWehTdnzZBNmDkr4pKPvZGRqaT
 7dT0wUhysraIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 039/115] backlight: qcom-wled: Fix FSC update
 issue for WLED5
Date: Mon,  3 May 2021 12:35:43 -0400
Message-Id: <20210503163700.2852194-39-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163700.2852194-1-sashal@kernel.org>
References: <20210503163700.2852194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kiran Gunda <kgunda@codeaurora.org>

[ Upstream commit 4d6e9cdff7fbb6bef3e5559596fab3eeffaf95ca ]

Currently, for WLED5, the FSC (Full scale current) setting is not
updated properly due to driver toggling the wrong register after
an FSC update.

On WLED5 we should only toggle the MOD_SYNC bit after a brightness
update. For an FSC update we need to toggle the SYNC bits instead.

Fix it by adopting the common wled3_sync_toggle() for WLED5 and
introducing new code to the brightness update path to compensate.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/backlight/qcom-wled.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 83a187fdaa1d..cd11c5776438 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -348,7 +348,7 @@ static int wled3_sync_toggle(struct wled *wled)
 	return rc;
 }
 
-static int wled5_sync_toggle(struct wled *wled)
+static int wled5_mod_sync_toggle(struct wled *wled)
 {
 	int rc;
 	u8 val;
@@ -445,10 +445,23 @@ static int wled_update_status(struct backlight_device *bl)
 			goto unlock_mutex;
 		}
 
-		rc = wled->wled_sync_toggle(wled);
-		if (rc < 0) {
-			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
-			goto unlock_mutex;
+		if (wled->version < 5) {
+			rc = wled->wled_sync_toggle(wled);
+			if (rc < 0) {
+				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
+				goto unlock_mutex;
+			}
+		} else {
+			/*
+			 * For WLED5 toggling the MOD_SYNC_BIT updates the
+			 * brightness
+			 */
+			rc = wled5_mod_sync_toggle(wled);
+			if (rc < 0) {
+				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
+					rc);
+				goto unlock_mutex;
+			}
 		}
 	}
 
@@ -1459,7 +1472,7 @@ static int wled_configure(struct wled *wled)
 		size = ARRAY_SIZE(wled5_opts);
 		*cfg = wled5_config_defaults;
 		wled->wled_set_brightness = wled5_set_brightness;
-		wled->wled_sync_toggle = wled5_sync_toggle;
+		wled->wled_sync_toggle = wled3_sync_toggle;
 		wled->wled_cabc_config = wled5_cabc_config;
 		wled->wled_ovp_delay = wled5_ovp_delay;
 		wled->wled_auto_detection_required =
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
