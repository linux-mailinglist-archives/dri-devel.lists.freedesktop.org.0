Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5F6206B6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 03:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5C510E42F;
	Tue,  8 Nov 2022 02:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1705D10E428
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 02:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fTmYQ
 SBCeJZ+jM+atfFLIxU00NDSX7NxTKUJz3H2Sn0=; b=YyL2PzPfcvnXVarIl4QJj
 4dBqKc2GU/imeFd/wHI0SQPwzYnbDfWoI8gZ/4lXWPpj/cEPivLpZdGa++mKNNBT
 plBuSoDVP1eGcmTQmSlZYL5pej0M1rUXQwuI9J+hHBRzC3W660IFuhqL21jNzU5O
 l4MzebAmVHR4KQrQh/deVI=
Received: from localhost.localdomain (unknown [114.221.197.143])
 by smtp12 (Coremail) with SMTP id EMCowADXE+AUvmlj05P9Ag--.20S2;
 Tue, 08 Nov 2022 10:25:45 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/gem-shmem: When drm_gem_object_init failed,
 should release object
Date: Tue,  8 Nov 2022 10:25:13 +0800
Message-Id: <20221108022513.1037-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowADXE+AUvmlj05P9Ag--.20S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1DAFWrKr13Jr4Dur1DAwb_yoW3WFX_Ga
 47WFnrWr4q9w1Du3W3Aw4avryF9F1DurZYva4jgFWfAr4DAw1DWryxX3s8ur17XF45tF9x
 t3Z7Xr4xZrs29jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRZL0YPUUUUU==
X-Originating-IP: [114.221.197.143]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiYw6zUVaEMJL15wAAst
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

