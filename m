Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B87F8F51
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 21:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF4D10E058;
	Sat, 25 Nov 2023 20:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F310E046
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 20:55:42 +0000 (UTC)
Received: from sobremesa.fritz.box (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FDB86602F32;
 Sat, 25 Nov 2023 20:55:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700945741;
 bh=2dXYtao9TZWcdBl3k4zc+aQA5XUgHlJliolV8pPR8qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QqDguSoypAvohoEiqUIfqDMcbjY6Mz+CUOn0D5Qrj5w4vP5RTyyVjGAa4xUzfVzOL
 DLedTETPPju5QjU9S8JBbtVVwIlvmuqNvrSexyDiomC+XyP5HoRhpBr3zRK89NyS8Y
 zKcXp7aIj6Ta1dfQAr7/A5LrefMXIj7HjrX34CTENWj88aJu6dO59jVSGQbpJtn+vt
 MhLDm/klf43sv4z/UzJW/KCcir0UGgs8v6PFbTuav/YMvuq7s3TRdAtOKpBERuNXqQ
 ZSaOhFCIbOxBn7KBNqyqF188SkFlNMAEQ1tlpbY57+RvkPRrAVXp2OhHjt3atEqdIL
 75B7b2qMOc9Eg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] drm/panfrost: Fix incorrect updating of current device
 frequency
Date: Sat, 25 Nov 2023 20:52:03 +0000
Message-ID: <20231125205438.375407-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125205438.375407-1-adrian.larumbe@collabora.com>
References: <20231125205438.375407-1-adrian.larumbe@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was noticed when setting the Panfrost's DVFS device to the performant
governor, GPU frequency as reported by fdinfo had dropped to 0 permamently.

There are two separate issues causing this behaviour:
 - Not initialising the device's current_frequency variable to its original
 value during device probe().
 - Updating said variable in Panfrost devfreq's get_dev_status() rather
 than after the new OPP's frequency had been retrieved in target(), which
 meant the old frequency would be assigned instead.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f59c82ea8870..2d30da38c2c3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -29,14 +29,20 @@ static void panfrost_devfreq_update_utilization(struct panfrost_devfreq *pfdevfr
 static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 				   u32 flags)
 {
+	struct panfrost_device *ptdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
+	int err;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 	dev_pm_opp_put(opp);
 
-	return dev_pm_opp_set_rate(dev, *freq);
+	err =  dev_pm_opp_set_rate(dev, *freq);
+	if (!err)
+		ptdev->pfdevfreq.current_frequency = *freq;
+
+	return err;
 }
 
 static void panfrost_devfreq_reset(struct panfrost_devfreq *pfdevfreq)
@@ -58,7 +64,6 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
 	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
 
 	panfrost_devfreq_update_utilization(pfdevfreq);
-	pfdevfreq->current_frequency = status->current_frequency;
 
 	status->total_time = ktime_to_ns(ktime_add(pfdevfreq->busy_time,
 						   pfdevfreq->idle_time));
@@ -164,6 +169,14 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
 
+	/*
+	 * We could wait until panfrost_devfreq_target() to set this value, but
+	 * since the simple_ondemand governor works asynchronously, there's a
+	 * chance by the time someone opens the device's fdinfo file, current
+	 * frequency hasn't been updated yet, so let's just do an early set.
+	 */
+	pfdevfreq->current_frequency = cur_freq;
+
 	/*
 	 * Set the recommend OPP this will enable and configure the regulator
 	 * if any and will avoid a switch off by regulator_late_cleanup()
-- 
2.42.0

