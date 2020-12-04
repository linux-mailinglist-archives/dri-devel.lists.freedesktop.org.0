Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF42CF244
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 17:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A886E19C;
	Fri,  4 Dec 2020 16:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6DF6E19C;
 Fri,  4 Dec 2020 16:51:33 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <john.clements@amd.com>
Subject: [PATCH] drm/amdgpu: fw_attestation: fix unused function warning
Date: Fri,  4 Dec 2020 17:51:20 +0100
Message-Id: <20201204165128.3747878-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 amd-gfx@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Without debugfs, the compiler notices one function that is not used at
all:

drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c:123:12: error: unused function 'amdgpu_is_fw_attestation_supported' [-Werror,-Wunused-function]

In fact the static const amdgpu_fw_attestation_debugfs_ops structure is
also unused here, but that warning is currently disabled.

Removing the #ifdef check does the right thing and leads to all of this
code to be dropped without warning.

Fixes: 19ae333001b3 ("drm/amdgpu: added support for psp fw attestation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
index e47bca1c7635..7c6e02e35573 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
@@ -130,7 +130,6 @@ static int amdgpu_is_fw_attestation_supported(struct amdgpu_device *adev)
 
 void amdgpu_fw_attestation_debugfs_init(struct amdgpu_device *adev)
 {
-#if defined(CONFIG_DEBUG_FS)
 	if (!amdgpu_is_fw_attestation_supported(adev))
 		return;
 
@@ -139,5 +138,4 @@ void amdgpu_fw_attestation_debugfs_init(struct amdgpu_device *adev)
 			    adev_to_drm(adev)->primary->debugfs_root,
 			    adev,
 			    &amdgpu_fw_attestation_debugfs_ops);
-#endif
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
