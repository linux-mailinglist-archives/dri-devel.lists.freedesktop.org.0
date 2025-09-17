Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66261B80365
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B278E10E875;
	Wed, 17 Sep 2025 14:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="izIozhuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3234210E870
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C7186023C;
 Wed, 17 Sep 2025 14:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60E1C4CEF7;
 Wed, 17 Sep 2025 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120453;
 bh=3CoE1GJH0VwHBAmjRypgbLmKrahNnnzJwlvIYSMZLLs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=izIozhuTRq5JzzXAv5qpvj/31GxWmxb9STZ4F416iNzJqmVHp+GBt18v46ho+1R+R
 MrBK9aHgYdoBv28bzQcFYmOXposA63apR1ZCOsTnR/CGIaPe/nU9TNdNHdd1VpCEsG
 fOnn7eRRWD1ivHdyrbbsj3LDzg9sY+W2Pe27oAtq9Jgg4bnd3Xs9MhV4KxZiX3SNG/
 1yzDn996MDyX22aHTBMmUehBIUQUr70d3KlCL7jZ3e5UlXWxyCdmBoCvEIlEOhnwCn
 hp8Ysy9g9NFDvliWPJYA3XRWRwAXE5uw/07CMWA0rsJGt+Z4HgoFvqkuWwusmQGMkO
 kfAyvM6v6dO3g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:10 +0200
Subject: [PATCH v4 29/39] drm/tegra: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-29-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3CoE1GJH0VwHBAmjRypgbLmKrahNnnzJwlvIYSMZLLs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq6RZb4e/NHcyPHEkutcki9FQ61//j5070FJ9rO/d
 ysNYrJsOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEqu4xNlwxrVmiMm/elZX/
 nl8utX/y9rJRzYm7h+wXsWVaMBkrcCntYeGKVr6uf33euviTZy02xDE29J7ZfpCLtfvqSasTx1Y
 qW1cePvQ/YnPgTZWaKgUrNbvAU2f9rDrCL8dO3Gv4+Jb56a6jAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The tegra atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a82f62c1835da574867084da98106..0f80da3544c9b3a239c43740c05f007711bc728b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1031,11 +1031,11 @@ static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_a
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int err;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;

-- 
2.50.1

