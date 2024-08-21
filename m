Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5DD95A020
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27DF10E644;
	Wed, 21 Aug 2024 14:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AmOoqp++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E5510E642
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:39:16 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724251152; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lSouNbSOWHtGAFYRRSFtnTS/+7lpmLnYYW6awc3BJzWlaRvlKLCvYrkRIApfiYq8u6SIFlMvaln11y72tjaxPCYBqmo56l50zlrOdALmu5PzF1p+PxJuPXa2uBusMqFCsYneIbJc+OB0qb9wbaxzDwZA2uXHdEUyTC9P10TNhWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724251152;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=X7hMMm58w0Lxs4euGai67p0IMEstJ81Np3QDMu1KXrY=; 
 b=TRPwru0cbS/15fagKBO2xyvTEPMlm8LAw+X82/Qk9f+dr+GNiIqtm+7ZYItHHyVglLt9NCCmrDr5ukMTGG2xhFGpEmtQLABWMXA1JsgHSQy/Cpy5NsO7X6OYJ8PpikRQyCUmCDs1czch/iKhUl+2kF0oLqEm5g+7lNuXg9ifvdk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724251152; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=X7hMMm58w0Lxs4euGai67p0IMEstJ81Np3QDMu1KXrY=;
 b=AmOoqp++hKAhKeYl/NxwBsjC7h40p5qFxeHjEjDaAoTD2z1AlKdg5H5/xusTCnyS
 FrgJoXODvqhiMwwGOnpgH466FWSAE3EuR3ci63EhrXeozHCNvXQ9KsExUfo0x/JTET/
 KbcmdLtAXwNF8S5gbsAeYO66HXW5D2A4rNNEzX2Y=
Received: by mx.zohomail.com with SMTPS id 1724251150579437.46131050444615;
 Wed, 21 Aug 2024 07:39:10 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 boris.brezillon@collabora.com, robh@kernel.org,
 faith.ekstrand@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND 3/5] drm: panthor: add debugfs support in
 panthor_sched
Date: Wed, 21 Aug 2024 11:37:29 -0300
Message-ID: <20240821143826.3720-4-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821143826.3720-1-daniel.almeida@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

In preparation for future patches, add support for debugfs in
panthor_sched.c.

Follow-up patches will make use of debugfs files to control aspects of
the dumping process.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 1 +
 drivers/gpu/drm/panthor/panthor_sched.c | 9 +++++++++
 drivers/gpu/drm/panthor/panthor_sched.h | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb30e119d9bf..bb759baa98bd 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1374,6 +1374,7 @@ static const struct file_operations panthor_drm_driver_fops = {
 static void panthor_debugfs_init(struct drm_minor *minor)
 {
 	panthor_mmu_debugfs_init(minor);
+	panthor_sched_debugfs_init(minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 59c30b311ee9..afd644c7d9f1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3602,3 +3602,12 @@ int panthor_sched_init(struct panthor_device *ptdev)
 	ptdev->scheduler = sched;
 	return 0;
 }
+
+#ifdef CONFIG_DEBUG_FS
+void panthor_sched_debugfs_init(struct drm_minor *minor)
+{
+	struct panthor_device *ptdev =
+		container_of(minor->dev, struct panthor_device, base);
+	struct panthor_scheduler *sched = ptdev->scheduler;
+}
+#endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 9a5b53498dcc..88871f38c1ab 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -8,6 +8,7 @@ struct drm_exec;
 struct dma_fence;
 struct drm_file;
 struct drm_gem_object;
+struct drm_minor;
 struct drm_sched_job;
 struct drm_panthor_group_create;
 struct drm_panthor_queue_create;
@@ -57,4 +58,10 @@ void panthor_sched_resume(struct panthor_device *ptdev);
 void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
 void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_sched_debugfs_init(struct drm_minor *minor);
+#else
+static inline void panthor_sched_debugfs_init(struct drm_minor *minor) {}
+#endif /* CONFIG_DEBUG_FS */
+
 #endif
-- 
2.45.2

