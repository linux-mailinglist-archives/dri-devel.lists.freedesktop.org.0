Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18626AB08CF
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BB810E250;
	Fri,  9 May 2025 03:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="AVIMuKl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 578E410E250
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 03:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ph
 KIn8xb8XbVXQGCQjiCBCqZi+z6O78hdDfrHAQJV6E=; b=AVIMuKl00lo1q/Lms4
 6Y73Tu1IXKmKAiaeoBIWQYYQjDsD4fYLa3zisZL3qq7+UrslFaoJMIEMNyrJTZZw
 M++WvXioo000IZ4JMpExwicWJXKQOwUydXFU1qgzBjXMu/YiKVkYLJ1Wab8N6Hn7
 njNgcuCvGCFM6Wb+JVRfq9zmI=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wAXdfCKdB1o2Hx1AA--.7654S4; 
 Fri, 09 May 2025 11:20:45 +0800 (CST)
From: oushixiong1025@163.com
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v4 3/3] drm/udl: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Fri,  9 May 2025 11:20:40 +0800
Message-Id: <20250509032040.185730-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509032040.185730-1-oushixiong1025@163.com>
References: <20250509032040.185730-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXdfCKdB1o2Hx1AA--.7654S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3Zwb_CF
 4ftrsrWFZ8uw1Duw1xAFW5Ary29a4ruF48WF47ta4Syw4xJw1j9ry0vrWvv3WUKF45CF9x
 J397XrsxAr4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8OAw3UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwNID2gdblKwZQAAs7
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
index 1922988625eb..9c385771b483 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1

