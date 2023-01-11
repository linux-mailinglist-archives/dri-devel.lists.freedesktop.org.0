Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52957665F78
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3E510E77E;
	Wed, 11 Jan 2023 15:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777F610E775
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso10010455wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvSF0y9cGVydackbO4wbJNVFr06wRRTkQkIKN/PkYhQ=;
 b=DS7eOdA9ggp4AlFEpH67KG9/Cyrzc8B52VSXtRv27As9iIaxCjD1rF7UtS4h4TapEk
 Quz07JxkUhXAlDX9lIGGsOfQOVMNJyvTYgSIuwpUlvI4g9njZiG5av0/RgjEXMFc/zhv
 JALqBUcMWnCnrHQHz+bk/xt1vMvCFmUL8DchE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvSF0y9cGVydackbO4wbJNVFr06wRRTkQkIKN/PkYhQ=;
 b=nzr9FrIPnaoeHEvubNifTPJafvzB+BeIQJh1WFsE3sln625hyDIvk440vIfzosMVtw
 eFksI82vWB7rQKhCtsHFLuyvtnTKjw24i5glqhgi/kQkQLCF8GUSGBtsL6zw76Obea4A
 kHalxp0SWTSQ6tPgqd2Nm/f6CpUtgvrwLoMUZbhAGJ6Yvqs6+TJMrXyJ0baTkXqJv7Sf
 YGMF3s2CQ41twwWQgB8G3028WkuwZHOGG7kvHm14mtBXpyNEsYWEIMvmXET9YO/Wm+X+
 fTLzbxWq/BtJ/J+4SyUdqoGRkJVpW5R9+m76fiTq56ZULGSOzMynl2jhAYEAAmQMbuHw
 wZww==
X-Gm-Message-State: AFqh2kp6g4TO+qKVeDDnfhXPGLWk6tLry9fDIb//38vgsgBR+uuV+eMn
 zYn1L3WnHB+L/IdVeZyLuwLkBUOoi1ewdkR/
X-Google-Smtp-Source: AMrXdXvlLbbyUpsJ/0Isc83fGIkQVv5L0p8vpuSZp55Xs48ktQXVK61WwUBQhAWGdU1GXTXAU2Hqzw==
X-Received: by 2002:a05:600c:3b8f:b0:3d0:85b5:33d3 with SMTP id
 n15-20020a05600c3b8f00b003d085b533d3mr54156813wms.16.1673451692093; 
 Wed, 11 Jan 2023 07:41:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:31 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/11] video/aperture: Move vga handling to pci function
Date: Wed, 11 Jan 2023 16:41:10 +0100
Message-Id: <20230111154112.90575-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few reasons for this:

- It's really the only one where this matters. I tried looking around,
  and I didn't find any non-pci vga-compatible controllers for x86
  (since that's the only platform where we had this until a few
  patches ago), where a driver participating in the aperture claim
  dance would interfere.

- I also don't expect that any future bus anytime soon will
  not just look like pci towards the OS, that's been the case for like
  25+ years by now for practically everything (even non non-x86).

- Also it's a bit funny if we have one part of the vga removal in the
  pci function, and the other in the generic one.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/aperture.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 6f351a58f6c6..03f8a5e95238 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -298,14 +298,6 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 
 	aperture_detach_devices(base, size);
 
-	/*
-	 * If this is the primary adapter, there could be a VGA device
-	 * that consumes the VGA framebuffer I/O range. Remove this device
-	 * as well.
-	 */
-	if (primary)
-		aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
-
 	return 0;
 }
 EXPORT_SYMBOL(aperture_remove_conflicting_devices);
@@ -344,6 +336,13 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 	if (!primary)
 		return 0;
 
+	/*
+	 * If this is the primary adapter, there could be a VGA device
+	 * that consumes the VGA framebuffer I/O range. Remove this device
+	 * as well.
+	 */
+	aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
+
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
 	 * otherwise the vga fbdev driver falls over.
-- 
2.39.0

