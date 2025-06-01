Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C373ACA11E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7C710E17B;
	Sun,  1 Jun 2025 23:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A1H9eP03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED3010E178
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:24:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DFD125C5586;
 Sun,  1 Jun 2025 23:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A99C4CEF2;
 Sun,  1 Jun 2025 23:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820281;
 bh=FvoF4yjt+VixD0Lh1JUNXrpy8vAcNwCKA5aOdeHYRTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A1H9eP03MTtR7XTI1H0TXXjrSaIWhqzpXdYmKdK+C7oY7khWEnddCE7ZTJ8koGxfR
 B0XT1IrjOZ980ZJczhK6LFs+3QMLSIGmbiy2A19oFyehReh2n6qTQE4YZpa3Y8pJBM
 vq+CKrD5d+NHwKsltzcLAjmIqbSENPbeM4VipUgnn4kG+40KwtLmfCEtpn6pcInJrh
 4fV4laQQ9Rm9sb1bpflqc2Tfcd8kDPBRGsKDJVLC17/EjPmXv5QFKU/QdaAoU3Cf1w
 lW/mcJruL2+rr2QoV4LZi70w5RyKaNgtjp2+XAjH8V/JejjLybc2VYZjgxtUvhC8MU
 iGQI5uAZbNM8A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sasha Levin <sashal@kernel.org>, andrzej.hajda@intel.com, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 002/110] drm/bridge: select DRM_KMS_HELPER for
 AUX_BRIDGE
Date: Sun,  1 Jun 2025 19:22:44 -0400
Message-Id: <20250601232435.3507697-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

[ Upstream commit b12fa5e76e1463fc5a196f2717040e4564e184b6 ]

The aux bridge uses devm_drm_of_get_bridge() from the panel bridge (and
correctly selects DRM_PANEL_BRIDGE). However panel bridge is not a
separate module, it is compiled into the drm_kms_helper.o. Select
DRM_KMS_HELPER too to express this dependency.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/r/20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, here is my determination: **YES** This commit
should be backported to stable kernel trees for the following reasons:
1. **It fixes a missing dependency issue**: The commit addresses a real
dependency problem where `DRM_AUX_BRIDGE` uses
`devm_drm_of_get_bridge()` which is implemented in `bridge/panel.c`. As
shown in the Makefile analysis, `panel.o` is built into
`drm_kms_helper.o` when `CONFIG_DRM_PANEL_BRIDGE` is selected (line 149
of drivers/gpu/drm/Makefile: `drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE)
+= bridge/panel.o`). 2. **It prevents build failures**: Without
selecting `DRM_KMS_HELPER`, the aux bridge can fail to link properly
because the actual implementation of `devm_drm_of_get_bridge()` won't be
available. This can lead to undefined reference errors during linking,
similar to the issue described in Similar Commit #1 where
`devm_drm_of_get_bridge` was undefined. 3. **The fix is minimal and
safe**: The change is a simple one-line addition to select
`DRM_KMS_HELPER` in the Kconfig. This is a build configuration fix with
no runtime impact - it merely ensures the correct dependencies are
satisfied at build time. 4. **It follows established patterns**: Looking
at other bridge drivers in the same Kconfig file, we can see that
drivers using similar functionality already select `DRM_KMS_HELPER`
(e.g., lines 38, 53, 64, 88, 99 in the Kconfig show other drivers
selecting it). 5. **Similar to backported commit #2**: This fix is
conceptually similar to Similar Commit #2 which was backported and dealt
with circular dependencies and proper module organization for
`devm_drm_of_get_bridge()`. 6. **No architectural changes**: This commit
doesn't introduce new features or change any architecture - it simply
fixes a missing Kconfig dependency that should have been there from the
beginning when `DRM_AUX_BRIDGE` was introduced. The commit meets the
stable tree criteria as it: - Fixes a real bug (missing dependency
leading to potential build failures) - Is minimal and contained (single
line Kconfig change) - Has no risk of regression (only affects build
configuration) - Doesn't introduce new features or architectural changes

 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 09a1be234f717..b9e0ca85226a6 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -16,6 +16,7 @@ config DRM_AUX_BRIDGE
 	tristate
 	depends on DRM_BRIDGE && OF
 	select AUXILIARY_BUS
+	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
 	  Simple transparent bridge that is used by several non-DRM drivers to
-- 
2.39.5

