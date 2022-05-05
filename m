Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3C51CBD8
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AED10E39E;
	Thu,  5 May 2022 22:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B870E10E3E2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651788308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpySyazXcP9jeQEo03DKJEoNJ7MOw25wdUGi6hnO0cY=;
 b=JABCmbM8vx7KfdP2EhaLyBJKCMzSXzvZYTSFgMOa1PhFv4Quc+ZGvnrndegRvFTgEbasOd
 sFtJyWQxN550BZWFCjlpyLyeLUZYXiGtT95wLCjozAGe+ypN4LhUvIBID+rxLCz8VlpSxy
 zdEN3D1TMcAwX8AwiRaALxxa7zKefOM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-CGL20kY6O5uK4c1Z5v-rXg-1; Thu, 05 May 2022 18:05:08 -0400
X-MC-Unique: CGL20kY6O5uK4c1Z5v-rXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 s14-20020a05600c29ce00b00394611a8059so2376456wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpySyazXcP9jeQEo03DKJEoNJ7MOw25wdUGi6hnO0cY=;
 b=x66cQlsr2IsM3XGngzwHjK61g9mri2O54kc0trz3gOCayXoRo+qyY4TAFeKq6uY7LG
 1Ng5eZopwHzeONdiSW6FsvBwhLEAdLEh4i9ODfRgCp17cFsqxOHGypGG+T+a97j16OU3
 j9h40zESPgTImjFR/uTZ1mpc/bDNM/GWroIavaERbzAi0x/UDggFcsliAO+JB6am5/GC
 ETBugjSMTvSbxlL/3rZ01ECnv/C+RXDwn9FLyQ7QGIEreJDMQSS4kbkZftEOD5NcfjFV
 YbBGNpw6CzjOKYL8g+XdKyRhGb93+fkD65srfJTW8BhuEfN2AOu52Pv8r4c9prN+ViaB
 mK1Q==
X-Gm-Message-State: AOAM530/xfPscnSkv3YS905ZcZewjZsoPIZigXH5S7hgUiqBpUSA+d3L
 gnb5qORLPDEB/L/glddwcyRGJvySnYS2T4QO3XcbDsKeKbLpwqtNt4U7J+LUyJ2ug+r/e/liD40
 f2L923+uyDp7qV0DD1qpo0Emmv6Cz
X-Received: by 2002:a5d:6c65:0:b0:20c:5230:f145 with SMTP id
 r5-20020a5d6c65000000b0020c5230f145mr142607wrz.337.1651788305743; 
 Thu, 05 May 2022 15:05:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx4hSKJf5+8gqVXy4SQIIH/+d18yIIzPchwfl0/SeHroDdEocZasvgfA/q6M9W6ITqVZA+Yg==
X-Received: by 2002:a5d:6c65:0:b0:20c:5230:f145 with SMTP id
 r5-20020a5d6c65000000b0020c5230f145mr142590wrz.337.1651788305549; 
 Thu, 05 May 2022 15:05:05 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n21-20020a7bc5d5000000b003942a244f47sm7942360wmk.32.2022.05.05.15.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 15:05:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] fbdev: simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Fri,  6 May 2022 00:04:56 +0200
Message-Id: <20220505220456.366090-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505215947.364694-1-javierm@redhat.com>
References: <20220505215947.364694-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is calling framebuffer_release() in its .remove callback, but
this will cause the struct fb_info to be freed too early. Since it could
be that a reference is still hold to it if user-space opened the fbdev.

This would lead to a use-after-free error if the framebuffer device was
unregistered but later a user-space process tries to close the fbdev fd.

To prevent this, move the framebuffer_release() call to fb_ops.fb_destroy
instead of doing it in the driver's .remove callback.

Strictly speaking, the code flow in the driver is still wrong because all
the hardware cleanupd (i.e: iounmap) should be done in .remove while the
software cleanup (i.e: releasing the framebuffer) should be done in the
.fb_destroy handler. But this at least makes to match the behavior before
commit 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal").

Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v1)

 drivers/video/fbdev/simplefb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 94fc9c6d0411..2c198561c338 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -84,6 +84,10 @@ struct simplefb_par {
 static void simplefb_clocks_destroy(struct simplefb_par *par);
 static void simplefb_regulators_destroy(struct simplefb_par *par);
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void simplefb_destroy(struct fb_info *info)
 {
 	struct simplefb_par *par = info->par;
@@ -94,6 +98,8 @@ static void simplefb_destroy(struct fb_info *info)
 	if (info->screen_base)
 		iounmap(info->screen_base);
 
+	framebuffer_release(info);
+
 	if (mem)
 		release_mem_region(mem->start, resource_size(mem));
 }
@@ -545,8 +551,8 @@ static int simplefb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* simplefb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

