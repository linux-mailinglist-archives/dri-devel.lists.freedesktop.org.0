Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB317879B1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88B510E5C5;
	Thu, 24 Aug 2023 20:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A803D10E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:54:11 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-64f5aeb81d1so1670656d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692910451; x=1693515251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgC9U49/1XiwmHUdLqYJREJEgjjdntczSVLh2BMuOoY=;
 b=jneh+RP2PhXCvVUPvts4fDrlGO0Ce6JTjiF+WiuMmXwfchAsRzFxukjA4PYCxz6MU9
 dQT33+c/nK7y4rP/Plb5NIEihx/jT+/7ivp/iyGj7nNPoNm8GeZog+18PWKvlEKF/ruy
 eR3GuKNnBS5Yr8erQQ/K5tKCKlZwDtGZ8YI88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692910451; x=1693515251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgC9U49/1XiwmHUdLqYJREJEgjjdntczSVLh2BMuOoY=;
 b=OhtgmS0e2j96wxf0bhSKyu5Edtula+8azukQ2ZRK1jdjmnbI77ZkRR+CLGkk0xH+wL
 5lxGfh/spUkDP+vy+K0ur/Khm7wicfhePq5ENIv2C2EDqu76KA9NsVZ+YmFkcjyBgydD
 HgBcd/ReefsKeshzxO8zys/P20yHyy69kzoJO0IYaie037Lybh6xafO1GKN3K89Oz4Ws
 L95Y1LdhHsc8QhTZ3HmDiGIXcfWf9Kh5tP6NXYN+KVmz7j/a5ZAO0bB9+x9Bj6szyGHb
 7Mo40bNKn6kvuv5RcrwyzYSF2xbsDuPNiewWC4jpRzi2hCskoYrE7HNR9/ijMmjmIF7T
 Latw==
X-Gm-Message-State: AOJu0Yz2XmKMnOBcX6uMLdG9YxQwcfxq1o24+HCCFU5ReU/lE6D+qfqG
 jyEsG2C8D2sbeysflHV0uSwW3Q==
X-Google-Smtp-Source: AGHT+IFEyu6IiZPgQUAsuWOUDBYCAODiO3iub/UNk3w8eXH2eq8Kci+JIcTJL01N69WuVA1WZT9ICw==
X-Received: by 2002:a05:6214:3d08:b0:64b:654a:f553 with SMTP id
 ol8-20020a0562143d0800b0064b654af553mr18232744qvb.19.1692910450792; 
 Thu, 24 Aug 2023 13:54:10 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a0ce442000000b0064f5020df91sm62038qvm.28.2023.08.24.13.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 13:54:10 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/i915/dp_link_training: Emit a link-status=Bad
 uevent with trigger property
Date: Thu, 24 Aug 2023 16:50:21 -0400
Message-ID: <20230824205335.500163-7-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824205335.500163-1-gildekel@chromium.org>
References: <20230824205335.500163-1-gildekel@chromium.org>
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

Signed-off-by: Gil Dekel <gildekel@chromium.org>

V2:
  - init link_status_property inline.
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e8b10f59e141..328e9f030033 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_sysfs.h>

 #include "g4x_dp.h"
 #include "i915_drv.h"
@@ -5995,6 +5996,8 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	struct intel_dp *intel_dp =
 		container_of(work, typeof(*intel_dp), modeset_retry_work);
 	struct drm_connector *connector = &intel_dp->attached_connector->base;
+	struct drm_property *link_status_property =
+		connector->dev->mode_config.link_status_property;

 	/* Set the connector's (and possibly all its downstream MST ports') link
 	 * status to BAD.
@@ -6011,7 +6014,7 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
-	drm_kms_helper_connector_hotplug_event(connector);
+	drm_sysfs_connector_property_event(connector, link_status_property);
 }

 bool
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
