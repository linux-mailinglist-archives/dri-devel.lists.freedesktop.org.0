Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133AE99AEF8
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 00:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E8010EB35;
	Fri, 11 Oct 2024 22:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Emtr4hgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0148110EB30
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 22:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728687561; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d6lOPDDbsXYajpqnWAEGCYjrycH1l1qhEpNvqkoVWLmToca0BxO5VFf6fqV/mzNhgej9vHJ8949vm40IpNZDiSCBBeFA69CBWf7X76N2yct8EKZUJQw9vcYUMbJOGiXIQUkidF/81CvlJ/Y8iy7tKLw1Vgd32oHuGjdjIPCvDZk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728687561;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sHHKPfHgZRs5gMzNFp3u//pQRXS+IebqOoINdKrWbgo=; 
 b=ZNx4EaDIwYEQ3GeKyohIpzX/18QeBuMnr4jh4hTHyl00kXnMx7XM74OQhPlFNYxviO6Ubu+dhbDVXzrknIy5kgrXIMmBptpOpL/11Hg5jLSc2LM3AbjIISs3EOq0T9wlj/eZq0fq9tYd1/L5QU17hRNUzoR5+eXt/GUjp+zO6p4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728687561; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=sHHKPfHgZRs5gMzNFp3u//pQRXS+IebqOoINdKrWbgo=;
 b=Emtr4hgRDMBCc0t7YaHcTnOylDr2tk60m9iWlDz//DIHiwOp1F+akQeOUkj3j6HI
 PIFM1CXDMG+D1GbKkRI12ew4CyEvSSx1+nAFQLoLRAfgpQisNZPp1YviDuISAX1JZ9I
 iy9HUm2QRo6SpccAtZ3wUEFBg/xZXhkq+cj1z988=
Received: by mx.zohomail.com with SMTPS id 1728687560568724.2057795814977;
 Fri, 11 Oct 2024 15:59:20 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/panthor: Retry OPP transition to suspension state a
 few times
Date: Fri, 11 Oct 2024 23:57:00 +0100
Message-ID: <20241011225906.3789965-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
References: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
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

When the device's runtime PM suspend callback is invoked, the switch to
a suspension OPP might sometimes fail. Although this is beyond the
control of the Panthor driver, we can attempt suspending it more than
once as a defensive strategy.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index cedd3cbcb47d..5430557bd0b8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -490,6 +490,7 @@ int panthor_device_resume(struct device *dev)
 int panthor_device_suspend(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	unsigned int susp_retries;
 	int ret, cookie;
 
 	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
@@ -522,7 +523,12 @@ int panthor_device_suspend(struct device *dev)
 		drm_dev_exit(cookie);
 	}
 
-	ret = panthor_devfreq_suspend(ptdev);
+	for (susp_retries = 0; susp_retries < 5; susp_retries++) {
+		ret = panthor_devfreq_suspend(ptdev);
+		if (!ret)
+			break;
+	}
+
 	if (ret) {
 		if (panthor_device_is_initialized(ptdev) &&
 		    drm_dev_enter(&ptdev->base, &cookie)) {
-- 
2.46.2

