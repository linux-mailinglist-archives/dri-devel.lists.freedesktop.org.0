Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913040CE2B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEC06EA2E;
	Wed, 15 Sep 2021 20:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381226EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:38:56 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id c19so3595291qte.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8mqkW45lWHgijrobFYKhB0jUxwyFWG7Hg7GMe+qA4bY=;
 b=M69omufWdQExDl96QlWBTeZQNs7S3qk/Elh+3xzRpTiMdrsEQKC+BLk1wC8TrGOXp4
 nXvz609fgP4wmLMVaD+BqbHrdls5TN4d9XMevJcbaAhFvAE1rdaoWMrzJNvaeKPM1qpS
 Q2jnZaeBV2KTMXz6McIF36+ry41Ul1Q+GuX70ifrir54HFO2+XV031MG470EO8KeN50i
 UZk2RaDw+HOBMX7bJSc85Bs7MSaIVU6g+1c4X3955PTEiwNzxFNP4H2zqMGdBWqLt6Rm
 vighGWgqVWqZJiXolA2/wTztSn27lt9lgjvtgzuBgyVM9xkFmAIMkWF9Q6PqYJq47kYW
 VlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8mqkW45lWHgijrobFYKhB0jUxwyFWG7Hg7GMe+qA4bY=;
 b=5DL8PUu6wFNNNoYuzzdNWQ6ug/wbg/Y1wvBhyU8x0uyL/hb3alWSpi+OtJoKv2SnQT
 H70Id5OwpGnKXtjuVFwpK8nfnUYevY8ixZCWDTUnCZlUdtOluS97PCVDOQQZbeLdOc7J
 KRvce8tOHKxCuEFPTIIZijiiW+2Hfjh5y4kCP8gAl3aF5Actz5o/Tgl+qqnsbxlfZSnC
 tsMCdD77mG7WQ5DCMz1u0L3YJBuApomRi0v4HJPneuuCZ0Dl6bg3loKOU0KHyU5IbcUy
 UAKYZ56V4KbQ7P5WUoeecTUrpgeRps7TU9W4YMCkgecUVwG1OBc2xwby1S9p4kbBlejA
 PVwg==
X-Gm-Message-State: AOAM531R580TVMINGkZ5u2wtXZMc1PP8SbwCl8j1CO9XJl6RXslkwBzx
 HB6aRaJ0f7/H4XSC+cFEnl2QAWDbhuMCyQ==
X-Google-Smtp-Source: ABdhPJx/ej8tB0rDWmxtn1zzwQrWpoL6HXA6X8wfF3MAR+qHBmrZQW9Gq/cJhggXJ+XSpH/1wFReew==
X-Received: by 2002:ac8:4716:: with SMTP id f22mr1825779qtp.250.1631738334905; 
 Wed, 15 Sep 2021 13:38:54 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id h9sm834052qkl.4.2021.09.15.13.38.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:38:54 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/13] drm/hdcp: Update property value on content type and
 user changes
Date: Wed, 15 Sep 2021 16:38:22 -0400
Message-Id: <20210915203834.1439-4-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-4-sean@poorly.run #v1

Changes in v2:
-None
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

