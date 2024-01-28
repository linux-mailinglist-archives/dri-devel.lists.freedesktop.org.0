Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B083F6C1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAA210E808;
	Sun, 28 Jan 2024 16:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38010E808;
 Sun, 28 Jan 2024 16:16:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3869061B97;
 Sun, 28 Jan 2024 16:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5978C433F1;
 Sun, 28 Jan 2024 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458618;
 bh=eAQJARwjTPNNCWJVhfVjlvXJ/Q7ey7Ccu6Mw70EJ+D0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IesHNUZc+F0qNb1JklfvoWw36RzweOfAsfw2ck3OFw+qv6JwXV6C6N0Sni10sBHdr
 ZjBb6dXqH+54SOnhmtlEwFJh2uaS1Yf8DNGBg0rX6rCIBisr5nJZZsdg+kgvHiu4po
 Dr8FAL8uXjfHtsxH+rewuQtmqVKnXcO+NvImOA3Pb9WKQJq7uawbHUUA4SeO+tahvx
 Q5UaKKjAiVUH6MWm99x6pEeM+tMtymVYvU8FFlikmLemIl5gL/vz1WZJIZkltHPeO+
 AfsmMjelThs9IlnqtK3w9DzQVpZB2PPYTfBbrsE+hWZT68oEj+plX9sAccldZD2/61
 y9+n+I076Kypw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/11] drm/amdgpu: Release 'adev->pm.fw' before
 return in 'amdgpu_device_need_post()'
Date: Sun, 28 Jan 2024 11:16:32 -0500
Message-ID: <20240128161637.205509-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161637.205509-1-sashal@kernel.org>
References: <20240128161637.205509-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.268
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
index e5032eb9ae29..9dcb38bab0e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -847,6 +847,7 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev)
 				return true;
 
 			fw_ver = *((uint32_t *)adev->pm.fw->data + 69);
+			release_firmware(adev->pm.fw);
 			if (fw_ver < 0x00160e00)
 				return true;
 		}
-- 
2.43.0

