Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E643BDD84C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4523810E754;
	Wed, 15 Oct 2025 08:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aROBhwH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177F10E754
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760518239; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IdlEZe/iswhahs/GR/1DFgnRhDI7e2QIcFpLACz1UmpNrPPwTlRFayz8OxcqTx/Ss7XCguukgR4DvVvzdimgCW6Mf431tIeScI4P8d3hbi0BSAELtsjdCf2F/f4c0tmDF0lbicd0E95fBrFM0B8L/hR0TKJKpVT3GSc4I5vCKLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760518239;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=laH6VsELHp+YZ/QiMWE66EVtfbqvEoAjIyqzf+SaxQc=; 
 b=RVDnfHg75pvdl06mXk1Y77Cyp+EG+0gqR0HLQNeRZ8tJSHEZ64238STh9hMhNKrfqZxaNoJrkp7eAktdLQRS/0YgfiHz2hrXPAOaSYl9tsCJKeiQNcyIZgizi6lGrDwjFDz0iBaAukSuZJY6vN+vXDkOjizqEdZ9gWdC5W4EN6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760518239; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=laH6VsELHp+YZ/QiMWE66EVtfbqvEoAjIyqzf+SaxQc=;
 b=aROBhwH8RUqdQNf915oPMZ1SofgdAi6EybwMs7BrekcExvGZJLYgfvI8bbZhhgRN
 SFUMP7STijJDpHiUEFOhMgXAZ8ZXfujXLsD3j63aWI4Tg5JkTB6jus0iZGGjzCKkjYl
 LnYsGitd23wy8l+mBtsOulqqyre6QTWx6mh0GCWI=
Received: by mx.zohomail.com with SMTPS id 1760518238042413.5318766196442;
 Wed, 15 Oct 2025 01:50:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 15 Oct 2025 10:50:02 +0200
Subject: [PATCH v7 3/5] drm/panthor: call into devfreq for current
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-mt8196-gpufreq-v7-3-0a6435da2080@collabora.com>
References: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
In-Reply-To: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
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
X-Mailer: b4 0.14.3
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

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 30 ++++++++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_devfreq.h |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h  |  3 ---
 drivers/gpu/drm/panthor/panthor_drv.c     |  4 +++-
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2df1d76d84a0..a6dca599f0a5 100644
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
@@ -197,7 +204,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		return PTR_ERR(opp);
 
 	panthor_devfreq_profile.initial_freq = cur_freq;
-	ptdev->current_frequency = cur_freq;
 
 	/*
 	 * Set the recommend OPP this will enable and configure the regulator
@@ -295,3 +301,19 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
+
+unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	unsigned long freq = 0;
+	int ret;
+
+	if (!pdevfreq->devfreq)
+		return 0;
+
+	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
+	if (ret)
+		return 0;
+
+	return freq;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index b7631de695f7..f8e29e02f66c 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -18,4 +18,6 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev);
 void panthor_devfreq_record_busy(struct panthor_device *ptdev);
 void panthor_devfreq_record_idle(struct panthor_device *ptdev);
 
+unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_DEVFREQ_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 9f0649ecfc4f..f32c1868bf6d 100644
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
index fb4b293f17f0..75898d83a207 100644
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

