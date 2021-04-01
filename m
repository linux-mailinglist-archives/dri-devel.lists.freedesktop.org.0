Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0392351644
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 17:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82DC6ECA5;
	Thu,  1 Apr 2021 15:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEFC6ECA5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 15:40:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r12so3543102ejr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGjuP998sGbpCkvnhSfwleQK/z96z2z32YTuaQtQcg8=;
 b=DM2EYw7uG0/0c897DXzDswcwOIRUm4RG+G3GJdufCxom7JCnxI5hOsTQwevTvsOx8Z
 4TwVeY6Zpr6Ud5tgjB4cBDvWv2nWEnysTfjHseXfay+d4NggOB7cUE4nNUhPPYxrraeh
 4v8NNc7/UR0z0tWZ0jfpjHBlBDPCfRtSkhLYx5QHbRWgIXEvccC7q3aCOZLXvZUyD5cN
 OMujeCeF6BA+HKDRpb71AktE3vgVzlWsJejZQbYlvNxrm8tRyAE/ccPx2mBD7G8whTqF
 Ef28YENX7a8AElFFfwROPntmtahmVJjLNsW+uepFNaliOZRQIeE198l6itz8+2IlR+z/
 2HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGjuP998sGbpCkvnhSfwleQK/z96z2z32YTuaQtQcg8=;
 b=HCjWWwYLnKtgYmKI5sA4S1ypUxRYl2TP7m6k8LQpGx2YpT7y05USzY0UryutdmObUV
 Q3AOP9TK0kNdmj1s8m7b2CoJIvZJ4PElk80N3GjFQ414Kix+ZbifpbCieby7qVmGU8Jb
 4Iwx+qOtt5exJbnXJ+lI9vcsV0jFtZGeOtdW0GNrvEZ5ola37KgGn+iHKnGy6UGkOUW/
 lrXoPUgGSLxqRic4nQ1NS9GSi0EclzZwczOZKBGMFxYiG/XWpHwMEw9JjFPtAyRV3X6v
 11sDRLUa+ikiypRvNOGb5nG4TnnoJUiOejnOIFKHprPPtNlqUl7eLCXoGAaUP1Z3gdq6
 pZuw==
X-Gm-Message-State: AOAM532lkbH6FjIXgn0sEDtkAfZqyRsSgePMZ0bP0ga20VyDU7hKzzKj
 4dze80rzd2uoRvwb9XV8bB8=
X-Google-Smtp-Source: ABdhPJzvPFLhV2u50rzysciS5TbF+EdLD0d8Cq8ltE0MVSk4bFZe8xOrJbu4MMJNmh3VuaX1KQcLNQ==
X-Received: by 2002:a17:907:c08:: with SMTP id
 ga8mr9630888ejc.376.1617291641331; 
 Thu, 01 Apr 2021 08:40:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k12sm3804814edr.60.2021.04.01.08.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:40:40 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] gpu: host1x: Split up client initalization and
 registration
Date: Thu,  1 Apr 2021 17:41:04 +0200
Message-Id: <20210401154105.3345412-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In some cases we may need to initialize the host1x client first before
registering it. This commit adds a new helper that will do nothing but
the initialization of the data structure.

At the same time, the initialization is removed from the registration
function. Note, however, that for simplicity we explicitly initialize
the client when the host1x_client_register() function is called, as
opposed to the low-level __host1x_client_register() function. This
allows existing callers to remain unchanged.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 30 ++++++++++++++++++++++++------
 include/linux/host1x.h   | 30 ++++++++++++++++++++++++------
 2 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 46f69c532b6b..218e3718fd68 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -735,6 +735,29 @@ void host1x_driver_unregister(struct host1x_driver *driver)
 }
 EXPORT_SYMBOL(host1x_driver_unregister);
 
+/**
+ * __host1x_client_init() - initialize a host1x client
+ * @client: host1x client
+ * @key: lock class key for the client-specific mutex
+ */
+void __host1x_client_init(struct host1x_client *client, struct lock_class_key *key)
+{
+	INIT_LIST_HEAD(&client->list);
+	__mutex_init(&client->lock, "host1x client lock", key);
+	client->usecount = 0;
+}
+EXPORT_SYMBOL(__host1x_client_init);
+
+/**
+ * host1x_client_exit() - uninitialize a host1x client
+ * @client: host1x client
+ */
+void host1x_client_exit(struct host1x_client *client)
+{
+	mutex_destroy(&client->lock);
+}
+EXPORT_SYMBOL(host1x_client_exit);
+
 /**
  * __host1x_client_register() - register a host1x client
  * @client: host1x client
@@ -747,16 +770,11 @@ EXPORT_SYMBOL(host1x_driver_unregister);
  * device and call host1x_device_init(), which will in turn call each client's
  * &host1x_client_ops.init implementation.
  */
-int __host1x_client_register(struct host1x_client *client,
-			     struct lock_class_key *key)
+int __host1x_client_register(struct host1x_client *client)
 {
 	struct host1x *host1x;
 	int err;
 
-	INIT_LIST_HEAD(&client->list);
-	__mutex_init(&client->lock, "host1x client lock", key);
-	client->usecount = 0;
-
 	mutex_lock(&devices_lock);
 
 	list_for_each_entry(host1x, &devices, list) {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index ef13bc69b493..7310ce9c70e0 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -349,12 +349,30 @@ static inline struct host1x_device *to_host1x_device(struct device *dev)
 int host1x_device_init(struct host1x_device *device);
 int host1x_device_exit(struct host1x_device *device);
 
-int __host1x_client_register(struct host1x_client *client,
-			     struct lock_class_key *key);
-#define host1x_client_register(class) \
-	({ \
-		static struct lock_class_key __key; \
-		__host1x_client_register(class, &__key); \
+void __host1x_client_init(struct host1x_client *client, struct lock_class_key *key);
+void host1x_client_exit(struct host1x_client *client);
+
+#define host1x_client_init(client)			\
+	({						\
+		static struct lock_class_key __key;	\
+		__host1x_client_init(client, &__key);	\
+	})
+
+int __host1x_client_register(struct host1x_client *client);
+
+/*
+ * Note that this wrapper calls __host1x_client_init() for compatibility
+ * with existing callers. Callers that want to separately initialize and
+ * register a host1x client must first initialize using either of the
+ * __host1x_client_init() or host1x_client_init() functions and then use
+ * the low-level __host1x_client_register() function to avoid the client
+ * getting reinitialized.
+ */
+#define host1x_client_register(client)			\
+	({						\
+		static struct lock_class_key __key;	\
+		__host1x_client_init(client, &__key);	\
+		__host1x_client_register(client);	\
 	})
 
 int host1x_client_unregister(struct host1x_client *client);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
