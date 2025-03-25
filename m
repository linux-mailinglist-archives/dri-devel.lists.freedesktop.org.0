Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BDDA70930
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4511610E293;
	Tue, 25 Mar 2025 18:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rZFfbhnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74810E4DA;
 Tue, 25 Mar 2025 18:42:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4DC9F61360;
 Tue, 25 Mar 2025 18:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC98C113D0;
 Tue, 25 Mar 2025 18:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742928153;
 bh=UTL901inkbdnXMs+G/Z6z+kgEDFCe5XJ5SSbeGhGR8c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rZFfbhnNXWmuU/o9PRcxacRwP9ntjhDAkD8RwFVI6BQls04fqCzD0FPiAGCKTC9LV
 Tk9AFK02rYuB+dJVFGVAqqiiqvmrL+1oqYtYv+J6vJ9d2O1eRiXQQCdXfo34NBsCsa
 PWePPfV4I5zo1q/CMvqiqm7aPOugNTWf06R/me2J5je5cuEywCFnWIdrlfJpiGQx67
 IAIjrzI0XcGrT13nfW6YTxBsMMmCZlpkXnchrzrc1Yxa/6Hicz4S7ymgEc9QgSjFWn
 /wrl3e5i4q2t50SQoVain4OpE/JF5HRDCPmEOT6GOpuLMTjR0lY+sKWT7aUch6T9tI
 +aDnVUOwvuC9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lo-an Chen <lo-an.chen@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, aurabindo.pillai@amd.com,
 rodrigo.siqueira@amd.com, duncan.ma@amd.com, jinze.xu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 6/7] drm/amd/display: Fix incorrect fw_state
 address in dmub_srv
Date: Tue, 25 Mar 2025 14:42:14 -0400
Message-Id: <20250325184215.2152123-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325184215.2152123-1-sashal@kernel.org>
References: <20250325184215.2152123-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.8
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

From: Lo-an Chen <lo-an.chen@amd.com>

[ Upstream commit d60073294cc3b46b73d6de247e0e5ae8684a6241 ]

[WHY]
The fw_state in dmub_srv was assigned with wrong address.
The address was pointed to the firmware region.

[HOW]
Fix the firmware state by using DMUB_DEBUG_FW_STATE_OFFSET
in dmub_cmd.h.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Lo-an Chen <lo-an.chen@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit f57b38ac85a01bf03020cc0a9761d63e5c0ce197)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index a3f3ff5d49ace..9d2250d84f291 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -708,7 +708,7 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 	cw6.region.base = DMUB_CW6_BASE;
 	cw6.region.top = cw6.region.base + fw_state_fb->size;
 
-	dmub->fw_state = fw_state_fb->cpu_addr;
+	dmub->fw_state = (void *)((uintptr_t)(fw_state_fb->cpu_addr) + DMUB_DEBUG_FW_STATE_OFFSET);
 
 	region6.offset.quad_part = shared_state_fb->gpu_addr;
 	region6.region.base = DMUB_CW6_BASE;
-- 
2.39.5

