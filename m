Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2349A3D3C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 09:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A9B10E8E8;
	Thu, 20 Feb 2025 08:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="HVTauNK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9A5810E185
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tR6HK
 7BPrCbBvCzg+WZMBSOfkdZaQhKpZsbhz6ow2Vs=; b=HVTauNK1y44q7bM8/Pohf
 BKz69UW8HYcPFVzf1WXvs9y0Ir2xzkbXbRwwJCu/jYMrMyGrdtY3jv7SgbiZ82GQ
 zp1TlyRu3Kpn5KosQWjAM4DC3xnhj8QsHbxjgjBzp88mzA74myaRtm6DlEKf+ghu
 TfzzptIPP5VFAiAguPouxo=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wDnLwmn7bZnUN9jNQ--.46079S2; 
 Thu, 20 Feb 2025 16:54:01 +0800 (CST)
From: oushixiong1025@163.com
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/arm/komeda: Add a condition check before removing sysfs
 attribute
Date: Thu, 20 Feb 2025 16:53:58 +0800
Message-Id: <20250220085358.232883-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnLwmn7bZnUN9jNQ--.46079S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUWr1xGF4xAr1kKw17Jrb_yoW8ZF1Upa
 nrJ3WjqryUKanIyr9rAa1UuF1rGw4fWw4xGryUuw13u343AF18KF95XFWqyrZrJFWfCF1a
 qrs7XrW7WFs3Kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jncTPUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRD5D2e25TahOwAAsj
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

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY] If the call to sysfs_create_group() fails, there is
      no need to call function sysfs_remove_group().

[HOW] Add a condition check before removing sysfs attribute.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 7 ++++++-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 5ba62e637a61..7d646f978640 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -259,6 +259,8 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 		goto err_cleanup;
 	}
 
+	mdev->sysfs_attr_enabled = true;
+
 	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
 
 	komeda_debugfs_init(mdev);
@@ -278,7 +280,10 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 	const struct komeda_dev_funcs *funcs = mdev->funcs;
 	int i;
 
-	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
+	if (mdev->sysfs_attr_enabled) {
+		sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
+		mdev->sysfs_attr_enabled = false;
+	}
 
 	debugfs_remove_recursive(mdev->debugfs_root);
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
index 5b536f0cb548..af087540325c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
@@ -216,6 +216,8 @@ struct komeda_dev {
 #define KOMEDA_DEV_PRINT_DUMP_STATE_ON_EVENT BIT(8)
 	/* Disable rate limiting of event prints (normally one per commit) */
 #define KOMEDA_DEV_PRINT_DISABLE_RATELIMIT BIT(12)
+
+	bool sysfs_attr_enabled;
 };
 
 static inline bool
-- 
2.17.1

