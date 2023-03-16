Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19CF6BC8D9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37AA10EA57;
	Thu, 16 Mar 2023 08:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE3710EA55;
 Thu, 16 Mar 2023 08:20:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id ek18so4290820edb.6;
 Thu, 16 Mar 2023 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678954839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y5Genvz3psdnrKYFupF8x9dO/IbJnAh26YGJu4815n0=;
 b=qBeczK1khsQg8p236ZwzGgxulcFlL5YVzcZ8MSD7p2wS74p9aM0YMtwVaQqoNksaGl
 2/YTC9fXTrofIHM61txN2Dhj6LFRBlfZnxhv6RAiuc4XzL6WlcQ49pKGSy7aR+rJ8QD8
 V8cQZPW76tTxGqQHiQzIRBic1iLoXs3VshxhJCmw7qGwMIG0NqhRI3fPtZ+PYy0bOgRl
 szOMS9N1Q1dvktmPDCIlFhU49R1hFwUS6j4aOfvqZGTkjQYZ6zL1nJeNVimpH3/z+3ay
 9iAHZfpdYukN/PMBG7L31KQ9QMdRqixc4GwHt8DC87wzlL3Dwba9urgeAXz87Ra6HiS5
 1lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5Genvz3psdnrKYFupF8x9dO/IbJnAh26YGJu4815n0=;
 b=AP0t5LFGqFLFsa4b1p7FYGV9mWBZn21NwMW6zRLF6RxcuLp+MtFRCKheHX0qbTa11B
 Twk40IpcCmPcTogLEmDX8MA7+vcdi02m1VAN/iCW1aZtMAMSfTMo/VxD/NfT2BtGnv7S
 +M0e5LWTtvme2bCMzMeYFmQzTacPelpsY3x4U3+U5VQ1PB2GAlwm/rZaSy7m4fSk6Kz2
 ykeDCRlLOyGfg5P/TeoE8CxUKLmGmOajq0vK05GFulEp/kJEbaAqxACdkjOoA7OsdNM0
 Z+PztJVyv5vcAHCOhmvsOCsWweOBw1r7VDjUdAmvcfkaIRvrLioUXWwZ6bNTwCIcG3e+
 VXKQ==
X-Gm-Message-State: AO0yUKXnwcwz8qNgJQKw4VChH0bqyOPYBqRdOtQzUWExHscoeYeC+SIG
 dKW9nJn0SbOkjWHN31Cb6s4=
X-Google-Smtp-Source: AK7set/hTFAdmMuzEoEJTuWkQUXcM/ELAYIkSpo8KdRtPSDtjjgXr5iGOwOaQ/xM9FTupYbXEurMWQ==
X-Received: by 2002:a17:907:7ba6:b0:8af:ef00:b853 with SMTP id
 ne38-20020a1709077ba600b008afef00b853mr10721083ejc.73.1678954839528; 
 Thu, 16 Mar 2023 01:20:39 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170907989300b008cf8c6f5c43sm3519895ejc.83.2023.03.16.01.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:20:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm: remove drm_dev_set_unique
Date: Thu, 16 Mar 2023 09:20:29 +0100
Message-Id: <20230316082035.567520-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316082035.567520-1-christian.koenig@amd.com>
References: <20230316082035.567520-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used by any drivers any more, the only use case in drm_dev_init()
can be inlined now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 26 ++++----------------------
 include/drm/drm_drv.h     |  2 --
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c6eb8972451a..cee0cc522ed9 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -691,9 +691,11 @@ static int drm_dev_init(struct drm_device *dev,
 		}
 	}
 
-	ret = drm_dev_set_unique(dev, dev_name(parent));
-	if (ret)
+	dev->unique = drmm_kstrdup(dev, dev_name(parent), GFP_KERNEL);
+	if (!dev->unique) {
+		ret = -ENOMEM;
 		goto err;
+	}
 
 	return 0;
 
@@ -1000,26 +1002,6 @@ void drm_dev_unregister(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unregister);
 
-/**
- * drm_dev_set_unique - Set the unique name of a DRM device
- * @dev: device of which to set the unique name
- * @name: unique name
- *
- * Sets the unique name of a DRM device using the specified string. This is
- * already done by drm_dev_init(), drivers should only override the default
- * unique name for backwards compatibility reasons.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_dev_set_unique(struct drm_device *dev, const char *name)
-{
-	drmm_kfree(dev, dev->unique);
-	dev->unique = drmm_kstrdup(dev, name, GFP_KERNEL);
-
-	return dev->unique ? 0 : -ENOMEM;
-}
-EXPORT_SYMBOL(drm_dev_set_unique);
-
 /*
  * DRM Core
  * The DRM core module initializes all global DRM objects and makes them
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 5b86bb7603e7..b419c59c4bef 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -584,8 +584,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
 }
 
 
-int drm_dev_set_unique(struct drm_device *dev, const char *name);
-
 /* TODO: Inline drm_firmware_drivers_only() in all its callers. */
 static inline bool drm_firmware_drivers_only(void)
 {
-- 
2.34.1

