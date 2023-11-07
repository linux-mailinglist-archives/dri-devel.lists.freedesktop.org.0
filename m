Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB717E3D5F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CF610E58B;
	Tue,  7 Nov 2023 12:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27C10E589;
 Tue,  7 Nov 2023 12:27:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1F60BB816C8;
 Tue,  7 Nov 2023 12:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A6CC433C8;
 Tue,  7 Nov 2023 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360075;
 bh=br1Im9wcZxU3TPWiSFZhB/V0bOGJWTYQFux3oKMhmhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GkKcuwRuQjqlVLipb47LjhDjEiXjsytJ+WT6pvySAhpqhXOwHxAMrzW8PPQCT4NP6
 eqMCdzA1lxpOCGjxx9gd6kdtocGElmmajhYeLYw5tU93dOSli88Jpkl4tV8Jk9uSby
 zwLZKcCM5glBtxXjjcfNYTfSdBTXaxa6UJXOozwrHXNyPltGimX/eO/rO8OyQtk0Cj
 VZMJVxlRjw449ZRIAJInVzsetadmTgsQOx/yu/1rosXRGOKwqst2//SzEFMGANzkOE
 uwt8IxBesr5ep4LbXxg+A8wa/9VY5dc0i2G19GoKoGCuVaSnlXlez09uZrewIkzDbf
 ldncFutk6oT+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 03/25] drm/amdgpu: not to save bo in the case of
 RAS err_event_athub
Date: Tue,  7 Nov 2023 07:26:42 -0500
Message-ID: <20231107122745.3761613-3-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Hongkun.Zhang@amd.com, tao.zhou1@amd.com,
 srinivasan.shanmugam@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, gpiccoli@igalia.com,
 mario.limonciello@amd.com, Alex Deucher <alexander.deucher@amd.com>,
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
index 5c1193dd7d88c..48e612023d0c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -391,8 +391,15 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
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

