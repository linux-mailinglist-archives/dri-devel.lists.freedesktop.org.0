Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E49508420
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FCC89EBD;
	Wed, 20 Apr 2022 08:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BBF10F21C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650444799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLz0G110FIfASO+iYCUFHr5GunjUpMHPsHrzLY9s3vE=;
 b=ANZX1rKCxnTU8eJH3AD9VQAzyLkNBaOs6i2xFs1mU4835Cx1fsGnbnuQx2hZicwy7g5Vc9
 BmpbRXdBnRv8//zGG0qLiVIFqHW64+53lpWn5I5rXqw9lePsbQ57Ec41Ty41W6wH03htW3
 qjI1xl3nnPUa993v5lUH15zNPcQvv5w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-FcBRWs9rP1-XGNHjhYPYcA-1; Wed, 20 Apr 2022 04:53:17 -0400
X-MC-Unique: FcBRWs9rP1-XGNHjhYPYcA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n37-20020a05600c502500b0038fdc1394c6so633503wmr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 01:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLz0G110FIfASO+iYCUFHr5GunjUpMHPsHrzLY9s3vE=;
 b=OVNnleB1MH1Yl5KR+tzNMcMLRHBHNoSqAuTSm6NvQVO/aJyXSlCQfr1lsu+kdavglK
 wzbeYCfU6l8wSWrhz72JvHAQA4gsgfiFSTwN7pTp+XnPDfpDwJgnAfrKj/zaQ8ynv3vZ
 ayaC1bnyub1FqXTDY7op4zX4XUXOyzwUCrF2b2Aa46YTh850wkmF3IH9Wtl0T4MreXDa
 Hargp9WJoat+hZ9l/KwvzWiG3xBoHRWFjpqQ+hZAUVo/xDBVO1WqzHeauYGNmBEXNag2
 TGXt11pCMjsCclG47ujsvOL+2WHtJ9HZMFv9WiubNhYeQzOvnizvk8Y1dsz6h+42abEr
 vgEQ==
X-Gm-Message-State: AOAM530KnL2rSgkxLch4v29wvqnHL9rcBbxxZfaPZR21OivXK2TGOAz/
 P/IjM7dbwm6hbweyFRBLQvmTEioJ2qSQ0eyXWcKQilLc6rphFxWTxygVW0KJ8Gx52s8x/pkxP8C
 LV9Iv4e7KtE+rxuLhghfKARwiQtzX
X-Received: by 2002:a05:6000:381:b0:20a:8a52:5c86 with SMTP id
 u1-20020a056000038100b0020a8a525c86mr13748751wrf.554.1650444796563; 
 Wed, 20 Apr 2022 01:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLr++p406eM0f6+U3Y3BY+kkRFz4V3k6cnvH2oKtp+1NlXXl61MnZBiijK/mowG7DRyB16og==
X-Received: by 2002:a05:6000:381:b0:20a:8a52:5c86 with SMTP id
 u1-20020a056000038100b0020a8a525c86mr13748731wrf.554.1650444796338; 
 Wed, 20 Apr 2022 01:53:16 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b0020aac00f862sm1895343wry.98.2022.04.20.01.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:53:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] firmware: sysfb: Make sysfb_create_simplefb() return a
 pdev pointer
Date: Wed, 20 Apr 2022 10:52:59 +0200
Message-Id: <20220420085303.100654-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420085303.100654-1-javierm@redhat.com>
References: <20220420085303.100654-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function just returned 0 on success or an errno code on error, but it
could be useful for sysfb_init() callers to have a pointer to the device.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v2)

Changes in v2:
- Rebase on top of latest drm-misc-next and fix conflicts (Daniel Vetter).

 drivers/firmware/sysfb.c          |  4 ++--
 drivers/firmware/sysfb_simplefb.c | 16 ++++++++--------
 include/linux/sysfb.h             | 10 +++++-----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 2bfbb05f7d89..b032f40a92de 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -46,8 +46,8 @@ static __init int sysfb_init(void)
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
-		ret = sysfb_create_simplefb(si, &mode);
-		if (!ret)
+		pd = sysfb_create_simplefb(si, &mode);
+		if (!IS_ERR(pd))
 			return 0;
 	}
 
diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index bda8712bfd8c..a353e27f83f5 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -57,8 +57,8 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	return false;
 }
 
-__init int sysfb_create_simplefb(const struct screen_info *si,
-				 const struct simplefb_platform_data *mode)
+__init struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
+						     const struct simplefb_platform_data *mode)
 {
 	struct platform_device *pd;
 	struct resource res;
@@ -76,7 +76,7 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
 		base |= (u64)si->ext_lfb_base << 32;
 	if (!base || (u64)(resource_size_t)base != base) {
 		printk(KERN_DEBUG "sysfb: inaccessible VRAM base\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	/*
@@ -93,7 +93,7 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
 	length = mode->height * mode->stride;
 	if (length > size) {
 		printk(KERN_WARNING "sysfb: VRAM smaller than advertised\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 	length = PAGE_ALIGN(length);
 
@@ -104,11 +104,11 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
 	res.start = base;
 	res.end = res.start + length - 1;
 	if (res.end <= res.start)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	pd = platform_device_alloc("simple-framebuffer", 0);
 	if (!pd)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	sysfb_apply_efi_quirks(pd);
 
@@ -124,10 +124,10 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
 	if (ret)
 		goto err_put_device;
 
-	return 0;
+	return pd;
 
 err_put_device:
 	platform_device_put(pd);
 
-	return ret;
+	return ERR_PTR(ret);
 }
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index b0dcfa26d07b..708152e9037b 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -72,8 +72,8 @@ static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
 
 bool sysfb_parse_mode(const struct screen_info *si,
 		      struct simplefb_platform_data *mode);
-int sysfb_create_simplefb(const struct screen_info *si,
-			  const struct simplefb_platform_data *mode);
+struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
+					      const struct simplefb_platform_data *mode);
 
 #else /* CONFIG_SYSFB_SIMPLE */
 
@@ -83,10 +83,10 @@ static inline bool sysfb_parse_mode(const struct screen_info *si,
 	return false;
 }
 
-static inline int sysfb_create_simplefb(const struct screen_info *si,
-					 const struct simplefb_platform_data *mode)
+static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
+							    const struct simplefb_platform_data *mode)
 {
-	return -EINVAL;
+	return ERR_PTR(-EINVAL);
 }
 
 #endif /* CONFIG_SYSFB_SIMPLE */
-- 
2.35.1

