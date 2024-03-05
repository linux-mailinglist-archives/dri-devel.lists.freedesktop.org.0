Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F2871DF1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332D8112A4D;
	Tue,  5 Mar 2024 11:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="BZQuDztV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1887B112A4D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:34:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1dc5d0162bcso47671405ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638466; x=1710243266;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1DfDZMTMffYiTmyqOzmLOtfTydk4L3JihPgMKHs/SA=;
 b=QqYRo7YC6UKXuIeTZq2hvzlB4Ciz3JdktgijVeszCD40bttDFrV8RdA03GAX3TAqK3
 0Y0A5r/86XmrvyrKm/9kM0w2uSu7bx16cIHQ/mSKylgNg7FWGthQVGjXiVJ1n2dIoQXw
 Yg0xz3QG+3VGLoJX1OxS6IWXiYnO0ApPCNdpIEX4f8VM+VXRyZd0pLqqUEwCOrir2JDI
 OvFTgRhn00Uv513qOydaWdkejAZuxoQFRh3CdmWaCiGqAUJjfsjtIdQ8qTAbP9f7Njf6
 k7DPwthK4PTbTd0e23/AyNwnKoaUsSNK+gPPaCkUZfJuTK4AqB09hkr6QnE4i3ZVv/sh
 TSzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGgoWWpEXN62SfrFHqRhKxk5UrkmGyqUT8X8y+0xu6U3Pn4c9HXMtis59ovtgWZT14ndHpNA4NAabgzgCrYNAzBaGG9t1xbGcoEKTfEiZa
X-Gm-Message-State: AOJu0YzQ5+8xvCdALgt9ZRs+y5o28tX6pFFEuylIOjNJn+lwSVqvoFSv
 CDr8mthDli+uT4jiCcqsIdKqi4o/XgqqBt5sKgjy7a2V6w/Qzqwt+Ust/HdhAOqSXw==
X-Google-Smtp-Source: AGHT+IHZWXKL+Lk1FfhlYKJcnfb5e8jQKTcN0jHBpaUNr32Y5e7OuV6Xsl+nwlXMjRn/fQRALMcOQw==
X-Received: by 2002:a17:90a:ea87:b0:29b:41aa:1673 with SMTP id
 h7-20020a17090aea8700b0029b41aa1673mr5116953pjz.23.1709638466494; 
 Tue, 05 Mar 2024 03:34:26 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090ad48c00b0029aac9c523fsm9293361pju.47.2024.03.05.03.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:34:26 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709638464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1DfDZMTMffYiTmyqOzmLOtfTydk4L3JihPgMKHs/SA=;
 b=BZQuDztVgmgzi+Uh2Sd6As8Sivl/LlMh5BhXMEd6lIWOGJryGqMmd+71wdK9N+jv6cdSu4
 F4BSAou210tR40UJyLZloxJWaYTbes3MpVIk7dssKXFSks/ezD1EdvAoPbtgvjfMLaX2IH
 Dv1m4NcbqRygZs2NjqtFMLo9z2FwgT0S9ld1ztiX/uiKpd5Yg/nn1wmBm3/mXCEy5LdTEP
 xdmrqcdNcuOy8ouXEF4XE/5LmTb8S7dyu50pZF39aMWRkRyzXaVKauS6okL+5SIZXovq13
 lRJRlCNsBrZ8SPeWmSxzTAtPAEi1geuJ5D2q8BrsVzLnfrHcWLAZBiqojoX3NQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 08:34:12 -0300
Subject: [PATCH RESEND drm-misc 3/4] drm/fbdev/core: make fb_class constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-class_cleanup-drm-v1-3-94f82740525a@marliere.net>
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
In-Reply-To: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4135; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=odlS9XGQQRwzN+B0py2AY1reM8pgKOyyB/x+HH+DGwc=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5wMz/VClmII16tlzVnls2AkPKRQDOF8ITXAxS
 E2AX4MDYLaJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecDMwAKCRDJC4p8Y4ZY
 pi6cD/48CYEbxbcvKs7TOaESq2VHY7ujmAiw6OqMderld8pQkDBzFtKAj9msxKjTqw6CHYhgOZK
 +mSSI6QSE/tqwMuM8NehJCfvyf4VpXXFRgY5llCm3hOvBXd6SydElVVwgg1ZWxlkyuZUjQ+fHtw
 gb0wcB5XPSTORMAqMxUADS0a1GJ9TOx1hfQe1KZFnz7Axi0uWdzLKAhs8VoKLaSBIjKCzDIrhPW
 2r+mvo0gFhyZ304vStg1xKyg2RdAYWgTXfbBlE2q77AIsVdqZgi5cZ92Uhzpsx0IyVe3+YKqGK5
 xUhJQPQlAUPx4sN0r6GvkhT2umuxNf5wFaqznS/CTslhKtKEXbUaHNO6sl4CjXIU6IrcU55QSfv
 OwdRg+pB7hVLcjNC/IdRO6CbHWhnBc7TJubNFKi3bBN8jsLiWGXV8dTYpw3DBwDxWhyVyjTDixl
 8XRBbuC3zHSwSA4U60z28nrjlvvJDJcFy1lcZpn2roUQ6capAKh3j+ELXMX+sYTNRDEmau8heih
 jdhAwWQ7Mr18+F32vgALXzZTEUVFUrciJ7fmd+rAAAl0bfBuWa7dQ6ZjCzdf0BXefAAVRX8wqnz
 3VDKtI0xWBQPQYNPdUOQ9nxrwsThkJB8HA3SEiASF3JsOwd1xqVftYRmVvREWJLO4z09+kpqTHq
 lmV9bhnUmwWMHWg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the fb_class structure to be declared at build time placing
