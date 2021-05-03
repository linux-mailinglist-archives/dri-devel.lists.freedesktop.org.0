Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE3371A37
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014436E96F;
	Mon,  3 May 2021 16:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF2D6E971;
 Mon,  3 May 2021 16:38:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 426A2613C6;
 Mon,  3 May 2021 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059895;
 bh=+HgmHTOTaMq1E0gDxXCL9uXYquSbuU8ATcw7dyeRPWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p/Th7vVD2W6755jh2wLGo0262c7smoK6YAfSwaRUf4EYAF7fiy2T1t5qwHD4F4RtI
 PlVny9bigcHQOFEhddWOiSZGz331e6SmZebFL0OkiSlUTCk4koB7qfg3cKTXCfwUoG
 JQP0Bp7xJq7v6QHE6zbj5/Khb5zSwBothDklI6w4Tk5moWufayVrnKbLvadRil54cU
 Yt+dITOPqeX62aqlRyNElP6qTLCpWLzBDfYmbg1cCIBLgPwOkX3ugRxPZMfxoDal/o
 1THRA6ynHYmiUdzV+YLYN63PI2xglYWAoLZllhHBW+t+zFbgJO4P/lglgl1eA2pUJs
 iKDV5W+vmhJ2A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 049/115] drm/amdgpu: Fix memory leak
Date: Mon,  3 May 2021 12:35:53 -0400
Message-Id: <20210503163700.2852194-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163700.2852194-1-sashal@kernel.org>
References: <20210503163700.2852194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 xinhui pan <xinhui.pan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit 79fcd446e7e182c52c2c808c76f8de3eb6714349 ]

drm_gem_object_put() should be paired with drm_gem_object_lookup().

All gem objs are saved in fb->base.obj[]. Need put the old first before
assign a new obj.

Trigger VRAM leak by running command below
$ service gdm restart

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 48cb33e5b382..f5fa1befa7e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -910,8 +910,9 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	}
 
 	for (i = 1; i < rfb->base.format->num_planes; ++i) {
+		drm_gem_object_get(rfb->base.obj[0]);
+		drm_gem_object_put(rfb->base.obj[i]);
 		rfb->base.obj[i] = rfb->base.obj[0];
-		drm_gem_object_get(rfb->base.obj[i]);
 	}
 
 	return 0;
@@ -960,6 +961,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
+	drm_gem_object_put(obj);
 	return &amdgpu_fb->base;
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
