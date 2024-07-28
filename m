Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8B93E647
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D2410E23A;
	Sun, 28 Jul 2024 15:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="naushqms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5300410E23A;
 Sun, 28 Jul 2024 15:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 966B161215;
 Sun, 28 Jul 2024 15:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1DDC4AF0F;
 Sun, 28 Jul 2024 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181573;
 bh=C+xvaKhz48FqvqprkaQycS+Bx+tlJK4t2v/ibyQ+V1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=naushqmsQQNZxnApQ3NhFDh8GTlj2sCBwU6+idukb/mAu9KiHu+Qg60ydV9je4Cb5
 Gy8CxMtUMAuM4c0MuRX+STAh0mI6jwVOqbySLIioelptrZ6VRrGiEzaf29WqwZ5IDu
 2DhDiecA/thquED0I3U0osAsxefRFnXQODTsXQs3Aa5ZzKSo1hIZoBbsAn0kSD91Si
 znLKdmBlyw6BajIxjFJh2seEbEyhILffDn70RYth5JyQNzruiSnWN4JcG1SlYMfAdv
 d2ZK9ziIdeljMYQ1ukkFZaWfBBQmHy0oZEzfDg18wbFfZ1MmYlKPEqPv0tNxh4P6re
 hvt+dN0O56MdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <Tim.Huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 shashank.sharma@amd.com, rajneesh.bhardwaj@amd.com, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 02/20] drm/amdgpu: fix potential resource leak
 warning
Date: Sun, 28 Jul 2024 11:45:00 -0400
Message-ID: <20240728154605.2048490-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154605.2048490-1-sashal@kernel.org>
References: <20240728154605.2048490-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Tim Huang <Tim.Huang@amd.com>

[ Upstream commit 22a5daaec0660dd19740c4c6608b78f38760d1e6 ]

Clear resource leak warning that when the prepare fails,
the allocated amdgpu job object will never be released.

Signed-off-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 349416e176a12..1cf1498204678 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -102,6 +102,11 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!r)
 		r = amdgpu_sync_push_to_job(&sync, p->job);
 	amdgpu_sync_free(&sync);
+
+	if (r) {
+		p->num_dw_left = 0;
+		amdgpu_job_free(p->job);
+	}
 	return r;
 }
 
-- 
2.43.0

