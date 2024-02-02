Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B48477C6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE3A10E40C;
	Fri,  2 Feb 2024 18:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z4+nrOQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ABA10E40C;
 Fri,  2 Feb 2024 18:40:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EAE83CE2D1D;
 Fri,  2 Feb 2024 18:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51898C433F1;
 Fri,  2 Feb 2024 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706899204;
 bh=Xno+js/pInSv3K86aU9j/XKbnVZ3diw6jDM62hITqXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z4+nrOQ3AphSkBfw7qQ5D5P49IiQ4KwONjhN89aANe+qmWdf8/LodzNv/85prPCbK
 CaX7E4JrFGUEhSJx5pocBtGHvVRAOh6sFnjtc26zH0SLJ1ADQpaLr52eOI2KQ7/NsO
 RCFX5YDyZgrGmwyJGFjeed6gz1amUX6SHxYhJjwJZZYr7o4hNWUIOhZV5XZvNytT+S
 LzLnCyrIbTiLDOYeQFW0XWqorZM+jrGVFiakxOAYmJ0jw2BirNbD/QrDLhSToHuaXI
 pdgJQGtOAsv/KSrxdmyRQB5QdC7zW+N6/wg4bW/lzHM+C3C+u1I3LV4UZF5csdevUp
 fBcb0hhmIHcGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roman Li <Roman.Li@amd.com>, Mark Broadworth <mark.broadworth@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 21/23] drm/amd/display: Disable ips before dc
 interrupt setting
Date: Fri,  2 Feb 2024 13:39:17 -0500
Message-ID: <20240202183926.540467-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202183926.540467-1-sashal@kernel.org>
References: <20240202183926.540467-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.3
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

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit 8894b9283afd35b8d22ae07a0c118eb5f7d2e78b ]

[Why]
While in IPS2 an access to dcn registers is not allowed.
If interrupt results in dc call, we should disable IPS.

[How]
Safeguard register access in IPS2 by disabling idle optimization
before calling dc interrupt setting api.

Signed-off-by: Roman Li <Roman.Li@amd.com>
Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 51467f132c26..d595030c3359 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -711,7 +711,7 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
 {
 	bool st;
 	enum dc_irq_source irq_source;
-
+	struct dc *dc = adev->dm.dc;
 	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
 
 	if (!acrtc) {
@@ -729,6 +729,9 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
 
 	st = (state == AMDGPU_IRQ_STATE_ENABLE);
 
+	if (dc && dc->caps.ips_support && dc->idle_optimizations_allowed)
+		dc_allow_idle_optimizations(dc, false);
+
 	dc_interrupt_set(adev->dm.dc, irq_source, st);
 	return 0;
 }
-- 
2.43.0

