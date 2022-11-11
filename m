Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02562504D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 03:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2017410E19A;
	Fri, 11 Nov 2022 02:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2106310E193;
 Fri, 11 Nov 2022 02:34:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A180F61E87;
 Fri, 11 Nov 2022 02:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B834C433C1;
 Fri, 11 Nov 2022 02:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668134057;
 bh=Ur+6ung+1Jg5W4OUPwgfM4XGfn/eozgws0JTSUiElDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O10V8uNY3q4tFUuX15+VlfM8UNaZWZ9byJvNtMspm+Ecz/JKT9J4oPXMdXLrsTHN3
 /A9gtk5dQdLGiA8TmzD4flubMFZegm8rP/+3s6PUQq8QVrb1TXnaORfIGGkNJ8Lo0e
 HohrJZCx/t/n2zUxAx9tFngu0U+LUcqlVpK2A3Lo/JhPT2FzHNkp69tq3hhIoivLpC
 tCmE4gl96Rzu+2wL0ZnhX6Ll0QhQI3palbEmCQOPJ7fwglv7awp+YF8Vcf0bK2OZGx
 +i7mAKCwl47xakUfL+JFvgU9lK5q5cDP5OFy/jESH5FitEHqdzYVz3RdJSo9sBWTL5
 ivZA8mH611JUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 18/30] drm/amd/display: Ignore Cable ID Feature
Date: Thu, 10 Nov 2022 21:33:26 -0500
Message-Id: <20221111023340.227279-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111023340.227279-1-sashal@kernel.org>
References: <20221111023340.227279-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Mark Broadworth <mark.broadworth@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[ Upstream commit 14aed119942f6c2f1286022323139f7404db5d2b ]

Ignore cable ID for DP2 receivers that does not support the feature.

Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Reviewed-by: Roman Li <Roman.Li@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3be70848b202..54c76ed1ad75 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1549,6 +1549,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	adev->dm.dc->debug.visual_confirm = amdgpu_dc_visual_confirm;
 
+	/* TODO: Remove after DP2 receiver gets proper support of Cable ID feature */
+	adev->dm.dc->debug.ignore_cable_id = true;
+
 	r = dm_dmub_hw_init(adev);
 	if (r) {
 		DRM_ERROR("DMUB interface failed to initialize: status=%d\n", r);
-- 
2.35.1

