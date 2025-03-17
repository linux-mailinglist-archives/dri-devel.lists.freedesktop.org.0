Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5EBA65844
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BCF10E173;
	Mon, 17 Mar 2025 16:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cSmCEfB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5E510E173;
 Mon, 17 Mar 2025 16:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1700AA48767;
 Mon, 17 Mar 2025 16:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED3BC4CEE3;
 Mon, 17 Mar 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742229482;
 bh=id79ieMkz1pM0rJ2Gjf3/Q9lJqRt9loQtH5PMtyfNTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cSmCEfB2wz9aMxEDbtWs8DB2VEmnR4Q+XShGrzkBwJFxp5XB+ATb0vr7dfdh1ct8j
 9GQW7iFrPsdmNUBPXSXCW6AYGIbUdoXka4ZosH/sv93RM71sh4EhAqA2Y6LIcEFFwe
 3gPnGB68Ad9NOhkBPbBj5ZrKxCGAENyEFXkzVUbwTbLdOziTerXwpC6pDGsC9u7/XH
 /qwFDPpt7I4ztnL204wPln+MSiYSEzacsvSvtY590p6nj8I7n9Bn3IHm/U0aS+dWuk
 gDh1IPGu4QG7w0pfW92JAsbSKL5nyQnSMnnFedNA43hJNFbX31501yu40WCCi0w+Wz
 Pi0fKyUn3Ut4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunpeng.li@amd.com, lijo.lazar@amd.com, tzimmermann@suse.de,
 rajneesh.bhardwaj@amd.com, shaoyun.liu@amd.com, Ramesh.Errabolu@amd.com,
 chiahsuan.chung@amd.com, siqueira@igalia.com, sunil.khatri@amd.com,
 alex.hung@amd.com, aurabindo.pillai@amd.com, hersenxs.wu@amd.com,
 mwen@igalia.com, hamzamahfooz@linux.microsoft.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 12/16] drm/amd: Keep display off while going into
 S4
Date: Mon, 17 Mar 2025 12:37:21 -0400
Message-Id: <20250317163725.1892824-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317163725.1892824-1-sashal@kernel.org>
References: <20250317163725.1892824-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.7
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

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 4afacc9948e1f8fdbca401d259ae65ad93d298c0 ]

When userspace invokes S4 the flow is:

1) amdgpu_pmops_prepare()
2) amdgpu_pmops_freeze()
3) Create hibernation image
4) amdgpu_pmops_thaw()
5) Write out image to disk
6) Turn off system

Then on resume amdgpu_pmops_restore() is called.

This flow has a problem that because amdgpu_pmops_thaw() is called
it will call amdgpu_device_resume() which will resume all of the GPU.

This includes turning the display hardware back on and discovering
connectors again.

This is an unexpected experience for the display to turn back on.
Adjust the flow so that during the S4 sequence display hardware is
not turned back on.

Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2038
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Link: https://lore.kernel.org/r/20250306185124.44780-1-mario.limonciello@amd.com
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 68bfdc8dc0a1a7fdd9ab61e69907ae71a6fd3d91)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 +++++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 91a874bb0e241..fc953ef4eedd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2556,7 +2556,6 @@ static int amdgpu_pmops_freeze(struct device *dev)
 
 	adev->in_s4 = true;
 	r = amdgpu_device_suspend(drm_dev, true);
-	adev->in_s4 = false;
 	if (r)
 		return r;
 
@@ -2568,8 +2567,13 @@ static int amdgpu_pmops_freeze(struct device *dev)
 static int amdgpu_pmops_thaw(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+	int r;
 
-	return amdgpu_device_resume(drm_dev, true);
+	r = amdgpu_device_resume(drm_dev, true);
+	adev->in_s4 = false;
+
+	return r;
 }
 
 static int amdgpu_pmops_poweroff(struct device *dev)
@@ -2582,6 +2586,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
 static int amdgpu_pmops_restore(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+
+	adev->in_s4 = false;
 
 	return amdgpu_device_resume(drm_dev, true);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ca6b9a585aba9..8652433aff1c6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3320,6 +3320,11 @@ static int dm_resume(struct amdgpu_ip_block *ip_block)
 
 		return 0;
 	}
+
+	/* leave display off for S4 sequence */
+	if (adev->in_s4)
+		return 0;
+
 	/* Recreate dc_state - DC invalidates it when setting power state to S3. */
 	dc_state_release(dm_state->context);
 	dm_state->context = dc_state_create(dm->dc, NULL);
-- 
2.39.5

