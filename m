Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8737782040
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 23:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70710E168;
	Sun, 20 Aug 2023 21:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765CC10E160
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692568454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+R/sWlMT7wVG64uORegqci3bW98/zYiz5u+hdhEocSI=;
 b=TMSzVnoccO46eCe1Liy2Ud9OP39rwo9tn+Exw24xwMf86uUUWvoDj0CSn2n+YV9EqRhZds
 nZ1ll0wTrDEN8+11I4aDw2VfqAkirej8X8QsDMt8LEfj7u0DI4kKOriyqaBd15+/JS6sw7
 BFOjXKp2kq0KNavWNCk9MpHtSFFiJFc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Phnw9hU6PFqDgLS3V-7eMA-1; Sun, 20 Aug 2023 17:54:13 -0400
X-MC-Unique: Phnw9hU6PFqDgLS3V-7eMA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4ff9e0ad205so2516059e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 14:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692568452; x=1693173252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+R/sWlMT7wVG64uORegqci3bW98/zYiz5u+hdhEocSI=;
 b=D6S0Wj+I+WEX6wYt2QAkmrQRe+cTuWvNHDuszpNvjZIK/tzKMM8CnnxPj0yzVb73MC
 WX+ehoJmuvrwHwBnMEhQa+eEUiAlh7DHa0VaIp5OWxlFQNHiI1Lx8Z5gG991bY9gJ/rD
 bwD4w0+Ln0uzGjEVJ/1pi0k7AJkL65SDVhKTh8vWCMJVFr6TaA+8KNhXoy9OMw4VhVrl
 LkhAxKg7jEjA6nDjWipoVv6DFcgeYPCs8YtY+4ONwIsGiaKHA9csRgJ8fhJhs35tvGYd
 chnG4Pp/0VUwGtQ1Y2nsKx8Z4HNvbLf+tfL80TW3cSAqBJvkcmip9Yd5rDOTgvzL6B/5
 jW3g==
X-Gm-Message-State: AOJu0Yx1YP+hG2U7H7sAsUYXC0eHSK13fJfHKA2WO0BaDKeGF/jxwVnO
 eW0JirLi6x2wxCCl9R1zh+XI5+I1bvuG4P9StJ45fRnbfRQOPs6sNA6UbBhPpQLZrKlJF5M/Ymk
 Tqa0BGHXmH6FbUdDxHnRB5wjM0pF3
X-Received: by 2002:a05:6512:2396:b0:4fd:fafd:1ed4 with SMTP id
 c22-20020a056512239600b004fdfafd1ed4mr4221920lfv.2.1692568451863; 
 Sun, 20 Aug 2023 14:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQOe6EUHANI7lcqkPBWc4kZcyrIJjTjqCjCwwhLtlytYfuYgg2prfqx79jcLJiK4a6N2mu/w==
X-Received: by 2002:a05:6512:2396:b0:4fd:fafd:1ed4 with SMTP id
 c22-20020a056512239600b004fdfafd1ed4mr4221907lfv.2.1692568451672; 
 Sun, 20 Aug 2023 14:54:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f11-20020aa7d84b000000b005257f2c057fsm4897287eds.33.2023.08.20.14.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 14:54:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com
Subject: [PATCH drm-misc-next 1/3] drm: drm_exec: build always builtin
Date: Sun, 20 Aug 2023 23:53:08 +0200
Message-ID: <20230820215320.4187-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820215320.4187-1-dakr@redhat.com>
References: <20230820215320.4187-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_exec must always be builtin for the DRM GPUVA manager to depend on
it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig         | 6 ------
 drivers/gpu/drm/Makefile        | 3 +--
 drivers/gpu/drm/nouveau/Kconfig | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..85122d4bb1e7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -210,12 +210,6 @@ config DRM_TTM_KUNIT_TEST
 
           If in doubt, say "N".
 
-config DRM_EXEC
-	tristate
-	depends on DRM
-	help
-	  Execution context for command submissions
-
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..388e0964a875 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -23,6 +23,7 @@ drm-y := \
 	drm_dumb_buffers.o \
 	drm_edid.o \
 	drm_encoder.o \
+	drm_exec.o \
 	drm_file.o \
 	drm_fourcc.o \
 	drm_framebuffer.o \
@@ -80,8 +81,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 # Memory-management helpers
 #
 #
-obj-$(CONFIG_DRM_EXEC) += drm_exec.o
-
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index c52e8096cca4..2dddedac125b 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -10,7 +10,6 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
-	select DRM_EXEC
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-- 
2.41.0

