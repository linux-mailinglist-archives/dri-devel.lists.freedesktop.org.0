Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7C9EDD2F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 02:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126710E0CC;
	Thu, 12 Dec 2024 01:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="iY7o/4DF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8510E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 01:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1733968049; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=Kqj9qK6jIh62y524FbW8f6U5KVgY1gRKxB0ZmR0iD0E=;
 b=iY7o/4DFJhP/00+MRRkbwQpndOvXWWAfuZfdqGxk7Dgnr1maPp1rvXaLzIwYZOR75Dn8E/i2DC8PxdRkAhE1MjvEQ84RQvfAee8w6tmY1l7lDuEc24zgbbN2TcxN5NdPjQmE05nWf6Jb9KVFyXw8sQNSXBlsw+8xlWpFlRUTpfY=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WLJtAS3_1733968038 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 12 Dec 2024 09:47:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: use swap() in update_phy_id_mapping()
Date: Thu, 12 Dec 2024 09:47:17 +0800
Message-Id: <20241212014717.14286-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use existing swap() function rather than duplicating its implementation.

./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c:185:47-48: WARNING opportunity for swap().
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c:125:53-54: WARNING opportunity for swap().

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=12335
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 309c7999faa6..6fdc306a4a86 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -120,11 +120,8 @@ static void update_phy_id_mapping(struct amdgpu_device *adev)
 	for (idx = connector_cnt; idx > 1 ; idx--) {
 		for (idx_2 = 0; idx_2 < (idx - 1); idx_2++) {
 			if (sort_connector[idx_2]->dc_link->link_enc_hw_inst >
-				sort_connector[idx_2 + 1]->dc_link->link_enc_hw_inst) {
-				aconnector = sort_connector[idx_2];
-				sort_connector[idx_2] = sort_connector[idx_2 + 1];
-				sort_connector[idx_2 + 1] = aconnector;
-			}
+			    sort_connector[idx_2 + 1]->dc_link->link_enc_hw_inst)
+				swap(sort_connector[idx_2], sort_connector[idx_2 + 1]);
 		}
 	}
 
@@ -180,11 +177,8 @@ static void update_phy_id_mapping(struct amdgpu_device *adev)
 						}
 					}
 
-					if (swap) {
-						aconnector = sort_connector[j];
-						sort_connector[j] = sort_connector[j + 1];
-						sort_connector[j + 1] = aconnector;
-					}
+					if (swap)
+						swap(sort_connector[j], sort_connector[j + 1]);
 				}
 			}
 
-- 
2.32.0.3.g01195cf9f

