Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11636E788D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 13:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A755510E029;
	Wed, 19 Apr 2023 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0C210E029
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 11:24:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01FFE614D9;
 Wed, 19 Apr 2023 11:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC3AC433EF;
 Wed, 19 Apr 2023 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681903489;
 bh=PanmDTu5lRIgSn8GKJ9uoLf6Evo6osxCZ4efcHlSt3U=;
 h=From:To:Cc:Subject:Date:From;
 b=iWQ76DyFPVUXh4v11hmPber04xI849i4omW2/7EpTyHlfQDeFGzMNdfmt/ptO7kEL
 Uj9fIK7xlz6KlyMtCZstTGAlwRevPS5u8I2hHOsbzqk6F1kIhcKYdcTlGY5bGwF6T/
 udu4HtrAfP/zvSChXI+Y4wOJ+6HPJDr0L32KI+1AfW2mspcd+mqXM0cQgyIaWEVCcF
 JODgl1mC7L1n3tsOOOG9mTMwukBNITvN7ANRt3v8hI9dhTFeidy2nYOOKjYBevJzHH
 WPoFWj41GmJQdCTm5w+jN8IBCbM7NFwqL51yEahYRBtJSm4zE5NvL4+XDU9YtanTWI
 FlKc3OmIggNRw==
From: Jeff Layton <jlayton@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
Date: Wed, 19 Apr 2023 07:24:46 -0400
Message-Id: <20230419112447.18471-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've been experiencing some intermittent crashes down in the display
driver code. The symptoms are ususally a line like this in dmesg:

    amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 000000006d3a3885: -5

...followed by an Oops due to a NULL pointer dereference.

Switch to using mgr->dev instead of state->dev since "state" can be
NULL in some cases.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2184855
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I've been running this patch for a couple of days, but the problem
hasn't occurred again as of yet. It seems sane though as long as we can
assume that mgr->dev will be valid even when "state" is a NULL pointer.

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..e2e21ce79510 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* Skip failed payloads */
 	if (payload->vc_start_slot == -1) {
-		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
-- 
2.39.2

