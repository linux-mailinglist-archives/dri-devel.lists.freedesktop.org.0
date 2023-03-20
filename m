Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B507C6C1521
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC1510E5A5;
	Mon, 20 Mar 2023 14:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F3010E581;
 Mon, 20 Mar 2023 14:44:42 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id ix20so12670162plb.3;
 Mon, 20 Mar 2023 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpnnpJi0jMpuVIirJnKhht3Br4nZk/nWgbLPyeNVKoM=;
 b=NHg2rsAQuZBbVNpWJoQ7SMYcg1sSGv6708+Yi51sSumVAb7P4W0Sgz+ZApLe1OBqQ9
 X4zeyzHi7Wf4djrzl44O+b73TLhdaiCP0bG11wMhDpw/6pxLwiYlL/DiH+WLDYQCYKpY
 73ETis2vl6NE7mVLY6bltE4zQhwR94ZiaarsDBky65Sl+A2ZdOAvgjAWoL1RhZ71BZXM
 GWmAn7CXAaMoxvvx/9+TgN7MBQEYTlO/uGlA3CtgeEGwsBHV1q00mTLF2m0rEJI2Aw2O
 dK8VeGnQI4ASznl7F14ZJRe5gCd+knY0S0CGUEO6h7v/Dr3YeYiuQDFMBNJClq6nWmGR
 5Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpnnpJi0jMpuVIirJnKhht3Br4nZk/nWgbLPyeNVKoM=;
 b=yu2hJKmz+UoJqNiLy/3Dx4px4tDcYaNk/3KQj9BisIftRP2IWCBXR695586Qra21N/
 BmYG7eHjr9+lvSxHg4aKAji7FoBgv/wgtOw3376UTQ+1Zn4YDkKDO9dza/KJ8myJlgGt
 915CA1cJlMX0NFpvdULvDOW3/h4XPEReD6uZU+4yiIpudsYiFF/Lfn/5ur7JL0CM/E0y
 Zjmpn3Gse+madWgLdjWOvMFR2X5TVEtDSFDkFWEErvL57ZoQXIqbt+QByOz+KzEwfgI/
 bXEkQAu/Km3p1aq3AvEiZhX1/QiLQMxthwRWBbO4LwdYVqiefYVAJVVJZRG5FJ44ClUA
 mzbw==
X-Gm-Message-State: AO0yUKVHN/D4eEU8Sak/UaRxrM9PKmCCger7hLDx2Dhc8JLYAmvwbUYb
 I8jOs1jbmMn56HmpSy/Apl1k25xXNUU=
X-Google-Smtp-Source: AK7set9gngSUjr4POl841Y/cEm5ZUCas4/gLzFTfM7Kwi3k2gQ4K9PnIhK/7pgWuEZJlzgwJ1vs7Yw==
X-Received: by 2002:a17:903:124d:b0:19e:7a2c:78a7 with SMTP id
 u13-20020a170903124d00b0019e7a2c78a7mr21091860plh.57.1679323481613; 
 Mon, 20 Mar 2023 07:44:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170902d35200b0019468fe44d3sm6806113plk.25.2023.03.20.07.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/23] drm/gem: Export drm_gem_lru_move_tail_locked()
Date: Mon, 20 Mar 2023 07:43:28 -0700
Message-Id: <20230320144356.803762-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Export the locked version or lru's move_tail().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem.c | 11 ++++++++++-
 include/drm/drm_gem.h     |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 59a0bb5ebd85..693f7f35a7bd 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1344,7 +1344,15 @@ drm_gem_lru_remove(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_lru_remove);
 
-static void
+/**
+ * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
+ *
+ * Like &drm_gem_lru_move_tail but lru lock must be held
+ *
+ * @lru: The LRU to move the object into.
+ * @obj: The GEM object to move into this LRU
+ */
+void
 drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
 {
 	lockdep_assert_held_once(lru->lock);
@@ -1356,6 +1364,7 @@ drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj
 	list_add_tail(&obj->lru_node, &lru->list);
 	obj->lru = lru;
 }
+EXPORT_SYMBOL(drm_gem_lru_move_tail_locked);
 
 /**
  * drm_gem_lru_move_tail - move the object to the tail of the LRU
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 772a4adf5287..a811c7e346ec 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -475,6 +475,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 
 void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
 void drm_gem_lru_remove(struct drm_gem_object *obj);
+void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
 			       bool (*shrink)(struct drm_gem_object *obj));
-- 
2.39.2

