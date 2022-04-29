Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08E51447B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D2F89951;
	Fri, 29 Apr 2022 08:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CEA10FC8F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNYlvzVzM/yRIsQFJFDDE/gEOtrzgO/JKjkWbkd7amE=;
 b=EBON5Oa0GifoMJbawc1kXex9mTuKqHtZ/VMLKoWQw1PIeDvMzt/QHPonSAgfXuTxdo+WQk
 8oteTBelkpvidrIv629P/Na/hJVC1fQoTOHqyfMe1q8yA79rMoNEXbwqC6ZqmQo9GmO2aR
 RXZAHTo7yCK/Ih6JL2g0m5jy+pD5kHE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-svzrD3YcO0mZduj3O3Ep7Q-1; Fri, 29 Apr 2022 04:43:15 -0400
X-MC-Unique: svzrD3YcO0mZduj3O3Ep7Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so2816434wrg.22
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNYlvzVzM/yRIsQFJFDDE/gEOtrzgO/JKjkWbkd7amE=;
 b=hWJ4QsiuW6z9J1B8q7NfpyewqTkixJmYQ2hsIUGJcli/V4JPX5JvS2QqyA+g0Ph2qE
 3HveYA6o24pAf+SOQogtjwIXN2kXdt+QFqG2OD9PbG9F1a11t9eTRpAGQdNFZqlHuYGX
 njZqhnmam6y/luiG/ppVxkIJcj8ze/o2V0Qw0gADWzsjMHVs56wyzqWI9cu6ApEc7OVk
 ZKlTn0SXV5vqV9U36qzYan9XPtViiCKvXUieet/2aWDQcQeTVIGmgSxdGKS5FtoMq/Ib
 mh4z8cpog7ZR4KEL/3IiTU7NZOUtnPJMZcDDarWFhlzq6/Qc9MKWO8V/JL9tXJOqgTXV
 pxtw==
X-Gm-Message-State: AOAM531TV1GMOexA7EWxc64KQcJLXr4QGAvA2MO1PGQlqHxI0Ub9m/ZB
 SnnuAhKrZpqtMJsyBUldLacc8gfhYjx51dLktU1sRpVbovAbpJpO8FoNPl5VipKQQb3bSXA3VsB
 Onh/5JLNSQ2cZ95UtCNfST63nKZ3d
X-Received: by 2002:a1c:2185:0:b0:38f:f4ed:f964 with SMTP id
 h127-20020a1c2185000000b0038ff4edf964mr2140361wmh.115.1651221793212; 
 Fri, 29 Apr 2022 01:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzULH/Z8iTBu9imB6E2jhhktq6ujl1Rp03jG3ZGkP0d9/n1g3yBNXFS/dMPBVvjlH2AOcTVlQ==
X-Received: by 2002:a1c:2185:0:b0:38f:f4ed:f964 with SMTP id
 h127-20020a1c2185000000b0038ff4edf964mr2140338wmh.115.1651221792987; 
 Fri, 29 Apr 2022 01:43:12 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 05/11] firmware: sysfb: Add helpers to unregister a
 pdev and disable registration
Date: Fri, 29 Apr 2022 10:42:47 +0200
Message-Id: <20220429084253.1085911-6-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These can be used by subsystems to unregister a platform device registered
by sysfb and also to disable future platform device registration in sysfb.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v2)

Changes in v2:
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 87 +++++++++++++++++--
 include/linux/sysfb.h                         | 19 ++++
 3 files changed, 106 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index b81794e0cfbb..06ac89adaafb 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -13,6 +13,12 @@ EDD Interfaces
 .. kernel-doc:: drivers/firmware/edd.c
    :internal:
 
+Generic System Framebuffers Interface
+-------------------------------------
+
+.. kernel-doc:: drivers/firmware/sysfb.c
+   :export:
+
 Intel Stratix10 SoC Service Layer
 ---------------------------------
 Some features of the Intel Stratix10 SoC require a level of privilege
diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index b032f40a92de..6768968949e6 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -34,21 +34,92 @@
 #include <linux/screen_info.h>
 #include <linux/sysfb.h>
 
+static struct platform_device *pd;
+static DEFINE_MUTEX(disable_lock);
+static bool disabled;
+
+static bool sysfb_unregister(void)
+{
+	if (IS_ERR_OR_NULL(pd))
+		return false;
+
+	platform_device_unregister(pd);
+	pd = NULL;
+
+	return true;
+}
+
+/**
+ * sysfb_disable() - disable the Generic System Framebuffers support
+ *
+ * This disables the registration of system framebuffer devices that match the
+ * generic drivers that make use of the system framebuffer set up by firmware.
+ *
+ * It also unregisters a device if this was already registered by sysfb_init().
+ *
+ * Context: The function can sleep. A @disable_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a system framebuffer device and
+ *          sysfb_try_unregister(), that tries to unregister a framebuffer device.
+ */
+void sysfb_disable(void)
+{
+	mutex_lock(&disable_lock);
+	sysfb_unregister();
+	disabled = true;
+	mutex_unlock(&disable_lock);
+}
+EXPORT_SYMBOL_GPL(sysfb_disable);
+
+/**
+ * sysfb_try_unregister() - attempt to unregister a system framebuffer device
+ * @dev: device to unregister
+ *
+ * This tries to unregister a system framebuffer device if this was registered
+ * by the Generic System Framebuffers. The device will only be unregistered if
+ * it was registered by sysfb_init(), otherwise it will not be unregistered.
+ *
+ * Context: The function can sleep. a @load_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a simple framebuffer device and
+ *          sysfb_disable(), that disables the Generic System Framebuffers support.
+ *
+ * Return:
+ * * true          - the device was unregistered successfully
+ * * false         - the device was not unregistered
+ */
+bool sysfb_try_unregister(struct device *dev)
+{
+	bool ret = false;
+
+	mutex_lock(&disable_lock);
+	if (IS_ERR_OR_NULL(pd) || pd != to_platform_device(dev))
+		goto unlock_mutex;
+
+	ret = sysfb_unregister();
+
+unlock_mutex:
+	mutex_unlock(&disable_lock);
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
+	mutex_lock(&disable_lock);
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
@@ -60,8 +131,10 @@ static __init int sysfb_init(void)
 		name = "platform-framebuffer";
 
 	pd = platform_device_alloc(name, 0);
-	if (!pd)
-		return -ENOMEM;
+	if (!pd) {
+		ret = -ENOMEM;
+		goto unlock_mutex;
+	}
 
 	sysfb_apply_efi_quirks(pd);
 
@@ -73,9 +146,11 @@ static __init int sysfb_init(void)
 	if (ret)
 		goto err;
 
-	return 0;
+	goto unlock_mutex;
 err:
 	platform_device_put(pd);
+unlock_mutex:
+	mutex_unlock(&disable_lock);
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

