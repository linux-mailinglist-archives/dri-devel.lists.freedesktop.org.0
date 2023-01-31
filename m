Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAED683033
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F0910E367;
	Tue, 31 Jan 2023 15:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5D10E367;
 Tue, 31 Jan 2023 15:00:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37EA0B81D3E;
 Tue, 31 Jan 2023 15:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC78C433EF;
 Tue, 31 Jan 2023 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675177229;
 bh=IR2ghLgr2g4QmwmZiIXnJ7xh3SC++vSjGxGy/gKx3gY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EUBKvfG0BosAafqvTJF1dOqKOpUfQmASK+Q4g/Vx+Cj8KNowP8g+d/YhhM1lPRH9p
 NLqLt7Dpsao+qkEHSnRGKQHP+0UAOXIcwHUDdyABAqBZYhnfgi0kqeW2ukayuyNdtr
 zaqH6xvR7OGckqnEyLNlLAtWAy8MosMwRjcEpME7q2lBbm6kU3bLFNtZyaGNMQ+2YN
 RxVWauXnQ5Vc6+NK9QulVVOUYCfUPnGoSFn6trJZQawAwLgu6TIziuHSgtS8nKqa/S
 WOA/VF/F+EotpFasfaQAh/kK7VNKEEVpUEF8EKmu2+0/iXFDVuJWlzGvr7nfhHT+Ke
 XktkPhuoHXi6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 20/20] amdgpu: fix build on non-DCN platforms.
Date: Tue, 31 Jan 2023 09:59:46 -0500
Message-Id: <20230131145946.1249850-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131145946.1249850-1-sashal@kernel.org>
References: <20230131145946.1249850-1-sashal@kernel.org>
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
index 15b408e3a705..d756a606b5e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9411,6 +9411,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	bool lock_and_validation_needed = false;
 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct drm_dp_mst_topology_mgr *mgr;
+	struct drm_dp_mst_topology_state *mst_state;
 	struct dsc_mst_fairness_vars vars[MAX_PIPES];
 #endif
 
-- 
2.39.0

