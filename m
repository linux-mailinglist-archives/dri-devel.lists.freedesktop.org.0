Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F300AADBCF
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 11:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FE489FEA;
	Wed,  7 May 2025 09:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="qYFaAZNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C356810E783
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0ZHhP
 /CxGZHtKdJH/7NAAa54AxeBo79z1P920bna1RY=; b=qYFaAZNn7gF6GtNGTi/mA
 Q9m7Nr2KMEhoJGG3GVN3cHH7RjGo7DumsufzB7b8gdwAFN7FaKA8/q1uBjsxmGnJ
 5d7KI1kIEON54EAUIY/OcaEdopSZFIhOjff8aGUe6+WR0VHGx9j3y6dLyVGdV4zq
 WH0s2FqKW3pHb9xHoQBU/M=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wCn0Sw2LBtoPOJREw--.58097S3; 
 Wed, 07 May 2025 17:47:38 +0800 (CST)
From: oushixiong1025@163.com
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v3 2/3] drm/ast: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Wed,  7 May 2025 17:47:27 +0800
Message-Id: <20250507094728.603302-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507094728.603302-1-oushixiong1025@163.com>
References: <20250507094728.603302-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn0Sw2LBtoPOJREw--.58097S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCrWfKr15Gw4rXw1fZwb_yoW3uFgEkF
 10qan3XFWDua4Duw1Iyay5ZryIvr1UurWfJF1Utasxtw47Jr4UZ3409r4jvF1j9F4xZF90
 yw1xWF45AFsakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8b_-PUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQxGD2gbJmF-zwAAsc
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
  ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..b626660e1fd7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
-- 
2.17.1

