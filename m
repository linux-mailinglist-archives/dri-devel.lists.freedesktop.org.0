Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1726A3AC81
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8410E781;
	Tue, 18 Feb 2025 23:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cT44W4Xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBBB10E781
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921350; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nmqVa7cF5xhDoKrRmhZBDJGYT0v38+pBpdExeM7XdrYfG33t8RrDj559mOOlN1XoUUaOboH6DwR0oRuh5bI8TZPXSrAzgJ3O/p6FbaUt0YuUoMXK/X/K17gx1qOYGT/E08mgE/uhSQ/6M4zLBRTaoZDYRTOCnV3jaMLgF2Jv9KM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921350;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VtJM+6VGRnYwpG1okrpvmsoo+QzSvXWf7ZKxTATVhv4=; 
 b=bNxUEARlfyR/n2eH01zRD0BuXaKT8WS0p1R1V6YkVO+GRiticJW3WFCaHwTV7ircuY2lOvX9Lm+w/tWvlQzjsIUI+gBL5eREisOeYNwASA+Ht9FHijUZ59icKx8vEH0Tty21YcvrRwGlUoB4fP20KH20Q/wTyq8mfDoNXaq012k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921350; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VtJM+6VGRnYwpG1okrpvmsoo+QzSvXWf7ZKxTATVhv4=;
 b=cT44W4XtMz3+QJyLmTynv+wH6fRh/+jQdWmJJo+rVT8kV39GlTeWbFF4enqIuUFv
 b+CwdXdHKIa/jvfjNgOQIX8btggOULKtIChLy5iSLOazqNSz+PT36bw4KPhMHLRdY/Y
 tIBjX9Gv1EF/mOb7SuK38JzAsTuqr8AdsnuVNtQo=
Received: by mx.zohomail.com with SMTPS id 1739921347867297.0981931852451;
 Tue, 18 Feb 2025 15:29:07 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 7/7] drm/panfrost/panthor: Take sparse objects into
 account for fdinfo
Date: Tue, 18 Feb 2025 23:25:37 +0000
Message-ID: <20250218232552.3450939-8-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
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

Because of the alternative definition of the 'pages' field in shmem after adding
support for sparse allocations, the logic for deciding whether pages are
available must be expanded.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 4 +++-
 drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 0cda2c4e524f..ced2fdee74ab 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -200,7 +200,9 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (bo->base.base.import_attach || bo->base.pages)
+	if (bo->base.base.import_attach ||
+	    (!bo->base.sparse && bo->base.pages) ||
+	    (bo->base.sparse && !xa_empty(&bo->base.xapages)))
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	if (bo->base.madv == PANFROST_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..8dbaf766bd79 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -155,7 +155,9 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (bo->base.base.import_attach || bo->base.pages)
+	if (bo->base.base.import_attach ||
+	    (!bo->base.sparse && bo->base.pages) ||
+	    (bo->base.sparse && !xa_empty(&bo->base.xapages)))
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	return res;
-- 
2.47.1

