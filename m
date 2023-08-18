Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0339178112F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 19:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ADB10E556;
	Fri, 18 Aug 2023 17:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64EA10E552
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 17:03:15 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4085ee5b1e6so10635681cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692378195; x=1692982995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKccNRWIi2bA24YpYy5649eNepNW0bWb1E6yKpcIZXU=;
 b=R7m+nPb1zr1OonHOhk7H2SQuSYy10my+mgYzdzqzayqTgX1TNUuNiGrIIaBLTH5/Qz
 EpvHlW4pGHoRZZz7iomdb2IM76HgEQenpuIvl4EkFjncV780LZfmCQ7BOhMZxEFU4aE+
 sZc1xW8Oow4Ka1TkUwWEDrQiOqspDjDw+aHwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692378195; x=1692982995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKccNRWIi2bA24YpYy5649eNepNW0bWb1E6yKpcIZXU=;
 b=D1Er3SIMgMBKoHBOhYBYfyzjE5kPHpJAiMhKnGEVVmvCjD5UNG4q6eWPxzDbjTK4+A
 i+/PnjUcR8VZ8AGQwgQfnmjvWqJ9NoNXp4zCxc/5t3p2IUL3jFI9u04KRCyijduYz1z6
 Li4veyX8Na406g3GPqNMBlACH0L/I3V18zlSjkb8bBqoc3Dh4aSJFuGkpA3tmPBvDUL0
 gQ5zhSOUxsgmrurKHgKYhY7S6oT6kNxjwr1S640/MinsEzDDGSJxWg4JSvu15XbujC+c
 QvsML2aJRyUQ3dlwYHG7EX/yXrQ3dKiANEaAd66xbqo/QzX2Ic87DVjOYCdFKqEErtm9
 4cAw==
X-Gm-Message-State: AOJu0YzMJt+2JBQ22wr7LxblTZ2ukJFs48d1g9Ui9lDqu3DJwBLfSM2f
 uI33GlTUbQCHtkev3EoFcAw7BA==
X-Google-Smtp-Source: AGHT+IEWGeHczmoeDZAZ1wJ8A564mXZNnJOGWIF7AO1p/WZAwImjo+fkRLefOXH0MVV4zAEVa8mB/g==
X-Received: by 2002:a05:620a:bcc:b0:76c:d2be:b7d with SMTP id
 s12-20020a05620a0bcc00b0076cd2be0b7dmr3342141qki.14.1692378194825; 
 Fri, 18 Aug 2023 10:03:14 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:281:cb2f:c9c3:f2f8])
 by smtp.gmail.com with ESMTPSA id
 cx12-20020a05620a51cc00b00767cfb1e859sm649278qkb.47.2023.08.18.10.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 10:03:14 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/dp_link_training: Emit a link-status=Bad uevent
 with trigger property
Date: Fri, 18 Aug 2023 12:59:20 -0400
Message-ID: <20230818170156.2194015-4-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230818170156.2194015-1-gildekel@chromium.org>
References: <20230818170156.2194015-1-gildekel@chromium.org>
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
Cc: Sean Paul <seanpaul@chromium.org>, Gil Dekel <gildekel@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a link-training attempt fails, emit a uevent to user space that
includes the trigger property, which in this case will be
link-statue=Bad.

This will allow userspace to parse the uevent property and better
understand the reason for the previous display configuration failure.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index aee3845edd2d..772979f163df 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_sysfs.h>

 #include "g4x_dp.h"
 #include "i915_drv.h"
@@ -5604,10 +5605,12 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 {
 	struct intel_connector *intel_connector;
 	struct drm_connector *connector;
+	struct drm_property *link_status_property;

 	intel_connector = container_of(work, typeof(*intel_connector),
 				       modeset_retry_work);
 	connector = &intel_connector->base;
+	link_status_property = connector->dev->mode_config.link_status_property;
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
 		    connector->name);

@@ -5620,7 +5623,7 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 					       DRM_MODE_LINK_STATUS_BAD);
 	mutex_unlock(&connector->dev->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
-	drm_kms_helper_connector_hotplug_event(connector);
+	drm_sysfs_connector_property_event(connector, link_status_property);
 }

 bool
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
