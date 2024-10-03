Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5898E7C0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 02:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8D10E05D;
	Thu,  3 Oct 2024 00:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="U4glnt4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA3610E05D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 00:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727915179; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gebRKY4Cd8s6LDrxNwkT2OUgQQUWitapRVQ8AYlE6ZYxZhctwZ9gu6t8MhEzfuu9m2G1sJzQtXepIxBlJRkhbd95ZMLZ/S7uPrs+pj2nEUyMothgTkpgalWhUvA4vnUsyjvWzo5DTHN7XrnHkCJ7mlcpEgAoPIInqz4y6HCEiiY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727915179;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DChdb2BFzLOXfJBF9ehTCkQlOOWBFtEDNuAGBsr3xJ4=; 
 b=U/EiUdxVShpE7mSEw+vKvOrMYl8izisccJuNSyR7Df4FeBCSlDVTrvBZx+BJBQ1DyWoWb5jp08PJIfsmZeFcQFEOjvMi4kEFYB+Ea2WrKbuCKVwCcDCsn7K30B7m76QNTeA1XbuhAGD4lpCJDUkM2IJBe8cd1FzP17rJzlVKKU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727915179; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=DChdb2BFzLOXfJBF9ehTCkQlOOWBFtEDNuAGBsr3xJ4=;
 b=U4glnt4lU4eZXXlmuK6xFvxFeAdEywuNSE1Ixmm8HQ8PaEvvVa4yjKYC8K5XeINu
 QQgjcbGeqSHUsMNnmeF1ldcOm4Yz54mOx0zMIzpjPy7SnKX7qIFNI04mA7VeL+UKXua
 Mw0Jp84Tx75QQ/pWjSjs2GeNV/Ed5WSqPTkylZ4I=
Received: by mx.zohomail.com with SMTPS id 1727915178493626.7814922268785;
 Wed, 2 Oct 2024 17:26:18 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: Add missing OPP table refcnt decremental
Date: Thu,  3 Oct 2024 01:25:37 +0100
Message-ID: <20241003002603.3177741-1-adrian.larumbe@collabora.com>
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
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 2d30da38c2c3..c7d3f980f1e5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);
 	dev_pm_opp_put(opp);
 
-	err =  dev_pm_opp_set_rate(dev, *freq);
+	err = dev_pm_opp_set_rate(dev, *freq);
 	if (!err)
 		ptdev->pfdevfreq.current_frequency = *freq;
 
@@ -177,6 +177,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	 */
 	pfdevfreq->current_frequency = cur_freq;
 
+	dev_pm_opp_put(opp);
+
 	/*
 	 * Set the recommend OPP this will enable and configure the regulator
 	 * if any and will avoid a switch off by regulator_late_cleanup()
-- 
2.46.2

