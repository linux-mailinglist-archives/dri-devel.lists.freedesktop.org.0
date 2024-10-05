Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B74991820
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 18:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A9710E0E3;
	Sat,  5 Oct 2024 16:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="GcfZ6KZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1288810E0E3
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 16:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728144548; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cGd8u8H830/Y9MO90QueAMSjyO+lDU3OLKxWbV6b1rCR0e588kYZ64v/J2C70fSG5pO5kxyeIDBczyV3nH3SnX/2dW5FOBB6Klcw7dRfStavpdUmmpNg2dxkQXnFZvUhhZD1Tm4P1ZXA14HH5ziwcce4qLzMZt1FF9+1KaQnMZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728144548;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=B/KSYYR1T3gUzqZowAe2+SBTCH+9OFZAP3JPy6LVLtQ=; 
 b=l42G5dDJj4SEepunCXhDsrONYyJw+v/u1dhOc2VWhI4YOysyXNTBFr+KdEX5CVPNhEBa7DfSwJJOtC8gQGYVx7ptsGEGbiQXFa84cE/dAqs18TuJQiDsfdu2z26XM0+83vSX7MiI+bSuqdkQBWIieG/51PQpO3s8ykurWsfBdDE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728144548; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=B/KSYYR1T3gUzqZowAe2+SBTCH+9OFZAP3JPy6LVLtQ=;
 b=GcfZ6KZtDAkZM7DuszAaU5JXvF07NOzzq+M3jAjklI2J37A6kO4PoFw/AsRfyui8
 8QWdDAW0Zf/pHLfmruTHTTqDoLIPoog4CgL3LMvJZQaL8EhQzkdWagPH9Nh6lFN5avj
 C/N3eXCJu/ovNgC1ZgkwQUAtUbZX/3BrKQclYM3A=
Received: by mx.zohomail.com with SMTPS id 172814454763354.29541276121313;
 Sat, 5 Oct 2024 09:09:07 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/panfrost: Add missing OPP table refcnt decremental
Date: Sat,  5 Oct 2024 17:08:52 +0100
Message-ID: <20241005160857.347796-1-adrian.larumbe@collabora.com>
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
-- 
2.46.2

