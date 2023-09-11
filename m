Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0C79C809
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38DB10E369;
	Tue, 12 Sep 2023 07:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-223.mta0.migadu.com (out-223.mta0.migadu.com
 [91.218.175.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D510E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694422976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJIBmn1MRAFelLIOs/v4ao97mYf3xkRoyjgfFYfZY14=;
 b=h2+CPJ5n6FG/Sg7078ZD3xLsQBydsH9E9T2kRBW1UChwcxUUeiN7x/F0k4vsInj4jTgvtX
 NRqXYUYQoIgDckiKjbCC7flEEBc7uD518qyFptvoSJ0/F0Yeyb5EfPr7JZjqHg0dsn4zjt
 Qi+wBWdCDhVjvcXZTue1HQryypiAlAqKoruQrmqBN7WACzt+Nma2LH4B0E3fdlw+FinEu1
 ABj/50O1c21W5dPvPYiWHFPgjWMM2e/zphNMR8eTF4CsmE9XGKwF39VveVx7IPeRdYumKv
 vxoVY6+w+9IleTP3RwzNWEt4zrYiTYH5VKRtXB6m/wARvzQzWdmpJFnQP5ZLCA==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/8] drm/panel: nv3052c: Wait before entering sleep mode
Date: Mon, 11 Sep 2023 19:02:02 +1000
Message-ID: <20230911090206.3121440-5-contact@jookia.org>
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

The panel needs us to wait 120ms between exiting and entering sleep.
Guarantee that by always waiting 150ms before entering sleep mode.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 2526b123b1f5..307335d0f1fc 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -289,6 +289,9 @@ static int nv3052c_unprepare(struct drm_panel *panel)
 	struct mipi_dbi *dbi = &priv->dbi;
 	int err;
 
+	/* Wait 150ms in case we just exited sleep mode */
+	msleep(150);
+
 	err = mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
 	if (err)
 		dev_err(priv->dev, "Unable to enter sleep mode: %d\n", err);
-- 
2.42.0

