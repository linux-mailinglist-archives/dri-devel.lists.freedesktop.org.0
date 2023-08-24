Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1865F7866C2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502A110E4EB;
	Thu, 24 Aug 2023 04:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9688E10E4E9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 04:34:18 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-76d83954c40so446932285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 21:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692851657; x=1693456457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgC9U49/1XiwmHUdLqYJREJEgjjdntczSVLh2BMuOoY=;
 b=gg5wzGnvwgSMiGWUWT8be99rxJZ48CKcdgrwm6esyAyIvMBY9Nbcn08vj/EW1wVMFw
 prRlfcnVX0FjzRvraMb6OoDIBqZ9WJX8HimTb2BpEwPdmJRbk2/151Bz4DKx3TnXHuTh
 ST7cp8suPxdeTcnhCERCIFIDSYktkeDu1VtEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692851657; x=1693456457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgC9U49/1XiwmHUdLqYJREJEgjjdntczSVLh2BMuOoY=;
 b=LJvbgvCikHXOEjPaEWzgAMe/gsuxf2rusLE34tCKtOHDeyrC05ay7sNkQlgqqv2ce0
 n7AEwPHg8ysF/91QbOYQcW3ln61OViRndA8NudqmH1K3OY4b2k88nWOZNpu4bl8BB9iT
 VDRaoJ32TCZAHqNzxBfuOwDtoO6/n+IkB9QCzqhZ1nsk17SjPOGiRTle3ItQgVfPzXR9
 UDejgZKF/RSGNNK/z/tb8jaHI9aSBKvUr8lVMSbtoz4TUAnPijLe23oZwj4QngTzMnJC
 tYz62TWE1yeU/ghG9ZSpQl6vrb014GN/Af+Kih7INnDSfBUcXpITIb13yh85kZdvhojI
 LFOA==
X-Gm-Message-State: AOJu0YzEOti8qzwk/noDRt62bg0/gjdkancCF2vSkTf7lJjoURIxYugr
 rhWCtgePnP5kbHqwMbmNJ0fjnA==
X-Google-Smtp-Source: AGHT+IF+JEqqakh161VqbJXU+gduG64hJWV+3rpIUAxyr6nGinUGGkqMa/97TCcoefJY3syWrfHePw==
X-Received: by 2002:a0c:f0c4:0:b0:63d:2a59:e446 with SMTP id
 d4-20020a0cf0c4000000b0063d2a59e446mr15218076qvl.22.1692851657568; 
 Wed, 23 Aug 2023 21:34:17 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a0cca83000000b0064910f273aesm4913632qvk.146.2023.08.23.21.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 21:34:17 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/i915/dp_link_training: Emit a link-status=Bad
 uevent with trigger property
Date: Thu, 24 Aug 2023 00:31:09 -0400
Message-ID: <20230824043240.323564-7-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824043240.323564-1-gildekel@chromium.org>
References: <20230818170156.2194015-1-gildekel@chromium.org>
 <20230824043240.323564-1-gildekel@chromium.org>
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
