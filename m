Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182EB95B10
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6863010E5F1;
	Tue, 23 Sep 2025 11:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bzn6YvXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7FE10E5F1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758627660; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=i4ET9+AyWeMONB8o+tjdRzjDw8n26z6moOAhGe6B+zXccEzNLh09z+ufuCdpEDWqrNCc8ijPmhLAiwK8R4st8JwDzuNU0So3lHztAalsPei02exJhtbGjm5v/7UgbnBccsLEeO9lAbFeO3HNQ+J+pnnLhwYzta9gRz6h7psMBzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758627660;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UxZvjhEJCAiuvf/8CnR5ujZ+N4d9oN5GgfPWk3NAFVg=; 
 b=Y6m3QfORhUuW2GLH9Vff15repNpo6GG7yIP1PyybxHT8E8Z9cGunFfUA/Rk3lz6ompgjbAxwNYIdKw+KHc9W27REqLShPWced84kD8pQoIseC9NGdsqvY0FKg48rUfIRY1Rfv07trSMldHijd3+B31a+BAcp5ABbc1F/e4wFcXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758627660; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=UxZvjhEJCAiuvf/8CnR5ujZ+N4d9oN5GgfPWk3NAFVg=;
 b=bzn6YvXLYDjUpK84V7G/9Tf3laGfLafWt3hqSuflymd+uf5crLUNTZEopO1IDRYl
 WNYsC2y8Ux7NJ78Gvz5RnjvKx25N5Kj2oqdnsoXgPquK4u6tbjlYh5xgMhrHq5v8Q91
 wixhwtzUHWQP02hofVR+IfVAPVTa2Mbp4gB9oKt4=
Received: by mx.zohomail.com with SMTPS id 1758627658431328.6809391981618;
 Tue, 23 Sep 2025 04:40:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 23 Sep 2025 13:39:59 +0200
Subject: [PATCH v4 6/8] drm/panthor: call into devfreq for current
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-mt8196-gpufreq-v4-6-6cd63ade73d6@collabora.com>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
In-Reply-To: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
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

As it stands, panthor keeps a cached current frequency value for when it
wants to retrieve it. This doesn't work well for when things might
switch frequency without panthor's knowledge.

Instead, implement the get_cur_freq operation, and expose it through a
helper function to the rest of panthor.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 33 +++++++++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_devfreq.h |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h  |  3 ---
 drivers/gpu/drm/panthor/panthor_drv.c     |  4 +++-
 4 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 3686515d368db5bb329f4858d4a7247a4957cc24..8903f60c0a3f06313ac2008791c210ff32b6bd52 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -62,7 +62,6 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 				  u32 flags)
 {
-	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
 	int err;
 
@@ -72,8 +71,6 @@ static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 	dev_pm_opp_put(opp);
 
 	err = dev_pm_opp_set_rate(dev, *freq);
-	if (!err)
-		ptdev->current_frequency = *freq;
 
 	return err;
 }
@@ -115,11 +112,21 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 	return 0;
 }
 
+static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+
+	*freq = clk_get_rate(ptdev->clks.core);
+
+	return 0;
+}
+
 static struct devfreq_dev_profile panthor_devfreq_profile = {
 	.timer = DEVFREQ_TIMER_DELAYED,
 	.polling_ms = 50, /* ~3 frames */
 	.target = panthor_devfreq_target,
 	.get_dev_status = panthor_devfreq_get_dev_status,
+	.get_cur_freq = panthor_devfreq_get_cur_freq,
 };
 
 int panthor_devfreq_init(struct panthor_device *ptdev)
@@ -198,7 +205,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		return PTR_ERR(opp);
 
 	panthor_devfreq_profile.initial_freq = cur_freq;
-	ptdev->current_frequency = cur_freq;
 
 	/*
 	 * Set the recommend OPP this will enable and configure the regulator
@@ -296,3 +302,22 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
+
+unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	unsigned long freq = 0;
+	int ret;
+
+	if (!pdevfreq || !pdevfreq->devfreq)
+		return 0;
+
+	if (pdevfreq->devfreq->profile->get_cur_freq) {
+		ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev,
+							       &freq);
+		if (ret)
+			return 0;
+	}
+
+	return freq;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index b7631de695f7d79456478c87e8af5dc47673cd1d..f8e29e02f66cb3281ed4bb4c75cda9bd4df82b92 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -18,4 +18,6 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev);
 void panthor_devfreq_record_busy(struct panthor_device *ptdev);
 void panthor_devfreq_record_idle(struct panthor_device *ptdev);
 
+unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_DEVFREQ_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 9f0649ecfc4fc697a21a8b2fc4dd89c8ecf298df..f32c1868bf6d782d99df9dbd0babcea049c917e0 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -214,9 +214,6 @@ struct panthor_device {
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
 
-	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
-	unsigned long current_frequency;
-
 	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
 	unsigned long fast_rate;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ea4a37b566a8b215f2b7a09c333a696f1dcdb58f..4d59d94c353c3ca76f4b98a411c8f8284efafd08 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -25,6 +25,7 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
+#include "panthor_devfreq.h"
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gem.h"
@@ -1519,7 +1520,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
 
 	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
-	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
+	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n",
+		   panthor_devfreq_get_freq(ptdev));
 }
 
 static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)

-- 
2.51.0

