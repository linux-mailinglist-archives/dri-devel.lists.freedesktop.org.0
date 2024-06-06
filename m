Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819408FDBB1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 02:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161E010E5F8;
	Thu,  6 Jun 2024 00:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R3j1oXjk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1EA10E502
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 00:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717635277;
 bh=fFUvXAwwdWE8ka12wmELA/sfizV8ZmztfmF18ScI4Ys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R3j1oXjkA6PbKNZK9mh+85vJi4FRQGNSUR/qUkKU3IhEOB2ToemMa09zgFCuxW2Bf
 81GhtpMISg7occeiOmv9nGrGDGVXwqZc79skt48m6QDB4Y/JD2kaQAyGPvrQMYva5o
 keLcFxqaj5M/gdBBMhqrG5OJEfTQcsJX7B7m7l9KFxPmEY447PHYSbQGsvwvRfpuIg
 SC3lLCMn9LuxC5+JnNtPHpIvCP1TQtq3TcsiIbWrn2VX5cfN9J3Kj7DrqLTAp8DjNM
 FwAC1zJezR7NXJ6atUnunnTZjjS+2bo6SgacNCtueiAe7yyCFlcLsXWbbX77PxO3+k
 50kuvhwy+V1SA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A2EAF37821D2;
 Thu,  6 Jun 2024 00:54:36 +0000 (UTC)
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
Subject: [PATCH v3 4/7] drm/panthor: add sysfs knob for enabling job profiling
Date: Thu,  6 Jun 2024 01:49:56 +0100
Message-ID: <20240606005416.1172431-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
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

Just like it is already present in Panfrost, this commit introduces a DRM
device sysfs file that lets UM control the job accounting status in the
device.

The present commit only brings in the sysfs knob and also hides the cycles
and engine fdinfo tags when it's disabled, but leveraging it for job
accounting will be the matter of a later commit.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  1 +
 drivers/gpu/drm/panthor/panthor_drv.c    | 46 +++++++++++++++++++++---
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 8a0260a7b90a..c3ec1e31f8b7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -163,6 +163,7 @@ struct panthor_device {
 		struct page *dummy_latest_flush;
 	} pm;
 
+	bool profile_mode;
 	unsigned long current_frequency;
 	unsigned long fast_rate;
 };
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 6d25385e02a1..a2876310856f 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1360,12 +1360,14 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 				    struct panthor_file *pfile,
 				    struct drm_printer *p)
 {
+	if (ptdev->profile_mode) {
 #ifdef CONFIG_ARM_ARCH_TIMER
-	drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
-		   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
-				    arch_timer_get_cntfrq()));
+		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
+			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
+					    arch_timer_get_cntfrq()));
 #endif
-	drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
+		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
+	}
 	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
 	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
 }
@@ -1446,6 +1448,41 @@ static void panthor_remove(struct platform_device *pdev)
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
@@ -1465,6 +1502,7 @@ static struct platform_driver panthor_driver = {
 		.name = "panthor",
 		.pm = pm_ptr(&panthor_pm_ops),
 		.of_match_table = dt_match,
+		.dev_groups = panthor_groups,
 	},
 };
 
-- 
2.45.1

