Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE4621B38
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81E10E4F0;
	Tue,  8 Nov 2022 17:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1750A10E4E8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E0ow7fSJ7D0UMyu9yMEF24k74WVHurVL449+cJnQonE=; b=aO2Bbm8QHSMvftnCfQ3ZSDuKZ7
 V+GT0Mh1RzC+IRrczNAxWe75ePZKOLPuXWX0GO0CXP946IHBEHzgAwXFL0fILj+BdE7ajjaX1R5Rn
 d8Tpvt2EzqViU7nQhMz92j1ggK2y5hImls/qir3jgiATfMhd/DoN7C7RBKHyfDVsnghonkt4YBdsC
 r61UvqoX2DyYuiwpMKFKaNEcjWtSEV5a3pg0f1rgTqqkeswQ8xuqPgDefd/vAyat5O4IjeFtLWsGh
 Bda/LVrj2B+i2EseVO1LUhujlYgo1VE0fiGm/Lkj61kZ1/eG1ZAKd0kKO577e4VUbrsmaqYMfzjPw
 TyzVt3fQ==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osSo1-00EVxA-4S; Tue, 08 Nov 2022 18:54:37 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/v3d: switch to drmm_mutex_init
Date: Tue,  8 Nov 2022 14:54:24 -0300
Message-Id: <20221108175425.39819-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108175425.39819-1-mcanal@igalia.com>
References: <20221108175425.39819-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Juan A . Suarez" <jasuarez@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mutex_init is supposed to be balanced by a call to mutex_destroy, but
this is not currently happening on the v3d driver.

Considering the introduction of a DRM-managed mutex_init variant, switch
to the drmm_mutex_init.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index b8980440d137..96af1cb5202a 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -10,6 +10,7 @@
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_managed.h>
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/v3d_drm.h>
 
@@ -1075,10 +1076,18 @@ v3d_gem_init(struct drm_device *dev)
 
 	spin_lock_init(&v3d->mm_lock);
 	spin_lock_init(&v3d->job_lock);
-	mutex_init(&v3d->bo_lock);
-	mutex_init(&v3d->reset_lock);
-	mutex_init(&v3d->sched_lock);
-	mutex_init(&v3d->cache_clean_lock);
+	ret = drmm_mutex_init(dev, &v3d->bo_lock);
+	if (ret)
+		return ret;
+	ret = drmm_mutex_init(dev, &v3d->reset_lock);
+	if (ret)
+		return ret;
+	ret = drmm_mutex_init(dev, &v3d->sched_lock);
+	if (ret)
+		return ret;
+	ret = drmm_mutex_init(dev, &v3d->cache_clean_lock);
+	if (ret)
+		return ret;
 
 	/* Note: We don't allocate address 0.  Various bits of HW
 	 * treat 0 as special, such as the occlusion query counters
-- 
2.38.1

