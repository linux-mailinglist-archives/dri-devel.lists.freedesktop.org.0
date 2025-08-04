Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF75B19A3C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 04:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBCB10E0C2;
	Mon,  4 Aug 2025 02:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="kyn4r5eV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C4B810E0C2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 02:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ly
 ROzPVWAeV9XHHucx6h5OdtaN0VcdqdCQNP2WQJkMc=; b=kyn4r5eVbMOy6B5k1q
 DuVNR1hlv1rp7VARW+hrvODZ1sh3ZipSxi72JJxnzWB2jqNfNp50oKdcttJxUt8y
 rlqqO4F49lBOcXgQcFBXbGA2UTtuiw4olOKrGp43aZjYzeFIwKf0NVAGaeC9a/ID
 wHBsI8zrvAhAeK5W8z8yB9yQY=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wA3h83nGJBocS5mJg--.9947S4; 
 Mon, 04 Aug 2025 10:20:24 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, Haoxiang Li <haoxiang_li2024@163.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm: Fix potential null pointer dereference issues in
 drm_managed.c
Date: Mon,  4 Aug 2025 10:20:21 +0800
Message-Id: <20250804022021.78571-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3h83nGJBocS5mJg--.9947S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyrKrW5ur18KFWUWF1fCrg_yoWkXwc_u3
 W8X3s3Wr4kCF95GF4qy3W3ZryIka1DuF4vvFW7tF9ayrW5Jr10q348Zr45JryDWF1xuF9x
 u3WDAryfZrsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt6wZUUUUUU==
X-Originating-IP: [211.71.28.34]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiMwmfbmiQFKqiFwAAs4
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

Add check for the return value of kstrdup_const() in drm_managed.c
to prevent potential null pointer dereference.

Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- Modify a fix error. Thanks, Dmitry!
---
 drivers/gpu/drm/drm_managed.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index cc4c463daae7..e34b8dcde48c 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -151,6 +151,11 @@ int __drmm_add_action(struct drm_device *dev,
 	}
 
 	dr->node.name = kstrdup_const(name, GFP_KERNEL);
+	if (!dr->node.name) {
+		kfree(dr);
+		return -ENOMEM;
+	}
+
 	if (data) {
 		void_ptr = (void **)&dr->data;
 		*void_ptr = data;
@@ -236,6 +241,10 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 		return NULL;
 	}
 	dr->node.name = kstrdup_const("kmalloc", gfp);
+	if (!dr->node.name) {
+		kfree(dr);
+		return NULL;
+	}

 	add_dr(dev, dr);
 
-- 
2.25.1

