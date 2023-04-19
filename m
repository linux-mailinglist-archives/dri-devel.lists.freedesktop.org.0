Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025436E7EA8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 17:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AEB10EA13;
	Wed, 19 Apr 2023 15:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A4710EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:43:32 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id j15so10947600ybl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681919011; x=1684511011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFlWCMDBx+92U8Gicq4dCE8l+LQWSAsgAPa6YcnP9e8=;
 b=iTy3Xyz9RYZipczU9NOcIwUnhNUR8zgASdTMZd+jpPIqcU7xJDdt6cwV/pHQyL33V0
 vH6gNgft+hVjqAAxbWhw3AhWRkmPN/Ubr1rOOg93JXIVuP7B9D8CxHMJBcgx4+SMnKdJ
 9vrMTMezTajwXWum1802xplG+D6d06yaAwHD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681919011; x=1684511011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFlWCMDBx+92U8Gicq4dCE8l+LQWSAsgAPa6YcnP9e8=;
 b=YL7bjKeE3QgKjlBFbj/FdY3sKjJzFeyfV9WRvB3mZMqvfHIMiAQqqFMGyAJcleomns
 glGXofxzHo8wV2S3ZKzSb7nJWdNLpb7ZpDkpK2QTTQjZ82X+NlRHzKl0MxE9POIiRE+B
 33X+0m8vsKWBF6TsTaQkCNxa0wTGvc/WdJJFTDHAqn70gpIT4fO4Rczt9ThM5U/FemEz
 0ZQXedNjMCddN4L7qUxiU0UC7YETHMdqElsJK7IKvvl41KMfxlzPJczzAg98eTbFlfnE
 eRaaWStXKYp1Zb+sl94BA7AwhXCzlzjEIm8ojKomDY0XuvFbOJc9yCdym1/Ctr3FOsQ5
 Lmiw==
X-Gm-Message-State: AAQBX9eVc+smCSz9+Fb244TujRhCdP3xuk/EiYlVNJl4A+U39sX2wTVy
 e3r3VxMZFO0ppNbjGrF8PCPgdQ==
X-Google-Smtp-Source: AKy350bNF4Ll8UsIPtzHLOscm9fz3NHT9bkSJnzOGfqYkDbYJZKWgxKajQuWjyVtuTsgdDFVTToNVA==
X-Received: by 2002:a25:c504:0:b0:b96:cb0c:b904 with SMTP id
 v4-20020a25c504000000b00b96cb0cb904mr200609ybe.9.1681919011672; 
 Wed, 19 Apr 2023 08:43:31 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:55c6:7cf1:a68:79b0])
 by smtp.gmail.com with UTF8SMTPSA id
 bx8-20020a056902168800b00b8f5b078eacsm4376733ybb.39.2023.04.19.08.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 08:43:31 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 03/10] drm/hdcp: Update property value on content type and
 user changes
Date: Wed, 19 Apr 2023 11:43:13 -0400
Message-ID: <20230419154321.1993419-4-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419154321.1993419-1-markyacoub@google.com>
References: <20230419154321.1993419-1-markyacoub@google.com>
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Update the connector's property value in 2 cases which were
previously missed:

1- Content type changes. The value should revert back to DESIRED from
   ENABLED in case the driver must re-authenticate the link due to the
   new content type.

2- Userspace sets value to DESIRED while ENABLED. In this case, the
   value should be reset immediately to ENABLED since the link is
   actively being encrypted.

To accommodate these changes, I've split up the conditionals to make
things a bit more clear (as much as one can with this mess of state).

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-None
Changes in v3:
-Fixed indentation issue identified by 0-day
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Rebased: modifications in drm_hdcp_helper.c instead of drm_hdcp.c
Changes in v7:
-Rebased as function name has changed.

 drivers/gpu/drm/display/drm_hdcp_helper.c | 29 +++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
index 34baf2b97cd87..3ee1a6ae26c53 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -480,21 +480,30 @@ bool drm_hdcp_has_changed(struct drm_connector *connector,
 		return true;
 
 	/*
-	 * Nothing to do if content type is unchanged and one of:
-	 *  - state didn't change
-	 *  - HDCP was activated since the last commit
-	 *  - attempting to set to desired while already enabled
+	 * Content type changes require an HDCP disable/enable cycle.
 	 */
-	if (old_hdcp == new_hdcp ||
-	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	if (new_conn_state->hdcp_content_type !=
+	    old_conn_state->hdcp_content_type) {
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return true;
+	}
+
+	/*
+	 * Ignore meaningless state changes:
+ 	 *  - HDCP was activated since the last commit
+	 *  - Attempting to set to desired while already enabled
+ 	 */
+	if ((old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
 	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
-		if (old_conn_state->hdcp_content_type ==
-		    new_conn_state->hdcp_content_type)
-			return false;
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_ENABLED;
+		return false;
 	}
 
-	return true;
+	/* Finally, if state changes, we need action */
+	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_has_changed);
-- 
2.40.0.634.g4ca3ef3211-goog

