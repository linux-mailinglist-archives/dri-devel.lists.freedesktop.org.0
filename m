Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58943C3BC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3C66E544;
	Wed, 27 Oct 2021 07:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74106E544
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635319266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gce9oVMY0zq8KDp8Fp86o9qyEruiLkF3GO4tnEsUK/s=;
 b=XvbVeTMYnyWM0JiAe4Z+s9rQnlGuXSZzznWSke3R7rGha8mSoSO3k2Ptk00/Vmljg8ozSQ
 GxQYc8tJCP3B10KNcz5OWRyRp0oJP0dZ6gyo2WDo5ZDCKrb323E6NVi8obdwnOwT5qLkS3
 3C4oJE+2bRYkenM6TQwZ7uBsHHoDD+s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-bXPQkJUoMTCHzYnr8xA49Q-1; Wed, 27 Oct 2021 03:21:03 -0400
X-MC-Unique: bXPQkJUoMTCHzYnr8xA49Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a1c9d09000000b0032cc23db051so1688267wme.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 00:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gce9oVMY0zq8KDp8Fp86o9qyEruiLkF3GO4tnEsUK/s=;
 b=MrSpGPqJumCGbvmQHg8TrDDf1SPybXJTwcjZViG2l7EkihMfK90GZJj2ICzR28qGDD
 4e+P2Y1qABGfF4lm0gtKwF8VIznI215eFcyXNEgDlUKxY+o02C9sPFEm26cJpquHSYJV
 QINiBYTTUBmVvevB4BoI9d8yyCnyf5njhSelRnh7gWBzdhjYLLlDV5KlCcvwY8dfjpVT
 JgCN9mOe/3GHdeA140CrW9+adY9V8U3+Cht8lEpnBPNkRiUwlh5E7DNDD381yYO/qCfX
 7uV8Sjprn02BgADl54NLst70vxE9ySB7Ol8QeafQC0gaOimZsUMRmzFRsbdzErSyDgb8
 tlcQ==
X-Gm-Message-State: AOAM533HFr5FvGe8nTCUWUvr4LMUY1RSiWXZRMG1jzXU9FVOzX8F5I9R
 gEaQfR243Wz+WoWtiZ+RMRdOAYMZrGUeQoChJ1PZIzOvCUQ/muvoQ9HRdfhUVXjV5jFUv+37FIL
 SiDaghHiEPHORAnDQRH2gw4fIa03n
X-Received: by 2002:a5d:64ec:: with SMTP id g12mr38031067wri.140.1635319262702; 
 Wed, 27 Oct 2021 00:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2QZl4wgpE3MGzR+UZM6wz0rF26X0UVEKfVH7zxog9HKxoxD4LYrPBsVqm8Yi97HpTOeg4jw==
X-Received: by 2002:a5d:64ec:: with SMTP id g12mr38031038wri.140.1635319262521; 
 Wed, 27 Oct 2021 00:21:02 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r1sm279858wmq.15.2021.10.27.00.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 00:21:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>,
 "Justin M . Forbes" <jforbes@fedoraproject.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Make DRM_FBDEV_EMULATION deps more robust to fix linker
 errors
Date: Wed, 27 Oct 2021 09:20:44 +0200
Message-Id: <20211027072044.4105113-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Enabling the CONFIG_DRM_FBDEV_EMULATION Kconfig symbol can lead to linker
errors, if CONFIG_DRM_KMS_HELPER is built-in but CONFIG_FB as a module.

Because in that case the drm_kms_helper.o object will have references to
symbols that are defined in the fb.ko module, i.e:

  $ make bzImage modules
    DESCEND objtool
    CALL    scripts/atomic/check-atomics.sh
    CALL    scripts/checksyscalls.sh
    CHK     include/generated/compile.h
    GEN     .version
    CHK     include/generated/compile.h
    UPD     include/generated/compile.h
    CC      init/version.o
    AR      init/built-in.a
    LD      vmlinux.o
    MODPOST vmlinux.symvers
    MODINFO modules.builtin.modinfo
    GEN     modules.builtin
    LD      .tmp_vmlinux.kallsyms1
  ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
  drm_fb_helper.c:(.text+0x2a0): undefined reference to `fb_set_suspend'
  ...

To prevent this, make following changes to the config option dependencies:

  * Depend on FB && !(DRM_KMS_HELPER=y && FB=m), to avoid invalid configs.
  * Depend on DRM_KMS_HELPER instead selecting it, to avoid circular deps.

Reported-by: Justin M. Forbes <jforbes@fedoraproject.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

This fixes linker errors found when building the Fedora kernel package
for the s390x architecture:

https://kojipkgs.fedoraproject.org//work/tasks/9849/77859849/build.log

 drivers/gpu/drm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index cea777ae7fb9..9a21e57b4a0d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -103,8 +103,8 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	depends on FB
-	select DRM_KMS_HELPER
+	depends on FB && !(DRM_KMS_HELPER=y && FB=m)
+	depends on DRM_KMS_HELPER
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.31.1

