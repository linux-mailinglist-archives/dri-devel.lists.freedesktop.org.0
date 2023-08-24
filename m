Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E3F787421
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4947E10E599;
	Thu, 24 Aug 2023 15:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445610E598
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:27:00 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-41206fd9717so3172111cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692890819; x=1693495619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01nSo9lW06Ie1zgGOaW5x+E+AW55sJ9KmNuJshzlZXg=;
 b=lHfZIxl9yUE40HhYuPlxp50bMBUWgN/2mbz4zM4Rcmu5xR3SAfwmj88e72fMnr4/SD
 ZBvdukiLj0YhvDfd2jkl4BJQKGp0uFyPeHeIVXhD0nYxQeSGUC2VhbdrzQxCTLXl+4Wl
 dv/oV6bSOOl2qR4tTZ3J3w/X60ZITvqI+uIaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890819; x=1693495619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01nSo9lW06Ie1zgGOaW5x+E+AW55sJ9KmNuJshzlZXg=;
 b=G2/lucSpcgOlOEGka83olmYhzME3GaAPnpU6NRV3HBFBSO1NdRr1lPwPtoNCIQVCxT
 ND5KVF0c8EEx+h+IM38AQtKhE3w4xTJxOFub5tMB6VgblWYfJVOcBXPOYcix5DKu6yGY
 ev4oAYjrmqsza6XsxS9dlxwZoC1ET5ai2p+Fdd886W/ix/THc2ty90gI5uLpACbjQ7fH
 xjUnIhBs34RjP4yPHBeLV/9Xd5koEEnv8CBZr/A3YmUifIE8gm+r26iAD0kH+KuJ4T+m
 PiT9t2Qt7q+Tlb4o96c0oABdEiYDlEnBMyffHo66UYQpJNQ/Hr1GRorEIsUMP2atENHQ
 1Z9A==
X-Gm-Message-State: AOJu0Yy5rdBn7dCCi0MsHjGTmQo4yEaNR7s9G1wAidSz5arJZZTqKcCU
 AkVcRYOgRa5rLh0OEkG2FnUQOA==
X-Google-Smtp-Source: AGHT+IGaRH3VStaRfMi6Db4BY/0cBnHez6zFGVFM/BHVKaqZh59iqft5FTlzqUgfqtKhj1UYWXLXDg==
X-Received: by 2002:ac8:7c44:0:b0:40f:a358:46b4 with SMTP id
 o4-20020ac87c44000000b0040fa35846b4mr20457000qtv.13.1692890819707; 
 Thu, 24 Aug 2023 08:26:59 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac83d8a000000b0041079ba4f6bsm4423014qtf.12.2023.08.24.08.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:26:59 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/i915/dp_link_training: Set all downstream MST
 ports to BAD before retrying
Date: Thu, 24 Aug 2023 11:25:21 -0400
Message-ID: <20230824152631.401621-6-gildekel@chromium.org>
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

Before sending a uevent to userspace in order to trigger a corrective
modeset, we change the failing connector's link-status to BAD. However,
the downstream MST branch ports are left in their original GOOD state.

This patch utilizes the drm helper function
drm_dp_set_mst_topology_link_status() to rectify this and set all
downstream MST connectors' link-status to BAD before emitting the uevent
to userspace.

Change-Id: Iaae8f0b12b8bce4b16ecad63063c04d3c8ec93a8
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2e562e09c704e..71f54e56c4434 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5326,16 +5326,20 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	struct intel_dp *intel_dp =
 		container_of(work, typeof(*intel_dp), modeset_retry_work);
 	struct drm_connector *connector = &intel_dp->attached_connector->base;
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
-		    connector->name);

-	/* Grab the locks before changing connector property*/
-	mutex_lock(&connector->dev->mode_config.mutex);
-	/* Set connector link status to BAD and send a Uevent to notify
-	 * userspace to do a modeset.
+	/* Set the connector's (and possibly all its downstream MST ports') link
+	 * status to BAD.
 	 */
+	mutex_lock(&connector->dev->mode_config.mutex);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] link status %d -> %d\n",
+		    connector->base.id, connector->name,
+		    connector->state->link_status, DRM_MODE_LINK_STATUS_BAD);
 	drm_connector_set_link_status_property(connector,
 					       DRM_MODE_LINK_STATUS_BAD);
+	if (intel_dp->is_mst) {
+		drm_dp_set_mst_topology_link_status(&intel_dp->mst_mgr,
+						    DRM_MODE_LINK_STATUS_BAD);
+	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
 	drm_kms_helper_connector_hotplug_event(connector);
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
