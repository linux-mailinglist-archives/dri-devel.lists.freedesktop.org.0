Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086F68304F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241110E365;
	Tue, 31 Jan 2023 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D218C10E35F;
 Tue, 31 Jan 2023 15:01:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82EF5B81D43;
 Tue, 31 Jan 2023 15:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B0CC433D2;
 Tue, 31 Jan 2023 15:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675177258;
 bh=l53l4HHX8VY9mHyviTj/b+FmqBe4Fvyu7A6QkFn7By8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMSIv7X/SqokmX7DzGHdCGPhpn0mrCf0Bi5Rx+Qfp6MAxndwUaTR5Jj1soSfLo5I4
 nXpcdfUoy1pbbDVxVEla/NDHV3Z6vcH1CvO3deUYqfNVwWfulZa4ZnH201uv3Lev3w
 4+T8Mc9BNU38aYdeKeZdb8Tag3tC4GzpemMFEp7PvXKiGjOd3wRTwgZ5vuk3D6tMkq
 TyZ8Mf/0DHPZajO1zNhSpBmTRt6ihAdQJf1OJTBDTpfQBsEWoDENxhTxeV/Y+++SG+
 +r7jcNdBtEja1Ud2Kdf/iLc5E36NLp080x+gLwsch9lxZ3TYTFXPJTA96j2rxWnweP
 CZvhPfY8vXArA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/12] amdgpu: fix build on non-DCN platforms.
Date: Tue, 31 Jan 2023 10:00:30 -0500
Message-Id: <20230131150030.1250104-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131150030.1250104-1-sashal@kernel.org>
References: <20230131150030.1250104-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Dave Airlie <airlied@redhat.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

[ Upstream commit f439a959dcfb6b39d6fd4b85ca1110a1d1de1587 ]

This fixes the build here locally on my 32-bit arm build.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ee238a16572e..0f0dd9b0d84a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10769,6 +10769,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	bool lock_and_validation_needed = false;
 	struct dm_crtc_state *dm_old_crtc_state;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct drm_dp_mst_topology_mgr *mgr;
+	struct drm_dp_mst_topology_state *mst_state;
 	struct dsc_mst_fairness_vars vars[MAX_PIPES];
 #endif
 
-- 
2.39.0

