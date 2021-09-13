Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485C408750
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 10:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D66EC91;
	Mon, 13 Sep 2021 08:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 711 seconds by postgrey-1.36 at gabe;
 Mon, 13 Sep 2021 08:46:10 UTC
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0706D6EC9A;
 Mon, 13 Sep 2021 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (ip5f5aef84.dynamic.kabel-deutschland.de
 [95.90.239.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 78D0061E5FE33;
 Mon, 13 Sep 2021 10:34:19 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu: Demote TMZ unsupported log message from
 warning to info
Date: Mon, 13 Sep 2021 10:34:11 +0200
Message-Id: <20210913083411.11215-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913083411.11215-1-pmenzel@molgen.mpg.de>
References: <20210913083411.11215-1-pmenzel@molgen.mpg.de>
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

As the user cannot do anything about the unsupported Trusted Memory Zone
(TMZ) feature, do not warn about it, but make it informational, so
demote the log level from warning to info.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index c4c56c57b0c0..bfa0275ff5d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -598,7 +598,7 @@ void amdgpu_gmc_tmz_set(struct amdgpu_device *adev)
 		break;
 	default:
 		adev->gmc.tmz_enabled = false;
-		dev_warn(adev->dev,
+		dev_info(adev->dev,
 			 "Trusted Memory Zone (TMZ) feature not supported by hardware\n");
 		break;
 	}
-- 
2.33.0

