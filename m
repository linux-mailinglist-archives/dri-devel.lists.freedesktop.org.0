Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DDB5B494A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 23:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6B10E2DB;
	Sat, 10 Sep 2022 21:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F4F10E2D8;
 Sat, 10 Sep 2022 21:18:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC09BB80915;
 Sat, 10 Sep 2022 21:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDDFC433D7;
 Sat, 10 Sep 2022 21:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662844706;
 bh=3ql1VYg9itb/xt6h5Si74dgyuYXhL3I1F8DJJxHXuNw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ln8kGM4cwRv4kNRIwVapz9bmt4qV31SXevrMO0AkxRetyMgvHHbqq3LxrzrrTA+5C
 63Aa5/fCsT6zzaT12Bx3mOWzxDRLbaWf0pdKYXUZAxj0CH4NOcixGcL1v4hxsOqLP1
 ZvG5rlkDryaALji98NofsVgnJp1lhXSnnOx/htcCZMlHD5o0JkDOe5cLL/SI3hvk0A
 73w3rdJ+OVoWaPZQJpR7kPTsvuALqOyCC/hfsxUnk0/hkBCEk8oIbP8Teo2D8g3eGo
 kZZmhGitqIHcoASIzPDF8LF5e5c1yog99eATaiiNA1jZblLTqxX6aDSHXMD3V161Oo
 Sk56anFz33AAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/21] drm/amd/amdgpu: skip ucode loading if
 ucode_size == 0
Date: Sat, 10 Sep 2022 17:17:48 -0400
Message-Id: <20220910211752.70291-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211752.70291-1-sashal@kernel.org>
References: <20220910211752.70291-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com,
 Chengming Gui <Jack.Gui@amd.com>, guchun.chen@amd.com, airlied@linux.ie,
 Bokun.Zhang@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, candice.li@amd.com, john.clements@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chengming Gui <Jack.Gui@amd.com>

[ Upstream commit 39c84b8e929dbd4f63be7e04bf1a2bcd92b44177 ]

Restrict the ucode loading check to avoid frontdoor loading error.

Signed-off-by: Chengming Gui <Jack.Gui@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 57e9932d8a04e..dcb4ad6ecc37b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2505,7 +2505,7 @@ static int psp_load_smu_fw(struct psp_context *psp)
 static bool fw_load_skip_check(struct psp_context *psp,
 			       struct amdgpu_firmware_info *ucode)
 {
-	if (!ucode->fw)
+	if (!ucode->fw || !ucode->ucode_size)
 		return true;
 
 	if (ucode->ucode_id == AMDGPU_UCODE_ID_SMC &&
-- 
2.35.1

