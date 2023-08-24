Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD67868A2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAD510E4AF;
	Thu, 24 Aug 2023 07:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520210E4AD;
 Thu, 24 Aug 2023 07:38:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CEF065DEF;
 Thu, 24 Aug 2023 07:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06097C433CC;
 Thu, 24 Aug 2023 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862701;
 bh=XMLhGP3gS/GA5ugfwBvBA9rFCKno1toIUnNgJ1XxmRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LfHCZhGIEbSono5ZPGTva+4svqck8IBZDnL/u9eLKYfW1VIZSZxjrA7vkzj4DvJ1m
 qJYJ4KNKn1Doi63djOyJ3wu3g4PRXvFX2o8vOw/+qRmmbMgLGnUFwG1nvAcgtRvJ5b
 e9oSsvjdTUwAQejOWe9yRaCNWjn3pAW2dNYz+5EIcEaJGO3g/07RkI0Q3VSFqaiRrZ
 qRz/wS4Z65fKN5ogo6pg0Vc4zsRvDrX8pYHWOwL4YzPHaAKEdNUqJ+ZUr3y7FKYdrd
 0+Vfq9nkp0ps8vzcVR3p2bbMJ/ituWnRr28BsSrxh7L0PtNt+2KxaxC1Jz7w3vihxa
 raVHq0iG30JWQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 19/20] drm/amd/amdgpu/amdgpu_sdma: Increase buffer size to
 account for all possible values
Date: Thu, 24 Aug 2023 08:37:04 +0100
Message-ID: <20230824073710.2677348-20-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c: In function ‘amdgpu_sdma_init_microcode’:
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:217:64: warning: ‘.bin’ directive output may be truncated writing 4 bytes into a region of size between 0 and 32 [-Wformat-truncation=]
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:217:17: note: ‘snprintf’ output between 13 and 52 bytes into a destination of size 40
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:215:66: warning: ‘snprintf’ output may be truncated before the last format character [-Wformat-truncation=]
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:215:17: note: ‘snprintf’ output between 12 and 41 bytes into a destination of size 40

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index e2b9392d7f0de..572f861e3f706 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -208,7 +208,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
 	char ucode_prefix[30];
-	char fw_name[40];
+	char fw_name[52];
 
 	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 	if (instance == 0)
-- 
2.42.0.rc1.204.g551eb34607-goog

