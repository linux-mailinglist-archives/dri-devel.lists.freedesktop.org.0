Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF22C6039B6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 08:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BBE10F14D;
	Wed, 19 Oct 2022 06:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718E110F14D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 06:20:58 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-132fb4fd495so19483761fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QWZltT5Ik1403xLpYJWPCmlVFaiq2fqaz9yBCJYjcXI=;
 b=fHHz7Xzk5lYdiEDvHwu2jd21UdKcxPmzwJbiub7ibFHkmtsyteKF7RVeuJzxaHAhDX
 zetJ72PEeG8Sp6YVg5VSxQicLtOOjM1dVacrGrbAhczDxSxu9JP01G10ZvvpQ9vyyPLZ
 e95Ppe8WfALhzSbLN1l0LXT+pyzGo8OlieGSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QWZltT5Ik1403xLpYJWPCmlVFaiq2fqaz9yBCJYjcXI=;
 b=fyWtwrAWOhHfxhuWwIN8SbG8eWt42+VCcYi7F84RDIaWdqCVDOdWvT4tPnmI4fTei1
 FzDuGihSInbdUVIyBlowfRB5tkUuqJOClWAKyl79ND/KnUjtszQVlwjXocXnvasTw9f+
 mUCm9RvEz5cKxe6bb5NO2wzybmqHO8M22FGlNpRedhFlDz4bZyS2Mxb7YZn6dzxVyyLQ
 0xzDbM2WuuEgsPURXqv8bPkDs+DfuKE7kYRuhtnLeuCpglzNYlmVNVPvGkdAvn0vFYuP
 hCupSXJ/1UL9qtGzmOMn8XPDtLjOSZjcfvB+7gD8KJSpzF0XMTRYO7vAlGupSjTn42p7
 64jg==
X-Gm-Message-State: ACrzQf3EZ2m01TOGeoECozgkXsgZswjdd1xZLKfNmhwxlKrfI+rVBb/n
 Zid1G7Hg01hVooeMqOysWfRc7Q7iuIcBaQ==
X-Google-Smtp-Source: AMsMyM5BvfkKcU86WNyaqzZgxnMa/8bi2ufukanMVEw2tKbJ6454+6pNOJAwp/pQAra0ihyl78QhkQ==
X-Received: by 2002:a17:90b:254e:b0:20b:7e26:f0a0 with SMTP id
 nw14-20020a17090b254e00b0020b7e26f0a0mr42047837pjb.203.1666160447265; 
 Tue, 18 Oct 2022 23:20:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:39a:c061:1f1:ca67])
 by smtp.gmail.com with ESMTPSA id
 mg2-20020a17090b370200b0020d9ac33fbbsm9346563pjb.17.2022.10.18.23.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 23:20:46 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/mediatek: mtk-dpi: register content protect property
Date: Wed, 19 Oct 2022 14:19:37 +0800
Message-Id: <20221019061936.3599965-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register content protect property in drm so that bridge can update
the property from userspace request.

HDCP property needs to be created after the connecter is initialized
and before the connector is registered. Since some bridge may be
attached without connector, register this property in drm driver if
CONFIG_DRM_DISPLAY_HDCP_HELPER is defined.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Context: https://lore.kernel.org/lkml/20221012042030.573466-1-hsinyi@chromium.org/T/
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 508a6d994e831..3374ebe82aeb2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -18,6 +18,7 @@
 
 #include <video/videomode.h>
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -799,6 +800,15 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		ret = PTR_ERR(dpi->connector);
 		goto err_cleanup;
 	}
+
+#if defined(CONFIG_DRM_DISPLAY_HDCP_HELPER)
+	ret = drm_connector_attach_content_protection_property(dpi->connector, true);
+	if (ret) {
+		dev_err(dev, "attach content protection: %d\n", ret);
+		return ret;
+	}
+#endif
+
 	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
 
 	return 0;
-- 
2.38.0.413.g74048e4d9e-goog

