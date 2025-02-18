Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9986A3AC7E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3A010E779;
	Tue, 18 Feb 2025 23:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YHwYeW+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769AE10E463
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921338; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KAB+ODyFxGhg7B6x99dY/ELB1ZUxT4mKPu1HceEiLZbGFSKNWjggrdYJGFquNuSvUfXaVAI/07+ckaai2Zr8jb9yTlrBaRVpINI4IbsrQHsthbTeThmkhdgF0rDTCs/dYo3CSdZw/g5xhvpd7+KdMmLYBpshaLrIlauw5GEMdog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921338;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xXOQHDyDK3ylLZfTlWzUigjKBktcbj0fWV8yThDx3wA=; 
 b=SC0T7cuumYiDbudXfvebEbIuTjsdTWZ68i99nzQui5PMwjcVjauxJb1yiQ7YZyJscy1755Ht2exz6sKfcoTWN4Q3YqjMgRDjjkspn/v42i6vvkssmkGa7yGEB3W+mqiMPXjBejnMmVgzvmR/ojRjMCfEYnIIXemL9AzQ1Fx5+OY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921338; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=xXOQHDyDK3ylLZfTlWzUigjKBktcbj0fWV8yThDx3wA=;
 b=YHwYeW+G8NwqvIUlXgU7Tl3xjbF/vDtvQq33g0bLvaR2ve1bbmsPlR98L7/Ehi/w
 0PsRn2/aNwdggrxgsQ0VjV0a00pbkmzLaorCCooWmkTkaLMIeB6EsmRXjp6VtqaoMGE
 Gtx9jDeaQ3fUggAJIXJij2KMEb80IthjjMho9gOY=
Received: by mx.zohomail.com with SMTPS id 1739921336488392.7532493423994;
 Tue, 18 Feb 2025 15:28:56 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 3/7] drm/prime: Let drm_prime_pages_to_sg use the
 page_array interface
Date: Tue, 18 Feb 2025 23:25:33 +0000
Message-ID: <20250218232552.3450939-4-adrian.larumbe@collabora.com>
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

Switch to sg_alloc_table_from_page_array_segment() when generating an sgtable
from an array of pages. This is functionally equivalent, but a future commit
will also let us do the same from a memory page xarray.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_prime.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..1549733d3833 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -837,6 +837,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 				       struct page **pages, unsigned int nr_pages)
 {
 	struct sg_table *sg;
+	struct page_array parray = PAGE_ARRAY(pages);
 	size_t max_segment = 0;
 	int err;
 
@@ -848,9 +849,9 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		max_segment = dma_max_mapping_size(dev->dev);
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
-	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-						(unsigned long)nr_pages << PAGE_SHIFT,
-						max_segment, GFP_KERNEL);
+	err = sg_alloc_table_from_page_array_segment(sg, parray, 0, nr_pages, 0,
+						     (unsigned long)nr_pages << PAGE_SHIFT,
+						     max_segment, GFP_KERNEL);
 	if (err) {
 		kfree(sg);
 		sg = ERR_PTR(err);
-- 
2.47.1

