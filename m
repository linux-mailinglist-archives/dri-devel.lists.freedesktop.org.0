Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B43AB0F14
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 11:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89710E9EE;
	Fri,  9 May 2025 09:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Q6ZNHVAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4D5C10E9EE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oS
 HaCqpmVSZUCNlkJRRPH5arZH3pbbqhuy+IBmltDeI=; b=Q6ZNHVAUJ8IupmCb8H
 dJ3Q9RG58rPh6gpSUXue7vnsBvp90tVTwTG4Og33L4JmBvroVgm6x7+YZEIDdPeR
 6pO9QorBkwg69PjdZslWPDzW73Ffei+x+K5tChtz2bBj3DPtRSrnWZ6s+pr0HV3b
 NjJMDhKoiU7k+/rOepkBE0hI4=
Received: from localhost.localdomain (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgA3fmEVzB1oyGRhAA--.7417S4;
 Fri, 09 May 2025 17:34:17 +0800 (CST)
From: oushixiong1025@163.com
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v5 3/3] drm/udl: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
Date: Fri,  9 May 2025 17:34:08 +0800
Message-Id: <20250509093408.611642-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509093408.611642-1-oushixiong1025@163.com>
References: <20250509093408.611642-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgA3fmEVzB1oyGRhAA--.7417S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3urg_uF
 4ftwsrWFZ8u34Dur1IyFy5Zry29a4ruF4IgF4rta4Syw4xtw1jvryIvrs2v3WUKF4rCF9x
 J397XFsxAF4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8YsjUUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQlID2gdxEzAPwAAsR
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
   udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..ce5ae7cacb90 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1

