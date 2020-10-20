Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170EA29451C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 00:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C866E02D;
	Tue, 20 Oct 2020 22:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1106E02D;
 Tue, 20 Oct 2020 22:24:31 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id g16so83609pjv.3;
 Tue, 20 Oct 2020 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OmjtnWyk38ZBX1D8MavpXL10VCl/FwBII1zAmAlKY9s=;
 b=Awop/oxHP1NDOcP0KnWp5FWHkrltx2DjbBqr7tobJcMxu4Ei7uqjExLbcyvm7SYfmD
 aTC06k45zMNEUfhCm2PQwnTAsv1vwHUXXzO5sYSFgyj00L1rnJB1dv9MQUUcMmlc94wB
 23UuqEnat7si/49sUfgx87zNuyahxeqf0gWGKX27jUpi0eDf2wj+eJWxv1W6O7qeji2N
 iy782NcFvHIrIR3HTQEXIr0RDMcFk+xzJt1oM599ZKmSniBgczX31zjhvC9itH9+imp4
 4Dz7so2eEpAvFfXxXVPWbn8aUJPALFL3sG8JebTcK4cIXCgdVCfnXYkUMG7elJqBd2pr
 axug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OmjtnWyk38ZBX1D8MavpXL10VCl/FwBII1zAmAlKY9s=;
 b=GUnIxPZOWp3vt5ig70uLg43vBPgKV6Jx4gU/Q6R8HGQEJz40mZUmM5HfgsqwP7esmO
 laRmMmyLvq+wGn8XEbqGHmpWohSD6b+js/ejwgF7IIEEblpzFkni8O4Y2UU5grA48RGd
 BKUeRwYt2+HXsjkyWHcCNgCq6pxlbhG8GU0TQZ/Oh9QMKDZVxjRv44u8LdkB0h4moM5f
 ErkhvjI+DrWWSk71h+MqZipwIOli7vE+IB3pRWmhbm6lVgSYppFQlKHBHTwxzR/TCezS
 2ccae0xX8X+EAAXNC00cjf5w3PfVhpi2v14JMNwJEYPG0M9DWEz8FJQGc9r2PcK6XC6x
 4Rmw==
X-Gm-Message-State: AOAM530/r99Om06kLnmAtfCzYEyKfMKeL9YU4g3laTUG6M72AHfC+Sqm
 7SF5nX+wEUllOh13mw/6+cB2a44w0CIk7w==
X-Google-Smtp-Source: ABdhPJxIXbNsMsSh0dWfqwmYT1q1f863Oej76OZAU7iVStwx6Wktb0HzU61GvcvkkulTBDT3epizqA==
X-Received: by 2002:a17:90a:6b0a:: with SMTP id
 v10mr237477pjj.141.1603232669947; 
 Tue, 20 Oct 2020 15:24:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id c12sm147612pgd.57.2020.10.20.15.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 15:24:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/atomic: Drop per-CRTC locks in reverse order
Date: Tue, 20 Oct 2020 15:26:00 -0700
Message-Id: <20201020222600.264876-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

lockdep dislikes seeing locks unwound in a non-nested fashion.

Fixes: 37c2016e3608 ("drm/msm: Fix race condition in msm driver with async layer updates")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c |  2 +-
 drivers/gpu/drm/msm/msm_kms.h    |  4 ++++
 include/drm/drm_crtc.h           | 10 ++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index b03d6ab6b19b..6a326761dc4a 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -67,7 +67,7 @@ static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
 {
 	struct drm_crtc *crtc;
 
-	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
+	for_each_crtc_mask_reverse(kms->dev, crtc, crtc_mask)
 		mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 8d3e626c9fee..d8151a89e163 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -211,4 +211,8 @@ int dpu_mdss_init(struct drm_device *dev);
 	drm_for_each_crtc(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
+#define for_each_crtc_mask_reverse(dev, crtc, crtc_mask) \
+	drm_for_each_crtc_reverse(crtc, dev) \
+		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
+
 #endif /* __MSM_KMS_H__ */
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index dfdb04619b0d..25f5958f2882 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1274,4 +1274,14 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 #define drm_for_each_crtc(crtc, dev) \
 	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
 
+/**
+ * drm_for_each_crtc_reverse - iterate over all CRTCs in reverse order
+ * @crtc: a &struct drm_crtc as the loop cursor
+ * @dev: the &struct drm_device
+ *
+ * Iterate over all CRTCs of @dev.
+ */
+#define drm_for_each_crtc_reverse(crtc, dev) \
+	list_for_each_entry_reverse(crtc, &(dev)->mode_config.crtc_list, head)
+
 #endif /* __DRM_CRTC_H__ */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
