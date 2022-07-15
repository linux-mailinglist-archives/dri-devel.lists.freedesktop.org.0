Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD9575D47
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2A611B892;
	Fri, 15 Jul 2022 08:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Fri, 15 Jul 2022 08:22:39 UTC
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id C78FA11B88D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ylZbQ
 kKEt13nmfaDDRGzIrJAEYUE/3iMhujoDivUROM=; b=j0Rgt+3GUkvpcdn+QzIOt
 a2XZLL4DgR2YJr+ZXaSr9jEobDen0rRp9MXbubBj7Kt0D9mbInUDPfY+DMHkcafu
 E3Mv8CWtXGJ2DhaIkh/fcww4dWdqdLU9nPsFbfM1wXG12lJ+NNBVDUsiy3EEN1jA
 U6NR/HGH5Z2YZyq/+j85l8=
Received: from 163.com (unknown [123.113.245.47])
 by smtp4 (Coremail) with SMTP id HNxpCgAnzsY8INFixKe+Og--.26849S2;
 Fri, 15 Jul 2022 16:07:25 +0800 (CST)
From: "ZhiJie.zhang" <botton_zhang@163.com>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 Felix.Kuehling@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH v1 1/1] kfd: fixed memleak about release topology
Date: Fri, 15 Jul 2022 16:07:21 +0800
Message-Id: <20220715080721.1477324-1-botton_zhang@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HNxpCgAnzsY8INFixKe+Og--.26849S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw48uF1rKr1fuFyrGryrXrb_yoW3Gwb_Ca
 1kXr9xGr13u3Wqyw1S9w4fXryI9w4YvF48WF1fK3Wfury7Xr18Cr9rXr95Zr1fuFnrAFZr
 Kr1vgr4UJ3ZxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREYhF3UUUUU==
X-Originating-IP: [123.113.245.47]
X-CM-SenderInfo: xerw30xqb2xtlqj6il2tof0z/xtbBPR0-mGAZBhMx5AAAs+
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
Cc: botton_zhang@163.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memleak will happend that reload module due to ignore kfree when release topology

Signed-off-by: ZhiJie.zhang <botton_zhang@163.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 8d50d207cf66..8b86f56bd50c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -872,6 +872,7 @@ static void kfd_topology_release_sysfs(void)
 		}
 		kobject_del(sys_props.kobj_topology);
 		kobject_put(sys_props.kobj_topology);
+		kfree(sys_props.kobj_topology);
 		sys_props.kobj_topology = NULL;
 	}
 }
-- 
2.34.1

