Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A2B5565E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B3110ECC7;
	Fri, 12 Sep 2025 18:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="SHF4Lx+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B241E10ECC7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757702290; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jCcx5kupcGMQ6qEdeF0fPg45uIPns1+aZza0tsmRTDE6dqGN0tzKR5otE2E7aHxZnWtAhLdTlOZzZJxo4DDPmGP2UlpoRDyyUWp3DkPb0g74IyaeoOAUjyidOhhNrPy6bnSAHkh3GonLWjOeGbj6ngsBZheMc/07x+AE646V578=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757702290;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=t8qb0CjF4TYRjzxh3bLQCf9aGJQh8+bsgUjROmryPOo=; 
 b=JT8+qLfy3Acfr5s9tDKDme3QkuPKKfJOMIiN2+Q1Pd0u5xIfNo420QOgYvoa1/JGe4WEeXqBOE45UGlmXFuZmZVwu3UnL/5Oz+XOqQVsn+YyDCEdKBf8TYvKBu9Bbit/Nk9qE/XsowPBc+d1ijdQz49/B6yiWSAnOTkdEQbif18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702290; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=t8qb0CjF4TYRjzxh3bLQCf9aGJQh8+bsgUjROmryPOo=;
 b=SHF4Lx+3Zq34d4SGkn2CKwtYjVKUWPGD/Sup1TkvqMk0Q8jwWLCJMvCG887iWArd
 Uuo6kRpdU1lHPFR0ah7NiGgai1FTDo9dC0v6BxZp/Hnqab8ynCJUAlqGP8f/OUUQ4k5
 1ExGo3JwY3ufUj25Bz8DxActLkJ5rwh3BUJDfCtE=
Received: by mx.zohomail.com with SMTPS id 1757702288056856.071305666723;
 Fri, 12 Sep 2025 11:38:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:05 +0200
Subject: [PATCH v2 06/10] drm/panthor: call into devfreq for current frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-6-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
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
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
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

As it stands, panthor keeps a cached current frequency value for when it
wants to retrieve it. This doesn't work well for when things might
switch frequency without panthor's knowledge.

Instead, implement the get_cur_freq operation, and expose it through a
helper function to the rest of panthor.

Reviewed-by: Steven Price <steven.price@arm.com>
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
index 4fc7cf2aeed577f623aac73ed287d6327645ecaa..a14239c8f9ca9229d8d6d36d327e6fd6d05f8f2f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -200,9 +200,6 @@ struct panthor_device {
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
 
-	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
-	unsigned long current_frequency;
-
 	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
 	unsigned long fast_rate;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fdbe89ef7f43c54d705b90275917dfdee16a0152..ba871466d7e05a95b51b3e5bb6723c587410f3d8 100644
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

