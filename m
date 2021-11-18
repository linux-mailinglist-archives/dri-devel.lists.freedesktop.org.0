Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62B456384
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 20:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAFA6E98D;
	Thu, 18 Nov 2021 19:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A74A6E98D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 19:30:12 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id z6so4950113plk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6a6XNUBiSVXYL8JcjB4TIIHPE7C73L1S2r2kenMwpgs=;
 b=ARw6JlgSc4uSQsvSy1AnLry+K0GYe8gJVXoEpwzdAFt1kYqveGSebR3VEHsCXYIgeM
 EyBMLlDwdWgFQJZiiRF2Bpjc38O1LCR0/W7JMMPclLANOq+dTu81Qg29RS1DvydwmI0H
 0/lorw5B28mzpOf7PH6OvINy1pWy7XEvZWAa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6a6XNUBiSVXYL8JcjB4TIIHPE7C73L1S2r2kenMwpgs=;
 b=CDumqX/lD/0gjroq9kPyWrML1PUkNvTJRdBFCK52FWFn+QeJBgO+lFeod8OgZ4DpEk
 aA4oMtJaHgfSp05kcCEaDFPbCpEwgW/6Zcf1Xug+fmhYnRfEwbDvRsN9gBsKQRrsiH1A
 mVF1/G/jn6RZNHHCeeZGfCFTyf9z/0SitNNtzXQfeCrb34zIxXh7yi4ufBhET+9JzFOA
 CCijOkoZ5b4+oXKR8gp/Cl7fGHpxrwE1n11P/QEvwp0WNvQEwuw9CHv05hxre0X8h1ZN
 qIQkOh4bNcpUZ6THpBzIghZSnmAy82gy4GKkh4rVGvbg5A0mU2DKZHrWgCPzjerNLoE+
 Ha2Q==
X-Gm-Message-State: AOAM530U+Tw5yhr/aYZulphZE60e98xKdXzSLJ+GZvawwLLVX1AJhxyn
 F+MbQkN86NGQuX7s1mGkaJ/GoQ==
X-Google-Smtp-Source: ABdhPJzBkr1Ks3Z0c9CYiyRMhPuG5ANntyNBtjJZWW0AEGpAFbPYkMIeoCEBkkh8iMPZKET/xO8cKw==
X-Received: by 2002:a17:902:8a93:b0:142:30fe:dd20 with SMTP id
 p19-20020a1709028a9300b0014230fedd20mr68641445plo.29.1637263811954; 
 Thu, 18 Nov 2021 11:30:11 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:4cf0:1835:2db:b2b8])
 by smtp.gmail.com with ESMTPSA id mg17sm343789pjb.17.2021.11.18.11.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 11:30:11 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
Date: Fri, 19 Nov 2021 03:30:02 +0800
Message-Id: <20211118193002.407168-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

edid_read() was assumed to return 0 on success. After
7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
the function will return > 0 for successful case, representing the i2c
read bytes. Otherwise -EIO on failure cases. Update the g_edid_break
break condition accordingly.

Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
v2: Fix type error.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 1a871f6b6822ee..3a18f1dabcfd51 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -795,7 +795,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 	int count, blocks_num;
 	u8 pblock_buf[MAX_DPCD_BUFFER_SIZE];
 	u8 i, j;
-	u8 g_edid_break = 0;
+	int g_edid_break = 0;
 	int ret;
 	struct device *dev = &ctx->client->dev;
 
@@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 				g_edid_break = edid_read(ctx, offset,
 							 pblock_buf);
 
-				if (g_edid_break)
+				if (g_edid_break < 0)
 					break;
 
 				memcpy(&pedid_blocks_buf[offset],
-- 
2.34.0.rc2.393.gf8c9666880-goog

