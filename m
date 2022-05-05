Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E051CBA1
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54410FAEE;
	Thu,  5 May 2022 21:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD87710FAEE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 21:52:25 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id v4so7204093ljd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoshODm7iqCrZFWiFB2Vem8EURDVclILAzPCL2+8yfU=;
 b=c5f/rX5msB4ZpL+bvLH7hHn5ZvLhpMGUvldwduhfEx4EP200XAxpYWsm6mMYEPRNuI
 i3H9js0/Kg5TFvmJoqGoSVFq3pS98Zv62/6QdH/GQejZYNPO6TFqbZ3jiZY/TOECuJrn
 bcI5euEv3nzamU3rYYI8OxYJdFDu06urLsPnE7nl3ja3V0ECAj6amevSATFQuCPPNTaQ
 ZhKroATPxgkIwDR+tl6FEzWE3fHN8/5SnJ5YHH/7DzTXjrxbo41VfZ+HfKVQu+GKqahT
 IpTOj/Vubv3v3TuJzJZ60tTEcL2uKCdTp0FFhOS2SrCkmMGltGTQpczNOz1X3SmZlxLo
 MfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoshODm7iqCrZFWiFB2Vem8EURDVclILAzPCL2+8yfU=;
 b=YRdhIH6VahlgWTFAEjiJHPExQ6BvfLtBBC2PCnyQ6UO4dczBDpfoRvP7tl8SvMPaC8
 SLEfHcn6kLECOcNGmQlfASnkpjHYahxbKe9lQugvjgRB8ESAU64VwPFcHcKRPkBOYyvb
 Kn4VpxdVA8nDv5SFo3BAvl31lig0rOUr1QfXrlKNH3B9N3ZyzX9sW3m6lS663SvZzXnH
 i9ojkS0JHPBc69N9VGpYwotpd7Pw6Rr5PiEBF0wK04AHbY2v4Dh78AzSFoCZ1FW8Alyp
 pVNLEDd9iQ25U6bQtFAQfNcb20yLgYIDEgHR26jhZ6mOIoVWDXlLHjaknDEt1vt+uRNn
 hSsQ==
X-Gm-Message-State: AOAM533QDNUBpfUfqpW8K8uzA2pkaByz2EzrqkzhJYKGWK8jJrqKvxKP
 /A9eYMZuzmjx0BHKPgsUHKenp4MNVQ9p3w==
X-Google-Smtp-Source: ABdhPJyLCuNV3t4gZk/oCBqpOsgGPIz0cRd8R3ks7Jn86zlltAaUYV0nccQtt8ZUhrWb5RQ49PlySA==
X-Received: by 2002:a2e:93c6:0:b0:24d:422f:f8f0 with SMTP id
 p6-20020a2e93c6000000b0024d422ff8f0mr66204ljh.469.1651787543754; 
 Thu, 05 May 2022 14:52:23 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a05651239cc00b0047255d21192sm380757lfu.193.2022.05.05.14.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 14:52:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/tve200: Fix smatch warning
Date: Thu,  5 May 2022 23:50:19 +0200
Message-Id: <20220505215019.2332613-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "ret" variable is ambiguously returning something that
could be zero in the tve200_modeset_init() function, assign
it an explicit error return code to make this unambiguous.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/tve200/tve200_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 6d9d2921abf4..3f4fef574706 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -65,7 +65,7 @@ static int tve200_modeset_init(struct drm_device *dev)
 	struct tve200_drm_dev_private *priv = dev->dev_private;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	int ret = 0;
+	int ret;
 
 	drm_mode_config_init(dev);
 	mode_config = &dev->mode_config;
@@ -93,6 +93,7 @@ static int tve200_modeset_init(struct drm_device *dev)
 		 * method to get the connector out of the bridge.
 		 */
 		dev_err(dev->dev, "the bridge is not a panel\n");
+		ret = -EINVAL;
 		goto out_bridge;
 	}
 
-- 
2.35.1

