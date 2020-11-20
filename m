Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0532BA901
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377D6E8B1;
	Fri, 20 Nov 2020 11:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2D36E8AF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ktWlQBEsXO9esUx4GSbdq4ppWsLxzJ47LUK5Tv8IBfw=; b=1GUhBNMrkNTNmjKWSLwAibowjo
 njcYiWUP7fahFTGpHKg2YVCVSdA1vLP/YiZ4lbRQu0fjlcHG1glt0yZMT3pXdUnc2PLqmxMN5jD7k
 Xu63Tu4RM1pvdNe666aawPAIvauxfcQan9pLD6BLTmo0aiE5RaNOZ4Hmayi77k/YPIEqsrx+WSzIN
 pdij1ezCC++q23ol8u6AbH87lGRNqxl388PcWtOWGaOV719ljE7H4oJkopw2Zxgu9XPIvBgrNjwnQ
 XC9K/VQyy1bIngYFbRbTILm+kmhNult73g5GVxvBtcKdJJ2zcMXbc/lY9K9M1AL/g+/T2812gV3a2
 b23BcQeQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kg4Yq-0003lG-CG; Fri, 20 Nov 2020 13:26:40 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v4 01/21] gpu: host1x: Use different lock classes for each
 client
Date: Fri, 20 Nov 2020 13:25:40 +0200
Message-Id: <20201120112600.935082-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid false lockdep warnings, give each client lock a different
lock class, passed from the initialization site by macro.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 7 ++++---
 include/linux/host1x.h   | 9 ++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index e201f62d62c0..4101f64bd545 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -714,13 +714,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
  * device and call host1x_device_init(), which will in turn call each client's
  * &host1x_client_ops.init implementation.
  */
-int host1x_client_register(struct host1x_client *client)
+int __host1x_client_register(struct host1x_client *client,
+			   struct lock_class_key *key)
 {
 	struct host1x *host1x;
 	int err;
 
 	INIT_LIST_HEAD(&client->list);
-	mutex_init(&client->lock);
+	__mutex_init(&client->lock, "host1x client lock", key);
 	client->usecount = 0;
 
 	mutex_lock(&devices_lock);
@@ -741,7 +742,7 @@ int host1x_client_register(struct host1x_client *client)
 
 	return 0;
 }
-EXPORT_SYMBOL(host1x_client_register);
+EXPORT_SYMBOL(__host1x_client_register);
 
 /**
  * host1x_client_unregister() - unregister a host1x client
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 20c885d0bddc..f711fc0154f4 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -320,7 +320,14 @@ static inline struct host1x_device *to_host1x_device(struct device *dev)
 int host1x_device_init(struct host1x_device *device);
 int host1x_device_exit(struct host1x_device *device);
 
-int host1x_client_register(struct host1x_client *client);
+int __host1x_client_register(struct host1x_client *client,
+			     struct lock_class_key *key);
+#define host1x_client_register(class) \
+	({ \
+		static struct lock_class_key __key; \
+		__host1x_client_register(class, &__key); \
+	})
+
 int host1x_client_unregister(struct host1x_client *client);
 
 int host1x_client_suspend(struct host1x_client *client);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
