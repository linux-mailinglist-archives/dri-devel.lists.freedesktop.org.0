Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996BD3BCBB1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107836E096;
	Tue,  6 Jul 2021 11:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E926E096;
 Tue,  6 Jul 2021 11:15:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CC5361C5C;
 Tue,  6 Jul 2021 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570122;
 bh=yYQX/l86/tT//dk9dZb0R3ZlXb4iOuPLeiwiA8cA/Ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=faFK7j/lIQIxBvz/+HSdBQsfwQhiDzhoSVbvaIkFjUnEzXy8Ye8GSNaCuPjDPJ6K8
 D+UWLuQ1Sp0aASvV6u98ZzhuR0kGk/eedSEuis4xYobV4IIzRhpJmV34D29Y5FtTyj
 3S0vh0Dy9D2VPhmdz6Vc9Y8/wjVufdaXZ13sf6VhP3nXtfJtYC3vsyJdgoCWCkaJbp
 OsRHCJh0UGUjmLRgLmx1QHd8CjlZ/ifoU/GVzN4R0MpBFwKG5y9PPnO/xdyKLVWLkp
 Je57xGQwFN2Iz5vNXD4t/0QPHEBxEbmP0jcJO273j2vesfCV2xQjVj5x/WvYOIwJAd
 3iGSsWErWU66Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 051/189] drm/amdgpu/swsmu/aldebaran: fix check in
 is_dpm_running
Date: Tue,  6 Jul 2021 07:11:51 -0400
Message-Id: <20210706111409.2058071-51-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit dd1d82c04e111b5a864638ede8965db2fe6d8653 ]

If smu_cmn_get_enabled_mask() fails, return false to be
consistent with other asics.

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index 16ad4683eb69..0d2f61f56f45 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1290,10 +1290,13 @@ static int aldebaran_usr_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_
 
 static bool aldebaran_is_dpm_running(struct smu_context *smu)
 {
-	int ret = 0;
+	int ret;
 	uint32_t feature_mask[2];
 	unsigned long feature_enabled;
+
 	ret = smu_cmn_get_enabled_mask(smu, feature_mask, 2);
+	if (ret)
+		return false;
 	feature_enabled = (unsigned long)((uint64_t)feature_mask[0] |
 					  ((uint64_t)feature_mask[1] << 32));
 	return !!(feature_enabled & SMC_DPM_FEATURE);
-- 
2.30.2

