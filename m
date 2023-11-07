Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8578B7E3D7A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A7F10E59E;
	Tue,  7 Nov 2023 12:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8012910E59C;
 Tue,  7 Nov 2023 12:28:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CD112CE0F4C;
 Tue,  7 Nov 2023 12:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735C0C433C7;
 Tue,  7 Nov 2023 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360131;
 bh=X226EpgIEneFaPqtTSC31tllmiqpBdJiVVgarJUWHJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KnkB1pXWG88IPvIXW6XtKDeavM7h3IJQO8bX1lhpp2bmVmr2+ECe2vG7aCTyRJbPh
 L7GQqbrYqO6ffCbwlrhYmmW33nkklz/cfRbzawBhJmdK+0LJaHR+FIRX6z7F+BVZG9
 x6eXICGURKy5YNZC5Gk4fxGibs+oB/K7jNE9t5ODUwo4qD/P3S4fEvLRgQYjv0VoNt
 yXoku3ehWu7jVgKo5NzsQyisaYxjYAbNuI7goh2h0RS3laS8uYFvPhzFfcyUus5iHQ
 t4zYJmhQGv8c38f3PTooMl0v/P6KHSTJoJggY/g/q2NoEBzA74sjd12W8z7PkD98B3
 r9DxAMtT16u1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 16/25] drm/amdgpu: Fix potential null pointer
 derefernce
Date: Tue,  7 Nov 2023 07:26:55 -0500
Message-ID: <20231107122745.3761613-16-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122745.3761613-1-sashal@kernel.org>
References: <20231107122745.3761613-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
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
Cc: Sasha Levin <sashal@kernel.org>, Tao Zhou <tao.zhou1@amd.com>,
 andrealmeid@igalia.com, shashank.sharma@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com, le.ma@amd.com,
 "Stanley.Yang" <Stanley.Yang@amd.com>, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, srinivasan.shanmugam@amd.com,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Stanley.Yang" <Stanley.Yang@amd.com>

[ Upstream commit 80285ae1ec8717b597b20de38866c29d84d321a1 ]

The amdgpu_ras_get_context may return NULL if device
not support ras feature, so add check before using.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 92fa2faf63e41..dc61cc1659326 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5330,7 +5330,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 * Flush RAM to disk so that after reboot
 	 * the user can read log and see why the system rebooted.
 	 */
-	if (need_emergency_restart && amdgpu_ras_get_context(adev)->reboot) {
+	if (need_emergency_restart && amdgpu_ras_get_context(adev) &&
+		amdgpu_ras_get_context(adev)->reboot) {
 		DRM_WARN("Emergency reboot.");
 
 		ksys_sync_helper();
-- 
2.42.0

