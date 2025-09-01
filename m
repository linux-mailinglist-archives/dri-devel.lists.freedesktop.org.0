Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56550B3E2C2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A54910E447;
	Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="USLvBNci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B018010E446
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3d0dd9c9381so2894354f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729574; x=1757334374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcY27BYD5SEbH9egkOiTtO1uLUZ1+Eh26ylvssFUQyw=;
 b=USLvBNcixXt9VjgARvbmUnE48iOqw1DEw9MgHTXYRsaY8THWp9mrBM3wp2bcMS31gh
 WcpmRnPJ6I9F9Ik3GOcl3p0h9QLKNzkQ0nUiFdFa3NV2HSc5gaO8NhQMtCNujWt09UPo
 q03NxJRGWrseMQtQfEDv4n8GM7eE4okcrsKVDfmL2xfW+B3/2ujLlXuxl+6ECyeK8ot6
 ZOATDtLeeamj8Fu4ki2Twka4Mdh0/3EX2j38hPi545dK3Wfh8cwbqyD/wx1yjVnaEZfj
 OO0ueGYLHLREdijTAo8Y5rJLCpPp82Sv9/7My5hqbIeZXPxp/IVgHbY+eNJOkBicPA9h
 f8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729574; x=1757334374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcY27BYD5SEbH9egkOiTtO1uLUZ1+Eh26ylvssFUQyw=;
 b=GblGiFzAbPGXTGfBoEakFxuhXFcqx25vAteTNeDAjZwy8eoyx2rf13Hao1TE9Kya/8
 CA6oiSTYphaIqN4izezubmFQVEOL/nFB6Riz6WY+DyHh0saSouO9iDN1M0xvPBTIPwIq
 0nbRoyeSbY+AMGmB+4y9QVBV/iXr7H5sTrTsVpE1l425/oyrkRfwZcV3uUB58wgXYnZI
 iEjP8WBvj81Lkq/zd+zRmKGBaL0O50IZVBpasgqtQFPhW5Ivh5IcLafTV289KdQBaRkF
 zaEQ6Cup/+qMB14WCalCDv3VzNHZRXja/+dfshG9DI1PNY/K5hMkMm5mRIlD+MZqUndw
 Y6/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3qrKYFpxh7gejDYWenu+UrpgaOy2bshbqt3RF2aEBM/ygujKK98blSdTh3bvCAtt5yjZIaNLqByM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXyP4Gb4+j52G0A3UWs8jceT/mbM9HimRtxY8yTeZ0xt8NT8cZ
 RP6+LuXfOnWwmTcDn6AX6pEblI0oWrCnSzGoSx4xD7lHpOMEE4Y+Qa0D
X-Gm-Gg: ASbGncu7wGorCo43+lwjRYhDC3VYBIilIBnPF/9oPDTvzGhjfSHNBP51m7tNOP2ieRq
 inZUd5uQqGMvNwcN/8J8KJkKjm8/TInpybAte5Ed52cM2uaewGn+4CDS87xTZ2XTtQ34xn3JYVO
 nYB99DL3HXOTr5qzsgeT8B3bhgZkI3hdLCGmtj8hf5LiuZ8WIvrOMzAegxr+G6UPsqQfWKDbiA8
 qYiKuXCSAMmsgOh5CoenWNOvGr9gvyZpXO+eatuKkeQF44ILIKAArI7zXO5Uu0AuU5kHac6AJDw
 qaeeAe3TMl9sgYckcWCbUFkIFb7g5d1+Y3uEHZUAK9NomcMYZ/ean3BjkXK+C6HUznNSJhN+aSb
 ZAu3RvEyiUPi9gJNyY51NC9Du1C4Y
X-Google-Smtp-Source: AGHT+IFWulHN5lakrvfB1yKPVtAR0ebBNhrheh2w9WyUFz7tvjAD0QDG5YOMbXfP9MF4shPuaprcoQ==
X-Received: by 2002:a05:6000:400d:b0:3d6:1610:1b6a with SMTP id
 ffacd0b85a97d-3d616101e3dmr2729303f8f.22.1756729573969; 
 Mon, 01 Sep 2025 05:26:13 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:13 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>
Subject: [PATCH v6 15/16] drm/vkms: Allow to update the connector status
Date: Mon,  1 Sep 2025 14:25:40 +0200
Message-ID: <20250901122541.9983-16-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
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

Implement the drm_connector_funcs.detect() callback to update the
connector status by returning the status stored in the configuration.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 28 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 48b10cba322a..89fa8d9d739b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -5,9 +5,37 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+#include "vkms_config.h"
 #include "vkms_connector.h"
 
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						       bool force)
+{
+	struct drm_device *dev = connector->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	struct vkms_connector *vkms_connector;
+	enum drm_connector_status status;
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+
+	/*
+	 * The connector configuration might not exist if its configfs directory
+	 * was deleted. Therefore, use the configuration if present or keep the
+	 * current status if we can not access it anymore.
+	 */
+	status = connector->status;
+
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->connector == vkms_connector)
+			status = vkms_config_connector_get_status(connector_cfg);
+	}
+
+	return status;
+}
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index c9149c1b7af0..90f835f70b3b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,6 +5,9 @@
 
 #include "vkms_drv.h"
 
+#define drm_connector_to_vkms_connector(target) \
+	container_of(target, struct vkms_connector, base)
+
 /**
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
  *
-- 
2.51.0

