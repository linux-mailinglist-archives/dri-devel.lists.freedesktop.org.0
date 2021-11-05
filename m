Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E4445E3E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0F6E524;
	Fri,  5 Nov 2021 03:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE8A6E524
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:04:54 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id gh1so6608040qvb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 20:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaPgA7GrPKHFUCkZR6n55Od+7uoOaP/KgLcR0iVRkFw=;
 b=eZdd1Nfty0rYbMgfmP8ScRGVEDQEnhYxZDPXZWQJr4Rz6ga1eSoLQ7ok57k0kpqkRq
 t0LyxqR+qKzT0aAclS2hqrqt+0/6r1jeN9TiyVwVDDi/b7a9pO7cNdDM0hge6Za3jaHI
 mD9ZNHFpCjCXLg4Ln7tW9B9EHtwHw0xsf/W/G5x+vd4LjEYZaZO93mlMrc6zIOzD2tvK
 xoYB5NRVWNbY+7BdioNby+JdZJDwH6w33bnCusDNdhc1mR/u/beRLYL6G1VTIJRcmcUZ
 OCINzarAArusaMkhdz+wLNQgBUM11OU66ue1MAFruiUo1uUozpQeA6qdXMHr2QL3l+mJ
 zvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaPgA7GrPKHFUCkZR6n55Od+7uoOaP/KgLcR0iVRkFw=;
 b=3qZH+8LdIfltcF01yvlha2+1cp2e3vsT74EcA0t4vyRTCNCSTm0YS+aykfD4v3Y2Ui
 BHfkUb2Tsav/HdCnLmRT8d9UC8nDO8xUetSX09VyYx07r5hC79M0VZ+Qfjkm8nDLgHTH
 aKaat+RL6YtEQ+ptd/0i+DoDSNcIEDo/d8iNcF910QJZr0A1G7Cqg/yWbZy2F58DWiEf
 F+Ca2kcO/Ot5PzXoeQG1VjIgAvWiX17UWIcM4DB4WzTIdvEeidmE9oOt5shTKiM9GD2E
 ZgztIbp9d5ss29XKVxQvv+wgid3ZQ0KbVUYjarmuVOUK/n8KqBm1Y4yqP0K7kL4M/5m7
 VnAg==
X-Gm-Message-State: AOAM533VNmnTZh1/R4FyET2WK/rQN9HuwklT7R/FDUXnl47VWIaiqYbK
 UdxSxrAuCPxyEUUD4A7Lhig8lhTWyb3WSQ==
X-Google-Smtp-Source: ABdhPJzgTkKiDu0sbzW+nSdeWPEpRB7aKzoplRcb8ZjwniIJolI9FgUatV7hbGg1reXb7p+AAOVHoQ==
X-Received: by 2002:ad4:5b86:: with SMTP id 6mr35080505qvp.25.1636081493432;
 Thu, 04 Nov 2021 20:04:53 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id bi38sm5093024qkb.115.2021.11.04.20.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:04:53 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 03/14] drm/hdcp: Update property value on content type and
 user changes
Date: Thu,  4 Nov 2021 23:04:20 -0400
Message-Id: <20211105030434.2828845-4-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
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
Cc: jani.nikula@intel.com, abhinavk@codeaurora.org, swboyd@chromium.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, bjorn.andersson@linaro.org
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-4-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-4-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-4-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-Fixed indentation issue identified by 0-day
Changes in v4:
-None
---
 drivers/gpu/drm/drm_hdcp.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index dd8fa91c51d6..8c851d40cd45 100644
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
+		return false;
 	}
 
-	return true;
+	/* Finally, if state changes, we need action */
+	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

