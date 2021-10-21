Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A244358DC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C936EA6F;
	Thu, 21 Oct 2021 03:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801DA6E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:32 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 75so24328241pga.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lnP0JIeU4WMucvckNmAZdbJm3u8WDteMovU1BGERnM=;
 b=E//A4FRGDS7HjyUGx/gcxMA93ObKb3gM6+7KSphrVWWxfVe7X9tNE9k+zJKNfmavmn
 M2QTERS9yo6+3TvXZ0xJWlXvnB7M/yePVKyDjQhA3sbCNQY1nZtYKVvSPFmpswAftgQP
 BZWA7iSKd6tC8jvL5Njln0qmJxq+Qi8yLgeTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5lnP0JIeU4WMucvckNmAZdbJm3u8WDteMovU1BGERnM=;
 b=maSY57t3gbCCw0IuXMIZshD2BfQGxOQ+BMk7oLi+CbKjwhAcoxNaSaH60JvAjluJ2s
 zIjITBHkxb/P5VayFHYXMfzHlRoLcJjFILoNjqUgVm5nwbrOyioNdPwqVkIQu7oRFkYv
 ucvvlKkFRefYr+Fafy9d4DdTA19oR3zWk/LDNj6OxX/oJTUKuwbWrrZ7h3lF90ouO6NY
 1TNCR2rAOMqAEpW6KJuFVFQGoba5gLTUKob3zgZYYmrzqKYG00Dd5g406rWIGXi3a1D1
 wl3L3LzrcKxsA5R3gQ+149wF1T6lf03/UKnwGn6+h25SbDSMwXLRF5K5w5BWzIw7SFdR
 Gi7Q==
X-Gm-Message-State: AOAM531tOQms/w5nVmaghp37L+mG8seQUipPNzG/jxl/CYlOIuSL2xXY
 G1YEQuMemOKPpVtHbMAQS10oMYIaYYWwWg==
X-Google-Smtp-Source: ABdhPJzjbsvYYjtVrmd637dUd6fTIMg3GhWX9z4hoW+81AVBL6mANQKgqaTzKhgKDvPbX8Ayq1zubw==
X-Received: by 2002:a05:6a00:190d:b0:46d:516c:4ed9 with SMTP id
 y13-20020a056a00190d00b0046d516c4ed9mr924403pfi.57.1634785831636; 
 Wed, 20 Oct 2021 20:10:31 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:31 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 2/8] drm: add new tracepoint fields to drm_device and
 drm_file
Date: Wed, 20 Oct 2021 20:10:21 -0700
Message-Id: <20211021031027.537-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
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

For struct drm_device, add:
    - mem_total
    - import_mem_total

For struct drm_file, add:
    - mem_instance
    - import_mem_instance

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 include/drm/drm_device.h | 16 ++++++++++++++++
 include/drm/drm_file.h   | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 604b1d1b2d72..35a96bda5320 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -298,6 +298,22 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
+	/**
+	 * @mem_total:
+	 *
+	 * The total size of all GEM objects known to this DRM device.  Used
+	 * with `gpu_mem_total` tracepoint.
+	 */
+	atomic64_t mem_total;
+
+	/**
+	 * @import_mem_total:
+	 *
+	 * The total size of all GEM objects imported into this DRM device from
+	 * external exporters.  Used with `gpu_mem_total` tracepoint.
+	 */
+	atomic64_t import_mem_total;
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index a3acb7ac3550..a5b9befcf1db 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -362,6 +362,22 @@ struct drm_file {
 	 */
 	struct drm_prime_file_private prime;
 
+	/**
+	 * @mem_instance:
+	 *
+	 * The total size of all GEM objects known into this instance of the DRM
+	 * device.  Used with `gpu_mem_instance` tracepoint.
+	 */
+	atomic64_t mem_instance;
+
+	/**
+	 * @import_mem_instance:
+	 *
+	 * The total size of all GEM objects imported into this instance of the
+	 * DRM device.  Used with `gpu_mem_instance` tracepoint.
+	 */
+	atomic64_t import_mem_instance;
+
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
-- 
2.25.1

