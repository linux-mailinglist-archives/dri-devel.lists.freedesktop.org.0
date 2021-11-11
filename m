Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F744D599
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EBC6E8E6;
	Thu, 11 Nov 2021 11:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795FF6E8E6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636629107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6eGvVdE+WOQI0n1vAW2uJhdmDZdRKNo3k8x27QeGSUs=;
 b=eKOztse8CSQD9JC3+iWzBWFKxfQNS4zoQkg0JrUNG450+BZzGfR/Dsi/0EMg4MXw+9C4rj
 laJ7IiSlkkdU0NzTWUF3ooq8uBJYCizeOBPWw8AWvZ3xqnr/OjOtVI+Aa06/zz7Tetc5ZV
 nvPXeSLLb1z49LqmlwPWTTwrpQSFKvw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-kubZhsKVPyKb9tiAVB4X3A-1; Thu, 11 Nov 2021 06:11:46 -0500
X-MC-Unique: kubZhsKVPyKb9tiAVB4X3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso1637557wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6eGvVdE+WOQI0n1vAW2uJhdmDZdRKNo3k8x27QeGSUs=;
 b=URgwRMIswSj0HFkFZf71AmYJ4U98AT38XeivMRhbIqSfOc9zp5ukP+MC0PC6r4VzuE
 bPMPmns0G1acL9pzXZT6inSbIs5dbN0GRbz7WhBtnZGYpvDHxTTsbonuu4EXSOty6j00
 O/hI/S5xpjEXWp/jsYRwXZn7pfprXH90HpU05+dlMAJy/ku9wjbGlpzhHMtTYtCv4WVq
 iSuzdY+w5zTFgBLzHyMf8sePQw75lkNOS1VcsaeJujFncr7vx3+mj2YRfkaVLroifD4F
 /bAwnxf87oMT2UAcNPypPBq8jncNzj2LFvHrxK8tOa7O3eqwwljjLUSg4qJip5u4ri9f
 Q/6g==
X-Gm-Message-State: AOAM5338fP5aRQKTSX/b4nqESfZJXvJ0aOPxOCaQ2vQPN1WRH5yVIwd3
 cnnxT1a5ahIj14/FlMbdYQ5W4bmYy3zHq1Nz/tc4dwk9Hz/EgTJ0PQ+GfkuYWrAOnmmfW584R+1
 zYzYAqBDMkoS/o9TCjOC7j/B5OdU+
X-Received: by 2002:a5d:548d:: with SMTP id h13mr7729990wrv.30.1636629104856; 
 Thu, 11 Nov 2021 03:11:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpiIEii6T7ztWVEFXdyjsxYX2ZgZCjRy/OqBzYjm9qowfTgAkURfVua5FAPoeW2C2TpR0nOg==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr7729960wrv.30.1636629104600; 
 Thu, 11 Nov 2021 03:11:44 -0800 (PST)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id f7sm7937292wmg.6.2021.11.11.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:11:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is already
 registered
Date: Thu, 11 Nov 2021 12:11:20 +0100
Message-Id: <20211111111120.1344613-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
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
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

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

