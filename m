Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01515DB96
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAFF6F979;
	Fri, 14 Feb 2020 15:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673496F979;
 Fri, 14 Feb 2020 15:50:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 825872467D;
 Fri, 14 Feb 2020 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695426;
 bh=I3GG6lSlT9TzpTOQSFRaoFpe2xLdXe/3lR+hI2etkKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LQ3dOLYqJhoupFj84Uy0X/3AIuEGOY6KOiLO6hQH4HwdAgDUBnJr2+CnBonOyGuAw
 dJqNbmUqv7M7EmT/cqz5Z7uTSAIShy/PMAnT9hnol3vbF6gukbK6bHkW9YCutIZRWY
 g/4L8vzJUXPtuKHRc+e6iz3HXLWwmd9kxbSi3/kQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 070/542] drm/amdgpu/sriov: workaround on rev_id
 for Navi12 under sriov
Date: Fri, 14 Feb 2020 10:41:02 -0500
Message-Id: <20200214154854.6746-70-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tiecheng Zhou <Tiecheng.Zhou@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tiecheng Zhou <Tiecheng.Zhou@amd.com>

[ Upstream commit df5e984c8bd414561c320d6cbbb66d53abf4c7e2 ]

guest vm gets 0xffffffff when reading RCC_DEV0_EPF0_STRAP0,
as a consequence, the rev_id and external_rev_id are wrong.

workaround it by hardcoding the rev_id to 0, which is the default value.

v2. add comment in the code

Signed-off-by: Tiecheng Zhou <Tiecheng.Zhou@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 0ba66bef57468..de40bf12c4a8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -701,6 +701,12 @@ static int nv_common_early_init(void *handle)
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_VCN_DPG |
 			AMD_PG_SUPPORT_ATHUB;
+		/* guest vm gets 0xffffffff when reading RCC_DEV0_EPF0_STRAP0,
+		 * as a consequence, the rev_id and external_rev_id are wrong.
+		 * workaround it by hardcoding rev_id to 0 (default value).
+		 */
+		if (amdgpu_sriov_vf(adev))
+			adev->rev_id = 0;
 		adev->external_rev_id = adev->rev_id + 0xa;
 		break;
 	default:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
