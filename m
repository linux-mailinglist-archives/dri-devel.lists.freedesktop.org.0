Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC44895C7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 10:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6878312B5D0;
	Mon, 10 Jan 2022 09:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BFF12B5B4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641808592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJr2+TRe6SBb1BM5UDY1ejbky83MU/0sD3dvYedx6MA=;
 b=DorjZva4pGsMo180rYh6I4e8MCcLSdKxeAvkmsfHXcX81CYFoTdrlcliQpSkXN+5fceLwp
 fy6eyUI8YEWPbR8sb58/fzySNBkjHsBBZhQKrOEVBjhAsIJ7PL9F6zN+MCaUr3Zm6WU350
 cCFIlMCLbZV0rveul3R428YpStmA4CU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-IU9K-DKeMmqQ63t_GunMyw-1; Mon, 10 Jan 2022 04:56:31 -0500
X-MC-Unique: IU9K-DKeMmqQ63t_GunMyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so3983480wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJr2+TRe6SBb1BM5UDY1ejbky83MU/0sD3dvYedx6MA=;
 b=wrGEVzGzPjsDXiHzl+bbbR5QHlfC7pPzG5+u1ZGZkAM/UXI3sbRwiBlUu7NhFwmW4g
 HyQYfqiQZsfRdquhskCLc+IL86RPEjB8mAO9k6urKNpgOjjMYFv1e9EMH8gwra4AnErI
 +KztLx6a6/C4AuVtRdckOF+t5HHTgzWTZs/b0YHhRf8aJe2JPBe3afU7aEMWo/GYh3ss
 aKmD0dNZI38JzqNgDh/yO8aVIqTEUX50hV9hj4Qu06Dhkk5QXtiVpJanHR9TQs2HdbYq
 tmRdK8Y/XTRm22E5gIq3GvDRj7yBZj1va2YKArvvdXv8iFd5Tnbm9b3s1XXfC3YcSsNF
 p0uA==
X-Gm-Message-State: AOAM532vRw7Q3u11+Hdg22DyJJbi17EdvM12TNkvgKoGNJSIdc2sdm5a
 UI+1kfZllEw/bIBm4JB6Kz4Bt3dTSP4RoakxAvUA9KOFsMIwPyPDdGFD9Cnb8nMeQh+JpHAB8V6
 mOTw6rpZe9lMBfJsZRxC1sxsuuI6s
X-Received: by 2002:a05:6000:11c9:: with SMTP id
 i9mr6134111wrx.544.1641808590196; 
 Mon, 10 Jan 2022 01:56:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvF1fUNv4N+g4L82v97FbltLNWdtemC8wnOpy3eswOBvCDx6S9Wvq2C8LmHTKllcM2hylVhA==
X-Received: by 2002:a05:6000:11c9:: with SMTP id
 i9mr6134090wrx.544.1641808589966; 
 Mon, 10 Jan 2022 01:56:29 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b13sm6315167wrf.64.2022.01.10.01.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:56:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] video: vga16fb: Only probe for EGA and VGA 16 color
 graphic cards
Date: Mon, 10 Jan 2022 10:56:25 +0100
Message-Id: <20220110095625.278836-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110095625.278836-1-javierm@redhat.com>
References: <20220110095625.278836-1-javierm@redhat.com>
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
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 stable@vger.kernel.org, Kris Karas <bugs-a21@moonlit-rail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vga16fb framebuffer driver only supports Enhanced Graphics Adapter
(EGA) and Video Graphics Array (VGA) 16 color graphic cards.

But it doesn't check if the adapter is one of those or if a VGA16 mode
is used. This means that the driver will be probed even if a VESA BIOS
Extensions (VBE) or Graphics Output Protocol (GOP) interface is used.

This issue has been present for a long time but it was only exposed by
commit d391c5827107 ("drivers/firmware: move x86 Generic System
Framebuffers support") since the platform device registration to match
the {vesa,efi}fb drivers is done later as a consequence of that change.

All non-x86 architectures though treat orig_video_isVGA as a boolean so
only do the supported video mode check for x86 and not for other arches.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215001
Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: Kris Karas <bugs-a21@moonlit-rail.com>
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Kris Karas <bugs-a21@moonlit-rail.com>
---

Changes in v2:
- Only check the suppported video mode for x86 (Geert Uytterhoeven).

 drivers/video/fbdev/vga16fb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 8c464409eb99..d21f68f3ee44 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -184,6 +184,25 @@ static inline void setindex(int index)
 	vga_io_w(VGA_GFX_I, index);
 }
 
+/* Check if the video mode is supported by the driver */
+static inline int check_mode_supported(void)
+{
+	/* non-x86 architectures treat orig_video_isVGA as a boolean flag */
+#if defined(CONFIG_X86)
+	/* only EGA and VGA in 16 color graphic mode are supported */
+	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EGAC &&
+	    screen_info.orig_video_isVGA != VIDEO_TYPE_VGAC)
+		return -ENODEV;
+
+	if (screen_info.orig_video_mode != 0x0D &&	/* 320x200/4 (EGA) */
+	    screen_info.orig_video_mode != 0x0E &&	/* 640x200/4 (EGA) */
+	    screen_info.orig_video_mode != 0x10 &&	/* 640x350/4 (EGA) */
+	    screen_info.orig_video_mode != 0x12)	/* 640x480/4 (VGA) */
+		return -ENODEV;
+#endif
+	return 0;
+}
+
 static void vga16fb_pan_var(struct fb_info *info, 
 			    struct fb_var_screeninfo *var)
 {
@@ -1427,6 +1446,11 @@ static int __init vga16fb_init(void)
 
 	vga16fb_setup(option);
 #endif
+
+	ret = check_mode_supported();
+	if (ret)
+		return ret;
+
 	ret = platform_driver_register(&vga16fb_driver);
 
 	if (!ret) {
-- 
2.33.1

