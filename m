Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6744D3F3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A968967A;
	Thu, 11 Nov 2021 09:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6128967A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636622464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M7EnEFZM8hpmKbZzBB2524z5yoBtQtMivZ7RH2EH6gg=;
 b=Fz857kvyCpBWhNBYAeEqbyt4dfyml2DWLsmdH0E2ww8hlKqRLgqfpsCVvv4ELSpVXIGjHD
 ljXJsjMKHk5m3juTEEBqobxjqyqEkxmZp17pUgQ4lCP5EU8hY1q9ryyI8El+LwlLRV3qsl
 6InmbOmkqSkrOHbcDBU+dBYJp0QAkdA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-oI1CdzPKPB-MPUibGwC87A-1; Thu, 11 Nov 2021 04:21:03 -0500
X-MC-Unique: oI1CdzPKPB-MPUibGwC87A-1
Received: by mail-wm1-f72.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso1532088wme.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 01:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7EnEFZM8hpmKbZzBB2524z5yoBtQtMivZ7RH2EH6gg=;
 b=o+LlSNKG5DPRXO1q+Y3l2uT1cRiBaKlFRzYteeHrbSKjkdwyaJanH1BpvbFXDWUQby
 ETsfYDukdKLQJ6ej2X5sGM1KgV59C1ULS2pRAp3/H0dDG+usawWIoyHm1nrur2Dg7muP
 wLJbxlsTza4qoHzsdFr7QNIv5kTw4jufqRQrDIEh8aEea5qN+y34gRSUBk5XBK1zJpQv
 fXjn/iBnz1d1do2KhKLiiRs9p/xzTgh+N2d7XgO36pqRnbmZbkNxJHfAhXBMldD1XIfr
 O0jVU7blN27XuJ2Ez1hE5HCwOiiHzEhnFqpXlEet3fXwi1b+gGtxJBCtKXRE1bnD5dJ1
 rj2A==
X-Gm-Message-State: AOAM530Pxu6E5OfHM+yPW4I9DNZ/RD7TI9JpIS+KnUhF56mixixMugcy
 /4AarbhkeqcNe6aONMoRzRZ/thGcp4yzpTIg+7I64n4JpzVlQK4CFwstsYBqTl3ouEBK6YDSpoY
 gXqDNBOOI9FYKZ2bF8SRoyMYzXDfy
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr6960351wrz.401.1636622461413; 
 Thu, 11 Nov 2021 01:21:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoCpfVGEoP5JTD2lYYhZ8BrAUpodfbF1IJMQ5/neOUnHUU1QzYlFJgKjg18hFHJMVZCV5Zog==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr6960329wrz.401.1636622461175; 
 Thu, 11 Nov 2021 01:21:01 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id c6sm10242842wmq.46.2021.11.11.01.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:21:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Prevent probing generic drivers if a FB is already
 registered
Date: Thu, 11 Nov 2021 10:20:53 +0100
Message-Id: <20211111092053.1328304-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The efifb and simplefb drivers just render to a pre-allocated frame buffer
and rely on the display hardware being initialized before the kernel boots.

But if another driver already probed correctly and registered a fbdev, the
generic drivers shouldn't be probed since an actual driver for the display
hardware is already present.

Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/efifb.c    | 6 ++++++
 drivers/video/fbdev/simplefb.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git drivers/video/fbdev/efifb.c drivers/video/fbdev/efifb.c
index edca3703b964..76325c07cf0c 100644
--- drivers/video/fbdev/efifb.c
+++ drivers/video/fbdev/efifb.c
@@ -351,6 +351,12 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
+	if (num_registered_fb > 0) {
+		dev_err(&dev->dev,
+			"efifb: a framebuffer is already registered\n");
+		return -EINVAL;
+	}
+
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
diff --git drivers/video/fbdev/simplefb.c drivers/video/fbdev/simplefb.c
index 62f0ded70681..55c1f54d7663 100644
--- drivers/video/fbdev/simplefb.c
+++ drivers/video/fbdev/simplefb.c
@@ -407,6 +407,12 @@ static int simplefb_probe(struct platform_device *pdev)
 	struct simplefb_par *par;
 	struct resource *mem;
 
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

