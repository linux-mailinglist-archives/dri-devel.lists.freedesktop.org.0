Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CA48D468
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB03C11217E;
	Thu, 13 Jan 2022 09:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E19211210B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 09:44:44 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c3so8846702pls.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 01:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ky2zKVWv+mMhs4J7OH2O/XxqaVlLO/dXHhtpRUox9mg=;
 b=2ZH3pGHASkNoRRW3yTj2gs92BdyBRnbNK7EOWNRr2p217WskEpz3ZawJyYbGwRENS2
 vMGX0y2vgckUQbJ9vbH13jk0cwh/3yJoWJLe/o/FSFsQZYR/fm/HI6Xl2v9Y0JVUt21K
 R6X6RLp8BjThthOhgV7LfRvovvIn2RAf28l/48+klHURA9SOlvp18Ptm60y1nJuIWes3
 gTagPWQTaTNH8luH6KNm+Y/kA6LjMn3ZVm7KQjtO77ob8sjLultWHYwYVr8R1bs5yLsF
 9GwUIkQt/vKTCQo95rk4F0FN9PoipNIROxY1Ozx+F6lvwYpEm+hU+L67Orip/Mwq9zMR
 zaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ky2zKVWv+mMhs4J7OH2O/XxqaVlLO/dXHhtpRUox9mg=;
 b=uHkWzNcEYheCMYE7+UJh27HBwkp/bjt1SVDHSUC57MReBpGvHMRdJXYKtQLy0yyzPV
 WzYc5whdYhSojXOiZnb0Vx8odDSRAnQWRdUZD8GU8Wgus4iTST1qT0h8QiAW5jFm5zZQ
 OqmsXApi0ap/ytQuVC8uC3aa1gbI6v7Eqc4vNe1hQC3nz2lLRA3tI9VB5kRv9i2lb5n5
 04O45Z03ZvsYMNZVipULyX98MeatGrsiuQ0eQdwFgnplBdxi3mRMef8xQvj02cdrMPPw
 2IGMn8JZjRRm3jH6aAfRAvlWf8U4zvK2nsXawFzo5iQ6uhPCXSxS+JSeEXr5m5pAaysj
 HcdQ==
X-Gm-Message-State: AOAM5316Y3+KhyEkDWndJNKrBmGIYpc5QVYtFe7gFH+wQjTYpy9lRBpr
 POZoxracTzcSFF2eHInQwSVuMtSgLXC/6lLo
X-Google-Smtp-Source: ABdhPJyGNIs5iSBJFPyNrKFb9TvMjCxg99lbnYZnpLQQPnfs6LZ/38Pz/SGsgrLp596XqfMheTyGNg==
X-Received: by 2002:aa7:9094:0:b0:4bd:8f39:236e with SMTP id
 i20-20020aa79094000000b004bd8f39236emr3414645pfa.35.1642067083412; 
 Thu, 13 Jan 2022 01:44:43 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id rm4sm2207154pjb.4.2022.01.13.01.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:44:42 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 1/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Date: Thu, 13 Jan 2022 18:44:17 +0900
Message-Id: <20220113094419.12433-2-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113094419.12433-1-etom@igel.co.jp>
References: <20220113094419.12433-1-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LINEAR modifier is advertised as default if a driver doesn't specify
modifiers. However, there are legacy drivers such as radeon that do not
support modifiers but infer the actual layout of the underlying buffer.
Therefore, a new flag not_support_fb_modifires is introduced for these
legacy drivers. Allow_fb_modifiers will be replaced with this new flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/drm_plane.c   | 15 ++++++++++++---
 include/drm/drm_mode_config.h | 10 ++++++++++
 include/drm/drm_plane.h       |  3 +++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index deeec60a3315..5aa7e241971e 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -237,6 +237,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	const uint64_t default_modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID
+	};
 	unsigned int format_modifier_count = 0;
 	int ret;
 
@@ -277,6 +281,11 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 
 		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
 			format_modifier_count++;
+	} else {
+		if (!dev->mode_config.fb_modifiers_not_supported) {
+			format_modifiers = default_modifiers;
+			format_modifier_count = 1;
+		}
 	}
 
 	/* autoset the cap and check for consistency across all planes */
@@ -341,7 +350,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
 	}
 
-	if (config->allow_fb_modifiers)
+	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
 
 	return 0;
@@ -368,8 +377,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
  * drm_universal_plane_init() to let the DRM managed resource infrastructure
  * take care of cleanup and deallocation.
  *
- * Drivers supporting modifiers must set @format_modifiers on all their planes,
- * even those that only support DRM_FORMAT_MOD_LINEAR.
+ * For drivers supporting modifiers, all planes will advertise
+ * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
  *
  * Returns:
  * Zero on success, error code on failure.
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..c56f298c55bd 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -920,6 +920,16 @@ struct drm_mode_config {
 	 */
 	bool allow_fb_modifiers;
 
+	/**
+	 * @fb_modifiers_not_supported:
+	 *
+	 * This flag is for legacy drivers such as radeon that do not support
+	 * modifiers but infer the actual layout of the underlying buffer.
+	 * Generally, each drivers must support modifiers, this flag should not
+	 * be set.
+	 */
+	bool fb_modifiers_not_supported;
+
 	/**
 	 * @normalize_zpos:
 	 *
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 0c1102dc4d88..cad641b1f797 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -803,6 +803,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
  *
  * The @drm_plane_funcs.destroy hook must be NULL.
  *
+ * For drivers supporting modifiers, all planes will advertise
+ * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
+ *
  * Returns:
  * Pointer to new plane, or ERR_PTR on failure.
  */
-- 
2.25.1

