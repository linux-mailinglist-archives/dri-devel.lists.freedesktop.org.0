Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB944D641
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1736E5CE;
	Thu, 11 Nov 2021 11:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF36E5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636631911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GpCy36el8L/qh4Uk9yDbL7KgAnUqMJxvY/v6l31jKkQ=;
 b=gCygRVBbJSCkj+reBgph0XpfT/SJlNhsmvHs2kUO3IUXJ88g23QzP2UO0TSfYp3HIDsuPY
 PkEbB8r2JHQOd5paY1+myJxopW5pBmSMlv1Jy6fOEMN+o0TUNe+RgMwSmcAFdKGVMoKlav
 vWReG36YtyHkRP2ulZkiHg5p6N/qoUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-IVm9Y1gjOQuic7vAwl1Xew-1; Thu, 11 Nov 2021 06:58:30 -0500
X-MC-Unique: IVm9Y1gjOQuic7vAwl1Xew-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so2599612wmj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpCy36el8L/qh4Uk9yDbL7KgAnUqMJxvY/v6l31jKkQ=;
 b=z06BTv7QAOQbEvHpSCOK+d9X+8bqyaGsc1LvzCF76OJpO6letwD2TMpoGYgqnrMZSe
 IfW2vvdMp7+By/GzfMupyOVqnDdY68EopbDFiDS2mW+dPZFYkSqmCY6mDwzXHrvqPYMj
 yQ+ckOENqMHU7u28seIQicLnqDyRhYUBlPbxc+o4DVua0FGZhBroBGjEPtG1boz1H27F
 SKQTilp4QG24+RCoRoyTnaehrb+SBtTTf62kGGcEP+3V8S9S5+nvrFUy9RQw3mPxIrna
 h8j7hcy8GSrGWWL7t1U/xHQwYsa4iqMWQNZTa12S72jwt97fmPY80nlvXucp5WUcBKgZ
 qq6w==
X-Gm-Message-State: AOAM530Z24fGpuBbXlmlIBz0R/DT86PsYVOan7VigSQAxbPERFcLCFND
 LK2zjwbBKdhCB/X/Wjg6cJYbjPGLrzlexjOiIQ/3Uq2PMgQQjIaeDDH/JB51Y1o5g3iX7OwRIOu
 x2YNM1911PMfJlHunzQ38PFFt4nAE
X-Received: by 2002:adf:ecce:: with SMTP id s14mr8119948wro.98.1636631909108; 
 Thu, 11 Nov 2021 03:58:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfoIxf570FYpycJGE2UH3Ewq0I2fnG+SXfzWg9ZPKr71MsC8o/krxHefoSdTddnQ59oHIKuw==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr8119917wro.98.1636631908877; 
 Thu, 11 Nov 2021 03:58:28 -0800 (PST)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l7sm3588756wry.86.2021.11.11.03.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:58:23 -0800 (PST)
From: Javier Martinez Canillas <fmartine@redhat.com>
X-Google-Original-From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] fbdev: Prevent probing generic drivers if a FB is already
 registered
Date: Thu, 11 Nov 2021 12:57:57 +0100
Message-Id: <20211111115757.1351045-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fmartine@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-fbdev@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Ilya Trukhanov <lahvuun@gmail.com>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The efifb and simplefb drivers just render to a pre-allocated frame buffer
and rely on the display hardware being initialized before the kernel boots.

But if another driver already probed correctly and registered a fbdev, the
generic drivers shouldn't be probed since an actual driver for the display
hardware is already present.

This is more likely to occur after commit d391c5827107 ("drivers/firmware:
move x86 Generic System Framebuffers support") since the "efi-framebuffer"
and "simple-framebuffer" platform devices are registered at a later time.

Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

Changes in v3:
- Cc <stable@vger.kernel.org> since a Fixes: tag is not enough (gregkh).

Changes in v2:
- Add a Link: tag with a reference to the bug report (Thorsten Leemhuis).
- Add a comment explaining why the probe fails earlier (Daniel Vetter).
- Add a Fixes: tag for stable to pick the fix (Daniel Vetter).
- Add Daniel Vetter's Reviewed-by: tag.
- Improve the commit message and mention the culprit commit

 drivers/video/fbdev/efifb.c    | 11 +++++++++++
 drivers/video/fbdev/simplefb.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git drivers/video/fbdev/efifb.c drivers/video/fbdev/efifb.c
index edca3703b964..ea42ba6445b2 100644
--- drivers/video/fbdev/efifb.c
+++ drivers/video/fbdev/efifb.c
@@ -351,6 +351,17 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
+	/*
+	 * Generic drivers must not be registered if a framebuffer exists.
+	 * If a native driver was probed, the display hardware was already
+	 * taken and attempting to use the system framebuffer is dangerous.
+	 */
+	if (num_registered_fb > 0) {
+		dev_err(&dev->dev,
+			"efifb: a framebuffer is already registered\n");
+		return -EINVAL;
+	}
+
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
diff --git drivers/video/fbdev/simplefb.c drivers/video/fbdev/simplefb.c
index 62f0ded70681..b63074fd892e 100644
--- drivers/video/fbdev/simplefb.c
+++ drivers/video/fbdev/simplefb.c
@@ -407,6 +407,17 @@ static int simplefb_probe(struct platform_device *pdev)
 	struct simplefb_par *par;
 	struct resource *mem;
 
+	/*
+	 * Generic drivers must not be registered if a framebuffer exists.
+	 * If a native driver was probed, the display hardware was already
+	 * taken and attempting to use the system framebuffer is dangerous.
+	 */
+	if (num_registered_fb > 0) {
+		dev_err(&pdev->dev,
+			"simplefb: a framebuffer is already registered\n");
+		return -EINVAL;
+	}
+
 	if (fb_get_options("simplefb", NULL))
 		return -ENODEV;
 
-- 
2.33.1

