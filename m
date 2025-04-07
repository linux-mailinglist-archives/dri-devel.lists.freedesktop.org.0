Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F4A7D755
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C400F10E3AF;
	Mon,  7 Apr 2025 08:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ec131pbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB92310E3A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so14584635e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013690; x=1744618490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnVpWku238hbA4Nkq9IkwuoRE17xKzZpiURAgcmw2aY=;
 b=Ec131pbkfLHFA387l0uBo5IOteVEoS5B5fJYrKDNal82BXIvqqmPvc5ikmsBpqA1Ae
 M2OVmS5+azAWXvHRzZNyPZOHr15qkQ+lv7Zy9QqyHWGSN5EXqw5rm7j5YVQ3ngztamL8
 zdOWkiX3ya9mligwtrZ2hf9sPHCdRI/7zjRDYD/oqYkYDy/2RadM/K4nZpjCgXPmlSDD
 WMUrtRzmS5tRaTue7MT1/GMHrZc1AIvAI7QZ898nv1D++UDMLHS2X1nKJJNls6LmvuGv
 ENPV8MxDkZ4gxwoIq3HNAe9hK1hY1rKzaUsQqRakQ1e5rzElwI+ROskl0h997YwBs62j
 z3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013690; x=1744618490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PnVpWku238hbA4Nkq9IkwuoRE17xKzZpiURAgcmw2aY=;
 b=Ld4ZrxacoZQBoNQWxVxDu225uoITnwX+0o+EuDIvVmhF9Nk9PcWCT1f9JWdguA+MiF
 /ag7erOZF6sEoNr7ujNwDvwh2M4mSXNg10an0c9jxgFCRHjONS+yjTh+oJEEBaiUJacL
 R7pMGjIPD+6+e4nbcpgs2Qa6+4iz/8Wd7G9GojrBpwCkw6wq2zSKpREu9Rde2yMfO20j
 1U2+DpcIxwq8D0pZJ7+eh6KodRw+DC2IUWa2uVUXV0at28zBAm3gDEk7xzQlPMUN7pBW
 JoojFaVlsaYJylchc8zUHdak/xpBwAJFTiBf46ibDZyFqOhOEzRzKknsx5ezL3UMvvd5
 8XeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnmqMA3nMt8EkxLHAvl7nPKrI/zRmdHg+JgYvlsn4Q54922kq4nGggKO2vkppqgR7CJZmGUwWGEbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb9dhGSipesSla1GtoFr/Wg7TnGm+t4r5ua4dqooClevR263Iv
 2rKKg8xevgZUlCavWlooS493ltxZfMMchiHgGn0kjglciOXGmkxy
X-Gm-Gg: ASbGncvyc+nT9Hq54GQJSYXINWKPE//2STMA2Bu6pC/RqHEu4QkVv/Ug1FFFflYeecL
 czBCHGKY/vMWvaH/NCvSO+hLXXOcvO3fFx6zX1tUMUuMFI9hQAXvkiQ1yAVZTc08pgiX4oxLb8+
 IPyTQMImnNYIbFRCxjGPPIXnYPlgh7VyGQXpNulIQBBcVS3EjRvp21JNUmAd6Z3dlolX5CXV+sN
 /264lQYZh5ZJoKrsG9kIkr6f4G+Ixozhykd8xL1WKoXtncNyzsLjYkfipNPPOpw29HRuzBBmNP5
 c1etLlvVeseeoQ9ASATm+AW0d+JYNkiGJtgjauys3wnSRbjMWOtAYtI=
X-Google-Smtp-Source: AGHT+IHhKBmlY7br9pm8f5WIAoCtogRB7yIZ1AoNbNEUAWye6mIWcwnEpvMXHGsAgQU+b+HjhSrsiw==
X-Received: by 2002:a05:6000:1847:b0:38d:de45:bf98 with SMTP id
 ffacd0b85a97d-39cb3575870mr8506590f8f.8.1744013690345; 
 Mon, 07 Apr 2025 01:14:50 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 15/16] drm/vkms: Allow to update the connector status
Date: Mon,  7 Apr 2025 10:14:24 +0200
Message-ID: <20250407081425.6420-16-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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
2.48.1

