Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE394F6D1E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E2410E0FC;
	Wed,  6 Apr 2022 21:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEFB10E090
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649281254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gm2w5zhEo/y/hC/MnEig9xvUokSksiUvuJdIdj5pPYA=;
 b=KREAgkI1AWDAKWpOLJP8n8BMYBIV34DQlqmOazG2mc6FwveR/OqEFLqwEfwmo7WD93Szra
 Ha6mpkhEZBP73OahX8HKao6fqW2R8BZfrTy10Pkk9OCoQ/avWVtcTiEoDdwh8jFHMQ/y7o
 4H+QnwLDCr6Aa05+kPI3AnMMYzAGHSg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-bnMrJ0LBMvqllsd8Lz1bkw-1; Wed, 06 Apr 2022 17:40:53 -0400
X-MC-Unique: bnMrJ0LBMvqllsd8Lz1bkw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i6-20020a05600c354600b0038be262d9d9so3531630wmq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gm2w5zhEo/y/hC/MnEig9xvUokSksiUvuJdIdj5pPYA=;
 b=bmWLN59Y7AKxjNbjrEhsJmX63O0Vl1h4mzAWwjjxQ5ukkhnOGoprwq9XH2eU0W+ewC
 80HSL0SUETpXHSZuEhyg0e/GGEbnLMDD70NCnZfLGBdPMc6chCu9MsIMPdNxiY6NzzHp
 LAth6rBVC040aARnCOeWphqSr7dsN+aVrohnqvPrA4Jg7iPNLhukhyRy7o8CECOu8yP5
 aOlw8QGxwsddEGSzioXpSTNRBAcKloSuh3JApZVpCuWVgRhvDsB3Twy9g7530y02IbZh
 Dm3HIjmoiCz/j+287n1NH7yh8+Mn/stUwZ2rtpsSQNXsywW4xk7cZ0Sbi89vtxZSSdrG
 Jo2w==
X-Gm-Message-State: AOAM530huwa2bRgDzTpJkaHXNsnndSxqVhmfYZKhfL+yStVqNp9pJC6l
 jGxU24zOdQqp/+FZfH1QwiE2q68O/iqdwjnAcUVojVch53rx/QAyRWBuwXR/GOieACluNcp4U/b
 ysrv8vzQE3SOHuEBH+B2ch3q1mQWb
X-Received: by 2002:a05:600c:510e:b0:38e:346f:8a46 with SMTP id
 o14-20020a05600c510e00b0038e346f8a46mr9048509wms.153.1649281252411; 
 Wed, 06 Apr 2022 14:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMTekWlIniEn/wRy/hq26mmEdsyLZioccx8O1RToh7NRrIiCsilpEYTP7Kfu1VPjt/UNTH2A==
X-Received: by 2002:a05:600c:510e:b0:38e:346f:8a46 with SMTP id
 o14-20020a05600c510e00b0038e346f8a46mr9048490wms.153.1649281252164; 
 Wed, 06 Apr 2022 14:40:52 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm5876020wms.15.2022.04.06.14.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:40:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 2/5] firmware: sysfb: Add helpers to unregister a
 pdev and disable registration
Date: Wed,  6 Apr 2022 23:39:16 +0200
Message-Id: <20220406213919.600294-3-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These can be used by subsystems to unregister a platform device registered
by sysfb and also to disable future platform device registration in sysfb.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/firmware/sysfb.c | 47 +++++++++++++++++++++++++++++++++++-----
 include/linux/sysfb.h    | 19 ++++++++++++++++
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index b032f40a92de..08ae78c083f1 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -34,21 +34,52 @@
 #include <linux/screen_info.h>
 #include <linux/sysfb.h>
 
+static struct platform_device *pd;
+static DEFINE_MUTEX(load_lock);
+static bool disabled;
+
+void sysfb_disable(void)
+{
+	mutex_lock(&load_lock);
+	disabled = true;
+	mutex_unlock(&load_lock);
+}
+EXPORT_SYMBOL_GPL(sysfb_disable);
+
+bool sysfb_try_unregister(struct device *dev)
+{
+	bool ret = true;
+
+	mutex_lock(&load_lock);
+	if (!pd || pd != to_platform_device(dev))
+		return false;
+
+	platform_device_unregister(to_platform_device(dev));
+	pd = NULL;
+	mutex_unlock(&load_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sysfb_try_unregister);
+
 static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
 	struct simplefb_platform_data mode;
-	struct platform_device *pd;
 	const char *name;
 	bool compatible;
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&load_lock);
+	if (disabled)
+		goto unlock_mutex;
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
 		pd = sysfb_create_simplefb(si, &mode);
 		if (!IS_ERR(pd))
-			return 0;
+			goto unlock_mutex;
 	}
 
 	/* if the FB is incompatible, create a legacy framebuffer device */
@@ -60,8 +91,10 @@ static __init int sysfb_init(void)
 		name = "platform-framebuffer";
 
 	pd = platform_device_alloc(name, 0);
-	if (!pd)
-		return -ENOMEM;
+	if (!pd) {
+		ret = -ENOMEM;
+		goto unlock_mutex;
+	}
 
 	sysfb_apply_efi_quirks(pd);
 
@@ -73,9 +106,11 @@ static __init int sysfb_init(void)
 	if (ret)
 		goto err;
 
-	return 0;
+	goto unlock_mutex;
 err:
 	platform_device_put(pd);
+unlock_mutex:
+	mutex_unlock(&load_lock);
 	return ret;
 }
 
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 708152e9037b..e8c0313fac8f 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -55,6 +55,25 @@ struct efifb_dmi_info {
 	int flags;
 };
 
+#ifdef CONFIG_SYSFB
+
+void sysfb_disable(void);
+bool sysfb_try_unregister(struct device *dev);
+
+#else /* CONFIG_SYSFB */
+
+static inline void sysfb_disable(void)
+{
+
+}
+
+static inline bool sysfb_try_unregister(struct device *dev)
+{
+	return false;
+}
+
+#endif /* CONFIG_SYSFB */
+
 #ifdef CONFIG_EFI
 
 extern struct efifb_dmi_info efifb_dmi_list[];
-- 
2.35.1

