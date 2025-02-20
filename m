Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69562A3E8AE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 00:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8064D10E9F3;
	Thu, 20 Feb 2025 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="lPMEb5bI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BA310E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ei/G/C+Q2EB4HolW6F+KXHikaTWJisX5oA6+ZThEK8=; b=lPMEb5bIU9ybnKqWwCujlG8mZ+
 +nrXybstNXgJrS/gk9FKpnPBrt4LdexLrxAh6ngSYgDYdscNrm6grTGIh8daT0i+/744cO/kTGtXm
 TrFzZq+Gn+1Yht+okl3AuxMo3ck21UwFeXLBjS+Hsfj+CbOld+kzMEqUp1/y5hU4oWbPpD01ChFC/
 h1QLCsBnTcXxKx8caaERXETyL5XSBgpMQVJjRrckjGVzDawDcdr45XOa2ly1HqleO1TcY9xMxkSGS
 EaZpdkB94mynONN90I4JJF+taU3sCB+jOfuxVRkoSeX+BjPUbDP3K2xmv1vjFFV5Q3bJ8TtvfgX0Q
 Wq1eJi0A==;
Received: from i53875bc0.versanet.de ([83.135.91.192]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tlGAy-0004Wc-Dt; Fri, 21 Feb 2025 00:41:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org,
	heiko@sntech.de
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: [PATCH 1/2] drivers: base: component: add function to query the bound
 status
Date: Fri, 21 Feb 2025 00:41:40 +0100
Message-ID: <20250220234141.2788785-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250220234141.2788785-1-heiko@sntech.de>
References: <20250220234141.2788785-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The component helpers already expose the bound status in debugfs, but at
times it might be necessary to also check that state in the kernel and
act differently depending on the result.

For example the shutdown handler of a drm-driver might need to stop
a whole output pipeline if the drm device is up and running, but may
run into problems if that drm-device has never been set up before,
for example because the binding deferred.

So add a little helper that returns the bound status for a componet
device.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/base/component.c  | 14 ++++++++++++++
 include/linux/component.h |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 741497324d78..d63e01f4851d 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -569,6 +569,20 @@ void component_master_del(struct device *parent,
 }
 EXPORT_SYMBOL_GPL(component_master_del);
 
+bool component_master_is_bound(struct device *parent,
+	const struct component_master_ops *ops)
+{
+	struct aggregate_device *adev;
+
+	guard(mutex)(&component_mutex);
+	adev = __aggregate_find(parent, ops);
+	if (!adev)
+		return 0;
+
+	return adev->bound;
+}
+EXPORT_SYMBOL_GPL(component_master_is_bound);
+
 static void component_unbind(struct component *component,
 	struct aggregate_device *adev, void *data)
 {
diff --git a/include/linux/component.h b/include/linux/component.h
index df4aa75c9e7c..9d6c66401280 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -3,7 +3,7 @@
 #define COMPONENT_H
 
 #include <linux/stddef.h>
-
+#include <linux/types.h>
 
 struct device;
 
@@ -90,6 +90,8 @@ int component_compare_dev_name(struct device *dev, void *data);
 
 void component_master_del(struct device *,
 	const struct component_master_ops *);
+bool component_master_is_bound(struct device *parent,
+	const struct component_master_ops *ops);
 
 struct component_match;
 
-- 
2.47.2

