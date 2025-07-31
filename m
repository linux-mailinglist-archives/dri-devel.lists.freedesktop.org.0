Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7AB175A9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 19:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814CC10E233;
	Thu, 31 Jul 2025 17:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Qh2rPqu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B02310E233
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 17:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753983353; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d0rphQD1NV5MZLKXTj7YMoCVTtDDKuPZ09MR/OVXU1siMNuX88XwsBGJftaPsagSqGT3OUf2iG+3/JgyW71SmsF/xHg5jHvppfV/LNv6oYFNnGeOaMLAbiKogIx/nFw+PDKzqprz6M/xhW6XYGeTRY/Zb0H7y3E2Ok08k3NNW/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753983353;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GjGC/nyiqA9GedJj8NrTQ/0E23UNoK83tKxKWa7ZgOg=; 
 b=ah3uXx1B2o3HvdWbgzD8X3KhKsELvQ88LY1npiCxxHRoTWE7j7HrfeFMF+xPX5KCeNmE9S5ZlWIrwRtJUH/kRFQVxdhKZYX0Z2kxJcERFb6h5Ii/BX/QMHMObBLTOznANg/UKAMeW/J1iSSKqRnbkknk49V+B+WHIioTDbn12b8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753983353; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=GjGC/nyiqA9GedJj8NrTQ/0E23UNoK83tKxKWa7ZgOg=;
 b=Qh2rPqu5fqQxZvRfaNsZSqptfiAI+IUECXmH126biBY6ofMc6MRTmlyC5Nb6gVFN
 2SwuIZcWDQDHp7FylH7N1EwHptLyB3x4MqRO1jLeQQi0HJMYFkjw6TwrxqEt5u8hVi8
 Sr9crUJwsVJjd4bXjGK/lo5GT9XhHU9VQMOKDmks=
Received: by mx.zohomail.com with SMTPS id 1753983350584774.4939370221103;
 Thu, 31 Jul 2025 10:35:50 -0700 (PDT)
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
Subject: [PATCH] drm/panfrost: Print RSS for tiler heap BO's in debugfs GEMS
 file
Date: Thu, 31 Jul 2025 18:35:31 +0100
Message-ID: <20250731173534.3494324-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
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

Otherwise it would display the virtual allocation size, which is often
much bigger than the RSS.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: e48ade5e23ba ("drm/panfrost: show device-wide list of DRM GEM objects over DebugFS")
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index bb73f2a68a12..da7613801ac0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -432,7 +432,8 @@ static void panfrost_gem_debugfs_bo_print(struct panfrost_gem_object *bo,
 	if (!refcount)
 		return;
 
-	resident_size = bo->base.pages ? bo->base.base.size : 0;
+	resident_size = bo->base.pages ?
+		(bo->is_heap ? bo->heap_rss_size : bo->base.base.size) : 0;
 
 	snprintf(creator_info, sizeof(creator_info),
 		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);

base-commit: 934452cbb16e1e3609ba52acb48c503b9aaf3154
-- 
2.50.0

