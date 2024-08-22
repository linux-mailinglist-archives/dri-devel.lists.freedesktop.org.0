Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4C95B646
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D1E10EA6B;
	Thu, 22 Aug 2024 13:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JmCb+bBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB29110EA6B;
 Thu, 22 Aug 2024 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EQk9IWFZrBZyaPOe8dF3XG2A/jJYvEXZ9mLKvMe1Bmg=; b=JmCb+bBSaU2xW2niwCUDi9fpxc
 WP3RKxOog37nKmsr+vbx2BCIdhQqA0DWChjHtooaOJKC9xwNYarSKFzpIUJC+0H+EHMrhgtJnrU07
 +JmkhVVmhOfYW7hmctMGWVZRwIq1ia2tMhlbQ3lLx8d5fZmijVjoLe+A+5Xno8aCxhFnlfLt7muY3
 VkWlAKHxodxTs1sbIMunjH0SlKxbmqZAdJDJbB/8jYhPvURCpS1D8PBdWuFg67pfZvjk9v1WxWIf/
 rhJ/qS2wT05gqEi+qP/C1JPWbcOva2ae1SZUMlX6a19kdJ0TIlrjdcwuxgyzzy48Wz4aNk+pvIddo
 spN/eKsg==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sh7i9-003ZDv-C3; Thu, 22 Aug 2024 15:18:45 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Agustin Gutierrez <Agustin.Gutierrez@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>, Swapnil.Patel@amd.com,
 Erwin Han <erwin.han@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Joshua Ashton <joshua@froggi.es>,
 Matthew Schwartz <mattschwartz@gwu.edu>, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: let update_planes_and_stream_state define
 minimal state
Date: Thu, 22 Aug 2024 10:17:04 -0300
Message-ID: <20240822131836.236644-1-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artifacts appear when using dc->current_state as the minimal transition
state in a scenario where update_planes_and_stream_state() would set the
context as the new one because the update type is FULL. To prevent those
artifacts, instead of defining the minimal state according to plane
addition (current context) or removal (new context) - when forcing
minimal pipe splitting - let update_planes_and_stream_state() define the
suitable context for minimal transition.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3441
Reported-by: Matthew Schwartz <mattschwartz@gwu.edu>
Tested-by: Matthew Schwartz <mattschwartz@gwu.edu>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index b1253e4c81a8..a9525c2df4e0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4998,11 +4998,6 @@ static bool update_planes_and_stream_v2(struct dc *dc,
 			surface_count,
 			&is_plane_addition);
 
-	/* on plane addition, minimal state is the current one */
-	if (force_minimal_pipe_splitting && is_plane_addition &&
-		!commit_minimal_transition_state(dc, dc->current_state))
-		return false;
-
 	if (!update_planes_and_stream_state(
 			dc,
 			srf_updates,
@@ -5013,13 +5008,17 @@ static bool update_planes_and_stream_v2(struct dc *dc,
 			&context))
 		return false;
 
-	/* on plane removal, minimal state is the new one */
-	if (force_minimal_pipe_splitting && !is_plane_addition) {
+	/*
+	 * minimal state is determined by update_planes_and_stream_state:
+	 * current or new context according to the update type.
+	 */
+	if (force_minimal_pipe_splitting) {
 		if (!commit_minimal_transition_state(dc, context)) {
 			dc_state_release(context);
 			return false;
 		}
-		update_type = UPDATE_TYPE_FULL;
+		if (!is_plane_addition)
+			update_type = UPDATE_TYPE_FULL;
 	}
 
 	if (dc->hwss.is_pipe_topology_transition_seamless &&
-- 
2.43.0

