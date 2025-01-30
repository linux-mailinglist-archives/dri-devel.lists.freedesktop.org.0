Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC5A232D6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCFD10E9BE;
	Thu, 30 Jan 2025 17:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kgsFQRXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB3710E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 17:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738258188; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VQAKzV9mcUTO6J8jy5cc+UMQyftB3RHW95WiG7yLlMh06/WLVOAr+LIRuGC6/Fh45zxpHkEJA5dZotRn1YRRkI0SuKWFV2gpUujEPlUnVzDSgKMsbX5ARPmpDAY+JNaurEHatw0ovCXg+7LTRPgYTc1QIPIKlF/a60VjUC4Fu40=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738258188;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oe9yz0LUgW/HyWP7QYNCqzc/hVt9PtaAICLV4Q8wDfo=; 
 b=i9C7pnx4rUKNzocCoYHPAHenweKpOK2qYTYpp4u7ugE0rt0Yk5Rm6R9iQwpECXZzOcXojJiVnWtHvgzPaHt7nhuM3UJ9JPeU0jraJusKZPfEnZE8Y+8RNbxodYZnqNWJyOre9WPTDBuAXdMaZuZON51EwKLUr8/1RpsAqaE7IK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738258188; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=oe9yz0LUgW/HyWP7QYNCqzc/hVt9PtaAICLV4Q8wDfo=;
 b=kgsFQRXk1Pl9A90mfMshBGa9FRinEQx17r3QHzoZYjLCtLmD0libdXyjGuTkebzq
 J2UeyUGrQXry5OE7+TXCc6tCh5doFm9p+WjELyGSdsAHriBGD4+UrfARDVmvAXU9pgs
 D3BHQeGpRlyP1IGJ1RV+BYOmM0FGCQP1ajM7SkmQ=
Received: by mx.zohomail.com with SMTPS id 1738258170262965.1122189634012;
 Thu, 30 Jan 2025 09:29:30 -0800 (PST)
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
Subject: [PATCH v10 5/5] drm/panthor: Fix race condition when gathering fdinfo
 group samples
Date: Thu, 30 Jan 2025 17:28:13 +0000
Message-ID: <20250130172851.941597-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130172851.941597-1-adrian.larumbe@collabora.com>
References: <20250130172851.941597-1-adrian.larumbe@collabora.com>
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

Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
protect access to groups with an xarray lock, which could lead to
use-after-free errors.

Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index f3c6ca4dc11c..6d49b4f40f58 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 	if (IS_ERR_OR_NULL(gpool))
 		return;
 
+	xa_lock(&gpool->xa);
 	xa_for_each(&gpool->xa, i, group) {
 		mutex_lock(&group->fdinfo.lock);
 		pfile->stats.cycles += group->fdinfo.data.cycles;
@@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 		group->fdinfo.data.time = 0;
 		mutex_unlock(&group->fdinfo.lock);
 	}
+	xa_unlock(&gpool->xa);
 }
 
 static void group_sync_upd_work(struct work_struct *work)
-- 
2.47.1

