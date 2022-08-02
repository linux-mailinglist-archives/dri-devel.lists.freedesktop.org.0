Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EC587F82
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C658905BF;
	Tue,  2 Aug 2022 15:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504F190522;
 Tue,  2 Aug 2022 15:51:57 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 23so12685344pgc.8;
 Tue, 02 Aug 2022 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tv9XZJtMf2UZGPK9r5daZO8lAjNs4ugv43Of9czCQIM=;
 b=ewcgdHYUnR0pjbQr7lLrbohv0CIdWnfTaVa/OdLqKa56REj1mZVDD3loCWUUXysHJb
 r1nv6LvBlTqUGW5Yn7MekuRqEHSPnRvgfxi8RbvnxLAPMdUnKJd3gAzv7ZK0ctBMmKFK
 Cx5FfFd7GebaOk14M/0AQVBAEON772Rfp5BU7zVsirwUcKBaErJ3PfTATLVq4G/Bw+B/
 vKxsWxn33KGmbgUmEWsOn1uNznXGWHDoB+nDhkdNc08TKQ/kKKSY/K7/EoMlTGURdLwc
 r5hqBVOcuKvFTYPqyq2XRu1L0cPf/efn+WxvfX6OEEhuXH/KXeoqWzwOqXhYXUDDISLP
 8bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tv9XZJtMf2UZGPK9r5daZO8lAjNs4ugv43Of9czCQIM=;
 b=NJp/em989XATUMCkHvpuk6743nkL0oMl2Ru4o25HQyDS+yl3GDmhe4TaOo5BIUGUk8
 quaM6ZbXRDVaywrIbFNWsEEWVXwB6ob5UqVy6rNDqHUqDS1doQ/bl9qZmNUuFAGDVG0A
 C0DcumpfvEbNik0lnOoANnTtUaq609vWqW/dQ6Zh5RxlFoA7mV9eEwwWuNimMBWFPIYj
 gaeO1j+c3fIzrxKSnHC/AL5DtraK+ZMmOSQ0YcHx4ImsUVuBBnJ5W6G9EVM2xwhNN3MQ
 Lne2lIsIYBLYdZ3GXJy1/sl7TdsUhGYOuPPSgmBr4Kik3EL0MmcdkrtYQwlfzkvthcKJ
 2bWA==
X-Gm-Message-State: ACgBeo1+INqMEaeID9+xUxzcXBO/Sphq/B4bT/hLd7SD2Z4LcpzaEa27
 7Zj35tLz4qfICt+eHM/7XbW0GytcRWQ=
X-Google-Smtp-Source: AA6agR7fjw8jn0jQNN1u5zHtoNHt/wIMLL6YxqIYFMtVGwrrRbd03oug9Bjkf/Ril+hPJDZo6qr8WQ==
X-Received: by 2002:aa7:82c2:0:b0:52d:2317:8938 with SMTP id
 f2-20020aa782c2000000b0052d23178938mr15195307pfn.75.1659455516225; 
 Tue, 02 Aug 2022 08:51:56 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 s20-20020aa78bd4000000b0052d5e93fcb7sm5315612pfd.191.2022.08.02.08.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 15/15] drm/msm/gem: Convert to lockdep assert
Date: Tue,  2 Aug 2022 08:51:48 -0700
Message-Id: <20220802155152.1727594-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3c6add51d13b..c4844cf3a585 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -197,8 +197,8 @@ msm_gem_unlock(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
-static inline bool
-msm_gem_is_locked(struct drm_gem_object *obj)
+static inline void
+msm_gem_assert_locked(struct drm_gem_object *obj)
 {
 	/*
 	 * Destroying the object is a special case.. msm_gem_free_object()
@@ -212,13 +212,10 @@ msm_gem_is_locked(struct drm_gem_object *obj)
 	 * Unfortunately lockdep is not aware of this detail.  So when the
 	 * refcount drops to zero, we pretend it is already locked.
 	 */
-	return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
-}
-
-static inline void
-msm_gem_assert_locked(struct drm_gem_object *obj)
-{
-	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	lockdep_assert_once(
+		(kref_read(&obj->refcount) == 0) ||
+		(lockdep_is_held(&obj->resv->lock.base) != LOCK_STATE_NOT_HELD)
+	);
 }
 
 /* imported/exported objects are not purgeable: */
-- 
2.36.1

