Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056845B36CE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5D710ECCC;
	Fri,  9 Sep 2022 11:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4822E10E041
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaX+jqO7khT6sLU/Z1vahzaM2CJY8uytGgQ9w7E85d4=;
 b=J65Z39vrzxX1mn+phSD1gau26o5/njxlv+AYSOt5ykqGUCDQbPmkHsfpsk4rIk7W6l6VVB
 j0SCH9OIXIwl64fy2Z7gc71fl1q+UOylN+ECCZrxTQxDQTIcuzQLjcG5YM2HeP/Xh+uqmh
 S0bnFHYCoMDNVlK6WO3Eoxz3/+FL+74=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-cfzUWoweNvusi9EMWQxA1Q-1; Fri, 09 Sep 2022 07:56:58 -0400
X-MC-Unique: cfzUWoweNvusi9EMWQxA1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F28638164D9;
 Fri,  9 Sep 2022 11:56:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8176F1410F36;
 Fri,  9 Sep 2022 11:56:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 6/6] drm/gma500: Remove unnecessary suspend/resume wrappers
Date: Fri,  9 Sep 2022 13:56:46 +0200
Message-Id: <20220909115646.99920-7-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The psb_runtime_suspend/resume/thaw/freeze/restore functions are all
just 1:1 wrappers around gma_power_suspend/_resume.

Drop these wrappers and use the DEFINE_RUNTIME_DEV_PM_OPS() macro to
define the dev_pm_ops struct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/power.c   | 25 -------------------------
 drivers/gpu/drm/gma500/power.h   |  9 ---------
 drivers/gpu/drm/gma500/psb_drv.c | 10 +---------
 3 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index 5dd291dad4a4..62d2cc1923f1 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -230,28 +230,3 @@ void gma_power_end(struct drm_device *dev)
 {
 	pm_runtime_put(dev->dev);
 }
-
-int psb_runtime_suspend(struct device *dev)
-{
-	return gma_power_suspend(dev);
-}
-
-int psb_runtime_resume(struct device *dev)
-{
-	return gma_power_resume(dev);
-}
-
-int gma_power_thaw(struct device *_dev)
-{
-	return gma_power_resume(_dev);
-}
-
-int gma_power_freeze(struct device *_dev)
-{
-	return gma_power_suspend(_dev);
-}
-
-int gma_power_restore(struct device *_dev)
-{
-	return gma_power_resume(_dev);
-}
diff --git a/drivers/gpu/drm/gma500/power.h b/drivers/gpu/drm/gma500/power.h
index 243b9dd00910..063328d66652 100644
--- a/drivers/gpu/drm/gma500/power.h
+++ b/drivers/gpu/drm/gma500/power.h
@@ -43,9 +43,6 @@ void gma_power_uninit(struct drm_device *dev);
  */
 int gma_power_suspend(struct device *dev);
 int gma_power_resume(struct device *dev);
-int gma_power_thaw(struct device *dev);
-int gma_power_freeze(struct device *dev);
-int gma_power_restore(struct device *_dev);
 
 /*
  * These are the functions the driver should use to wrap all hw access
@@ -54,10 +51,4 @@ int gma_power_restore(struct device *_dev);
 bool gma_power_begin(struct drm_device *dev, bool force);
 void gma_power_end(struct drm_device *dev);
 
-/*
- * GFX-Runtime PM callbacks
- */
-int psb_runtime_suspend(struct device *dev);
-int psb_runtime_resume(struct device *dev);
-
 #endif /*_PSB_POWERMGMT_H_*/
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index aea8876059d8..9168bc620628 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -471,15 +471,7 @@ static void psb_pci_remove(struct pci_dev *pdev)
 	drm_dev_unregister(dev);
 }
 
-static const struct dev_pm_ops psb_pm_ops = {
-	.resume = gma_power_resume,
-	.suspend = gma_power_suspend,
-	.thaw = gma_power_thaw,
-	.freeze = gma_power_freeze,
-	.restore = gma_power_restore,
-	.runtime_suspend = psb_runtime_suspend,
-	.runtime_resume = psb_runtime_resume,
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(psb_pm_ops, gma_power_suspend, gma_power_resume, NULL);
 
 static const struct file_operations psb_gem_fops = {
 	.owner = THIS_MODULE,
-- 
2.37.2

