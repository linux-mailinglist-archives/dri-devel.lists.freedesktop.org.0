Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E39493A82
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 13:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E453110F1AD;
	Wed, 19 Jan 2022 12:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB22710F1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:37:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so14262766wmo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCSzim4chD2YZ1nYmMNUQu/jVANvmFwzUsxwlSkjcNs=;
 b=wZ+86cHu8by60Agnp1LSNhYjMgIjqTdNmvTULzONiNWLDnC/Pu6/zOmu/j4lE9pLJh
 oQC4FdupKTx5Fv8aq/4GC95rl+LCb1zLVz4RacPi2lbEtI8vGckDJLYCA9QQWFZCzhVs
 jRnZnAWkiE4yIK2+mCMbBiyMstokGQGvyEErREzQKhIzpxHeEL+5r1Ukpv+CAQjAuqd4
 QV1/iOyV+3NShPPDnszcc4FX0J1c/I2yjDC6ga7Z+d2AzpG6EQGhOJPmexLh+WOxJgl5
 Ay/w5+oLRIg5iuIm0ocOT2++SwIiB7xjpUAzaLsexUQbVCikOYzzqja42SDz4KOjIWvN
 6C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCSzim4chD2YZ1nYmMNUQu/jVANvmFwzUsxwlSkjcNs=;
 b=duk0aDAk2neSetP5VJOCRAk4HCyjjbxJpysWQ0TcnqqEU3nxyRQIIK/T87GAGlZiK1
 Yz5QrfLGwNeGu7nd53PO9o3IAbFXT2SlkcnskJjEoAHscdgmpCzocD9o5TbxTTS6QJA9
 BK7iLkheduQkoP55E8qFPiZPHDXDaYPzaDcehqqTkyErI6oYiD2i7fOuPOVxi6WKzVup
 /0SgK88i4BwlPFWfsZNDSbCKfVQTUhZ1h1b0IjV3uiXVM6yMTD4epP70p0+/KLrXom0Y
 4xXjLVDYxZYucgs1xYtCsAaDqSGJ+dz79jw6UDuYv/euIR1C6iHPOooCuIBkoZhjudNu
 CHcg==
X-Gm-Message-State: AOAM533ZBCNRqWB+GVVrxL1EMN6QeLBlWsZTHBhSV0CCwCPt1uK6/Q+w
 XdY4XR+0dr1Ok3aW/8P8h/k5Kg==
X-Google-Smtp-Source: ABdhPJw5a6DqhO5V4G/twLsma+1rrkJjiYS0Dq+Tec+BjOq4x+FA3gSO/pnEybBYhPBtNQSJ0iIj9g==
X-Received: by 2002:a5d:428f:: with SMTP id k15mr6580508wrq.347.1642595820339; 
 Wed, 19 Jan 2022 04:37:00 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id bh13sm2610327wmb.33.2022.01.19.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 04:36:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robert.foss@linaro.org
Subject: [PATCH 1/2] drm/bridge: dw-hdmi: filter safe formats when first in
 bridge chain
Date: Wed, 19 Jan 2022 13:36:55 +0100
Message-Id: <20220119123656.1456355-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
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
Cc: jernej.skrabec@gmail.com, Neil Armstrong <narmstrong@baylibre.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the dw-bridge is in the first position in the bridge chain, this
means there is no way to set the encoder output bus format.

In this case, this makes sure we only return the default format as return
of the get_input_bus_fmts() callback, limiting possible output formats
of dw-hdmi to what the dw-hdmi can convert from the default RGB24 input
format.

Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 97cdc61b57f6..56021f20d396 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2674,6 +2674,25 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	if (!input_fmts)
 		return NULL;
 
+	/* If dw-hdmi is the first bridge make sure it only takes RGB24 as input */
+	if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
+		switch (output_fmt) {
+		case MEDIA_BUS_FMT_FIXED:
+		case MEDIA_BUS_FMT_RGB888_1X24:
+		case MEDIA_BUS_FMT_YUV8_1X24:
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+			break;
+		default:
+			kfree(input_fmts);
+			input_fmts = NULL;
+		}
+
+		*num_input_fmts = i;
+
+		return input_fmts;
+	}
+
 	switch (output_fmt) {
 	/* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
 	case MEDIA_BUS_FMT_FIXED:
-- 
2.25.1

