Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDCA1C8E5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA5A10E3B7;
	Sun, 26 Jan 2025 14:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SPdcX3Zj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C87810E3A9;
 Sun, 26 Jan 2025 14:54:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEE465C606C;
 Sun, 26 Jan 2025 14:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69450C4CEEB;
 Sun, 26 Jan 2025 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903255;
 bh=AUYlC3Kq1tJ9yUzra1pfHn+21oUrYNBP5wRDuPx4TAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SPdcX3Zj9eARevzCLHqZqL0Z9+Xf9cHx+Ic3YcS+kTqHi7w2PeOIAyrwY5UuxjCgA
 2Mf7R9hdGriohFGoLCnupuOKb5eIpG64k1VCQDUqe/Ql4pvZJqqeCCBcUXy6PYx8nX
 O7EIw+5NK3dOE5j7WMAGymjst3PMyyBPBEx3Bh4GFKXC1e3RYZT6hdWQGvg6Rm/2l+
 c+7negN4Wv3d8HBLv4EazfDKCS9RWR78a+H6aI+89ECbDLgRI4V9GEcFilvsLQOWlf
 wbxmEEjTofkBPYcqTijAwiUqgMChb5ohrBwE3W4Krgt9j6WaU3Pd5Y6Kvuq0lq2abJ
 rqoY5BQhli8qw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Sasha Levin <sashal@kernel.org>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 20/34] drm/radeon: use eld_mutex to protect
 access to connector->eld
Date: Sun, 26 Jan 2025 09:52:56 -0500
Message-Id: <20250126145310.926311-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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

[ Upstream commit b54c14f82428c8a602392d4cae1958a71a578132 ]

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20241206-drm-connector-eld-mutex-v2-8-c9bce1ee8bea@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 5b69cc8011b42..8d64ba18572ec 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -775,8 +775,10 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 		if (!dig->pin || dig->pin->id != port)
 			continue;
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 		break;
 	}
 
-- 
2.39.5

