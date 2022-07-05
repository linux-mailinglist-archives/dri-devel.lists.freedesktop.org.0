Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2537566F27
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 15:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B3C113C3A;
	Tue,  5 Jul 2022 13:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92358113C3F;
 Tue,  5 Jul 2022 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gXy/Y
 z4KCId8SFCAfrVNi5PuBJCfR9XEK9tE4hr3UMk=; b=fp/zwUlITCGkn7mKyHq76
 3krFugiAzVymSNKB6opO8r/aqqAyx0KMRPca+hoLlf7cD0vyKh3WvQixS6wt7Hu+
 StnA0YOMVgm4NIf7pn3PqgsfLAKdAvoeYNclnWAJcPpN8OpiIDc1U5AImG+CbnyU
 x6VAsFgL4FQSIbf8K3VHRQ=
Received: from localhost.localdomain (unknown [123.112.69.106])
 by smtp5 (Coremail) with SMTP id HdxpCgBXgTLcO8RiQtNIMg--.52057S4;
 Tue, 05 Jul 2022 21:25:55 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: fix a use-after-free in
 nouveau_gem_prime_import_sg_table()
Date: Tue,  5 Jul 2022 21:25:46 +0800
Message-Id: <20220705132546.2247677-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgBXgTLcO8RiQtNIMg--.52057S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy7tFy5KFyfJFWrJF47urg_yoWkXwb_ur
 yxZFnxWw1kKFs8ArsFy34UAFy29ay8XrWkuas2qF95t39xJr1ruFW7Zr18u34kurWIgr9x
 G3Wqvas0krn7WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRGsj8UUUUUU==
X-Originating-IP: [123.112.69.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/xtbBOQM1jF-POWd5wwAAs3
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
Cc: nouveau@lists.freedesktop.org, Jianglei Nie <niejianglei2021@163.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
back to the caller. On failures, ttm will call nouveau_bo_del_ttm() and
free the memory.Thus, when nouveau_bo_init() returns an error, the gem
object has already been released. Then the call to nouveau_bo_ref() will
use the freed "nvbo->bo" and lead to a use-after-free bug.

We should delete the call to nouveau_bo_ref() to avoid the use-after-free.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 347488685f74..9608121e49b7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -71,7 +71,6 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 	ret = nouveau_bo_init(nvbo, size, align, NOUVEAU_GEM_DOMAIN_GART,
 			      sg, robj);
 	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
 		obj = ERR_PTR(ret);
 		goto unlock;
 	}
-- 
2.25.1