it into read-only memory, instead of having to be dynamically allocated at
boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/video/fbdev/core/fb_internal.h |  2 +-
 drivers/video/fbdev/core/fbcon.c       |  4 ++--
 drivers/video/fbdev/core/fbmem.c       | 17 ++++++++---------
 drivers/video/fbdev/core/fbsysfs.c     |  4 ++--
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 613832d335fe..f1c0f1386675 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -38,7 +38,7 @@ static inline int fb_show_logo(struct fb_info *info, int rotate)
 #endif /* CONFIG_LOGO */
 
 /* fbmem.c */
-extern struct class *fb_class;
+extern const struct class fb_class;
 extern struct mutex registration_lock;
 extern struct fb_info *registered_fb[FB_MAX];
 extern int num_registered_fb;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 1183e7a871f8..4d87a6ebdbdf 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3380,7 +3380,7 @@ void __init fb_console_init(void)
 	int i;
 
 	console_lock();
-	fbcon_device = device_create(fb_class, NULL, MKDEV(0, 0), NULL,
+	fbcon_device = device_create(&fb_class, NULL, MKDEV(0, 0), NULL,
 				     "fbcon");
 
 	if (IS_ERR(fbcon_device)) {
@@ -3425,7 +3425,7 @@ void __exit fb_console_exit(void)
 
 	console_lock();
 	fbcon_deinit_device();
-	device_destroy(fb_class, MKDEV(0, 0));
+	device_destroy(&fb_class, MKDEV(0, 0));
 
 	do_unregister_con_driver(&fb_con);
 	console_unlock();
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 48287366e0d4..d868194499fb 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -26,7 +26,9 @@
 
 #define FBPIXMAPSIZE	(1024 * 8)
 
-struct class *fb_class;
+const struct class fb_class = {
+	.name = "graphics",
+};
 
 DEFINE_MUTEX(registration_lock);
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
@@ -571,11 +573,10 @@ static int __init fbmem_init(void)
 {
 	int ret;
 
-	fb_class = class_create("graphics");
-	if (IS_ERR(fb_class)) {
-		ret = PTR_ERR(fb_class);
+	ret = class_register(&fb_class);
+	if (ret) {
 		pr_err("Unable to create fb class; errno = %d\n", ret);
-		goto err_fb_class;
+		return ret;
 	}
 
 	ret = fb_init_procfs();
@@ -593,9 +594,7 @@ static int __init fbmem_init(void)
 err_fb_cleanup_procfs:
 	fb_cleanup_procfs();
 err_class_destroy:
-	class_destroy(fb_class);
-err_fb_class:
-	fb_class = NULL;
+	class_unregister(&fb_class);
 	return ret;
 }
 
@@ -605,7 +604,7 @@ static void __exit fbmem_exit(void)
 	fb_console_exit();
 	fb_unregister_chrdev();
 	fb_cleanup_procfs();
-	class_destroy(fb_class);
+	class_unregister(&fb_class);
 }
 
 module_init(fbmem_init);
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 1b3c9958ef5c..aac013dfe06a 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -476,7 +476,7 @@ int fb_device_create(struct fb_info *fb_info)
 	dev_t devt = MKDEV(FB_MAJOR, node);
 	int ret;
 
-	fb_info->dev = device_create(fb_class, fb_info->device, devt, NULL, "fb%d", node);
+	fb_info->dev = device_create(&fb_class, fb_info->device, devt, NULL, "fb%d", node);
 	if (IS_ERR(fb_info->dev)) {
 		/* Not fatal */
 		ret = PTR_ERR(fb_info->dev);
@@ -497,6 +497,6 @@ void fb_device_destroy(struct fb_info *fb_info)
 		return;
 
 	fb_cleanup_device(fb_info);
-	device_destroy(fb_class, devt);
+	device_destroy(&fb_class, devt);
 	fb_info->dev = NULL;
 }

-- 
2.43.0

