Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD53BCB9B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24ED6E05A;
	Tue,  6 Jul 2021 11:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C7C6E05A;
 Tue,  6 Jul 2021 11:15:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5C1561A14;
 Tue,  6 Jul 2021 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570103;
 bh=woZHgorVR7Q0m33QF4ihy7qs1+znD/0nAYjA2QP/kTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ize0dZTODvAeupeSDMYUtdXXCB/tfgFhrbT3QhhEP1T6HxO+3y2nk4He4V2d2oOim
 68QW0T8CN5D7IwZf+buAvrpLBe8HETW5n9jWzyIKkxWL2En/qEEn9vqwN1i7/6gnee
 +4DB1AVsWwtR6s9KIcVxYuekTx0/Rt6ZmyOVMhoBTdSoebhng+l74nSuD91VfN10Ge
 hY+BJMubt8BPJJG/Zdghy+abp7lQ9mPfsgooz9g+on2xU64719ZAGJHaJFjMqiZEC6
 N/76Vxt1K/hNyucJjSYJU09zpPhcR/rZPmGRjpwZ3RKNQOLldy/4bGQu4H54rb195N
 TVz4kxYpb1kmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 037/189] drm/amdgpu/display: restore the
 backlight on modeset (v2)
Date: Tue,  6 Jul 2021 07:11:37 -0400
Message-Id: <20210706111409.2058071-37-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 7230362c78d441020a47d7d5ca81f8a3d07bd9f0 ]

To stay consistent with the user's setting.

v2: rebase on multi-eDP support

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1337
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 875fd187463e..62663e287b21 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8967,6 +8967,12 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	/* Update audio instances for each connector. */
 	amdgpu_dm_commit_audio(dev, state);
 
+#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||		\
+	defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
+	/* restore the backlight level */
+	if (dm->backlight_dev)
+		amdgpu_dm_backlight_set_level(dm, dm->brightness[0]);
+#endif
 	/*
 	 * send vblank event on all events not handled in flip and
 	 * mark consumed event for drm_atomic_helper_commit_hw_done
-- 
2.30.2

