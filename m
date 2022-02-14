Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080254B5AF8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 21:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7E110E2D2;
	Mon, 14 Feb 2022 20:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A4C10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:31:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id E04281F43F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644870700;
 bh=CEk0DFXIUz+rib8Ps6KmDjMnwxb8SNNluWUTHums5hQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ievNAjv7U7jDN0ChCw4YX7Jv0ZMu5Ut6BbrqUhRy3qDYLAUbYj6zDasWUaIIjgas5
 tk4XlVsU7AKz0HOAwgqXkpAqdo+rD5/DrxhSwcvv22hyJAVZmrRSjwrj8cQi2MSxox
 SEy4WmOboddgpfuXSiOoe58Hfh+qBLnP34hyjH9ZtT+Mor28hjJeVpOFBp/lMjGhMX
 cIbIvoaPwkBbkBwA8xIWxQbAmB554GaaVSnUyPC/hGyhvSvJZ3vtxoSDcYs/fQrxOw
 +lGQA+duIA1IpCuxMdJL+XdR+a7h7vxpH/SPqNzhRSS/VNniqaiowOMCl6Zq0TFIkq
 PeVDBll6CCjOg==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Dynamically allocate pm_domains
Date: Mon, 14 Feb 2022 15:31:32 -0500
Message-Id: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MT8192 requires 5 power domains. Rather than bump MAX_PM_DOMAINS and
waste memory on every supported Panfrost chip, instead dynamically
allocate pm_domain_devs and pm_domain_links. This adds some flexibility;
it seems inevitable a new MediaTek device will require more than 5
domains.

On non-MediaTek devices, this saves a small amount of memory.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 14 ++++++++++----
 drivers/gpu/drm/panfrost/panfrost_device.h |  5 ++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index ee612303f076..661cdec320af 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -127,7 +127,10 @@ static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
+	if (!pfdev->pm_domain_devs || !pfdev->pm_domain_links)
+		return;
+
+	for (i = 0; i < pfdev->comp->num_pm_domains; i++) {
 		if (!pfdev->pm_domain_devs[i])
 			break;
 
@@ -161,9 +164,12 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
 		return -EINVAL;
 	}
 
-	if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
-			"Too many supplies in compatible structure.\n"))
-		return -EINVAL;
+	pfdev->pm_domain_devs = devm_kcalloc(pfdev->dev, num_domains,
+					     sizeof(*pfdev->pm_domain_devs),
+					     GFP_KERNEL);
+	pfdev->pm_domain_links = devm_kcalloc(pfdev->dev, num_domains,
+					      sizeof(*pfdev->pm_domain_links),
+					      GFP_KERNEL);
 
 	for (i = 0; i < num_domains; i++) {
 		pfdev->pm_domain_devs[i] =
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 8b25278f34c8..98e3039696f9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -22,7 +22,6 @@ struct panfrost_job;
 struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
-#define MAX_PM_DOMAINS 3
 
 struct panfrost_features {
 	u16 id;
@@ -87,8 +86,8 @@ struct panfrost_device {
 	struct regulator_bulk_data *regulators;
 	struct reset_control *rstc;
 	/* pm_domains for devices with more than one. */
-	struct device *pm_domain_devs[MAX_PM_DOMAINS];
-	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
+	struct device **pm_domain_devs;
+	struct device_link **pm_domain_links;
 	bool coherent;
 
 	struct panfrost_features features;
-- 
2.34.1

