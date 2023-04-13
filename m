Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BCF6E0C30
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 13:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCDF10E152;
	Thu, 13 Apr 2023 11:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13D210E152
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 11:12:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43C47614FF;
 Thu, 13 Apr 2023 11:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4756AC433EF;
 Thu, 13 Apr 2023 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681384376;
 bh=4VkW1+23Lm1d+I+PifbrLvyuCj+NZ7vdD2QP9Uyn9NE=;
 h=From:To:Cc:Subject:Date:From;
 b=sQInOiqfc3Or7ClBdvXEMdSjp3hBfxTBwzHxD4aM2vVbz/JuaSGuD0B/f5imgRWG8
 TzlntPxLhaJ8q5Ve0FIGZVCmQL/Q+WL67Vyckotzxfi61o3ZnjMjUCk6MTOCDO9AaD
 jg1pQourlDe1LlHUupWzwiDBmB1cBMsCcU3HNdG/ZlkDercA0c8vwZwbARnOAYjImx
 c+phH/xw2+FTblCPOZ7prUmr0eeDkU5csYjTRW08CK8IHc0PQ08nruKWGtPgJWTUz/
 ebRdENkYtgHUi3aC95FRAQkrR60CybTQjVvlBtXOeg38hjhbUoywhneM0ly/vftMgw
 X8giehzGLXrqA==
From: Jeff Layton <jlayton@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle NULL
 state pointer
Date: Thu, 13 Apr 2023 07:12:54 -0400
Message-Id: <20230413111254.22458-1-jlayton@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've been experiencing some intermittent crashes down in the display
driver code. The symptoms are ususally a line like this in dmesg:

    amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 000000006d3a3885: -5

...followed by an Oops due to a NULL pointer dereference.

The real bug is probably in the caller of this function, which is
passing it a NULL state pointer, but this patch at least keeps my
machine from oopsing when this occurs.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2184855
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..87ad406c50f9 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* Skip failed payloads */
 	if (payload->vc_start_slot == -1) {
-		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+		drm_dbg_kms(state ? state->dev : NULL,
+			    "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
-- 
2.39.2

