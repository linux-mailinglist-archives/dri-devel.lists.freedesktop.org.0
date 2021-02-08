Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0E313BE1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756B16E995;
	Mon,  8 Feb 2021 17:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA2C6E993;
 Mon,  8 Feb 2021 17:59:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD30B64EDE;
 Mon,  8 Feb 2021 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807155;
 bh=MYgGwpMm4Mmrwtr1ug2cuINDrU/BD+xVAfgGPokED+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C18OHy0HoJjm1A5C08bfstN4Unz5H4zAppkfQdPN7DLZVT/TDwtbMnFRVIAesPAq3
 1AGAV2kltXqJr6kZg2ylUn5dAVgZAmhV8AcESvjEkph9uLDkm9PrvzIKXKgvvP5joM
 OZgIgNvlDhttblmBBlGvnBnnIp5LgIH2M8RNE1Ph/jeYeaqewQwfdWIJL0zdhYrZew
 BLGjLuIzzAnomSSltWvNBOd3x5ho8kvZMcG3SHWG4f/Nym4OX/i/4IirSsRN/YZKzj
 bO+ftMmMkDcfwH3OjU3J/RHJpO8izuUNeQmKjlp/i+ECvRt5TKQP4WEKSHSP81HpqK
 qNu/aZDpcLNYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/19] drm/amd/display: Free atomic state after
 drm_atomic_commit
Date: Mon,  8 Feb 2021 12:58:51 -0500
Message-Id: <20210208175858.2092008-12-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175858.2092008-1-sashal@kernel.org>
References: <20210208175858.2092008-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <Anson.Jacob@amd.com>,
 Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 Victor Lu <victorchengchi.lu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[ Upstream commit 2abaa323d744011982b20b8f3886184d56d23946 ]

[why]
drm_atomic_commit was changed so that the caller must free their
drm_atomic_state reference on successes.

[how]
Add drm_atomic_commit_put after drm_atomic_commit call in
dm_force_atomic_commit.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Reviewed-by: Roman Li <Roman.Li@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 99ece6ea26bdf..9284960d24b0a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6465,14 +6465,14 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
 
 	ret = PTR_ERR_OR_ZERO(conn_state);
 	if (ret)
-		goto err;
+		goto out;
 
 	/* Attach crtc to drm_atomic_state*/
 	crtc_state = drm_atomic_get_crtc_state(state, &disconnected_acrtc->base);
 
 	ret = PTR_ERR_OR_ZERO(crtc_state);
 	if (ret)
-		goto err;
+		goto out;
 
 	/* force a restore */
 	crtc_state->mode_changed = true;
@@ -6482,17 +6482,15 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
 
 	ret = PTR_ERR_OR_ZERO(plane_state);
 	if (ret)
-		goto err;
-
+		goto out;
 
 	/* Call commit internally with the state we just constructed */
 	ret = drm_atomic_commit(state);
-	if (!ret)
-		return 0;
 
-err:
-	DRM_ERROR("Restoring old state failed with %i\n", ret);
+out:
 	drm_atomic_state_put(state);
+	if (ret)
+		DRM_ERROR("Restoring old state failed with %i\n", ret);
 
 	return ret;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
