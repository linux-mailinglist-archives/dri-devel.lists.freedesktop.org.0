Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81D248FE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DF46E165;
	Tue, 18 Aug 2020 21:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA86E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:32 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p4so19717790qkf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z3nr2eJmSOi62JFIuGHkSIz5KDvp6E7rh06KhWhu6M8=;
 b=fK5xL7M0k6zGSuTtpdg61V+WOvN6fcra6ecOTC45D8KXHmU61sCoiWiXdQhvFARlNT
 /UlTMlnQ88uZUMCqwBTL/L2ZYQpwamFZSbX7eHqVrr4nIgpe99AHkgGz/WBRDNp2O+h+
 uDz+91eKI2yLB7HuZtnOCT/LvIIkT1/DP66vyiFbNjxPdVfy4FqIIHMbt9pd9S9S3wqw
 MQJlER3Rh1iKwkDDmlVrnmfW4BC5VeEF0rTkIHFTEgp7fCGYDozPE5e/X3Y/golxCpBR
 DTg7hH+suOYTFMcF/gZa/z03ME7hzjXDrbcMKcxCUECFs4vB6fErFrekyCBI/P0HgM+t
 lUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z3nr2eJmSOi62JFIuGHkSIz5KDvp6E7rh06KhWhu6M8=;
 b=V25hzAKR+K+JJo0vG8/UT3CNkWOkKjdd/wOxl4i1PZZq11pEZ9PeD8+z7OcZqGyQoq
 etacuN5rubG3IVG0puIoyBa37kpljN3n1kOeg/z19pGQWxhyxxmuPHfdSbEB4jErgAhR
 1AetibQJahvd2kRDSRR3A2jYf26IgDQmEalS//Jw13Z+82URs22v1s+2JnTBTmI/tdNB
 U54sxNaaR/9NHda16E00pSjKSvpmu/kYjafwmzgDU4+uY/b44GB8B8u/UiN6KUWFtb8Y
 Ewqp3gw9h000wfHpDy4gt5irTM21igPxOSVtC0TryQPBEcCYakVpW7Oo89c7fjOecVwq
 e44A==
X-Gm-Message-State: AOAM532qKPUSjmTinl2aZ3/hpO8GCgC+bO10F6pZg9lBDXiSbMeQcU4M
 6ii5awHWK2vaJulFMh4accVdTcmGWGxK6A==
X-Google-Smtp-Source: ABdhPJwDdaIfcdTO4V4WCRpNgAYCfdR3EVtqnS9Tlh/Uw1mZf2TnIM4KC0hAhUoHiwDSypr5cYFatQ==
X-Received: by 2002:a37:87c3:: with SMTP id
 j186mr18302075qkd.480.1597784731525; 
 Tue, 18 Aug 2020 14:05:31 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id z67sm22493006qkb.27.2020.08.18.14.05.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:31 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 08/14] drm/nouveau: Change debug checks to specifically
 target syslog
Date: Tue, 18 Aug 2020 17:05:04 -0400
Message-Id: <20200818210510.49730-9-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-9-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-Rebased on drm-tip, changes in dispnv50/disp.h were rebased out
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index f63ac72aa556..70be12038b0c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -258,11 +258,11 @@ void nouveau_drm_device_remove(struct drm_device *dev);
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
