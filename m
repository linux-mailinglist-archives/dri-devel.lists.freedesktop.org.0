Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F208BA70ED2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 03:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4787E10E643;
	Wed, 26 Mar 2025 02:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Pz4wy852";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA3710E642
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 02:15:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742955329; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AVIT6ySTRQ1Imu+ucy2Dzhyb2FJkiCe7K5I0YwNBjY9UMzzBDykyCx6iBeYN7+MLUSWLbSzQqtdBG6i5dKKxMaziyiinQD6rD4Y248131FLNKSPIeHaIN1QgspIkBoMXE1hWw80vmVRf+wpk0VYs7TUsAolZboxx7Ru4VD8pKNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742955329;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=N6EeRE7HqfdBtYDSzkFIhVK4YQkzAdXLdg8zrxDgL4k=; 
 b=i7CpF8tzro9wd8czMBVwYXeuIEk/xDMTSBOuxETs8FabCwQkTjLSyvBfJvEDlcFsOuJeqM1sRTNtUG2v6L+h7SmnmGqwHAnraNhBG0q07eri7LZCLPU3eXYpu5iLEbvTHv52QBp/houtDiGEiw8g2vgY6mGSn9sfGU1PKZs+31s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742955329; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=N6EeRE7HqfdBtYDSzkFIhVK4YQkzAdXLdg8zrxDgL4k=;
 b=Pz4wy852f6C+t8RXrYy3l5Vn6wYcFD3Ph0iCOiBCmpooyplmEaumi7VpBPRyT53T
 DlhtZ0C59AHLM1QQz4PSLjvCM+5Gwnpk4OL0pq3UxUWGFYSRgvQGAtM+nklik+Nuz3K
 TT6Y5T58EQwh6CFAN+P4PbCWY/EUibBbgSVlftaY=
Received: by mx.zohomail.com with SMTPS id 1742955327646847.7799386101219;
 Tue, 25 Mar 2025 19:15:27 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 5/6] drm/shmem: Add a helper to check object's page
 backing status
Date: Wed, 26 Mar 2025 02:14:25 +0000
Message-ID: <20250326021433.772196-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326021433.772196-1-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
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

Provide a helper function that lets shmem API users know whether a given
object is backed by physical pages, or else in the case of a sparse
shmem object, at least one of them is populated.

The obvious user is fdinfo, which needs to know an object's resident
status.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 18 ++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 1bf33e5a1c4c..79ac7c7c953f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -1033,6 +1033,24 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+/**
+ * drm_gem_shmem_is_populated - Tell whether the shem object is backed by
+ *                 at least one page of physical memory
+ * @shmem: shmem GEM object
+ *
+ * Returns:
+ * A boolean, where the 'true' value depends on at least one page being preset
+ * in a sparse object's xarray, or all the shmem file pages for PRIME buffers
+ * and regular shmem objects.
+ */
+bool drm_gem_shmem_is_populated(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->base.import_attach ||
+		(!shmem->sparse && shmem->pages) ||
+		(shmem->sparse && !xa_empty(&shmem->xapages)));
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_is_populated);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index cbe4548e3ff6..60d2b8ef230b 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -302,6 +302,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 
+bool drm_gem_shmem_is_populated(struct drm_gem_shmem_object *shmem);
+
 /**
  * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
  *
-- 
2.48.1

