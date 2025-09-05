Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC8B4548B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D7910EB73;
	Fri,  5 Sep 2025 10:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="RjC3CKaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACCE10EB73
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757067858; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RsEmwD+23vus47pMNdpM7ANm0OHaXMbNM/+tJtTJ7JAELUmo8I/fWsfTVOgCxs2/fJNo9migABsh8TIp6QrAazc5M8ZLVTIJm5QpGcaoP8o1kkxZUL+DjWKaOjpEaOagd+WvO5w0sRVG7RG7LLWpIWNF6I7yVNqYBwjgNXNFjF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757067858;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FtFHp6BLwfa/TieGzbv7DaPGlt+ZTOt4EO8QRQvtQg4=; 
 b=Sdqe3oAhz9tskXval+xaZwJUgDboOpDhDvqMwEV6x5LDUL0t8RDPQImClF4RYbAj/WkOazojVJYXJim5vzkbykdqngU80e8FkwyML6VLWHYAYUmQeECi93Q37qLlv2evtgKosJe/+AFsE32g3R4VA3F5wHv8rbV8Kbcbn3iPGK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067858; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=FtFHp6BLwfa/TieGzbv7DaPGlt+ZTOt4EO8QRQvtQg4=;
 b=RjC3CKaPmmlM2kdgZNuyQvKTAoJJVnhI79DLjUgu7oE87vlA054WVtZ7QqRdcJwa
 uWHMhE299+xNMfMkjEzaOygEQf0mjga9jWaGsHudEIDP3C/pdSi/ajgl5xQ+71Xdugl
 /hgaOoCrswsduuP6Vje07GYg4zbxQfls8R0XcViQ=
Received: by mx.zohomail.com with SMTPS id 1757067856839498.1092107368131;
 Fri, 5 Sep 2025 03:24:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:23:03 +0200
Subject: [PATCH RFC 07/10] drm/panthor: move panthor_devfreq struct to header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-7-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

In order to make files other than panthor_devfreq.c be able to touch the
members of a panthor_devfreq instance, it needs to live somewhere other
than the .c file.

Move it into the panthor_devfreq.h header, so that the upcoming MediaTek
MFG devfreq can use it as well.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ---------------------------
 drivers/gpu/drm/panthor/panthor_devfreq.h | 36 ++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 8903f60c0a3f06313ac2008791c210ff32b6bd52..02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -12,38 +12,6 @@
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
 
-/**
- * struct panthor_devfreq - Device frequency management
- */
-struct panthor_devfreq {
-	/** @devfreq: devfreq device. */
-	struct devfreq *devfreq;
-
-	/** @gov_data: Governor data. */
-	struct devfreq_simple_ondemand_data gov_data;
-
-	/** @busy_time: Busy time. */
-	ktime_t busy_time;
-
-	/** @idle_time: Idle time. */
-	ktime_t idle_time;
-
-	/** @time_last_update: Last update time. */
-	ktime_t time_last_update;
-
-	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
-	bool last_busy_state;
-
-	/**
-	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
-	 * last_busy_state.
-	 *
-	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
-	 * and panthor_devfreq_record_{busy,idle}().
-	 */
-	spinlock_t lock;
-};
-
 static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 {
 	ktime_t now, last;
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index f8e29e02f66cb3281ed4bb4c75cda9bd4df82b92..e8b5ccddd45c52ee3215e9c84c6ebd9109640282 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -4,11 +4,45 @@
 #ifndef __PANTHOR_DEVFREQ_H__
 #define __PANTHOR_DEVFREQ_H__
 
+#include <linux/devfreq.h>
+
 struct devfreq;
 struct thermal_cooling_device;
 
 struct panthor_device;
-struct panthor_devfreq;
+
+/**
+ * struct panthor_devfreq - Device frequency management
+ */
+struct panthor_devfreq {
+	/** @devfreq: devfreq device. */
+	struct devfreq *devfreq;
+
+	/** @gov_data: Governor data. */
+	struct devfreq_simple_ondemand_data gov_data;
+
+	/** @busy_time: Busy time. */
+	ktime_t busy_time;
+
+	/** @idle_time: Idle time. */
+	ktime_t idle_time;
+
+	/** @time_last_update: Last update time. */
+	ktime_t time_last_update;
+
+	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
+	bool last_busy_state;
+
+	/**
+	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
+	 * last_busy_state.
+	 *
+	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
+	 * and panthor_devfreq_record_{busy,idle}().
+	 */
+	spinlock_t lock;
+};
+
 
 int panthor_devfreq_init(struct panthor_device *ptdev);
 

-- 
2.51.0

