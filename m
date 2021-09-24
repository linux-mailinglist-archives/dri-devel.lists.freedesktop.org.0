Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603BB416CB6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341F66EE10;
	Fri, 24 Sep 2021 07:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736936EDFB;
 Fri, 24 Sep 2021 07:18:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u18so24385187wrg.5;
 Fri, 24 Sep 2021 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2PlrT9rqD3g2RKXKoyVvQWRQ3kbYLZy4tSH1wo/aiKQ=;
 b=SaurTfbrOAd1J73wEzqbrLFpDyn2RrO6QVmlzVe7sKR0/jOw8/NPFHu4wTePTSY9mP
 42rkkc3M61pzMmreOtQ6XbS5O9OR77p2ChkYTqGDWpVYcL2qRTet4raiLMWNuiNRS0G0
 bl4tOYIPzQAGpWYPAPFTAZvL22CoLuIg3dzMucKHOGybZdohP0G+8PBzBczTrbbsvZO2
 LqalR9ZQ53ZqyplvI3d9jrkGLlk0FUaAE1NADzVL2dTAVR+9vrL9Ga/PBJ9R3p3yNtYb
 NqRZoWMjaNZ0UxDOh2oWSNvqlHKYEqwNW6AJMqCQLNMzJhOLFr10rTyTaaL1ObgnqXNk
 BZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2PlrT9rqD3g2RKXKoyVvQWRQ3kbYLZy4tSH1wo/aiKQ=;
 b=z6X75ibErzq3EkN1DF9bV2w0oYVM9H8GDD8qYLliJ+B7xpvenVX4epHDPLDVpDW+Ji
 zV7Rp9tw3oebs6dBtKCAodFQhr/mFAXPCeGeprvsCRpLkNmbyz3Da9s/Yjrra7iyJjKi
 rdEywyI9gPDCGc81Ex4+wiaJ4grQ0rJlPN+aPwyW97dL+S76cuTXl1VtJgL0jyT6sAaI
 L2qHVAAbhrBKNt2kWL1CWDZS4P7VgFBxeIkxtGcMV5RZjkgZt+kc6BlB7DTWFUqwhl6M
 bqpQHhK2kB8/Q2yyhVObmLLLMxqLHzQrzclI9+xTd16i3+Rilwa4dlU9BP3xz7H5/enk
 5nCw==
X-Gm-Message-State: AOAM5318GJ1f4VX6QAOqm7OLjxpDzqDy8IA8Iihol8h0Gzxnv7jUDvjD
 4VJSzey2PhvFzQewBcWfQDUw4pEkmYI=
X-Google-Smtp-Source: ABdhPJzvIL8GC2I1KfdrZn6W+rA/52hCsdX2n9uHkXWGyod5dX4v5NWGRmuVcxlMOunU1chC77sVZg==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr9287302wrp.437.1632467882926; 
 Fri, 24 Sep 2021 00:18:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 b7sm9200070wrm.9.2021.09.24.00.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 00:18:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 linux+etnaviv@armlinux.org.uk, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 2/4] drm/msm: allow compile_test on !ARM
Date: Fri, 24 Sep 2021 09:17:57 +0200
Message-Id: <20210924071759.22659-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924071759.22659-1-christian.koenig@amd.com>
References: <20210924071759.22659-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM is one of the few drivers which won't even compile
test on !ARM platforms.

Looking into this a bit more it turned out that there is
actually not that much missing to at least let the driver
compile on x86 as well.

So this patch replaces the use of phys_to_page() with the
open coded version and provides a dummy for of_drm_find_bridge().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/Kconfig   |  4 ++--
 drivers/gpu/drm/msm/msm_gem.c |  2 +-
 include/drm/drm_bridge.h      | 10 +++++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e9c6af78b1d7..5879f67bc88c 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -3,9 +3,9 @@
 config DRM_MSM
 	tristate "MSM DRM"
 	depends on DRM
-	depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
+	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on IOMMU_SUPPORT
-	depends on OF && COMMON_CLK
+	depends on (OF && COMMON_CLK) || COMPILE_TEST
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 14907622769f..5bd511f07c07 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -85,7 +85,7 @@ static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
 
 	paddr = physaddr(obj);
 	for (i = 0; i < npages; i++) {
-		p[i] = phys_to_page(paddr);
+		p[i] = pfn_to_page(__phys_to_pfn(paddr));
 		paddr += PAGE_SIZE;
 	}
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9cdbd209388e..a445298e1c25 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -790,11 +790,19 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 
 void drm_bridge_add(struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
-struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
 
+#ifdef CONFIG_OF
+struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+#else
+static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
+{
+	return NULL;
+}
+#endif
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
-- 
2.25.1

