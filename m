Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99C5A6981
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B812B10E245;
	Tue, 30 Aug 2022 17:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7C010E242;
 Tue, 30 Aug 2022 17:19:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0682661734;
 Tue, 30 Aug 2022 17:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8108C433C1;
 Tue, 30 Aug 2022 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661879948;
 bh=QBsjK9oGm5O9r4YTpxdmvu68qWH0C2oAEG1TyScOEnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CgvZvQn4290m3P/ibZRlay+67pEXm/8buecgrlSPFM8Q6fdHmNEavmBM1bnTuRt2h
 Z8LjpG4PbIRkL0bPLS+JPo/fGO+3jzvFjSymcrR67+ZZOwmPuKTxRBS/etgmjqQxT0
 UzJ23Ga5L/1nBD3V0JUTjdus7uJOJHzQmB8wlUSsIH4kacoFwZopMqEk0neDuoQ5wF
 BFfFSmtqJ0HUg9dTDxUEihQ5GvO2NmOIiiutg0Af8fKtjEP2OLQYUsx38FBr4cCewF
 ziMK//M5ZHy7oANgzXpSqOp8bjqbyKA0RMvq095Lufb0oxV4zC2LaBbfjr8zbS1mGi
 nVREjQCBN8YVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 10/33] drm/amdgpu: fix hive reference leak when
 adding xgmi device
Date: Tue, 30 Aug 2022 13:18:01 -0400
Message-Id: <20220830171825.580603-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Amaranath.Somalapuram@amd.com,
 guchun.chen@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 shaoyun.liu@amd.com, lang.yu@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: YiPeng Chai <YiPeng.Chai@amd.com>

[ Upstream commit f5994da72ba124a3d0463672fdfbec073e3bb72f ]

Only amdgpu_get_xgmi_hive but no amdgpu_put_xgmi_hive
which will leak the hive reference.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3adebb63680e0..ea2b74c0fd229 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2482,12 +2482,14 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 			if (!hive->reset_domain ||
 			    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
 				r = -ENOENT;
+				amdgpu_put_xgmi_hive(hive);
 				goto init_failed;
 			}
 
 			/* Drop the early temporary reset domain we created for device */
 			amdgpu_reset_put_reset_domain(adev->reset_domain);
 			adev->reset_domain = hive->reset_domain;
+			amdgpu_put_xgmi_hive(hive);
 		}
 	}
 
-- 
2.35.1

