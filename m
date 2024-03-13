Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED1D87B349
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 22:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AD510E0B6;
	Wed, 13 Mar 2024 21:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OVVLp0ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7AF10E0B6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 21:12:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A24D60DF3;
 Wed, 13 Mar 2024 21:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D14B7C433C7;
 Wed, 13 Mar 2024 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710364346;
 bh=pn/5tZr/4USUk6Xl24wnyddCOFjB3FKvA39M4UJsywA=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=OVVLp0ngrjEYvpCQp85XBLMBGVNfeDd+jUm1srgzNoDnDyDrATHtsTaMRJjDAAz2n
 SPeyfyN7XDvrFM+pP7Z+KpTTVBqgUNDZ7GFoWQOb2QQrA76SAEWW+KtlK2WVAzkOaW
 Mu9v6lAeldFor/kreLZP+qeO0g4rwAibD5qiBg9RAjP1Ips659p0GcW48VRG7DiRK5
 hD1HAC7qg6ex8Q3POGlp08U/W22rSypG+5WAqBr9HK6wf96Y+Voyqn1sopodg9ZUDk
 4UlsgSRl8f+r0yKyJ6L5H5i3x87m2AIegX2RRgvNCwOFC5wBP7rfuwxvfRDWkJ3FQh
 JiMVjoweSBAQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B5BDFC54E66;
 Wed, 13 Mar 2024 21:12:26 +0000 (UTC)
From: Douglas Anderson via B4 Relay <devnull+dianders.chromium.org@kernel.org>
Date: Wed, 13 Mar 2024 14:12:14 -0700
Subject: [PATCH] drm/panel: atna33xc20: Fix unbalanced regulator in the
 case HPD doesn't assert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-homestarpanel-regulator-v1-1-b8e3a336da12@chromium.org>
X-B4-Tracking: v=1; b=H4sIAK0W8mUC/x2MywqAIBAAfyX2nKAl9PiV6GC12kJprBZB9O9Jp
 2EOMw9EZMIIffEA40WRgs+iygLm1XiHgpbsUMlKy1opsYYdYzJ8GI+bYHTnZlJgYfXUdtJmNDP
 k+mC0dP/nYXzfD1GOg+BpAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710364346; l=2015;
 i=dianders@chromium.org; s=20240311; h=from:subject:message-id;
 bh=/jgB/LgJDly6Altvbipo14aZmr/j8F+XuDmbB4fICv0=;
 b=ZSkyjZHVIxke1plTs0iVfALVXhp73xvZV1inGwLQ3nW5eOV+sfMENciF2dYF1l2+2oZFBEoiT
 vi6lBPds8GkA6mNzmas1XXWF4TafE7e2SSJw22U5dDDFyN3gdum072f
X-Developer-Key: i=dianders@chromium.org; a=ed25519;
 pk=3pyAfvsLkkkp4Xpq0XV7ZHOoA0WmPoJTE/BIAhunPKg=
X-Endpoint-Received: by B4 Relay for dianders@chromium.org/20240311 with
 auth_id=138
X-Original-From: Douglas Anderson <dianders@chromium.org>
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
Reply-To: dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Douglas Anderson <dianders@chromium.org>

When the atna33xc20 driver was first written the resume code never
returned an error. If there was a problem waiting for HPD it just
printed a warning and moved on. This changed in response to review
feedback [1] on a future patch but I accidentally didn't account for
rolling back the regulator enable in the error cases. Do so now.

[1] https://lore.kernel.org/all/5f3cf3a6-1cc2-63e4-f76b-4ee686764705@linaro.org/

Fixes: 3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 76c2a8f6718c..9c336c71562b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -109,19 +109,17 @@ static int atana33xc20_resume(struct device *dev)
 		if (hpd_asserted < 0)
 			ret = hpd_asserted;
 
-		if (ret)
+		if (ret) {
 			dev_warn(dev, "Error waiting for HPD GPIO: %d\n", ret);
-
-		return ret;
-	}
-
-	if (p->aux->wait_hpd_asserted) {
+			goto error;
+		}
+	} else if (p->aux->wait_hpd_asserted) {
 		ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
 
-		if (ret)
+		if (ret) {
 			dev_warn(dev, "Controller error waiting for HPD: %d\n", ret);
-
-		return ret;
+			goto error;
+		}
 	}
 
 	/*
@@ -133,6 +131,12 @@ static int atana33xc20_resume(struct device *dev)
 	 * right times.
 	 */
 	return 0;
+
+error:
+	drm_dp_dpcd_set_powered(p->aux, false);
+	regulator_disable(p->supply);
+
+	return ret;
 }
 
 static int atana33xc20_disable(struct drm_panel *panel)

---
base-commit: b33651a5c98dbd5a919219d8c129d0674ef74299
change-id: 20240311-homestarpanel-regulator-f4b890ff4b7c

Best regards,
-- 
Douglas Anderson <dianders@chromium.org>

