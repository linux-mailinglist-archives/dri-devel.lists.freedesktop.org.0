Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5D75C02C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5747410E9CD;
	Wed, 21 Sep 2022 15:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187810E9C7;
 Wed, 21 Sep 2022 15:54:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FD9E63189;
 Wed, 21 Sep 2022 15:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD16C433D7;
 Wed, 21 Sep 2022 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775680;
 bh=v5EDMi5xv8Yp5djZlevGniTsGU8hyj95KCeXj7CWXZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hx6C6QpmEop/DNOhefbEZrnf3tCn0RokgNUyvbXdz39bDLItCEIHym3lEC2Hs1wvl
 jtQwltN2tGnRya6Nt6+D1B/BnrngTYhaoC3oAEnYXMQO6PRDUr08Xk7htHwUM8F9fY
 93m9e9RwCXaeExjPX/qjZa7IxSh47zr9GcNC/VU2mUv4RIE8MX2xytuUegLhsC3QMe
 8ewGCYlVWuVR/QvIbf3p8Shjg2AlOX+6qc6SR64WFv580hOvHfTLS1wji6iO9hfkX0
 p6eIutVEm1KY/0JRDHCn1PIp0oBQC2VgDTuF01Zc6ExfgJDRBxPRLdoJqaYg/xzkoU
 F0jZ5XLVKeSqg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 3/5] drm/amdgpu: use dirty framebuffer helper
Date: Wed, 21 Sep 2022 11:54:34 -0400
Message-Id: <20220921155436.235371-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155436.235371-1-sashal@kernel.org>
References: <20220921155436.235371-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, guchun.chen@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, seanpaul@chromium.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com, greenfoo@u92.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hamza Mahfooz <hamza.mahfooz@amd.com>

[ Upstream commit 66f99628eb24409cb8feb5061f78283c8b65f820 ]

Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_funcs
struct.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b588e0e409e7..d8687868407d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -35,6 +35,7 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -495,6 +496,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
 static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
 	.destroy = drm_gem_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
+	.dirty = drm_atomic_helper_dirtyfb,
 };
 
 uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
-- 
2.35.1

