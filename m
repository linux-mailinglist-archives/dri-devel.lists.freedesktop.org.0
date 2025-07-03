Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A87AF6FCA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 12:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC9B10E0F6;
	Thu,  3 Jul 2025 10:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="f75RPnYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1805 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jul 2025 10:14:30 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1989810E0F6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+g
 tBkV5sxWzTmS5t97Hf7Y/6Sg1riYapDeZfBHBup0Y=; b=f75RPnYMSwlRbPD9re
 yKj+tWmMMGAjPm27+UYtnZbF8y2zMEmGfZDa342nm8aqUmKM33kWmgfdkqNh7twA
 ycW2Tqbc/MY+QR/mdqGVdL0RpN5rc/qyga5+X6gvH3woqj4BNL/RiVLwOHI0dvgy
 SES2W6YheEYVGDYTSqOvD8siI=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wCnLF41TWZoBEn+CA--.4429S4; 
 Thu, 03 Jul 2025 17:28:22 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH RESEND] drm: Fix potential null pointer dereference issues in
 drm_managed.c
Date: Thu,  3 Jul 2025 17:28:19 +0800
Message-Id: <20250703092819.2535786-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnLF41TWZoBEn+CA--.4429S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyrKrW5ur18KFWUWF1fCrg_yoWDtrg_Ca
 18Xrn3Wr4kCF95GF4qyw13ZryIka1DCF4vvF47tasayry5Jrn2q34UZr45JryDWF1xuF9r
 u3WDAryfArsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRN2-eUUUUUU==
X-Originating-IP: [211.71.28.34]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkAR-bmhmTAAm7wAAsO
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
 drivers/gpu/drm/drm_managed.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index cc4c463daae7..368763d4c24e 100644
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
+	if (dr->node.name) {
+		kfree(dr);
+		return NULL;
+	}
 
 	add_dr(dev, dr);
 
-- 
2.25.1

