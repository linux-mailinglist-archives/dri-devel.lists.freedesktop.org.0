Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E8B15B0B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B47310E438;
	Wed, 30 Jul 2025 08:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UWVFvQxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2EE10E437
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCDDB5C53E1;
 Wed, 30 Jul 2025 08:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC7EC4CEE7;
 Wed, 30 Jul 2025 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865857;
 bh=yVhms9N5GqAzMLUA3rkSwf/i/c2WOIyLpO8RY/i5zhg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UWVFvQxBsqsAKLDzacN00rm+Mz0Fsa2dFr+cUNkV613T7CLdX9a0/sDdmZkjbKm6T
 tYnhUM2BQ0l60cj5kKY02C4+jTVh0/LEBt1ZIrqXBTvV09IqafHwo3TzWyCbQKKOBx
 m/uk3JzvEutC91gg4DnRVl5DGzZmWYUH29J6o8nwNPCH3326XQM6dIrga5P4gKAta4
 ijQUXS6ZrXgkQBdME0YhHnrVSUq/x7Oh5iVayEckBDj1V5WRIrt3S8kRI7P233AKzJ
 aw3wu8kzsk7XvPa8rPc7q3I1a89tCiNPFUVRVKjwZbhBk1JrfmNu87lpk4OvreCEtV
 c4kdrK5+DCP0A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:09 +0200
Subject: [PATCH 09/14] drm/tidss: dispc: Switch VID_REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-9-a71ae8dd2782@kernel.org>
References: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
In-Reply-To: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yVhms9N5GqAzMLUA3rkSwf/i/c2WOIyLpO8RY/i5zhg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd95LVmqMfZ9zQjI+Me6rp1LMkaokb8xehP2m1x11t7
 F49ltzRMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbS/5SxzqJho4KmxenFrhlT
 Pzv5nLxo0P3/3CGWwr9SCReiLrx8uOq2qxGfw6XiXDvpqN0B96Y3MNZKvv5uNvMY912TVUxW56z
 yn3smbgrfV+PSarxhfc8hQ39btW+qM6vz+/7EPsncHMXaJQcA
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

The VID_REG_GET function takes the start and end bits as parameter and
will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change VID_REG_GET to take the mask as an argument instead, and
let the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 2d9bd95ded873232d22a1ecd8127cb0edc95c24c..d276ad881706057acabf6895f0c1f6758693504a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -624,14 +624,13 @@ static void REG_FLD_MOD(struct dispc_device *dispc, u32 idx, u32 val, u32 mask)
 	dispc_write(dispc, idx,
 		    FLD_MOD(dispc_read(dispc, idx), val, mask));
 }
 
 static u32 VID_REG_GET(struct dispc_device *dispc, u32 hw_plane, u32 idx,
-		       u32 start, u32 end)
+		       u32 mask)
 {
-	return FIELD_GET(GENMASK(start, end),
-			 dispc_vid_read(dispc, hw_plane, idx));
+	return FIELD_GET(mask, dispc_vid_read(dispc, hw_plane, idx));
 }
 
 static void VID_REG_FLD_MOD(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 			    u32 val, u32 start, u32 end)
 {
@@ -2308,11 +2307,12 @@ void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
 }
 
 static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 {
-	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS, 15, 0);
+	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS,
+			   GENMASK(15, 0));
 }
 
 static void dispc_vid_set_mflag_threshold(struct dispc_device *dispc,
 					  u32 hw_plane, u32 low, u32 high)
 {

-- 
2.50.1

