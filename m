Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E2ABE215
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2710E594;
	Tue, 20 May 2025 17:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jv7+NfYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA0A10E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 17:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747763237; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NNKmIYRlz+wfUyONP1y/b8hrHc5gwM7i7JFQj2hWLJv9tQkWKJb/c7oGs13+gRiIbUI6YHoG8VZQQz+nYcHfAdoXhJ1LBoofOsu9LECP3DW+/p1WAemW9j6HGrIkziT17Y5+FWnSQTVfsoKb/7vE9wbLs90q8zFjq9Lc4PRVlbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747763237;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WRfpZGJlL9Qza01ry7Cfa5LPqPZaie7y/lkYoI2K6Gk=; 
 b=WzlBkJfU+Oatp3BonubW5v5nTMivX3tMqmbOPpMBq4QdRP3EPAXbr7Qhk+5jEb7oIJsFr3PZJDo+0Az0xTJfsHf7Fz9oclVjxum+o3Hwbczo0NWKPsNUeC3svnjmVijROJxp8H2zNEPb6TTZJQwx4bwzYAMykBf57lRAyburi4c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763237; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WRfpZGJlL9Qza01ry7Cfa5LPqPZaie7y/lkYoI2K6Gk=;
 b=jv7+NfYpZDLJlW6xqji6BiO0RBUHKX/DPvloumOx6v4WHGV4VihOhf6ligeN3S4U
 NwDfim8Gc8WqNokpwQyAxN8UrAfLiRHoYCkyBIuBeNODF8U3HCsA48YhKoyfjYByBuP
 om5TPw8bwQPQ/tLr03SfRh97duVBJK+vN11QhmtE=
Received: by mx.zohomail.com with SMTPS id 1747763236840656.4050429263883;
 Tue, 20 May 2025 10:47:16 -0700 (PDT)
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
Subject: [PATCH v3 2/5] drm/panfrost: Internally label some BOs
Date: Tue, 20 May 2025 18:43:59 +0100
Message-ID: <20250520174634.353267-3-adrian.larumbe@collabora.com>
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

Perfcnt samples buffer is not exposed to UM, but we would like to keep
a tag on it as a potential debug aid.

PRIME imported GEM buffers are UM exposed, but since the usual Panfrost
UM driver code path is not followed in their creation, they might remain
unlabelled for their entire lifetime, so a generic tag was deemed
preferable. The tag is assigned before a UM handle is created so it
doesn't contradict the logic about labelling internal BOs.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 10 ++++++++++
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 4c5be7ccc9cc..04483d5fb45d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -305,6 +305,16 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 	bo = to_panfrost_bo(obj);
 	bo->noexec = true;
 
+	/*
+	 * We assign this generic label because this function cannot
+	 * be reached through any of the Panfrost UM driver-specific
+	 * code paths, unless one is given by explicitly calling the
+	 * SET_LABEL_BO ioctl. It is therefore preferable to have a
+	 * blanket BO tag that tells us the object was imported from
+	 * another driver than nothing at all.
+	 */
+	panfrost_gem_internal_set_label(obj, "GEM PRIME buffer");
+
 	return obj;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 52befead08c6..563f16bae543 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -111,6 +111,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_put_mapping;
 	perfcnt->buf = map.vaddr;
 
+	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
+
 	/*
 	 * Invalidate the cache and clear the counters to start from a fresh
 	 * state.
-- 
2.48.1

