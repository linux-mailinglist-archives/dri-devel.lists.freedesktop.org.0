Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23B6206AF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 03:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C05D10E429;
	Tue,  8 Nov 2022 02:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Tue, 08 Nov 2022 02:20:06 UTC
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B610E427
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fTmYQ
 SBCeJZ+jM+atfFLIxU00NDSX7NxTKUJz3H2Sn0=; b=VFIEKwwTAA0YHBfSI54Dx
 9QDTCfcxBzUuray4YCnzjFj1fX3PFM0TKM5vqW5Hn/IfFRl4ZiZZf47HXk+3o6PX
 5RC9HAbOiIbsEcmxDf+OJVWkE1UrrNtoQC4cijXwZNlxDBOL7uaRWa2JZlwISRWh
 rhwlyYymnPRjwGb4kNxAEA=
Received: from localhost.localdomain (unknown [114.221.197.143])
 by smtp9 (Coremail) with SMTP id DcCowACnr+_4uGlj4AdmJg--.14492S2;
 Tue, 08 Nov 2022 10:03:56 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/gem-shmem: When drm_gem_object_init failed,
 should release object
Date: Tue,  8 Nov 2022 10:03:21 +0800
Message-Id: <20221108020321.911-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowACnr+_4uGlj4AdmJg--.14492S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1DAFWrKr13Jr4Dur1DAwb_yoW3WFX_Ga
 47WFnrWr4q9w1Du3W3Aw4avryF9F1DurZYva4jgFWfAr4DAw1DWryxX3s8ur17XF45tF9x
 t3Z7Xr4xZrs29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRG2NM7UUUUU==
X-Originating-IP: [114.221.197.143]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiGA2zUVv2jPX30wAAsH
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
Cc: dri-devel@lists.freedesktop.org, ChunyouTang <tangchunyou@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when goto err_free, the object had init, so it should be release when fail.

Signed-off-by: ChunyouTang <tangchunyou@163.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..2e5e3207355f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -104,10 +104,10 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 
 	return shmem;
 
-err_release:
-	drm_gem_object_release(obj);
 err_free:
 	kfree(obj);
+err_release:
+	drm_gem_object_release(obj);
 
 	return ERR_PTR(ret);
 }
-- 
2.25.1

