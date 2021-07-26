Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2D3D6A3F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B87A6EA55;
	Mon, 26 Jul 2021 23:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DB56EA42
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:34:50 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso2317666pjs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbCW32LfSHCHAkiAwgfCI+KXCphqw3RtU6lMEfGs4FM=;
 b=K7q0iQ+y4WkqT1bVjpFLpq2Mqb2axCqi3h4Q2onnI0EzLhJZARQ/qTyYNRBYJ9l1DE
 7GZO8TjDe7AZ+qALiz6rF/b8fgT8J2Pf4sduYXHwQRzEO5WobDLtcyD1Mgqk3yGETTIk
 H6c3UJEVgPHOXWNMgxcHjvWo3eaOXzaJKXyLybJ8mHHUF0TZw3+zWyJWlKYN6ayjEAV5
 LNAzrjKa6OJf+Zszw7Q32fI4KDy+KYNsvtdNbJe9smE73vR7qN4jfm1KdbIuwQC8eFr0
 LdIu9cO1MTVz+49dy146/Pcbqnt5FdDj0Ljf+PF0WyFTYntjdV29dBlGwwjlWvdK2jOr
 ZI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LbCW32LfSHCHAkiAwgfCI+KXCphqw3RtU6lMEfGs4FM=;
 b=P3Znr2jlYe7TkmGdUsp0J89szrV06T60cXh20QP1q/0FN74OFkOpSd22Lv5siORzEJ
 81sk8XeueklIpihG+0QGZUKkvy1NfyVB4BJYSA64wgT880tVLPYa1Cz0Ag1OHETDc8di
 DK+dIPDBpdVeJoVelCkcxnu5wXhGb5jNeNe3eO8jCagzyT6gAmOxOfGNa6WeS9l7FV1O
 11pdcQ3kObnaXfW2lX3ITwOjGGcTxSKVImQtcOHJYcwRKfIui+apzNNGHDoyttAvs9II
 PPOnCQlrPgdqUJWi6LOy3ikPGbZ9UshgCw26y2McWfU9WkqSd5RBBmtiWVTXmlJSYVCN
 1OEw==
X-Gm-Message-State: AOAM530JRk9MybOQwZUm0RupZzQ+X1anhPbqe3j2xZopWXF/Xw+mev0r
 zzkAgWRRqd2L+PGSQXTILSvizeagSO0SvA==
X-Google-Smtp-Source: ABdhPJxoQiLmHlotD+gpMoGdvL3iH855w/RTYJTvJFSV12JczIXixU5zFwe1jY6beM1RPKlKx/Hotg==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr20458925pgi.91.1627342489183; 
 Mon, 26 Jul 2021 16:34:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id ns18sm720850pjb.31.2021.07.26.16.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:34:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/4] drm/vblank: Add helper to get next vblank time
Date: Mon, 26 Jul 2021 16:38:49 -0700
Message-Id: <20210726233854.2453899-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 3417e1ac7918..88c824c294dc 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -980,6 +980,37 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
+/**
+ * drm_crtc_next_vblank_time - calculate the time of the next vblank
+ * @crtc: the crtc for which to calculate next vblank time
+ * @vblanktime: pointer to time to receive the next vblank timestamp.
+ *
+ * Calculate the expected time of the next vblank based on time of previous
+ * vblank and frame duration
+ */
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
+{
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
+	u64 count;
+
+	if (!vblank->framedur_ns)
+		return -EINVAL;
+
+	count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
+
+	/*
+	 * If we don't get a valid count, then we probably also don't
+	 * have a valid time:
+	 */
+	if (!count)
+		return -EINVAL;
+
+	*vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
+
+	return 0;
+}
+
 static void send_vblank_event(struct drm_device *dev,
 		struct drm_pending_vblank_event *e,
 		u64 seq, ktime_t now)
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 733a3e2d1d10..a63bc2c92f3c 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-- 
2.31.1

