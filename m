Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2825901F3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E85B49FA;
	Thu, 11 Aug 2022 16:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA2014A036;
 Thu, 11 Aug 2022 16:01:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 85D70CE225D;
 Thu, 11 Aug 2022 16:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F18C433C1;
 Thu, 11 Aug 2022 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233698;
 bh=OiZAxAnQZjkyZ2td/D0/JWcnAdGXseToaBcDirW3jKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sTj3+bTo0JUtuH/1VKD3JrDcw9Dl0nvIHYQpikuD8FT15cRSF712eKPPgGQVACSUi
 e524lauuaB7FDNFL0z5S5jSlU94I1nOLF/BZ10Asryww3t5iXQx9sLlvWgr7WoiB6X
 0a6OctrfwYZCSZVjnfF9vYoFJudr5jQ9gqHZ8GPvKcT4vCcGuUxVAWMQWh/VoLPXEP
 /4KqcQO1L9SrDxvAOqn6+X7qWsr2/AXnp3tTgt4IcJPomECDNdJm+mwK0MuEywXae/
 ChykmiYfzZq21ANDo7IpQ7iz1+/xf7g0CDlV+z5V3XU0jwD5MHXNRGluyyFq7cbOFN
 W772kQBtg+ptQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 43/69] drm/amdgpu: skip whole ras bad page
 framework on sriov
Date: Thu, 11 Aug 2022 11:55:52 -0400
Message-Id: <20220811155632.1536867-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, mukul.joshi@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
 YiPeng.Chai@amd.com, "Stanley.Yang" <Stanley.Yang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 candice.li@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Stanley.Yang" <Stanley.Yang@amd.com>

[ Upstream commit e0e146d5567317d6ba7d0169bed55d1d9ea05a61 ]

It should not init whole ras bad page framework on sriov guest side
due to it is handled on host side.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 96a8fd0ca1df..adea3bfb0760 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1964,7 +1964,7 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
 	bool exc_err_limit = false;
 	int ret;
 
-	if (!con)
+	if (!con || amdgpu_sriov_vf(adev))
 		return 0;
 
 	/* Allow access to RAS EEPROM via debugfs, when the ASIC
-- 
2.35.1

