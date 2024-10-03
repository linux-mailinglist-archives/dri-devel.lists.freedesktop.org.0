Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B9E98F069
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 15:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148B410E242;
	Thu,  3 Oct 2024 13:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="fKX8rtSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085A10E242
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 13:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727962254; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RtCuQjkb4ImmOrs9F5OU9PpeLiqS0rm9TzjibjiQRWR0ZkSLSXQbgqr4DihjV4A9+6Ca/bDniTKkW/C7bbabNTVmP0kp90CYzYrdM/RT3nyxOON62FQpEx4Oe93LPX39Omqk9IAakCLTwGOjZLQtpRo1CG95HItq6Z4XhWV/1Ic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727962254;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=u3hkyLMMRDkXtwRu8SNsIhsLIlGy1TJE8XWYuhk2/yA=; 
 b=MFUGGHRxojnhQcdB93EfDl4j1/8X1IibIlgkfdsT7s4UM/T8eC+HgOCydlNQsxTCI++tgBumbQYpB4IzgfVA2Prfa94Pl6adsmfiJZobOTthRauVP52AnL58NGMW4Y6wrYWkbr3iaytMM7FYKiXwOO3nuqGhetPflMi8n1pwFfk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727962254; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=u3hkyLMMRDkXtwRu8SNsIhsLIlGy1TJE8XWYuhk2/yA=;
 b=fKX8rtSxSyVJ1u69UoRXm/uTNy9DM9czkjbHjwQS3cP38vY1dar28o+3vsxyjPIT
 /YuCBUpZiMAWEWB8C7UXmQDRfXiphxt6kWJjuSfC5TAtNC4l+r2kYLDgeVUJFwiNPzk
 dM83FBK4TGPUvoSsr3hvTVebn0ycTF1CbGMLSqOc=
Received: by mx.zohomail.com with SMTPS id 1727962253296545.6382302905259;
 Thu, 3 Oct 2024 06:30:53 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panthor: Fix OPP refcnt leaks in devfreq
 initialisation
Date: Thu,  3 Oct 2024 14:30:29 +0100
Message-ID: <20241003133037.3398144-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
References: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
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

Make sure in case of errors between the first fetch of an OPP in
panthor_devfreq_init and its successive put, the error path decrements its
reference count to avoid OPP object leaks when removing the device.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: fac9b22df4b1 ("drm/panthor: Add the devfreq logical block")
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 9d0f891b9b53..ce0ac4563f65 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -197,7 +197,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	if (ret && ret != -ENODEV) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
-		return ret;
+		goto opp_err;
 	}
 
 	/*
@@ -207,7 +207,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	ret = dev_pm_opp_set_opp(dev, opp);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
-		return ret;
+		goto opp_err;
 	}
 
 	dev_pm_opp_put(opp);
@@ -242,6 +242,10 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
 
 	return 0;
+
+opp_err:
+	dev_pm_opp_put(opp);
+	return ret;
 }
 
 int panthor_devfreq_resume(struct panthor_device *ptdev)
-- 
2.46.2

