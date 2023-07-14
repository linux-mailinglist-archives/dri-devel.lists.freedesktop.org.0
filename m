Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C875404D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225BE10E8C4;
	Fri, 14 Jul 2023 17:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96BE10E108
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689355022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxKxDl8hkASbmof5obTD+MsN6Wed2Skg+HdVQ+mL5aQ=;
 b=PgiPS7mnlAbXeQChvA/krOfsy/pAJhF6obuxPzrI+Hu6KkC+5eIoy2jVflugcUeL8+JZ0K
 jC2hIGQHC+JUvuQSFTS8T8ZR9CQlNM/QJMpfffd+RYxpdLspIrjtea+UKLX6CkmqOUPepW
 RK5qo2DS1dzJhKo8TbrPMl4SffvWA5E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-mvslw98qOni0VlO1FpVpKg-1; Fri, 14 Jul 2023 13:17:00 -0400
X-MC-Unique: mvslw98qOni0VlO1FpVpKg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-314291caa91so1249127f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689355019; x=1691947019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxKxDl8hkASbmof5obTD+MsN6Wed2Skg+HdVQ+mL5aQ=;
 b=G2kF0jUrF90yaGSt8BrWD+tH2Mu3AD8nC+eD9ssOjE54hAKcuXR2Kt8ZGcs+c8kZHO
 am48zzHtr5VULPtDXtDlvn4O23EXXHk/Cu+Htt5LKmOqEAkZsdIydgEh3Hx6o4/kqaQU
 Nrdf+IkL6VThmN5lrdFpmzTAKlGQrPz5SFyFQUNIiHDVvIJqX+C0lZDt/5xlJBr/zz0C
 HVFuXe1I8loQ65sePlJJ6L96/i58hd1v0qu1i1Q4tmT7bhvjvKkVu22P3E0K+IiPy6Ah
 TZISXBmwqU9DSqYPTXIBKI00YvMd2WMcqw2FsKlafGPryCKeYHiSzUgWv6nP4bVMjO24
 czyw==
X-Gm-Message-State: ABy/qLY8PyVEUJNAykdfK44QOJLg7PrVt6dMBkMVXny3aZnR4b9k2KNU
 WqBJimQAnZc/1en0xB2lI4Q/zN1Vbisjqg+LnFBZFWxzXu/EvszSQxEojRJEHQxHRrHuhLSVfBs
 +p9SrN/TbUVpt0cEnoVYQL2euBXnK
X-Received: by 2002:a5d:4c41:0:b0:316:d887:624a with SMTP id
 n1-20020a5d4c41000000b00316d887624amr4545158wrt.15.1689355019175; 
 Fri, 14 Jul 2023 10:16:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGKPw1UykVcusjqH34hV6KXPzLB9kjRoLXf9wmHhY9nt93nNtlU2qXpYhntJXfeqdJlboF9dw==
X-Received: by 2002:a5d:4c41:0:b0:316:d887:624a with SMTP id
 n1-20020a5d4c41000000b00316d887624amr4545148wrt.15.1689355019005; 
 Fri, 14 Jul 2023 10:16:59 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020adfe891000000b003143cdc5949sm11620842wrm.9.2023.07.14.10.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:16:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] drm: Make FB_CORE to be selected if DRM fbdev
 emulation is enabled
Date: Fri, 14 Jul 2023 19:16:32 +0200
Message-ID: <20230714171642.91185-5-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714171642.91185-1-javierm@redhat.com>
References: <20230714171642.91185-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that fbdev core has been split in FB_CORE and FB, make the DRM symbol
to select the FB_CORE option if the DRM fbdev emulation layer is enabled.

This allows to disable the CONFIG_FB option if is not needed, which will
avoid the need to explicitly disable each of the legacy fbdev drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v3)

Changes in v3:
- Make the DRM symbol to select FB_CORE if DRM_FBDEV_EMULATION is
  enabled (Arnd Bergmann).
- Also make DRM select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
- Make DRM_FBDEV_EMULATION to depend on DRM instead of DRM_KMS_HELPER.

Changes in v2:
- Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).

 drivers/gpu/drm/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 22c1ba9ea28c..4f209e5c958c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -9,6 +9,9 @@ menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
@@ -96,7 +99,6 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
-	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
@@ -132,8 +134,7 @@ config DRM_DEBUG_MODESET_LOCK
 
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM_KMS_HELPER
-	depends on FB=y || FB=DRM_KMS_HELPER
+	depends on DRM
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
-- 
2.41.0

