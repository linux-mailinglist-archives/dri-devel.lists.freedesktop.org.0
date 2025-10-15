Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20DBDD852
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB25010E756;
	Wed, 15 Oct 2025 08:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Hf0TuZt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B109810E756
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760518247; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T+lfMCA+ZAbr3JKtHaGsAaYGIqcytuWZo7M/AVvVo6zfVYshA0GLJPyWFKxJDuMGkd5TLLF6TROnwYmT7CZe3CVWibfXX73fM5f1AuWpR5azvnIbdc0/Hapw2iOtZLNRWDTp0PJkF30LM26dd5pSL0tI5Fy67lehyl37Az7y08E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760518247;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=B1797pEnkkGQxskAo8aW0y+7RuxjF+4YWBWOHsk0nsQ=; 
 b=E88kM/20fT/3ia/uV7mDWiBei8njIyQX+r6PP5us5oqTPAmnxL99aRbvx0xKI/uFlvMHWMgety7Nz8DeA7ZPruAyg/fd+vDuakYGw8tkKgZq+fkIw+UdE46zmgFY4uB6z+KS4ielZMR1sB6AlzaX54x7BRd466QWRVKv7QoZU+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760518247; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=B1797pEnkkGQxskAo8aW0y+7RuxjF+4YWBWOHsk0nsQ=;
 b=Hf0TuZt/4jbFe7xHMjSZEfLt9MJOUuCnkvFM5sdXgYWkFTpxP8NIdmqq5Aj41YPe
 46QLbWpTsZV8L4YPVVFSUApglI8st6BM5loKFgJasei6raUxMWRY6yB3Z4WFINxJyjA
 3D+QGNv0n3aw/oHX4W/UCJLF8RxEvScTTcvVLBfw=
Received: by mx.zohomail.com with SMTPS id 1760518244903638.4032979992957;
 Wed, 15 Oct 2025 01:50:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 15 Oct 2025 10:50:03 +0200
Subject: [PATCH v7 4/5] drm/panthor: Use existing OPP table if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-mt8196-gpufreq-v7-4-0a6435da2080@collabora.com>
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

On SoCs where the GPU's power-domain is in charge of setting performance
levels, the OPP table of the GPU node will have already been populated
during said power-domain's attach_dev operation.

To avoid initialising an OPP table twice, only set the OPP regulator and
the OPPs from DT if there's no OPP table present.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index a6dca599f0a5..ec63e27f4883 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -141,6 +141,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct thermal_cooling_device *cooling;
 	struct device *dev = ptdev->base.dev;
 	struct panthor_devfreq *pdevfreq;
+	struct opp_table *table;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	unsigned long freq = ULONG_MAX;
@@ -152,17 +153,30 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	ptdev->devfreq = pdevfreq;
 
-	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret && ret != -ENODEV) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-		return ret;
+	/*
+	 * The power domain associated with the GPU may have already added an
+	 * OPP table, complete with OPPs, as part of the platform bus
+	 * initialization. If this is the case, the power domain is in charge of
+	 * also controlling the performance, with a set_performance callback.
+	 * Only add a new OPP table from DT if there isn't such a table present
+	 * already.
+	 */
+	table = dev_pm_opp_get_opp_table(dev);
+	if (IS_ERR_OR_NULL(table)) {
+		ret = devm_pm_opp_set_regulators(dev, reg_names);
+		if (ret && ret != -ENODEV) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+			return ret;
+		}
+
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return ret;
+	} else {
+		dev_pm_opp_put_opp_table(table);
 	}
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return ret;
-
 	spin_lock_init(&pdevfreq->lock);
 
 	panthor_devfreq_reset(pdevfreq);

-- 
2.51.0

