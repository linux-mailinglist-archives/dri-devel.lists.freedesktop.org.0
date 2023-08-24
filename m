Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBB78689E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEDF10E496;
	Thu, 24 Aug 2023 07:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9846410E49D;
 Thu, 24 Aug 2023 07:38:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A6E965E75;
 Thu, 24 Aug 2023 07:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95478C433CC;
 Thu, 24 Aug 2023 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862694;
 bh=80DhO1S3sF1BIZV94LCoe8Y0glyR6Eq4m/W3GG03lhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdYAOt3x5bIFGk28KKdnxKbh+kGPhHh60bkIKzpksJYyOLUKw2A1yO0oaPZfkF0Xj
 KN/dHWFrQppoB82d2dD2yAvPz/pxA5kNdcOzT/yn0KsPTwgf+F2MmFQNV5uUkbS1Gn
 TGKIkobVYCrHkXU6si5gmVjEOIehdCmv0ZlK7zsqF/ZhfC65mLef33db4K2NW0VLyw
 9m9Gt4gTuv/WOzRHokUr3+A4kkH23VI3Aqp4D2kAQo5/HCa8KNWMAbfh2qAR6d/oNQ
 qFtu3IfYp2IFz51LxpmzlDj1+90Yb+5S2c3gWGOgK5W+2czqmbbbbwixuP60o2CH0f
 XhBi3QOs9EbCg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 17/20] drm/amd/amdgpu/amdgpu_ras: Increase buffer size to
 account for all possible values
Date: Thu, 24 Aug 2023 08:37:02 +0100
Message-ID: <20230824073710.2677348-18-lee@kernel.org>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function ‘amdgpu_ras_sysfs_create’:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1406:20: warning: ‘_err_count’ directive output may be truncated writing 10 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1405:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index ffb49b2d533ad..7999d202c9bc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -436,7 +436,7 @@ struct amdgpu_ras {
 };
 
 struct ras_fs_data {
-	char sysfs_name[32];
+	char sysfs_name[48];
 	char debugfs_name[32];
 };
 
-- 
2.42.0.rc1.204.g551eb34607-goog

