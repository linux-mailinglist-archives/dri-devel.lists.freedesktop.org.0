Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A685C4AD336
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B3510E545;
	Tue,  8 Feb 2022 08:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C10210E22C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:15:28 +0000 (UTC)
X-QQ-mid: bizesmtp42t1644308115tsb4qzql
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 08 Feb 2022 16:14:48 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000C00A0000000
X-QQ-FEAT: hR9GyqeohSjJ8poqEfqqfnQTm/zs80/Vvjqy3T/4wc9YCPiMLqXp+q7NtT8gq
 rBF86DoPBxWUSHh6M7tGkbrjEV4exoR3cDiP+Fgqnvjt7QYXsJhFmDrNC+5/blVoVT6j2mr
 q6rdCYI5tCYGFAUFA5vzkdrIyLJ3oeVWdq2BEVrlzvhcPjuw3wthJqKfGBCRsBCMWYA2K6s
 sTpCm9fIx/jWgLCSiSHL/FvnWMP83g6UDg5ugiohu+Qs1hYW6T/0i0qE3SAAkkH02Y6jk7W
 fMeALM6EAU3sLiFqF8tApujMI2Kv1Ridm4xcWinHPeONPg+8ek3CYgFKkA/PJTfvCKy3iS1
 5n7VLvRzEMOx2A4YD+xxVB06Qkazk9bdE7ybf/qqYf014oxXAs=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v4 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
Date: Tue,  8 Feb 2022 16:14:43 +0800
Message-Id: <20220208081443.28210-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: David Airlie <airlied@linux.ie>, PanXinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhanglianjie <zhanglianjie@uniontech.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

after the buffer object is successfully mapped, call radeon_bo_kunmap before the function returns.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
Reviewed-by: Christian König <christian.koenig@amd.com>

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 377f9cdb5b53..0558d928d98d 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 	handle = msg[2];

 	if (handle == 0) {
+		radeon_bo_kunmap(bo);
 		DRM_ERROR("Invalid UVD handle!\n");
 		return -EINVAL;
 	}
@@ -559,12 +560,10 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 		return 0;

 	default:
-
 		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
-		return -EINVAL;
 	}

-	BUG();
+	radeon_bo_kunmap(bo);
 	return -EINVAL;
 }

--
2.20.1



