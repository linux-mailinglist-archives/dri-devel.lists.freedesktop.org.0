Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F396F59002A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B43B459F;
	Thu, 11 Aug 2022 15:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBAFB45C9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:39:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2F83DCE224E;
 Thu, 11 Aug 2022 15:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB9CC433D7;
 Thu, 11 Aug 2022 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232388;
 bh=i16o/UpQOLnaNmb6qlvby7vOoR3dY23lMEGXDmWnHrk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sm90RI0lo8u4ujfMpWnNVTlat5k0NHBmxg7i3s+CY/vfgqVHMrTmxjomjAj/IcCVD
 K9w3PRnOWE2jTeC4MQ5DPYF4vZ/hMHXRk3pX3QS0t5/pQKTJn9+Kvgtq67cZSbP2pI
 ZTPfsEaRU2HuQpvxgDmNadG8dx3uUIHBm7GgZxUlxiUMuHyeKntGoo1fyE20HFvFEN
 Kt1Fe6vtnn5CnDe5KnDxmp8178F4I69Oxq/MqoklrXAmqxm5q9EOClt6eOdS9dqgvU
 88W+mUiPl/XwEm1GsdttKu9FnxDWMZaV13jgOuOSPyNf2mxAwByn+kdWD8gexV6CYY
 GAw3QQ4hobGTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 075/105] drm/amdgpu: Call trace info was found in
 dmesg when loading amdgpu
Date: Thu, 11 Aug 2022 11:27:59 -0400
Message-Id: <20220811152851.1520029-75-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sathishkumar.sundararaju@amd.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, guchun.chen@amd.com,
 airlied@linux.ie, Jingwen Chen <Jingwen.Chen2@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, lin cao <lin.cao@amd.com>,
 danijel.slivka@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Mohammadzafar.ziya@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lin cao <lin.cao@amd.com>

[ Upstream commit 748262eb400e809aa13e3485f4983c3db3d0ebb3 ]

In the case of SRIOV, the register smnMp1_PMI_3_FIFO will get an invalid
value which will cause the "shift out of bound". In Ubuntu22.04, this
issue will be checked an related call trace will be reported in dmesg.

Signed-off-by: lin cao <lin.cao@amd.com>
Reviewed-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 78f3d9e722bb..4db7e32efd08 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -886,6 +886,7 @@ static void sienna_cichlid_stb_init(struct smu_context *smu);
 
 static int sienna_cichlid_init_smc_tables(struct smu_context *smu)
 {
+	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
 
 	ret = sienna_cichlid_tables_init(smu);
@@ -896,7 +897,8 @@ static int sienna_cichlid_init_smc_tables(struct smu_context *smu)
 	if (ret)
 		return ret;
 
-	sienna_cichlid_stb_init(smu);
+	if (!amdgpu_sriov_vf(adev))
+		sienna_cichlid_stb_init(smu);
 
 	return smu_v11_0_init_smc_tables(smu);
 }
-- 
2.35.1

