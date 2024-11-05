Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986BB9BD747
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 21:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62610E42F;
	Tue,  5 Nov 2024 20:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NxaUSgXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596710E114
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 20:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730840113; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Q92ZMBTzX2Ovt80kwYpz9CfZB2hnVMAmuq+lC4ecC99Q6Byndqvw/lwYe5dnpaItsjxKp+4nLguCk4DJ3iAn/aOIVuvqHU+jQ6sxCmJxo8RKgs+tRTphngSQHEDfDdpbo+yRHfhokPe9BYarH7XEa9uj7A3yv/zhPR19k9cChg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730840113;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AwrxtqiIa4mKWF1bEvs38Az3WJm9z6mQPcyAOFFvEs8=; 
 b=TsEr5VLOugB/3IGrwlQlcn54Wz+J34uu38BKDQJF7CkaD6zyWwdMHWFX6eFiQRPpGJxUVPwD8Or3DvG/rw+ypAmLz/QhJKVfiJX2kvajblN1JZ1M308z93F7zzEcZ4PgnYbaZ2wBq1O1N0YU70cMFy/qimCz7V8vN3V7oeOCtmc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730840113; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AwrxtqiIa4mKWF1bEvs38Az3WJm9z6mQPcyAOFFvEs8=;
 b=NxaUSgXmjFfWIK1qjGuGmSupIsgjS1zh0Q/hDgVXFB6ECVl0jR/vcEGLBKamY7bY
 e+o5RU6VK/0oLYEHUq2rDVqJojeLsflH6wKt7V1xJN/H2d+DUhG3IM4oAaHCNDh6epy
 APzvVGXpQLmUtY9ON85MYP6xA9LBcdptWtm30GEk=
Received: by mx.zohomail.com with SMTPS id 1730840111631663.6545608679393;
 Tue, 5 Nov 2024 12:55:11 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/panthor: Fix OPP refcnt leaks in devfreq
 initialisation
Date: Tue,  5 Nov 2024 20:54:56 +0000
Message-ID: <20241105205458.1318989-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241105205458.1318989-1-adrian.larumbe@collabora.com>
References: <20241105205458.1318989-1-adrian.larumbe@collabora.com>
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

Rearrange lookup of recommended OPP for the Mali GPU device and its refcnt
decremental to make sure no OPP object leaks happen in the error path.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: fac9b22df4b1 ("drm/panthor: Add the devfreq logical block")
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 9d0f891b9b53..ecc7a52bd688 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -163,13 +163,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	cur_freq = clk_get_rate(ptdev->clks.core);
 
-	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp))
-		return PTR_ERR(opp);
-
-	panthor_devfreq_profile.initial_freq = cur_freq;
-	ptdev->current_frequency = cur_freq;
-
 	/* Regulator coupling only takes care of synchronizing/balancing voltage
 	 * updates, but the coupled regulator needs to be enabled manually.
 	 *
@@ -200,18 +193,24 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		return ret;
 	}
 
+	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	panthor_devfreq_profile.initial_freq = cur_freq;
+	ptdev->current_frequency = cur_freq;
+
 	/*
 	 * Set the recommend OPP this will enable and configure the regulator
 	 * if any and will avoid a switch off by regulator_late_cleanup()
 	 */
 	ret = dev_pm_opp_set_opp(dev, opp);
+	dev_pm_opp_put(opp);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
 		return ret;
 	}
 
-	dev_pm_opp_put(opp);
-
 	/* Find the fastest defined rate  */
 	opp = dev_pm_opp_find_freq_floor(dev, &freq);
 	if (IS_ERR(opp))
-- 
2.46.2

