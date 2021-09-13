Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F17409B68
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C89C6ECDA;
	Mon, 13 Sep 2021 17:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899556ECDB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:09 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id o10so4035123qvo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvurVzZlAXN+3wz8I30tpTKQ4+4bUnrN0ukF/CdF4vE=;
 b=fnakUYFqIB5fbo4OVxeM+ao1UaC4dOk3qg30+sZcY8bmnuNIgklzub1yfQq7gJNKHj
 AiwfLFK4gQkcUgVsWr7m2CLoJwAwYAnIezlUz3jiLTwiHlZ1BzNnj+9KmHkO5FnRfDvt
 skURcmKSAdZRCy5h1RdnNmMiqpEbCcAJHFvIBmL1lmfBnnBsycmSz/E1tDovhdvyiMmh
 b0LLqoOa9+SgeL1BVQCdhfabX7OuhlQUxkH/cIKfO8jAoaxATb9aTsz9B8WzqTzNy2VI
 1Rr/+/5nClqBri+g/gwmvd07lsEkx7nMQjlgsdj54538Ov8dDkeiEoL7jeouBRknU+H8
 INyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvurVzZlAXN+3wz8I30tpTKQ4+4bUnrN0ukF/CdF4vE=;
 b=WSzEtVTADBBtSAj5Bni+GK2BGxgSbjkMCxMO0Zqf2lbf35R/YOMtIofmu1rntAlwOH
 5+AJUv3q1HuLEaz63PNL9HNijGbzs3x6+mYO+v66aMra9rMI7PDi3GUxrhFtUXV3VwHm
 9caOFFJVaS7KWFXx3YF1S0ZcfaR8CxQaJiXNaBgoMdaCUI0XPTnnsc/Ni1BnItvadx73
 dOI00owxKWu15v9R2XUqVZ9UrDUUH5lrMhCkN1whTBHAPD7q+NmcH3uOLNI/2YtHaXwz
 C4zbr5e9HTvmH3mbZN/1ITXCgpEE5Y3qeDpJ2eSeDZXrMULCKs9kSI4LBLNfHwFZT12F
 z9EA==
X-Gm-Message-State: AOAM531JC14hFY81jPKEEAgoD7uyHjBgADjljhOWN74ulT1UDqzPuL/l
 jZ24FnMNvR1L5MApfiyYw0LCNewaTidwMg==
X-Google-Smtp-Source: ABdhPJwhWW2FKMdz5QWHY1gDm4SfWEiZWUN4x/x/XeM/S3lcK/2Fw2nksrYWBUAFdZ4cCQ4s9HgLRA==
X-Received: by 2002:a0c:fca2:: with SMTP id h2mr780250qvq.5.1631555888517;
 Mon, 13 Sep 2021 10:58:08 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l126sm5881126qke.96.2021.09.13.10.58.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:08 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 03/14] drm/hdcp: Update property value on content type and
 user changes
Date: Mon, 13 Sep 2021 13:57:34 -0400
Message-Id: <20210913175747.47456-4-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch updates the connector's property value in 2 cases which were
previously missed:

1- Content type changes. The value should revert back to DESIRED from
   ENABLED in case the driver must re-authenticate the link due to the
   new content type.

2- Userspace sets value to DESIRED while ENABLED. In this case, the
   value should be reset immediately to ENABLED since the link is
   actively being encrypted.

To accommodate these changes, I've split up the conditionals to make
things a bit more clear (as much as one can with this mess of state).

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_hdcp.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index dd8fa91c51d6..742313ce8f6f 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -487,21 +487,29 @@ bool drm_hdcp_atomic_check(struct drm_connector *connector,
 		return true;
 
 	/*
-	 * Nothing to do if content type is unchanged and one of:
-	 *  - state didn't change
+	 * Content type changes require an HDCP disable/enable cycle.
+	 */
+	if (new_conn_state->hdcp_content_type != old_conn_state->hdcp_content_type) {
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return true;
+	}
+
+	/*
+	 * Ignore meaningless state changes:
 	 *  - HDCP was activated since the last commit
-	 *  - attempting to set to desired while already enabled
+	 *  - Attempting to set to desired while already enabled
 	 */
-	if (old_hdcp == new_hdcp ||
-	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	if ((old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
 	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
-		if (old_conn_state->hdcp_content_type ==
-				new_conn_state->hdcp_content_type)
-			return false;
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_ENABLED;
+	     return false;
 	}
 
-	return true;
+	/* Finally, if state changes, we need action */
+	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

