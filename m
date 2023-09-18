Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18D7A5A58
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696610E36C;
	Tue, 19 Sep 2023 06:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-229.mta1.migadu.com (out-229.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4F610E271
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 12:59:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695041988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJIBmn1MRAFelLIOs/v4ao97mYf3xkRoyjgfFYfZY14=;
 b=Eis19EUqt8F5IEwvw8k8WICesKIk8mVKQTgQ2JtVlQ/Nd4QR4TvsAVTHDbc7M7b42hC7p0
 HS5d2/tBiclp2l0szNn3Okmly9q+c3ItDNH4jvU5omvCbV7IKjoubgcAtTLWHMJs1TA31C
 +WlvwkLUU08ypgbbDuXItBJsRZrGhswphsJlKkfbY5BoaoDtSPqEqUO9w+6X2mUgCAdoWG
 rVh6KTD3HCE1JP+1fNIXeyjTQ92DDOp2Sofq66TDpgiEkUdyPlGZBE47KfCFmhLfZb60Zy
 9bXFmY14ySAJWn4Rh91RL4BCJtw7WYIKn8egenwedBwEaekOLajEmgrVA7on9w==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 4/9] drm/panel: nv3052c: Wait before entering sleep mode
Date: Mon, 18 Sep 2023 22:58:48 +1000
Message-ID: <20230918125853.2249187-5-contact@jookia.org>
In-Reply-To: <20230918125853.2249187-1-contact@jookia.org>
References: <20230918125853.2249187-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>
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

