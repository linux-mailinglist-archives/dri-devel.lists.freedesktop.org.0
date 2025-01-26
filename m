Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59CA1C93C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C10110E41A;
	Sun, 26 Jan 2025 14:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gEduJBqM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE3010E417;
 Sun, 26 Jan 2025 14:56:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63800A406EC;
 Sun, 26 Jan 2025 14:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D74C4CED3;
 Sun, 26 Jan 2025 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903392;
 bh=kME5yRiRSilS8XC5gTZceQWF76oZl872X/ZUtzoDK68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gEduJBqMjTWIzlEe+NOudpf5TZUzDX2tB8ivtS6t5tkcsXp8EbJWdpQ8beVWWp/e1
 MUvJMo9S2dZqIA10CSPFlP5g3pgeEyswuodBIJKvB9Lq048K567AIdvi0OiNijf3zL
 R96v3SwBkfA4+n3x9frZfn8vj8rEQCP9w8dZJUGXF2j8rmw1hZg7vTkbQj03IVmFp9
 1KYe1Fdv09UJG+bqr9XyzzkqFwXFjvjAg3WtrpcQcOsmJtt6j97DdqYozl80jE0Ugy
 RUKb/T2HzCMHDO5nmGkXRhkztNCUorHk3oYFSd3q586pmF+7nfI+haw1FKt8sG3JaZ
 d79Oca24LN5sw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Sasha Levin <sashal@kernel.org>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 08/17] drm/radeon: use eld_mutex to protect access
 to connector->eld
Date: Sun, 26 Jan 2025 09:56:03 -0500
Message-Id: <20250126145612.937679-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145612.937679-1-sashal@kernel.org>
References: <20250126145612.937679-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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
index fc22fe709b9c1..da37a827337bc 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -773,8 +773,10 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
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

