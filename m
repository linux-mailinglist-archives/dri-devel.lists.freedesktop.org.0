Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734BA1F2139
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4CE6E9A1;
	Mon,  8 Jun 2020 21:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127F96E9A1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:06:16 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id p15so9068088qvr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SAppPpa1LXhRlJGmkA2/z+Dr2Wp9y7xO4XPUfiSSbTI=;
 b=FMdXk7UIUD9h9hT2JCBx99SKW/dMCL5oH3fDczKvZ0nzxJQrfAN4X0iurpbXSHL0nS
 vtHXNxa8Be7Fxib+5od2v/PxcoayfScIZqjyQl/yjwxJ9PkA/0B4wQiRQpczNpaUiAYY
 pFEXQwulQWsI4A6igvEmvn+1UwZlTuaUu4ez8Y+Dm1BEc9QgugJNxa1gjtz2ZPkSMOh2
 SOsHwX4iMZOuJDf4x/YDHgyOKbQGBk15e72L6xiLe7qzsecxotKnXEsLA0zoxCl1ZeOo
 ytval+8WAOnSkZZD+ibMaX53Sjqq+ydt5GhwtbG9krZcZ8r7VC8nzxEC1XWKRdMKUxZz
 LMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SAppPpa1LXhRlJGmkA2/z+Dr2Wp9y7xO4XPUfiSSbTI=;
 b=flfK28aqZj5dbrIb1soI7HGp6iJQu2a7i0SZhaeww8M2ZuxOpL9C0ihj3EMs2aMV4N
 uQITjJDVBkig9Dmcf5/g0lDcsfXQUDqrx0DTVCk7q+A4PkIV982kRwPc3XWlPDFkKMom
 cSRQ9Ond87hPiy/8cHC/eWzbnrclKAGJ9qsz0MaaV2od4cVHESM4WxsMNgtZLwDag2ZQ
 +7MMcN07LNoB27yYkjk39o/Lm1fISlD4S9D20qR1KHcghZWqsJhc9iODvWvbz+Ku4Ho2
 1xIYh7T3qBmcvK3lkXP4wfjjlA4uotqofCE4se9PSwNjHAbMc5uqms3oU9JBqXW0V8nZ
 FSyQ==
X-Gm-Message-State: AOAM532zlNXfI9pIbFKsUjDKMy0wSySFU0xjGk61N+Zu+sIXVdF7upKM
 7yS6Ji41vDyReYjR91N9VzuOFGC0VfE=
X-Google-Smtp-Source: ABdhPJwheOYqcswFZ16457m3Bo6nUhBN7dUfynfSbEg06VTr1WbBj6rbjgGaKPPvPZdbWDJYmkTPvg==
X-Received: by 2002:a05:6214:589:: with SMTP id
 bx9mr622046qvb.127.1591650374964; 
 Mon, 08 Jun 2020 14:06:14 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id 126sm8226977qkj.89.2020.06.08.14.06.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:06:14 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 08/13] drm/nouveau: Change debug checks to specifically
 target syslog
Date: Mon,  8 Jun 2020 17:04:58 -0400
Message-Id: <20200608210505.48519-9-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 tzimmermann@suse.de, nouveau@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 696e70a6b98b..d60602db2cf0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -85,14 +85,14 @@ extern const u64 wndwc57e_modifiers[];
 
 #define evo_mthd(p, m, s) do {						\
 	const u32 _m = (m), _s = (s);					\
-	if (drm_debug_enabled(DRM_UT_KMS))				\
+	if (drm_debug_syslog_enabled(DRM_UT_KMS))				\
 		pr_err("%04x %d %s\n", _m, _s, __func__);		\
 	*((p)++) = ((_s << 18) | _m);					\
 } while(0)
 
 #define evo_data(p, d) do {						\
 	const u32 _d = (d);						\
-	if (drm_debug_enabled(DRM_UT_KMS))				\
+	if (drm_debug_syslog_enabled(DRM_UT_KMS))				\
 		pr_err("\t%08x\n", _d);					\
 	*((p)++) = _d;							\
 } while(0)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2a6519737800..b916d1f456cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -257,11 +257,11 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
-	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_ATOMIC))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
