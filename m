Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D352316E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C1D10ED6F;
	Wed, 11 May 2022 11:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61210ED10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9SntuE95Z9lS2Zx81mCZFUkNBpVjW+b+N3eCCbF1gA=;
 b=cOerQzTg12j9YdeIbf+D0yMubZ8logwiRbsu5XjYVADT9ix4Z4JJboJ4j52D+mofEEVibs
 FWOFDzeO0pQKlE/eCMhXR0yE6Sk99Qr/+doOgw8ozN21u8qsXRlFv/pscBA3uo4Na+R7kN
 2wYtGuztQ9I8QVIFTy1fa4lG8yudEiY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-hICTSZVKNfKdEFDwp-zviw-1; Wed, 11 May 2022 07:24:57 -0400
X-MC-Unique: hICTSZVKNfKdEFDwp-zviw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w20-20020adfd1b4000000b0020cbb4347e6so720712wrc.17
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9SntuE95Z9lS2Zx81mCZFUkNBpVjW+b+N3eCCbF1gA=;
 b=4h/VrIB7WKg7+3jHMub90rRixpMCyn9RThmZtlEvLwRc5HX3OUinADRcbgk1CnK865
 73oa1PHFRCp6RJoxE3URTf5lnXWwsuOWuDMZ8KSYZmaSBpBGGTZkYAfqSFRFTIhbMUQg
 fC4lPDAlh8ZDhtPvQa8RrjRryJsPvlqEgK7FMipGgTdDhFxcT9JLZ++4gsY09TgcKGtb
 fP2qYoH4enu+RlljLjDynErz3UGVu+aTv3Dy1usBXJki3tWSoHXjIowhL2AhuDOFhpwv
 Y7kjIPxZfhwgDFauGdtapoNdT+b9sUsIu7s/V1r7HapAZQ7gEFAc2syteNrZP3RLrbE8
 myvg==
X-Gm-Message-State: AOAM532ZDSqcTTB0xzHzltpDkvieDNR7QC/FUdLgklDqmX+qHH1CFcgi
 +69MKu+Pyyfa1VehObSyJRHz/VpMt+6eQSeB+YhnR8z3ie3o12lDNiWSOsdCSSXhj4U9/58+Bpd
 1eX8spmB6zLC5srRzzT1TH8QQLg7w
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr4381296wmj.110.1652268295472; 
 Wed, 11 May 2022 04:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLj2CSI9aVxKNa4g6AjcxfP1g4hpdYDGGtiwl+UPUrJBEfHDnhXd+VQuLlXkDmk+7WrCcTxA==
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr4381276wmj.110.1652268295247; 
 Wed, 11 May 2022 04:24:55 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b0020c5253d8d3sm1429174wrq.31.2022.05.11.04.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:24:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] firmware: sysfb: Make sysfb_create_simplefb() return a
 pdev pointer
Date: Wed, 11 May 2022 13:24:32 +0200
Message-Id: <20220511112438.1251024-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function just returned 0 on success or an errno code on error, but it
could be useful for sysfb_init() callers to have a pointer to the device.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

(no changes since v3)

Changes in v3:
- Add Thomas Zimmermann's Reviewed-by tag to patch #1.

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

