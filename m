Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335334AFA68
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D179010E439;
	Wed,  9 Feb 2022 18:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DC010E439;
 Wed,  9 Feb 2022 18:37:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9202B82378;
 Wed,  9 Feb 2022 18:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F40C340ED;
 Wed,  9 Feb 2022 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644431843;
 bh=DrAGn9se/iGO7lfeJv3SLyvoSg1DSodiMoS+m2ZYLYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NrHRuuAjNmnv5/RAw5VWxsSvLhkqWQHoJdmJtzotcoXBT5I98xTL+4dP91q0sYSDh
 UQAOz3f0ZUXT+qqjSN7x/1DxJn84hU+g4hiwZGtxI5oPDVNVgkCQfWXFRY/scmQH0F
 vlF7uU1X5uGIyJ5Tz7eTvxPbW9t93319vxkxw4ZzHJCpJM1cebeYiHH6eq08SJaIl2
 6SDZ5WVTVcxgqds3ZsJQx/oKAO6z99DCbBo+rLDXA9ESwyeVvsmp0XhkyngNefG1QJ
 LDSfVJu1D5pT43uTzE1arPxJG/3Zuy8SL6HzP9LgWdkHz+MqASY3Bl8Yz3gec8wbGj
 Hfjuq0nSjzMCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 36/42] drm/amd: add support to check whether the
 system is set to s3
Date: Wed,  9 Feb 2022 13:33:08 -0500
Message-Id: <20220209183335.46545-36-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209183335.46545-1-sashal@kernel.org>
References: <20220209183335.46545-1-sashal@kernel.org>
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
 lijo.lazar@amd.com, Pratik.Vishwakarma@amd.com, airlied@linux.ie,
 veerabadhran.gopalakrishnan@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Prike.Liang@amd.com, amd-gfx@lists.freedesktop.org,
 shaoyun.liu@amd.com, nirmoy.das@amd.com, rdunlap@infradead.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit f52a2b8badbd24faf73a13c9c07fdb9d07352944 ]

This will be used to help make decisions on what to do in
misconfigured systems.

v2: squash in semicolon fix from Stephen Rothwell

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0a5a5370a2004..f59121ec26485 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1419,9 +1419,11 @@ static inline int amdgpu_acpi_smart_shift_update(struct drm_device *dev,
 #endif
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
+bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev);
 bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev);
 #else
 static inline bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev) { return false; }
+static inline bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev) { return false; }
 #endif
 
 int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index b19d407518024..0e12315fa0cb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1032,6 +1032,19 @@ void amdgpu_acpi_detect(void)
 }
 
 #if IS_ENABLED(CONFIG_SUSPEND)
+/**
+ * amdgpu_acpi_is_s3_active
+ *
+ * @adev: amdgpu_device_pointer
+ *
+ * returns true if supported, false if not.
+ */
+bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev)
+{
+	return !(adev->flags & AMD_IS_APU) ||
+		(pm_suspend_target_state == PM_SUSPEND_MEM);
+}
+
 /**
  * amdgpu_acpi_is_s0ix_active
  *
-- 
2.34.1

