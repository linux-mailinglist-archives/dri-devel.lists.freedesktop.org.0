Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AD991821
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 18:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD2B10E0EC;
	Sat,  5 Oct 2024 16:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="BNlHkIog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3B10E0EC
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 16:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728144552; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NwNP66V0483WtAyzZowk2XgkBDH1zelCOmUawa47RGHDjE3EawRnT3VT+ouwl5FclIJUb9x86lpfvRsbM4yzFpLRw03xl8NwkdLHl7WvRq8NHpTCt5Lzx2HfBOsYXZGdlBelNxm9EczK/IRlgexblqXK/CcFsuc+MDmQuW+tmes=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728144552;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1Ici44Rb1PgnLO5qChCrAsJMisDfA95zHInoEyRjrx0=; 
 b=IFwhJ14DOpfeJRBtg1zRG9S67JgAF622Keb6hSnSgOuMdHlKnLGFTpvJOJhWIpZOSk8FhGufZpjuwE7aQKvuupwdUfDhoGSNvfsEwh+MobeDs117LsOFPEt18a9jFzwHgpPrXNaUay+AlTq31juJ1V4fTso2Wnv4hAPGstms+KE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728144552; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=1Ici44Rb1PgnLO5qChCrAsJMisDfA95zHInoEyRjrx0=;
 b=BNlHkIogYFw+ozP7mqhQhLwS6OjmeRc2DneG7dX1Dan1juMZQ8lohipjp/gQ9Th3
 R+NQZLBB4GteUWJ6kadRW4fup5eUIPM3uCm6r/Uzd3uDeAdt0SLr5edNEE4zwg0cQx8
 8tEdrDisWN7zZWYYmyUVlkjoYZAmG1gWnQcsPXic=
Received: by mx.zohomail.com with SMTPS id 1728144551305121.11416664592002;
 Sat, 5 Oct 2024 09:09:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/panthor: Fix OPP refcnt leaks in devfreq
 initialisation
Date: Sat,  5 Oct 2024 17:08:53 +0100
Message-ID: <20241005160857.347796-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241005160857.347796-1-adrian.larumbe@collabora.com>
References: <20241005160857.347796-1-adrian.larumbe@collabora.com>
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

