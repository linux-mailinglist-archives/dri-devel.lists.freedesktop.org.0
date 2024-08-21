Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D634595A021
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A3C10E643;
	Wed, 21 Aug 2024 14:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JEclViUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF610E643
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:39:21 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724251156; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=O8cn80QB488S0hspsD2N8iSIc7nblvantThsQYfOTt5e8kO9WMEE6biVCNPZUfvhMK7s4ZyEpvA67k2Brfw9fcM1tt4/lOGyjSjJAEmZtDfjLMJvoZxHWDIANC250FrLo+xv2nnbv9osR0GeCbrWH0fJE+4fKqEcQNQ8JgVeoHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724251156;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PCQWaHskTaBykjAdT2PUbBbFw9GDVrxCBS6/qxN19Uc=; 
 b=ktg2D90Zx+fb2Jgif6jVIuH4+gP6k/gefr2yk+qpO79MrYfFfN3AhMZafQG4PcpgQypHe+pO6zWkc/IAUUxaPeRr+YiegpNqZ9krRVfQRiesnkz+iUT/rqTEF8gbuVRjftCnbiv3UaOeXL3bgFgDWtFfhIBHV5GdlUrdlLGeIG8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724251156; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PCQWaHskTaBykjAdT2PUbBbFw9GDVrxCBS6/qxN19Uc=;
 b=JEclViUo3WR9O+C0gY/QCSDrjvBG0k44yqOSJ/q7XtNnZFNqXAtY8LXgYYl8+qcY
 Sg2Es1IkE02R1mR6/b2YyordUghelPCdvjkotxZMESrBZ25hhMDJSh1t2uTpaoGcnHa
 VZDz+o0I0dtDA7U3Rngp7FuBUFHsKSizZbioll1s=
Received: by mx.zohomail.com with SMTPS id 1724251153593788.1214301888147;
 Wed, 21 Aug 2024 07:39:13 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 boris.brezillon@collabora.com, robh@kernel.org,
 faith.ekstrand@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND 4/5] drm: panthor: add debugfs knob to dump
 successful jobs
Date: Wed, 21 Aug 2024 11:37:30 -0300
Message-ID: <20240821143826.3720-5-daniel.almeida@collabora.com>
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

It can be advantageous for userspace to have access to successful jobs.

Allow this as an opt-in through a debugfs file.

Note that the devcoredump infrastructure will discard new dumps if a
previous dump hasn't been read. A future patch will add support for
multi-job dumps which will work around this limitation.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index afd644c7d9f1..ea2696c1075a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -10,6 +10,7 @@
 
 #include <linux/build_bug.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-resv.h>
@@ -317,6 +318,9 @@ struct panthor_scheduler {
 		 */
 		struct list_head stopped_groups;
 	} reset;
+
+	/** @dump_successful_jobs: whether to dump successful jobs through coredumpv */
+	bool dump_successful_jobs;
 };
 
 /**
@@ -2946,6 +2950,16 @@ queue_run_job(struct drm_sched_job *sched_job)
 	queue->iface.input->extract = queue->iface.output->extract;
 	queue->iface.input->insert = job->ringbuf.end;
 
+	if (sched->dump_successful_jobs) {
+		struct panthor_core_dump_args core_dump_args = {
+			.ptdev = ptdev,
+			.group_vm = job->group->vm,
+			.group = job->group,
+		};
+
+		panthor_core_dump(&core_dump_args);
+	}
+
 	if (group->csg_id < 0) {
 		/* If the queue is blocked, we want to keep the timeout running, so we
 		 * can detect unbounded waits and kill the group when that happens.
@@ -3609,5 +3623,8 @@ void panthor_sched_debugfs_init(struct drm_minor *minor)
 	struct panthor_device *ptdev =
 		container_of(minor->dev, struct panthor_device, base);
 	struct panthor_scheduler *sched = ptdev->scheduler;
+
+	debugfs_create_bool("dump_successful_jobs", 0644, minor->debugfs_root,
+			    &sched->dump_successful_jobs);
 }
 #endif /* CONFIG_DEBUG_FS */
-- 
2.45.2

