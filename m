Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8A27879B2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471C810E5C7;
	Thu, 24 Aug 2023 20:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607010E5C1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:54:08 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-76dc7b0da9fso15711685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692910447; x=1693515247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wc66pRU9OKWitHlEhM03zOV4Qkog3n79jFNT7eNt/cw=;
 b=UOxGn5em/U/vnblLsi+Dv63uD2DkopgnW52wDV6h0c5MQNQpkUBWftFdW4KD5WGzgB
 7WlWMu/nSWkend165HiGYdWrKpha0wvlEsaD3wciazhHgMxePCqQP5qDtv4jvB8M+3f5
 j6usnEDHo9Vuhg1Jqxxj26lFfT2L5lXQytSIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692910447; x=1693515247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wc66pRU9OKWitHlEhM03zOV4Qkog3n79jFNT7eNt/cw=;
 b=eCwT2Z2yY+IG8kcz3AnISPv9VS8oM0WOUaIKCjpEA85eS9QnqxuofS1u8d5q9FxXEq
 IAwCNVcpJxugU2sp6HIE5c/oPFF65aWeBjYkDhJ8ieYFbCJxsUp/pLZ5HLfisAextUcF
 QzcYSppJqUH9YqurMZSY61bWR36zBUmYgNU5PJ2Wuf7+XzZGR8smsAM6LrCo6sLAvPRS
 rSYqj2I150vqoyayMVIBZUA7Ne1aVXYuA1OOTo48mg6JgDca3IkTtPjp4Macq6zku3fQ
 Te3G9jMpDCTlRRuLhU7QBGSa6dpkrPiAGNxJkvedl8rgPO9Z+CYeJe7SZK8lnLmgj3DN
 PZ5Q==
X-Gm-Message-State: AOJu0Yx6OL/cuS5vkMv/mPtAyqj+uGfPa4ZIvFRvn7npZ8+QLEhXq1Bk
 hPn1EAqq0pgiG1hJMyhUFoEYLQ==
X-Google-Smtp-Source: AGHT+IG7xKneWNbjt1OXDtuY96eIhGFbMGHQ/kG/0VMv3F3CkJB6mqr2GUmFb3pNdh+UfY11TMQoGQ==
X-Received: by 2002:a0c:e001:0:b0:64f:66b9:81e8 with SMTP id
 j1-20020a0ce001000000b0064f66b981e8mr4318035qvk.31.1692910447428; 
 Thu, 24 Aug 2023 13:54:07 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a0ce442000000b0064f5020df91sm62038qvm.28.2023.08.24.13.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 13:54:06 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/6] drm/i915/dp_link_training: Set all downstream MST
 ports to BAD before retrying
Date: Thu, 24 Aug 2023 16:50:20 -0400
Message-ID: <20230824205335.500163-6-gildekel@chromium.org>
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

Before sending a uevent to userspace in order to trigger a corrective
modeset, we change the failing connector's link-status to BAD. However,
the downstream MST branch ports are left in their original GOOD state.

This patch utilizes the drm helper function
drm_dp_set_mst_topology_link_status() to rectify this and set all
downstream MST connectors' link-status to BAD before emitting the uevent
to userspace.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 42353b1ac487..e8b10f59e141 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5995,16 +5995,20 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
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
