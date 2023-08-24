Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701A787427
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1810E59C;
	Thu, 24 Aug 2023 15:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81BA10E59D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:27:03 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-40ffa784eaeso39448111cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692890823; x=1693495623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rt6pB7aPeFnvM0um6shDl4ptArbJcOoIOPa13o3miM=;
 b=H9fbAMya95a0tdVqITRxCG98PHUGWy0mxJSyaCJ1oWoTmxZHAMsk7Ctwta2+IFFGFZ
 Gg7AnkV3/wsG4zWLjTU1Ubbao0gNsDQTXtDdhDwOzbYSZvovbyfPrh2Oj9ZK27BYbB0w
 +OGf/fdIrhvUcHKUR9sSpxm15tYFrlv78cXrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890823; x=1693495623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rt6pB7aPeFnvM0um6shDl4ptArbJcOoIOPa13o3miM=;
 b=S/s9JogVfuVSfVb5MUmF/ti6H6RI2j2fYHLxJN0jJG/2DyaPtJxC4rHjAeInet93kH
 eJnNOtjSOS9wm3ajyGr2Gina8WtVNlAT/JKC8SsFAuv0mTT4oRONGD9hcs8Wg9ZlbURf
 CoDUSi+dNY182iXQRjBsfDQtlhdn2hBPTZGLVcSLndQ56/3HuPrPWKgYr6py03/h/WdT
 OeitJTLc6KhU2k+EyuKtGEs9AisZqiXwHiGGaRsfuDBv0xqwuzgiGAezWnACEfvsTS7a
 TcJ9mZf7UhqBr5UgL43FhJ7iavTFgNhyvmTohA5oROIzFvC2NnlXEipwejwU8EfQTr7D
 AkYg==
X-Gm-Message-State: AOJu0YwPm9RwmZ12S9kce/nVMwGqPA8mc5vepPVFqMZrYdW9XJS6JOXC
 1qtl+JU3wlcXfF+cgPCCi0TdOg==
X-Google-Smtp-Source: AGHT+IHD43buU/3etSBsSxhHjbm9ooSj6JxY6ecMb64UALTutemAUqT3TcNXQE5iorGplYPJlNAXYQ==
X-Received: by 2002:a05:622a:13cc:b0:40f:dcda:ea2f with SMTP id
 p12-20020a05622a13cc00b0040fdcdaea2fmr17727365qtk.29.1692890822882; 
 Thu, 24 Aug 2023 08:27:02 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac83d8a000000b0041079ba4f6bsm4423014qtf.12.2023.08.24.08.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:27:02 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/i915/dp_link_training: Emit a link-status=Bad
 uevent with trigger property
Date: Thu, 24 Aug 2023 11:25:22 -0400
Message-ID: <20230824152631.401621-7-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824152631.401621-1-gildekel@chromium.org>
References: <20230824152631.401621-1-gildekel@chromium.org>
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
Cc: seanpaul@chromium.org, Gil Dekel <gildekel@chromium.org>,
 navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a link-training attempt fails, emit a uevent to user space that
includes the trigger property, which in this case will be
link-statue=Bad.

This will allow userspace to parse the uevent property and better
understand the reason for the previous modeset failure.

Change-Id: I6170e2755121adf04621ae4fff06985bf4b26d3a
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 71f54e56c4434..f45c3bab743cc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_sysfs.h>

 #include "g4x_dp.h"
 #include "i915_debugfs.h"
@@ -5326,6 +5327,8 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	struct intel_dp *intel_dp =
 		container_of(work, typeof(*intel_dp), modeset_retry_work);
 	struct drm_connector *connector = &intel_dp->attached_connector->base;
+	struct drm_property *link_status_property =
+		connector->dev->mode_config.link_status_property;

 	/* Set the connector's (and possibly all its downstream MST ports') link
 	 * status to BAD.
@@ -5342,7 +5345,7 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
-	drm_kms_helper_connector_hotplug_event(connector);
+	drm_sysfs_connector_status_event(connector, link_status_property);
 }

 bool
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
