Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BDC46F6CA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C9410E17F;
	Thu,  9 Dec 2021 22:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Thu, 09 Dec 2021 06:51:49 UTC
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 409BB89226;
 Thu,  9 Dec 2021 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JoVvK
 DToD3PXJ0AIpygi6y+ynr/fGiQ/SakOwvbqvD8=; b=TAGzuls7r2B/BIVROco77
 AFgtafDPUuwE2XKEEPy7QPnazcOdRTFJRSqAEdqWtDRAh9pWTzFC4WZOiEflbRKZ
 FFEXqtllTjWTCIWaJw1uZwp3MLjLg4zTFGiSLvzmNvobs1Wt1YKZVXQPUAKsMwjc
 GtS9PsRMPdY5x3q5h0nvPc=
Received: from localhost.localdomain (unknown [218.106.182.227])
 by smtp3 (Coremail) with SMTP id G9xpCgAnkwHlo7Fhcrc6Aw--.49676S4;
 Thu, 09 Dec 2021 14:36:29 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 john.clements@amd.com, candice.li@amd.com, lijo.lazar@amd.com,
 Jinzhou.Su@amd.com, jonathan.kim@amd.com
Subject: [PATCH] drm/amdgpu: Fix reference leak in
 psp_xgmi_reflect_topology_info()
Date: Thu,  9 Dec 2021 14:36:18 +0800
Message-Id: <20211209063618.123473-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgAnkwHlo7Fhcrc6Aw--.49676S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWkZw47XFy7ZryDWrW3ZFb_yoW8ZryrpF
 4rKwnxurWDZr15G3ykKay8Zr1Yvws2gaySyr47uw1I939xJF95WF1UJr45tryrGrWvkF47
 tFy5X39rXFWq9rJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlxRfUUUUU=
X-Originating-IP: [218.106.182.227]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbi6xFkjFXlyeWT7AABsw
X-Mailman-Approved-At: Thu, 09 Dec 2021 22:26:50 +0000
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

In line 1138 (#1), amdgpu_get_xgmi_hive() increases the kobject reference
counter of the hive it returned. The hive returned by
amdgpu_get_xgmi_hive()should be released with the help of
amdgpu_put_xgmi_hive() to balance its kobject reference counter properly.
Forgetting the amdgpu_put_xgmi_hive() operation will result in reference
leak.

We can fix it by calling amdgpu_put_xgmi_hive() before the end of the
function (#2).

1128 static void psp_xgmi_reflect_topology_info(struct psp_context *psp,
1129 			struct psp_xgmi_node_info node_info)
1130 {

1138 	hive = amdgpu_get_xgmi_hive(psp->adev);
	// #1: kzalloc space reference increment
1139 	list_for_each_entry(mirror_adev, &hive->device_list, gmc.xgmi.head) {
1140		struct psp_xgmi_topology_info *mirror_top_info;
1141		int j;

1143		if (mirror_adev->gmc.xgmi.node_id != dst_node_id)
1144			continue;

1146		mirror_top_info = &mirror_adev->psp.xgmi_context.top_info;
1147		for (j = 0; j < mirror_top_info->num_nodes; j++) {
1148			if (mirror_top_info->nodes[j].node_id != src_node_id)
1149				continue;

1151			mirror_top_info->nodes[j].num_hops = dst_num_hops;

1157			if (dst_num_links)
1158				mirror_top_info->nodes[j].num_links = dst_num_links;

1160			break;
1161		}

1163		break;
1164	}
	// #2: missing reference decrement
1165 }

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index c641f84649d6..f6362047ed71 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1162,6 +1162,7 @@ static void psp_xgmi_reflect_topology_info(struct psp_context *psp,
 
 		break;
 	}
+	amdgpu_put_xgmi_hive(hive);
 }
 
 int psp_xgmi_get_topology_info(struct psp_context *psp,
-- 
2.25.1

