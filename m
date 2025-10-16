Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB79BE4F23
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9F810E339;
	Thu, 16 Oct 2025 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IahEsaqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B05B10E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:57:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so1326694f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637420; x=1761242220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOeIZT+0nowAboOM15YWTpcZn2OOxWAKh4lx00a3ZV8=;
 b=IahEsaqPxNBdndh5/gHD533Vuu5YkXvGIu+c6579CXw3mH3ehKVKfqGWyNhhoH/e4z
 06GzdYshz4eoZorDG7d77vXtCyN/CfALRo2u93k7QTiGuoNmrPp9PXuLQRdf5ismyYEH
 sGVNJ0gV3FPLgXHMARDLnRcxoGg9tZGx3PyJccNs2/clCMcq0XYhQhgKPorvnLSZQFG/
 6dQgAguZjWjWukvbsTSei5DLWvh0gj56JybJhA11gfwDywYks0aV/74ATaq8Upugh4Hn
 mzDxPZ6s85G5fJIBT+jD48qHVJVWoX83j/dmoEY3e36nosSaXg3F5S0GMDkJqfqWtvLw
 Jhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637420; x=1761242220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOeIZT+0nowAboOM15YWTpcZn2OOxWAKh4lx00a3ZV8=;
 b=IZLu6TroEcsTz40MMstucLF3qiQjkzaHunknOdJ3n+Al5TpvHKXB1Ffe8YEyAO/Ome
 gvcBQno+WD0hMHz6Q/ZmyKuUD/SWLEHm/xdGKDTRkrmuIco6rDtsNs46gr6Lnus7CSVP
 xa3r8q5Wg76avy1fCuSMg8IuHb64ar3H0gRbBVN7aOw8KTCrFzu2w8zwebY1y+WIrbMU
 7VGnYKNdAzS3T9aQezHzDtpc7vYhxUA8z9Or7Ur8H7J8EHa7mfD2cS2SqH+udjGZaZNk
 /0GyyUsdbLNcRwkxx4HxiqFljgM1gURuujSN0dt1ml4k0UsXq/6gtSx7Y0z32KPB2i9g
 1B0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBjS7SynLlOg/NhD/SDgAiSvsB/I3yZmFJNt5UCJfbKR/V0ZDnFUQ5iCt1DvEGYU/GNTNK9/obWKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0JKiTHgYQ9dBFIVfQU6RDJbrobGTzv5tWVaNKyIyJtUKEyFa+
 BzjTTrCe9taBNcvAM1PNu8KoU7vy6xV4DUqBosS+frPcFNEH4zAnSu0q
X-Gm-Gg: ASbGncu8Y36RH3YsEoipDTOS6U1ltXDg6vwoMtJw/XHztYLCB6etbbcPD8y3y3sv88g
 qgwsgItd+R0YB1yGxtR5bGWs8qm9vndtpS2XKmvQVk8uHfyZwbBaONdwaZFy2xlu7LSclxR0RCH
 6qOisFx/aCkQn7d8+DlvKobI64TbJ9NOLN/QA3Fd9SihyuykJg8dFZtUVhFk3Y+UctkJ4AjUiaw
 2Zji0jpaTivmCWRpBn7t0yxFhzyZkFu9tbif5ComM/5WMAIAXxJKhUK0BaDPl4AMibhBKWtxfzD
 UrnR+zfLvSsf5e1iTN/m5/0+rHfRqZ3TEiTczoZ8CJuMoeJ37eETv3dYrGTC7zHObhpRDYj6Wig
 XYKcdaCOmcKGxZselZovWkqcryHaQqaRi+EFXI52p+a7eIPVNopEGbLmvxZRw8deyl0oF7q/c/3
 w=
X-Google-Smtp-Source: AGHT+IHe1OLOXOadpXnjRw98pZ3luRk/lvOuNRj9YhMuqiInrVYkMFOqFCyNrXu08kVK/1fJT5i00w==
X-Received: by 2002:a05:6000:144e:b0:426:fb63:c01f with SMTP id
 ffacd0b85a97d-42704bf71ecmr887370f8f.29.1760637419784; 
 Thu, 16 Oct 2025 10:56:59 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:59 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 15/16] drm/vkms: Allow to update the connector status
Date: Thu, 16 Oct 2025 19:56:17 +0200
Message-ID: <20251016175618.10051-16-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

