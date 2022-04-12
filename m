Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A20D4FC9E8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACE710FAD9;
	Tue, 12 Apr 2022 00:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1AF10FAD9;
 Tue, 12 Apr 2022 00:47:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 096ADB819BC;
 Tue, 12 Apr 2022 00:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DC4C385A4;
 Tue, 12 Apr 2022 00:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724462;
 bh=wFGnyvPUfPpRd8B6IV0DhpyhkeIwbe+1CvpJcSfRKig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rn4uIyGP0wysxXYWYdEK0EgX8hwORVZghGptBzHvD2VR2+lOwOFA8UwUGdwOMVKFt
 cvmY9jH6T6PAkhQHAS7yeuhWEw4VZEQuSB56jSZPFDSeemwOiY+gLblz14DblZZDU9
 onfBsFUS8xqJrqs0nbxkPl0kK7xtgCxaZmWP8R0PnvOsCABUwu91PCM0LslmLupitv
 qt+O1dg4rGAilO333NkcRXWtt0QpDEacO0iQlnvmn4fYTcC8gIxgWw/hdSoIsZ2mv2
 pEO659r41CEQhxLjwqF9kMwZ26+fwn9wF6uUWpeV2DkLK6JVrCa2jjBV7N5MKXpd9q
 vI1Q+m1QvFyOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/41] drm/amdgpu/vcn: improve vcn dpg stop
 procedure
Date: Mon, 11 Apr 2022 20:46:22 -0400
Message-Id: <20220412004656.350101-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004656.350101-1-sashal@kernel.org>
References: <20220412004656.350101-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@linux.ie,
 veerabadhran.gopalakrishnan@amd.com, Tianci Yin <tianci.yin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 PengJu.Zhou@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 ruijing.dong@amd.com, James Zhu <James.Zhu@amd.com>, leo.liu@amd.com,
 christian.koenig@amd.com, Bokun.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tianci Yin <tianci.yin@amd.com>

[ Upstream commit 6ea239adc2a712eb318f04f5c29b018ba65ea38a ]

Prior to disabling dpg, VCN need unpausing dpg mode, or VCN will hang in
S3 resuming.

Reviewed-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Tianci Yin <tianci.yin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 3d18aab88b4e..a026b2eaec21 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -1508,8 +1508,11 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
 
 static int vcn_v3_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 {
+	struct dpg_pause_state state = {.fw_based = VCN_DPG_STATE__UNPAUSE};
 	uint32_t tmp;
 
+	vcn_v3_0_pause_dpg_mode(adev, 0, &state);
+
 	/* Wait for power status to be 1 */
 	SOC15_WAIT_ON_RREG(VCN, inst_idx, mmUVD_POWER_STATUS, 1,
 		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
-- 
2.35.1

