Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8215DC2A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1C86F9C1;
	Fri, 14 Feb 2020 15:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1B56F9A5;
 Fri, 14 Feb 2020 15:52:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 531C22465D;
 Fri, 14 Feb 2020 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695543;
 bh=HgKQeKWb+GCFsDDznzsjcy/sSDQxBonJiUZijKIJNp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T/CFRVVyRyeihluxDZamgqlu3kkvhgo+0ziGXhuHh/GzVh+6J3msW8zmDqI56I9CY
 abf1J/Sdxor/xXhj7bsn9mjt0Tg9CQQd8/3ar0BCC3SI4wyLXDcubAz4TfqkfivF1/
 NiMSvuDo9PXBQkuyOoKDrhuYiHg3ye3IesBq5neE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 160/542] drm/amdgpu/dm: Do not throw an error for
 a display with no audio
Date: Fri, 14 Feb 2020 10:42:32 -0500
Message-Id: <20200214154854.6746-160-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

[ Upstream commit 852a91d627e9ce849d68df9d3f5336689003bdc7 ]

An old display with no audio may not have an EDID with a CEA block, or
it may simply be too old to support audio. This is not a driver error,
so don't flag it as such.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=112140
References: ae2a3495973e ("drm/amd: be quiet when no SAD block is found")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jean Delvare <jdelvare@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 0b401dfbe98a9..34f483ac36ca4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -97,8 +97,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 			(struct edid *) edid->raw_edid);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
-	if (sad_count < 0)
-		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
 		return result;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
