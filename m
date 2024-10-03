Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B698F068
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 15:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F6110E0BA;
	Thu,  3 Oct 2024 13:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HjbGyVF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379610E0BA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 13:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727962252; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U2PwFjUvF1MrjQeDpe5NtTQrzvJaB+roYvoJnJK9vqI0Y0vBNIqxpaxuC/+dCMemBBVtXrQB5cq/s2kLpL+DO0sm7vQXPxF8l1yk9FCafF4jg7bf2OTk5RneE5o62qej3wpfd+wta4GSHX232/vvPO00CZwNzqbIV/sN7iaGXuQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727962252;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=d6UuXdqkeRkP/vowaYIwAQPyT6dc3CyA0URjr+Pa01I=; 
 b=b9zU+zLWLPl6dg12y+D5F/8X2ok8uplSPfoKyS+i5waHzo36cTU/Jq8uT/inGw52BbyZB7uFqEIiPUxfzYF6LXYhzfpOWGuKXQERqZiKF2EFUtAlyfk2rPEYcYRxnwuiWpXu3hecM571JQFEpqvBssmnbTA+l5i3TI++MEc614I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727962252; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=d6UuXdqkeRkP/vowaYIwAQPyT6dc3CyA0URjr+Pa01I=;
 b=HjbGyVF8jO/YWIsqj5jldq+KRiPyzFtwDbf6rWUZahLEmzOTBASaHMKa47mrMO8o
 GvuExp4YcQlGFhIuwl6dF6nr+9FUXVgavjjJ6u+zxNYfHpUSqscI2QPZKwmA0NUaYBe
 +huZzclPNQQw71EbBGH/VhhDdPXKInFozVBRISJE=
Received: by mx.zohomail.com with SMTPS id 1727962249782554.8900083809897;
 Thu, 3 Oct 2024 06:30:49 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/panfrost: Add missing OPP table refcnt decremental
Date: Thu,  3 Oct 2024 14:30:28 +0100
Message-ID: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
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

Fix it by putting OPP objects as many times as they're retrieved. That
includes putting the OPP object in case setting it fails.

Also remove an unnecessary whitespace.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 2d30da38c2c3..4b8840a41779 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);
 	dev_pm_opp_put(opp);
 
-	err =  dev_pm_opp_set_rate(dev, *freq);
+	err = dev_pm_opp_set_rate(dev, *freq);
 	if (!err)
 		ptdev->pfdevfreq.current_frequency = *freq;
 
@@ -184,9 +184,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	ret = dev_pm_opp_set_opp(dev, opp);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
+		dev_pm_opp_put(opp);
 		return ret;
 	}
 
+	dev_pm_opp_put(opp);
+
 	/* Find the fastest defined rate  */
 	opp = dev_pm_opp_find_freq_floor(dev, &freq);
 	if (IS_ERR(opp))
-- 
2.46.2

