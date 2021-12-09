Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DF46EED2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1221E10E478;
	Thu,  9 Dec 2021 16:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB1910E119
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 10:58:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u17so9006157wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 02:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPVDqP6AO9LVEl6lajkZHncKthtZt07+0YhDuniXOPA=;
 b=WA9/ePSao582d/GYRd7Jz94W92c3AWteQOTfTAj6orMwwIm68pFItOT9jBkkRohxcX
 MWfS04AYWo5Rv3bRaPjWQT2uQlucEcRG/fj5PyWAIWtN1zRX8+D/bShz0e/qHSc5D5ju
 rXdhC0yUdUvXmZKatNBKNBUAYsSCoWZdsnys53pA6JEK1cf+TcQbgdTnZnJ5cT44XTOz
 KtwVnH1GRub6IzLWnvHoOc6JiYhjh98k/FgEErds9yi4KxxNuW72toDgsWy8DGryQjI0
 4o0MsdECIIRsWKfAE7CaKrk7KXaQL5/+DD87p7wk07puml/bvWFuJgSZc92bET57+Mq7
 DZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPVDqP6AO9LVEl6lajkZHncKthtZt07+0YhDuniXOPA=;
 b=5mr3Ho6qB+Tiq3wi5UQhEtyurjFeyue8qsc7eMhXWJcVA2LL3dzO2CHTZaGx4N23Sr
 w0lN0t4BvqKcnWRF096TtKsDlqmUZBk8vJYWf0tROh8GqWZLT9y4Zy8mKEXlwh6etlY/
 Ab+yDJMc9MZWUv0kXxXokCvcfhvAWheb2Ea4UHHCgcGY4/0PFtOQLx5Ad1oc3Uxq5uzJ
 e5Ib3DQrIFoeFMH3FgaPgnQRt1QKFRQjQvjGBQ9fG4VtJkxX3hUj1oxQaZuamZ+9MUiB
 WG35VAWMcmiZXDR4/GVKROYOyfIYdUj44U+9l5ZcxGkm7lUJNkHR3fpXZbjP1D/FiEBV
 kyLg==
X-Gm-Message-State: AOAM5329YFWmdBhqmfE2Q9ZKXQzu1ZSCagyaP73YgafPvVjCzzA2s9RI
 xZGQueLl7EuyljLL4hV0Su1jLd8D1MVWdg==
X-Google-Smtp-Source: ABdhPJyDnicrhx4DOizUgPooeXzxaKxflrK2kqFTZE4ANwdvUg94zdrYuIOstE390zM0g/3KmTMBFA==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr5731548wrn.521.1639047520873; 
 Thu, 09 Dec 2021 02:58:40 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id s8sm5495024wro.19.2021.12.09.02.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:58:40 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: LW@KARO-electronics.de
Subject: [PATCH] drm/imx: Fix memory leak in imx_pd_connector_get_modes
Date: Thu,  9 Dec 2021 11:58:33 +0100
Message-Id: <20211209105833.9921-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes: 76ecd9c9fb24 ("drm/imx: parallel-display: check return code from of_get_drm_display_mode()")
Addresses-Coverity-ID: 1443943 ("Resource leak")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/imx/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index a8aba0141ce7..3bf8e0a4803a 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -75,8 +75,10 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 		ret = of_get_drm_display_mode(np, &imxpd->mode,
 					      &imxpd->bus_flags,
 					      OF_USE_NATIVE_MODE);
-		if (ret)
+		if (ret) {
+			drm_mode_destroy(connector->dev, mode);
 			return ret;
+		}
 
 		drm_mode_copy(mode, &imxpd->mode);
 		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-- 
2.25.1

