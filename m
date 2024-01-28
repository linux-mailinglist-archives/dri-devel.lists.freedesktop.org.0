Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD8C83F6B2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135D2112708;
	Sun, 28 Jan 2024 16:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1E0112706;
 Sun, 28 Jan 2024 16:15:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A6DAD61BAF;
 Sun, 28 Jan 2024 16:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC3C433F1;
 Sun, 28 Jan 2024 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458512;
 bh=ZLEFwxCOTOF7EO6ou+YDVHqeyA9KKThtYa1MsczjO6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dSSrQ7FL+bgBxwghse5MGsL/X4wB3Daun+XJMCx6yOkQO2CvCflcRKqf5I/lOme0F
 L4MfF8iKo7y1OKKUhOC9jtRCvv4F8pQogRgQz6osjMEern+m6tsIwNJLl2+FGAHFkN
 OYbg/jo3daQm3NKokutSvKSe8+m4nqIQ6HLj2PVPeSNjXPzEmpwKUYnOdsRgtZcmmn
 F3/uqAkVHHgzBBaK75O06Cw+caJqZXUJqWDZG9F1XYKfYiPLHH1KlywVQWsg/ga8vU
 j3mQbUybvC6dvm6NdHnSnqbVl8DvM9TwfCLzOi4KTZw+4CaMK0XgQoSIzftOz02E9a
 KcxpxaHGG0VIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 25/27] drm/amdgpu: Release 'adev->pm.fw' before
 return in 'amdgpu_device_need_post()'
Date: Sun, 28 Jan 2024 11:14:10 -0500
Message-ID: <20240128161424.203600-25-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161424.203600-1-sashal@kernel.org>
References: <20240128161424.203600-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.75
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, shashank.sharma@amd.com,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, victorchengchi.lu@amd.com, le.ma@amd.com,
 hamza.mahfooz@amd.com, mario.limonciello@amd.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, andrealmeid@igalia.com,
 candice.li@amd.com, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 8a44fdd3cf91debbd09b43bd2519ad2b2486ccf4 ]

In function 'amdgpu_device_need_post(struct amdgpu_device *adev)' -
'adev->pm.fw' may not be released before return.

Using the function release_firmware() to release adev->pm.fw.

Thus fixing the below:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1571 amdgpu_device_need_post() warn: 'adev->pm.fw' from request_firmware() not released on lines: 1554.

Cc: Monk Liu <Monk.Liu@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a5352e5e2bd4..4b91f95066ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1310,6 +1310,7 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev)
 				return true;
 
 			fw_ver = *((uint32_t *)adev->pm.fw->data + 69);
+			release_firmware(adev->pm.fw);
 			if (fw_ver < 0x00160e00)
 				return true;
 		}
-- 
2.43.0

