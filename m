Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784167E3D06
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B1E10E55F;
	Tue,  7 Nov 2023 12:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5EA10E55F;
 Tue,  7 Nov 2023 12:25:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 30AC5B8168C;
 Tue,  7 Nov 2023 12:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7B3C433C9;
 Tue,  7 Nov 2023 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359906;
 bh=wH/Olkb/S96csUlOkSkdKDGcYNnJ9Oeo8bBkQ7+Z+mU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f8S5R6Y9hyRafCHNx9USOlRDw5CGVNk6/hJLd4MPXXg/hGaAjZK7hYxn/l7uUgGDF
 KBM1ybc3hRhHC8HoU3WnBiPuXUcHY7Y0LQ4gY/ivIcY3Nplk1jVVd8/Y/4fqLAJn1Z
 rWxdUdzhg2BGVPlMpqkd0f6P9zT2XgLNsUEU9WZx+RcxpIY6jRnMPvIkcvemSFWrXi
 madHWhpqJkcYN/RBuR7hvnVbvNpJNQBH/2neRNK57qJEn1qDoaf5zlfAfmFu6+1dFS
 1BnCDp7UceOYuWQjcK2rXZeiiBPlibLeeK3lGOpr/vhLHzOCPCG2xgV+Xvc8nOx0t9
 Jr5TqfAGSmx0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 09/37] drm/amdgpu: not to save bo in the case of
 RAS err_event_athub
Date: Tue,  7 Nov 2023 07:21:20 -0500
Message-ID: <20231107122407.3760584-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
Cc: Sasha Levin <sashal@kernel.org>, Hongkun.Zhang@amd.com, tao.zhou1@amd.com,
 srinivasan.shanmugam@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com,
 gpiccoli@igalia.com, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 "David \(Ming Qiang\) Wu" <David.Wu3@amd.com>, James.Zhu@amd.com,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 saleemkhan.jamadar@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "David (Ming Qiang) Wu" <David.Wu3@amd.com>

[ Upstream commit fa1f1cc09d588a90c8ce3f507c47df257461d148 ]

err_event_athub will corrupt VCPU buffer and not good to
be restored in amdgpu_vcn_resume() and in this case
the VCPU buffer needs to be cleared for VCN firmware to
work properly.

Acked-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: David (Ming Qiang) Wu <David.Wu3@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index ae455aab5d29d..7e54abca45206 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -292,8 +292,15 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
 	void *ptr;
 	int i, idx;
 
+	bool in_ras_intr = amdgpu_ras_intr_triggered();
+
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
+	/* err_event_athub will corrupt VCPU buffer, so we need to
+	 * restore fw data and clear buffer in amdgpu_vcn_resume() */
+	if (in_ras_intr)
+		return 0;
+
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
-- 
2.42.0

