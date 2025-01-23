Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDCA1ACDF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 23:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0BA10E8B9;
	Thu, 23 Jan 2025 22:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dg9kK+RD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFE310E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 22:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737672839; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OIKsIW1T5TCnyUsqTHVCjnxgp8hXeUQdnWTS6sg+igKiE3QgJxsAZDzAmkWfHIOGTK9WmpZvHcQZ8JpF7Zo3SoT+p2hv9DYPcCFCo+Ffbp2wdd+U9SKmLwagceA4V6wUxyfAWjZoifrhXHJModHyH2PxIBI7l3zAXpvMW557dwU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737672839;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5B2acTEKnWj2iTXPsUJ8KYfflSwtBpaFyWuQX+dPJzY=; 
 b=P2WfsRK5tuKMTJr4KSPZlmFox4c2/4YClLY0SgFoKu78vidhOMwx6qzCz3Jgc55xDirAd8jl/DvQN42OccfqqjhCXcu1LJZvx91mv2MqxORbrRzI/owSXh5sj4axdsGmabkUKgAFjpBU/akI1KMWWJ6f0BSgAX7KTW6DUCn4giU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737672839; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5B2acTEKnWj2iTXPsUJ8KYfflSwtBpaFyWuQX+dPJzY=;
 b=dg9kK+RDDrAI9xt333y5yYrZx9pZbQu0JwKGFVr/pzo8sk42wYkzJcCUjLccEH8l
 iou6Ds7A3NqnJ9kSaxAVP1L6j52eD9Nua1NgRa042CXFL6S6ztKIbpoFGeI10v6+eHx
 YDnK7CfOR+qjRyqOo20D67vGwg7MXGYYlVvOoDlo=
Received: by mx.zohomail.com with SMTPS id 17376728351061015.34983545301;
 Thu, 23 Jan 2025 14:53:55 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v9 2/5] drm/file: Add fdinfo helper for printing regions with
 prefix
Date: Thu, 23 Jan 2025 22:52:59 +0000
Message-ID: <20250123225325.3271764-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
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

This is motivated by the desire of some drivers (eg. Panthor) to print the
size of internal memory regions with a prefix that reflects the driver
name, as suggested in the previous documentation commit.

That means adding a new argument to print_size and making it available for
DRM users.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
---
 drivers/gpu/drm/drm_file.c | 27 +++++++++++++++++++--------
 include/drm/drm_file.h     |  5 +++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index cb5f22f5bbb6..f584abcd13cb 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
-static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+
+void drm_fdinfo_print_size(struct drm_printer *p,
+			   const char *prefix,
+			   const char *stat,
+			   const char *region,
+			   u64 sz)
 {
 	const char *units[] = {"", " KiB", " MiB"};
 	unsigned u;
@@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char *stat,
 		sz = div_u64(sz, SZ_1K);
 	}
 
-	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
+		   prefix, stat, region, sz, units[u]);
 }
+EXPORT_SYMBOL(drm_fdinfo_print_size);
 
 /**
  * drm_print_memory_stats - A helper to print memory stats
@@ -858,15 +864,20 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    enum drm_gem_object_status supported_status,
 			    const char *region)
 {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+	const char *prefix = "drm";
+
+	drm_fdinfo_print_size(p, prefix, "total", region,
+			      stats->private + stats->shared);
+	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
+	drm_fdinfo_print_size(p, prefix, "active", region, stats->active);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		drm_fdinfo_print_size(p, prefix, "resident", region,
+				      stats->resident);
 
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		drm_fdinfo_print_size(p, prefix, "purgeable", region,
+				      stats->purgeable);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index f0ef32e9fa5e..001ae553e8c3 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -494,6 +494,11 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+void drm_fdinfo_print_size(struct drm_printer *p,
+				  const char *prefix,
+				  const char *stat,
+				  const char *region,
+				  u64 sz);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.47.1

