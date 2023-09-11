Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB679C80E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2554B10E396;
	Tue, 12 Sep 2023 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-211.mta0.migadu.com (out-211.mta0.migadu.com
 [91.218.175.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607410E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:09:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694422968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEybRG/z/QiYL8x5ls+wYPU1myIjvupP8IAsRIKh5xg=;
 b=L4zZ4w9E6I3vJ/yHBEDZ7bNzpDYIxT6oC471yPAYUPUVy8khFrdLFoGbR4WnLs5hsEKiSB
 yHusLh1PHnuyZPA4BNjhQBBidEshgfx5A1dEMNboZAcGagMxOFU01LEPA1AhaKM0pNg4+T
 5nup4MOhOpwkbTG3+NfIxAg1IaJukZKvnmP/o9Sd2LGDG4Wp9T5zYTAh9vWlDXqO40veRm
 UTNMhxi2NR7MUecIEaC/BmngFO7QdNK3jP2iIgbRBiGGA8JVXo7DrkU9dgyTsqn6Tdo7Zs
 dxjoikuMXmYExpEv8H61JgiNqhxL+cRz+YzU810n4zRb9NmmP0v+LKEwvw86Gg==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/8] drm/panel: nv3052c: Sleep for 150ms after reset
Date: Mon, 11 Sep 2023 19:02:01 +1000
Message-ID: <20230911090206.3121440-4-contact@jookia.org>
In-Reply-To: <20230911090206.3121440-1-contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 12 Sep 2023 07:19:11 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code waits after resets for 5 to 20 milliseconds.
This is appropriate when resetting a sleeping panel, but an awake panel
requires at least 120ms of waiting.

Sleep for 150ms so the panel always completes it reset properly.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 90dea21f9856..2526b123b1f5 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -258,7 +258,7 @@ static int nv3052c_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	usleep_range(10, 1000);
 	gpiod_set_value_cansleep(priv->reset_gpio, 0);
-	usleep_range(5000, 20000);
+	msleep(150);
 
 	for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
 		err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
-- 
2.42.0

