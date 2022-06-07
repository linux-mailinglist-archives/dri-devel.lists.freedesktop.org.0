Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D9E53F724
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 09:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76E012AE94;
	Tue,  7 Jun 2022 07:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 07:28:07 UTC
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29F2312AE94;
 Tue,  7 Jun 2022 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gvH36
 QjK8hx1fii/eQMosYL0OpSsVFi8yqDxaN79F00=; b=jkxKeMQalPoRSfYYWFa/3
 aVQSwDn2x0fzsZ/+IACmfp2cxZG4FlFcwM/dJbRaFv00QJE8hjuxlM+nLYOuRff3
 nJ+u3YtkaA2SXeULfZxqoyXmskS4of6ObHWJybfKFpwlCueLqvJWpjFqXGT903iI
 JmLGvLVn4ZdahDD4DZOc9U=
Received: from localhost.localdomain (unknown [123.112.69.106])
 by smtp3 (Coremail) with SMTP id G9xpCgCnHGhm+p5i8kyGHQ--.37666S4;
 Tue, 07 Jun 2022 15:12:45 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 john.clements@amd.com, candice.li@amd.com, Likun.Gao@amd.com
Subject: [PATCH] drm/amdgpu: Fix reference leak in
 psp_xgmi_reflect_topology_info()
Date: Tue,  7 Jun 2022 15:12:34 +0800
Message-Id: <20220607071234.431245-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgCnHGhm+p5i8kyGHQ--.37666S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4xWF1rKry3try8XFyrWFg_yoWDZrg_Gr
 WUJFy3A39xCr1qgw1IyrWaq3srKFsa9rZ7Gr1ftFsaq34UZayrAryUGr1kXw48urs7Casr
 ZF1YgF1UZwnxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREsjjJUUUUU==
X-Originating-IP: [123.112.69.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbi6w0ZjFXl16EqCwAAsU
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
Cc: Jianglei Nie <niejianglei2021@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_get_xgmi_hive() increases the kobject reference counter of the
hive it returned. The hive returned by amdgpu_get_xgmi_hive() should be
released with the help of amdgpu_put_xgmi_hive() to balance its kobject
reference counter properly. Forgetting the amdgpu_put_xgmi_hive()
operation will result in reference leak.

We can fix it by calling amdgpu_put_xgmi_hive() before the end of the
function.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index e9411c28d88b..7b3a78da1684 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1292,6 +1292,7 @@ static void psp_xgmi_reflect_topology_info(struct psp_context *psp,
 
 		break;
 	}
+	amdgpu_put_xgmi_hive(hive);
 }
 
 int psp_xgmi_get_topology_info(struct psp_context *psp,
-- 
2.25.1

