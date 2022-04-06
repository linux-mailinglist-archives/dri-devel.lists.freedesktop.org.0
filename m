Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A624F6D1C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4246E10E090;
	Wed,  6 Apr 2022 21:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40B10E090
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649281253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOqy/c/KjwvNtJK/R+j/LJQnwi5pZIwF5UUMed5h1E8=;
 b=TVXTTbuzvwr2uKJB1OymnzSTdTC4nCd25a9nUwUuCky3GdKQvdHqg2K6FRkrB2JOE/1xFq
 F5znzM5R3yIWE42cuWqg35JRn/kJhp80zBGWX1HxjDYreIO7UO8UK6M7gcj3ms0kZbCccg
 +j7zHtdZCpnxdtSJ09Y5fuycAwraQIA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-ziU7eZDtN-2WgxwxRTiW-A-1; Wed, 06 Apr 2022 17:40:52 -0400
X-MC-Unique: ziU7eZDtN-2WgxwxRTiW-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 r6-20020a05600c35c600b0038e6db5da9cso975553wmq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kOqy/c/KjwvNtJK/R+j/LJQnwi5pZIwF5UUMed5h1E8=;
 b=zMQVUl4UM55u/ugzp1PPGK/lcKZ36Bc40jxzj51bUdunNYrgOa08wDwmVTFqMeQCMB
 yCYoYtpl6OZp3X1Wosj03sObASuaB2036Ei55rWK9QAiXmrvvnVN3hJgDH9A41xS7Ze1
 ESONzt9aUSJ2diJ16PkFT9HXYQEbNW+UhjmPJgngJtOhu+E0fJpqhms41/HmfuP+3ubo
 cW8SqvroCK7JwpOuVaSWFU+2FQurHK+/GDj4FaZgPhumlY+tcjOiQHogffddvhAF9FOM
 Tyxx6oxlrkflMg5DwMb4TaL65Eyy97k8UokV3UE0YwcVMyqkeaGBmX306FihI2Expf91
 Vrgg==
X-Gm-Message-State: AOAM531Ate9FwgxOvS+kmTLJWOIAkpYF3/rK0j359iXl5llgTqcQiX5W
 OczlWhp6bbaUtZKNXNWsHKGA1S3E4UcW6I3D1k9CGsbOXlJHPbCQjriBrUSlrQsfOafUgRGrZHx
 9IBgo73hrGUs6ZGujRotS1raMjVak
X-Received: by 2002:a7b:c0c9:0:b0:38e:7d65:6e7f with SMTP id
 s9-20020a7bc0c9000000b0038e7d656e7fmr9054399wmh.168.1649281251323; 
 Wed, 06 Apr 2022 14:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEvASRFqmeBI/gkKWoj3wck9xOJpn6025gTkIMDUq07B7B+SD3YIdjghFypSAm6QQAtr+Rbw==
X-Received: by 2002:a7b:c0c9:0:b0:38e:7d65:6e7f with SMTP id
 s9-20020a7bc0c9000000b0038e7d656e7fmr9054390wmh.168.1649281251134; 
 Wed, 06 Apr 2022 14:40:51 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm5876020wms.15.2022.04.06.14.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:40:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 1/5] firmware: sysfb: Make sysfb_create_simplefb()
 return a pdev pointer
Date: Wed,  6 Apr 2022 23:39:15 +0200
Message-Id: <20220406213919.600294-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406213919.600294-1-javierm@redhat.com>
References: <20220406213919.600294-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function just returned 0 on success or an errno code on error, but it
could be useful to sysfb_init() to get a pointer to the device registered.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/firmware/sysfb.c          |  4 ++--
 drivers/firmware/sysfb_simplefb.c | 24 +++++++++++++++---------
 include/linux/sysfb.h             | 10 +++++-----
 3 files changed, 22 insertions(+), 16 deletions(-)

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
index 76c4abc42a30..c42648ed3aad 100644
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
 
@@ -104,25 +104,31 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
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
 
 	ret = platform_device_add_resources(pd, &res, 1);
 	if (ret) {
 		platform_device_put(pd);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = platform_device_add_data(pd, mode, sizeof(*mode));
 	if (ret) {
 		platform_device_put(pd);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
-	return platform_device_add(pd);
+	ret = platform_device_add(pd);
+	if (ret) {
+		platform_device_put(pd);
+		return ERR_PTR(ret);
+	}
+
+	return pd;
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

