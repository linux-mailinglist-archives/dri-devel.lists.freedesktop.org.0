Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0489332BE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 22:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C117110E8AA;
	Tue, 16 Jul 2024 20:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2jXTb4+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF8710E8A5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721160796;
 bh=s1e1liijcI0BA0WHUrIX5x42YrT4y2A9s4r6eSHLK1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2jXTb4+iBXZlu4uvByJmc6fdvrMPqWHbIk3JA0Kj2Pdt9JDdwHo0/kOJGxtyMjmqe
 8cm8eJbTKTpDAoQD2Bf/WxckVmkqCEws8SdR8uYT9FJ8SmWMgCA8yKlXzh0tbS4ytA
 sZzY1qq9Whae8mAyA+Vo1lfwrilfxDGdBdVcJqZdo1H0Remu0+S0LAQO+p7IUHydeU
 xloDYFJrSFTIpBBcUyVSWx3qm6lzwb4SFL4M2r5M5khnuI4hOB35GHWXRckpEUX8M3
 XrgZ36u+uVZ3oXgoDgzIQy5AGaoP7A3MY8QP6UwJTkGT0CQ0g9KEdGrKveW8c+OXXt
 9RwF13EOhWBTg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 02FD437821E0;
 Tue, 16 Jul 2024 20:13:15 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] drm/panthor: add sysfs knob for enabling job profiling
Date: Tue, 16 Jul 2024 21:11:43 +0100
Message-ID: <20240716201302.2939894-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
References: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This commit introduces a DRM device sysfs attribute that lets UM control
the job accounting status in the device. The knob variable had been brought
in as part of a previous commit, but now we're able to fix it manually.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 6a0c1a06a709..a2876310856f 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1448,6 +1448,41 @@ static void panthor_remove(struct platform_device *pdev)
 	panthor_device_unplug(ptdev);
 }
 
+static ssize_t profiling_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", ptdev->profile_mode);
+}
+
+static ssize_t profiling_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	bool value;
+	int err;
+
+	err = kstrtobool(buf, &value);
+	if (err)
+		return err;
+
+	ptdev->profile_mode = value;
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(profiling);
+
+static struct attribute *panthor_attrs[] = {
+	&dev_attr_profiling.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(panthor);
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
@@ -1467,6 +1502,7 @@ static struct platform_driver panthor_driver = {
 		.name = "panthor",
 		.pm = pm_ptr(&panthor_pm_ops),
 		.of_match_table = dt_match,
+		.dev_groups = panthor_groups,
 	},
 };
 
-- 
2.45.1

