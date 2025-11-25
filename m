Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3BC870A6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7451B10E2B4;
	Tue, 25 Nov 2025 20:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rx9YTvrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FEF10E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84B1B4446A;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E3BDC116B1;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764102580;
 bh=xmOtbEbdnDZUK8n8UPV79lS8HJNc9fONfq/FhvbrZXo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rx9YTvrcFRkXn8Pb9zlPixzc2NOKkqj1uZIftYNshh9evio+1MMJwt3yVNW/aiDWk
 bkuqoCeYG1HbqTBexCeAIUe6n09r99Gfag6KDfEmx8Mnwc+bQzHUDA+NJIzKCg39Q/
 31M9Qhl/MletXnU8wnftkjd/WdO7/MKZEc/WqRwhQc3UAdQ+6xdLNMjTmqakkhbIer
 9awsBVtF0+3L4JLhX4ZP6d8iyEBhcrFkrenW/z+aBzZW3BnXh6QhkmYq2CmnZJ/Xxs
 4zJr/26x+NfiM0pAwIEdmy7H0228B7KHcyCm7QU6vRDO4q/cjD5cAro5obYG9VQD+z
 lGULRcq4jQzow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD32D0EE24;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:38 +0100
Subject: [PATCH v4 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-3-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9TAk0DAPWxZVYTBz3bFgNgm0xGew8ziZCJQS5XGU65g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGxRm6sRwZPo41Mwxyodut3ZK3FkRghiKnCj
 Bz8/Dg7lIqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsQAKCRBgAj/E00kg
 ckEKEACl9YEzwbH/NPMBTBmhqqST4/0mcBKw0oU2FxWl5UP35HBdt/cuj99YzuZv5UOaqwrQcaQ
 F2G60gHfObfkf7VTJKnKnl9iEEGbEEtslgkCCKiFnoCNP3Rrq6YSRC8cZy/RP6t2ee3f9SE7xsa
 Bu+/4njAMjkJgdn4RC52J7/GTamfr5obbRQlCVn7lEDmkwPKcTeybpyyBhl3l1MYyefuzvYRXNs
 HM64dP3YFCOVkrMSOKsG3HegrzySIhE+0Ufcb7JoPAibjMOGucNNV5PJBY0lHx3ow4K0Jw4pZZP
 J9P8j1ZqggAJsw8/32SfZ+PXPs0uZwocVX4opQBNKDBKLdG2MRT2BOsGVnppGxjcDLGdut5BIKH
 3OUML8BViKjwH5fqbdc4YvlmBe4ZrTLUJej6VZIrHTSVcvplVCkWht3dNzHUO8YrvpLu5o5pSF6
 YxNTnZ0tlCW1nPcON5j0e4vjmQpCKa3UAMx7edxy16DOAnwjqYWlP0EDbbhxMKPEf7ta//7gM6t
 qnuwCJ7B2BhHNLumKm/zPCVN5CJ1MzCUyqwLpnFkWX5pEW2h0GqkUfF/xjuTgXffvbnvyIstP0U
 mRXrIEXmjbX4TZlVhD1J/Xi4tC49q4yQkfF1rToVtUBdjBHiMi+6lxPHSj1NBBsMPE39sA0+7/j
 rSjpl6WXO5wWNng==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

The supported panel is LH546WF1-ED01, add compatible and adjust the
struct name to reflect that.

The standalone compatible lg,sw43408 will continue to work, even thou
there are no users yet.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 46a56ea92ad9f..dcca7873acf8e 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode sw43408_mode = {
+static const struct drm_display_mode lh546wf1_ed01_mode = {
 	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
 
 	.hdisplay = 1080,
@@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
 static int sw43408_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
-	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
+	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
 }
 
 static int sw43408_backlight_update_status(struct backlight_device *bl)
@@ -214,7 +214,8 @@ static const struct drm_panel_funcs sw43408_funcs = {
 };
 
 static const struct of_device_id sw43408_of_match[] = {
-	{ .compatible = "lg,sw43408", },
+	{ .compatible = "lg,sw43408", }, /* legacy */
+	{ .compatible = "lg,sw43408-lh546wf1-ed01", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sw43408_of_match);

-- 
2.51.0


