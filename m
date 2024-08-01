Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB36943B14
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0910E7A7;
	Thu,  1 Aug 2024 00:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gw5vuE5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4270010E7A8;
 Thu,  1 Aug 2024 00:23:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA8A86125E;
 Thu,  1 Aug 2024 00:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03190C32786;
 Thu,  1 Aug 2024 00:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471793;
 bh=a/aRreavIK3CM2UoNbBDxmCTSG3uc8Vn32mLDBmZ5Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gw5vuE5Rp1padZZLtjuderSd6YuniO+IrWNeYnirzpT0Yn8gERmD4DXAc8rWI46XG
 i5ilellfiEHMzmuFNl/F9j6FWdHfg4FlT/3JjDtBhrQyRNEtbvymfoAqzjiYN8RX6Y
 t1bOgQyw94bIsOnJDVgjTCxUchQic1qZCQMIqOW8WNhZUVdslDPJYMy3zPo7wnaRh0
 xCd9/dEMdtNjLIkoq7HcDe71vxm9+bcDF+o9MvFmy6efzVj/Fpp170i9/WKuwOvofK
 dd5nUd/a9iXJyCUDmvD0OB16ENcdpFnreJjqei54ZUYnvCl+T/6aeKi6jcREOhFgJ9
 +Dgg2CjqrFHAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Lin.Cao" <lincao12@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 23/83] drm/amdkfd: Check debug trap enable before
 write dbg_ev_file
Date: Wed, 31 Jul 2024 20:17:38 -0400
Message-ID: <20240801002107.3934037-23-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

From: "Lin.Cao" <lincao12@amd.com>

[ Upstream commit 547033b593063eb85bfdf9b25a5f1b8fd1911be2 ]

In interrupt context, write dbg_ev_file will be run by work queue. It
will cause write dbg_ev_file execution after debug_trap_disable, which
will cause NULL pointer access.
v2: cancel work "debug_event_workarea" before set dbg_ev_file as NULL.

Signed-off-by: Lin.Cao <lincao12@amd.com>
Reviewed-by: Jonathan Kim <jonathan.kim@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 9ec750666382f..94aaf2fc556ca 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -103,7 +103,8 @@ void debug_event_write_work_handler(struct work_struct *work)
 			struct kfd_process,
 			debug_event_workarea);
 
-	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
+	if (process->debug_trap_enabled && process->dbg_ev_file)
+		kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
 }
 
 /* update process/device/queue exception status, write to descriptor
@@ -645,6 +646,7 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
 	else if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
 		target->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
 
+	cancel_work_sync(&target->debug_event_workarea);
 	fput(target->dbg_ev_file);
 	target->dbg_ev_file = NULL;
 
-- 
2.43.0

