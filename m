Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8A2483104
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 13:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2EA10E25A;
	Mon,  3 Jan 2022 12:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35C010E26E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:29:59 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id w27so24970250qkj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 04:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4Y0TL/KovMUJRfnkVjTV4iJmVFv/tcSjBhNJ8lA3Pc=;
 b=hj97S6rr4TjD+9VMmgLYkaPb/vSbfj61Nc++Gb9ZrOiR1/TdIc3PCvfc/WBV9YDFTW
 t2FwppWgecmAN0l4CiXMIWzdSpAtKsZLrDU3jrz+u88ehT2075qlq/KRAQHpfucR5T6S
 IyykJmSzV/wGoKGHe+A1bFhyY+CiMUd8+pPdboSKnCBqROjMjITx9brDuRIFiB1dA0hf
 +zj0mAxpHGKrB74UpH6j6+PZtEa8Hzxy/1jWjuc+ySalWsRZqKOwWRdXmFLBsJZQDYCM
 k3KR1j1wATjp0K4XEiEoeMDw/qam65atqWbo8pc8ZsoETxC6xdp16O0ytmTBJbinHnqp
 iGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4Y0TL/KovMUJRfnkVjTV4iJmVFv/tcSjBhNJ8lA3Pc=;
 b=402OqTe5bzsn8MqDpUwWW7IIeS9eTxnkYNOIu2W26Bc1RQPPj1zZawDZL1IgtjkwgL
 aWeBUvN9FpCQ1p4OhoW+PhmH9KVg54RN77y1SZTpteQZARV0dH0vNx+BhwvEWh/Tvqx8
 XvVNzk6jNnz8uRd1TCcEG2jv4ey8K5YH+QbA4+Bk9zJSksuKZH9leSOLYJJixCDzYr46
 1FzVw4wAd+IQIpWUp5+YEvEpg01e69Ul7sOIpZmnqUVp77PDpj2K7lj6kjLsz+YaQxDu
 tO3ppLVBHnOq8mElHJTg6R/W/IHAeDE1RTzfEmy1DgdKE1LvRVjULILacahs6LsEoGS3
 MSKg==
X-Gm-Message-State: AOAM532hT/gMRVLHe34JzY+Ygou0cS+LpGRxRcTHqSqlVv257x9hvObD
 8xVFnKEQDgOOytKecvMdNLc=
X-Google-Smtp-Source: ABdhPJwXBYe9L4d4QhQC3kCMAPLi6aGHEL4UzYCFt8jnuYgUsNzFEqTL+x8+vNPluhgPlR6umzebRg==
X-Received: by 2002:a05:620a:2586:: with SMTP id
 x6mr30392022qko.15.1641212998983; 
 Mon, 03 Jan 2022 04:29:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:9fae:13de:8196:cc8c])
 by smtp.gmail.com with ESMTPSA id
 h3sm28364424qko.78.2022.01.03.04.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 04:29:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux@armlinux.org.uk
Subject: [PATCH v2 2/2] drm/i2c/tda998x: Implement atomic_get_input_bus_fmts
Date: Mon,  3 Jan 2022 09:29:41 -0300
Message-Id: <20220103122941.371578-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103122941.371578-1-festevam@gmail.com>
References: <20220103122941.371578-1-festevam@gmail.com>
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
Cc: marex@denx.de, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, tomm.merciai@gmail.com,
 pbrobinson@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the .atomic_get_input_bus_fmts callback to let the bridge
indicate the pixel format it requires on the parallel bus to the LCDIF.

Based on Marek's commit db8b7ca5b232 ("drm/bridge: ti-sn65dsi83: Replace
connector format patching with atomic_get_input_bus_fmts").

Tested on a imx6sx-udoo-neo board.

Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Move .atomic_duplicate_state,.atomic_destroy_state .atomic_reset from
patch 2/2 to 1/2. (Laurent)

 drivers/gpu/drm/i2c/tda998x_drv.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 45d52b8a4026..d987481e97c1 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1678,6 +1678,31 @@ static void tda998x_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_unlock(&priv->audio_mutex);
 }
 
+#define MAX_INPUT_SEL_FORMATS  1
+
+static u32 *
+tda998x_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state,
+				   u32 output_fmt,
+				   unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.attach = tda998x_bridge_attach,
 	.detach = tda998x_bridge_detach,
@@ -1688,6 +1713,7 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = tda998x_atomic_get_input_bus_fmts,
 };
 
 /* I2C driver functions */
-- 
2.25.1

