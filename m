Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E1545332
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 19:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAA412B3E8;
	Thu,  9 Jun 2022 17:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6DC12B3E8;
 Thu,  9 Jun 2022 17:42:05 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id j6so21646918pfe.13;
 Thu, 09 Jun 2022 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DgWiYXL1B/uo/ktjENEiT/nk+cuNvwQkS3/PMSJ/gS4=;
 b=qjoxGuk6HMHYik+QoHAomdqEdePsDbMiCxW9iV7oIbqgVxuPNVb9ogB0+RtQqJfIT/
 VozuOSx6bF93V7QDzgHj8ytZfJ5JDUqsc8ZBB0iCgMnzjAUEw23DDo9RF+3HgDltuQLj
 udS6xuqYf+z3fCfU51UiCeGN67eWlvvHjP+1BCYiGebHkC/bCzRFkA9ChS4W0S9OZyA4
 dxHNSoPmjH9OITDsxriW9sGe8nzM4slf4z8mjMRq+4SobAiGBK+gVpwrxuupqxRRJuST
 h6Tc/VSfLhMMjg2dEb8H9hfl4EWTwgyhi6C5TanSlEJBuX+ZHFNewvL1TdIz+MehU5G1
 Nebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DgWiYXL1B/uo/ktjENEiT/nk+cuNvwQkS3/PMSJ/gS4=;
 b=s5du3dfYXjMELZm797u5KJcrpT6AgLh70n1w37iBcaozqo8dmz6wbaTIgEAHy+AipI
 3Y3tDQTsWhELtj370aUwb1ae1dy4UaJWqnk1Z1UrahZhkgnp3KNsCazA1IWzRfzNyfw7
 WySlXNY9hss5ICs4rG8KmJ5jKRlrt/tC4t9I0RPds5Ncmd+9uWuJ+M9hXsrId3dOTeQJ
 CbhOsoojRhBC8bEhCHZxwCETJclV01mUvfZx88EsMmvLc34qwIncqjOJBQU9FN/JK+eH
 Mz2zV2OL4/YDxMhQMxYwY6SfgNMZqs8ohH2efvN69VPJZ1Dqvc6guVa/cuXX/IJlrZUv
 X0Ig==
X-Gm-Message-State: AOAM532PRSLy/1+Sa0uGmqqrLTKgJQ69iwjFrIx/V3IDALpMWi0fHads
 5SMqWMqO9a7dcqjaonbsXRwaOHvLtw4=
X-Google-Smtp-Source: ABdhPJzQGGfcdelkMUHlTzDatlp7MOnQu81Dg9YLAo3PCkW1cvlc9qYNvkdRn2FBLo/G2ojvbQB6jw==
X-Received: by 2002:aa7:92d2:0:b0:51b:4d60:6475 with SMTP id
 k18-20020aa792d2000000b0051b4d606475mr56425406pfa.73.1654796524151; 
 Thu, 09 Jun 2022 10:42:04 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n12-20020aa7904c000000b005187eb4194esm11387900pfo.118.2022.06.09.10.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 10:42:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
Date: Thu,  9 Jun 2022 10:42:11 -0700
Message-Id: <20220609174213.2265938-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
provide additional file ops, like show_fdinfo().

v2: Split out DRM_GEM_FOPS instead of making DEFINE_DRM_GEM_FOPS
    varardic
v3: nits

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_gem.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9d7c61a122dc..87cffc9efa85 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -314,6 +314,23 @@ struct drm_gem_object {
 	const struct drm_gem_object_funcs *funcs;
 };
 
+/**
+ * DRM_GEM_FOPS - Default drm GEM file operations
+ *
+ * This macro provides a shorthand for setting the GEM file ops in the
+ * &file_operations structure.  If all you need are the default ops, use
+ * DEFINE_DRM_GEM_FOPS instead.
+ */
+#define DRM_GEM_FOPS \
+	.open		= drm_open,\
+	.release	= drm_release,\
+	.unlocked_ioctl	= drm_ioctl,\
+	.compat_ioctl	= drm_compat_ioctl,\
+	.poll		= drm_poll,\
+	.read		= drm_read,\
+	.llseek		= noop_llseek,\
+	.mmap		= drm_gem_mmap
+
 /**
  * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
  * @name: name for the generated structure
@@ -330,14 +347,7 @@ struct drm_gem_object {
 #define DEFINE_DRM_GEM_FOPS(name) \
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
-		.open		= drm_open,\
-		.release	= drm_release,\
-		.unlocked_ioctl	= drm_ioctl,\
-		.compat_ioctl	= drm_compat_ioctl,\
-		.poll		= drm_poll,\
-		.read		= drm_read,\
-		.llseek		= noop_llseek,\
-		.mmap		= drm_gem_mmap,\
+		DRM_GEM_FOPS,\
 	}
 
 void drm_gem_object_release(struct drm_gem_object *obj);
-- 
2.36.1

