Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C5A798F26
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623E810E114;
	Fri,  8 Sep 2023 19:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8304810E123;
 Fri,  8 Sep 2023 19:30:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41431B821D4;
 Fri,  8 Sep 2023 19:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526D5C433CD;
 Fri,  8 Sep 2023 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201406;
 bh=UlNHEZooncUx70aELClSSXCKe2hSn6Mzv2ec/t1aFdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXkhwhKRJ4WSZgPosT3jwaUXzj1yo+CdbdRqMZ6wtBE0+G8GASLbnCXotK1OlCELR
 vXvibF6tJMgu6Iz2Wkhu2i9ZNFgt5R5KPJ227DNwuDamjmhIL47MqdmxAUqy/nRExI
 6b/mIK0J7ptPUJ5MfnlwMWianwRSE5suP/04Do28lbz73lqLvRJBwvcsn7cnHrtBFj
 Zgo++bvtT08ojMSGjlwaYOm4tzK3Dh0/vLc5AWvShjQtuRuqTijKOtGf5BXAOO95Ry
 pZmi2WUNYtMwCWbaaOnbSLDkuJNCJkOplD3bqct5lKerwTTpgzdQUmVqocmknoGoSr
 /f+JlA3xTShkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 13/36] drm/amdgpu: Update ring scheduler info as
 needed
Date: Fri,  8 Sep 2023 15:28:24 -0400
Message-Id: <20230908192848.3462476-13-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908192848.3462476-1-sashal@kernel.org>
References: <20230908192848.3462476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com, Xinhui.Pan@amd.com,
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org, le.ma@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 James Zhu <James.Zhu@amd.com>, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit 6cb209ed68e45c8e4b71d97a037ac6b7dbce9b50 ]

Not all rings have scheduler associated. Only update scheduler data for
rings with scheduler. It could result in out of bound access as total
rings are more than those associated with particular IPs.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
index 72b629a78c62c..d0fc62784e821 100644
--- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
+++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
@@ -134,7 +134,7 @@ static int aqua_vanjaram_xcp_sched_list_update(
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		ring = adev->rings[i];
-		if (!ring || !ring->sched.ready)
+		if (!ring || !ring->sched.ready || ring->no_scheduler)
 			continue;
 
 		aqua_vanjaram_xcp_gpu_sched_update(adev, ring, ring->xcp_id);
-- 
2.40.1

