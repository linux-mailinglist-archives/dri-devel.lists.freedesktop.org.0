Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE584A2DD8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 11:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0369110EA5B;
	Sat, 29 Jan 2022 10:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jan 2022 07:43:44 UTC
Received: from qq.com (smtpbg458.qq.com [59.36.132.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8839F10F63C;
 Sat, 29 Jan 2022 07:43:44 +0000 (UTC)
X-QQ-mid: bizesmtp38t1643441730t62b498p
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 29 Jan 2022 15:35:25 +0800 (CST)
X-QQ-SSF: 0140000000200090G000B00A0000000
X-QQ-FEAT: G+mSt178IQoTYQN1zQNWO4fWEpa2DjF6LmdbvCkxTJpa6g30cSawiGGPsWRcy
 nSN5/XaF6Hijq/rToZi9VOEKBy34VSLgR4gviRn/x3+ozu64xzhns6OV5jLbY/cTWsOR/9l
 1qo0H/L5m9ltuGRZln+q3CURtPSA7Gnc7gUZCW2iAotyAk7QATiOuMy2KznxJBoLzVGZ6Q9
 qLOAbhFvdq1lIzpNeWlQ8bJQTsOotpi5qp4I/ZTmMLT/wN7LMFt7D707KjGSbZlvNcbrAHB
 qlC+YT2uRY9kTAhUuQ/JTxNuoDx0vTYM/4fE1arW8E89cYhgdPP6XuaEQ276OChAaVO0MZt
 uf004hDt1ZApRHI+d3liKosa2WXnCuDfAMAtZpr
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/2] drm/amd/amdgpu/amdgpu_uvd: Fix forgotten unmap buffer
 object
Date: Sat, 29 Jan 2022 15:35:23 +0800
Message-Id: <20220129073524.31534-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sat, 29 Jan 2022 10:50:33 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 zhanglianjie <zhanglianjie@uniontech.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

after the buffer object is successfully mapped, call amdgpu_bo_kunmap before the function returns.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6f8de11a17f1..9cc23b220537 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -834,6 +834,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
 	handle = msg[2];

 	if (handle == 0) {
+		amdgpu_bo_kunmap(bo);
 		DRM_ERROR("Invalid UVD handle!\n");
 		return -EINVAL;
 	}
@@ -892,6 +893,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
 		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
 	}

+	amdgpu_bo_kunmap(bo);
 	return -EINVAL;
 }

--
2.20.1




