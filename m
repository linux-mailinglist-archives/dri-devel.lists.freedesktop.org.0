Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42DABE219
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605C10E61B;
	Tue, 20 May 2025 17:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FFN7t7jW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764ED10E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 17:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747763247; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gj+qZAv1Vqas2D98HrTYTtX89THlnMYIEfYTU0DhJoiemf23tl5gojB3h8JP+C/ieaIbFoExlbPfHXulqeHN89BUVGgtnVuIoP856ZNvykew2y2pa2NVZLXpKrvKaJGb3SJArWH7dE/+eDrG6lrrkxFnFSGdsEHskiy+iSwJDpc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747763247;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZwJNqE4R8o0XNFwOgoDwfufMDYbnprYPjqqiSXm7UnQ=; 
 b=QZB6YlLvqqaCoPwp6nH5ec3+dVntvqV9bTKGlEJBi0wrzfIGw57a65rieMKvoc+DQQHJ1KHVDSq1Uxxov1hkxVQGP4nsEtEtMIqUwy7V54s9JDyv6R/uthp7FbbF+AC99zYNqI5HWSGoXRufYvhpRJAz8pZzfEE+QIX79wLxb1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763247; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZwJNqE4R8o0XNFwOgoDwfufMDYbnprYPjqqiSXm7UnQ=;
 b=FFN7t7jW7JXxfT2X9a/iFHT5l2V8K99/2qWlDo0CBDq8dDxEEoI+mGqOP+EQ7MTH
 CcSral/3aOm6hetBVbClLW7IEaWxZ+RkxDqQOV3XZjjrOZ4LVAXSijZK7CgrJNasg5+
 ZmjBTuxFPrh0aoOAwBMkOLwaMlm0gcHLu7HYNsLY=
Received: by mx.zohomail.com with SMTPS id 1747763247490239.94632075864706;
 Tue, 20 May 2025 10:47:27 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 5/5] drm/panfrost: Fix panfrost device variable name in
 devfreq
Date: Tue, 20 May 2025 18:44:02 +0100
Message-ID: <20250520174634.353267-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250520174634.353267-1-adrian.larumbe@collabora.com>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
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

Commit 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current
device frequency") was a Panfrost port of a similar fix in Panthor.

Fix the Panfrost device pointer variable name so that it follows
Panfrost naming conventions.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current device frequency")
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 3385fd3ef41a..5d0dce10336b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -29,7 +29,7 @@ static void panfrost_devfreq_update_utilization(struct panfrost_devfreq *pfdevfr
 static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 				   u32 flags)
 {
-	struct panfrost_device *ptdev = dev_get_drvdata(dev);
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
 	int err;
 
@@ -40,7 +40,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
 
 	err = dev_pm_opp_set_rate(dev, *freq);
 	if (!err)
-		ptdev->pfdevfreq.current_frequency = *freq;
+		pfdev->pfdevfreq.current_frequency = *freq;
 
 	return err;
 }
-- 
2.48.1

