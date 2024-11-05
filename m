Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7186D9BD746
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 21:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1EB10E050;
	Tue,  5 Nov 2024 20:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="AtPb5s9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C156810E050
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 20:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730840109; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R4URFRu68qMBbJlAKi9VTm1Ne07Q1ZI9slaTrkvjkTvxySPKS6/5uiiyl8A1r4jHm/FThTKQvxjH0FjjFt9JWt3J1lB+AldwPgpgZtzTvt3l1eVMRD0eKlDMbwMi5VF1+GK1/fBiGkv/JCB7JP2hQZ9Y97SD/Xh6oAshhFU1RzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730840109;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nj7nP9zQoF3AEa+3/reQIoPhVeubnSxEu3NbYWDKKx4=; 
 b=G7Q5CrCYp1rB+jO88ETsFDFvBKNygFgeVb8T4UL8VZPpw31xtkUtQH+1IUHyEoS0IJArGjym+wJl9OQ1ehFZdQlxQwYsLdHHrc2F6z/Q2rksfddi4opgq8KceaO59tLumTQkreDCm+pM1rnII5NwAgKR4ifQLQyXDghnPw2lVH4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730840109; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nj7nP9zQoF3AEa+3/reQIoPhVeubnSxEu3NbYWDKKx4=;
 b=AtPb5s9iyVHf5cVM1C4rChxIAD/jXlty83NGkwb4qef0johFykNflbVKICQ9JTA0
 Ki7K53IZwGqds8TkACcJwWrk+5uBGRb/pcT6itQ5fUYcNG1dgZe1Lqv/35RPNeDfBe/
 ZCU4coechi/n4O9zwsX3Pmd+nY7F07mHGIUKnPSo=
Received: by mx.zohomail.com with SMTPS id 1730840108167855.385300677661;
 Tue, 5 Nov 2024 12:55:08 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/panfrost: Add missing OPP table refcnt decremental
Date: Tue,  5 Nov 2024 20:54:55 +0000
Message-ID: <20241105205458.1318989-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
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

Commit f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
retrieves the OPP for the maximum device clock frequency, but forgets to
keep the reference count balanced by putting the returned OPP object. This
eventually leads to an OPP core warning when removing the device.

Fix it by putting OPP objects as many times as they're retrieved.

Also remove an unnecessary whitespace.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 2d30da38c2c3..3385fd3ef41a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);
 	dev_pm_opp_put(opp);
 
-	err =  dev_pm_opp_set_rate(dev, *freq);
+	err = dev_pm_opp_set_rate(dev, *freq);
 	if (!err)
 		ptdev->pfdevfreq.current_frequency = *freq;
 
@@ -182,6 +182,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	 * if any and will avoid a switch off by regulator_late_cleanup()
 	 */
 	ret = dev_pm_opp_set_opp(dev, opp);
+	dev_pm_opp_put(opp);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
 		return ret;

base-commit: aadcf584583ca9833b4fb2140a4f437569ddbcd7
-- 
2.46.2

