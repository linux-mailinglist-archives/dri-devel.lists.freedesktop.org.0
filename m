Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3DA1C905
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AFA10E3E0;
	Sun, 26 Jan 2025 14:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cHVfkIQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F1710E3DD
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:55:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 478D25C6075;
 Sun, 26 Jan 2025 14:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A999BC4CED3;
 Sun, 26 Jan 2025 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903311;
 bh=cSU342SHfm5sEU97zxcpswrgFA+24zyFUoMzYMVW89Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cHVfkIQcffM33cEtsAJGEf79PlWWjEb+torDt7SNes/Zluikmo2CSTztptCrgH2yO
 wq/7cjp8dPESKQuj7+Jb1XpPGCXE10Sv+ON+V6XFl5j5NC2ZEBLKoPemfg+aFqTYOO
 g5LNYy9ZpgFzuJt40PPE6IG2i9wdUbHF27DHjblBKtKKvWdsHbATkN1NSOcZRePpC/
 4tgCAVEsoEJaLR4TXA00qa4px+HNbPbLzuNWw4GYdWo5eDKJ+5kMQO4HmIZ7b3x2i8
 tKdSNBveHrHAB4TL3XiE7G/zvbmA7W1GyVMB0he+sDi+QS3XXuJeBQymktMcHh0IRx
 y93n6dqLKkYJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dave.stevenson@raspberrypi.com, victor.liu@nxp.com,
 ruanjinjie@huawei.com, quic_jjohnson@quicinc.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 07/31] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
Date: Sun, 26 Jan 2025 09:54:23 -0500
Message-Id: <20250126145448.930220-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145448.930220-1-sashal@kernel.org>
References: <20250126145448.930220-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit d3314efd6ebf335a3682b1d6b1b81cdab3d8254a ]

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20241130-hdmi-mode-valid-v5-1-742644ec3b1f@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710..1e77689af6549 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -46,7 +46,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	struct drm_display_mode *mode, *preferred;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	preferred = list_first_entry_or_null(&connector->modes, struct drm_display_mode, head);
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;
-- 
2.39.5

