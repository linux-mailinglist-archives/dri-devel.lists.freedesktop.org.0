Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC3540783
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A343610ED75;
	Tue,  7 Jun 2022 17:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43D310E849;
 Tue,  7 Jun 2022 17:51:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B5806172E;
 Tue,  7 Jun 2022 17:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EEDC385A5;
 Tue,  7 Jun 2022 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624309;
 bh=WOZZ81gRLciIhVRawU+i1v+Da6F8SDjqNSRRDxrrypA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LJBd9gXmVLcmbxvJOYkoSsJXJqPT/iJPZ5nINJlDqarivZ3EMWjuKUxMM8s0cjQDR
 fWWIc1PUfeHJf1Zoqegn/jodLF86AOhjRh+9iSdKslJfoqf995F+xFuVMLFy40sMgG
 F5jqwaHgGyR2A7ADsKv1ic5fBAIyziOK/pAu2gCf/Fw4PfgBS+ObbY8XhqT00hXHcL
 dKMGtp9pilsilThCuS6e0blVhXIlR8+V9Sx7bu0txPDpIJMsE9b8YplS04EO7PK0rk
 +WMhninCYJcnnZmVzptVZZeuvEL20lswYJCtA/T8XZD/MNK5As4afQCOC44rqVAdo8
 2731n6Qyt/+KQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 46/68] drm/amd/display: Check zero planes for OTG
 disable W/A on clock change
Date: Tue,  7 Jun 2022 13:48:12 -0400
Message-Id: <20220607174846.477972-46-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com, Eric.Yang2@amd.com,
 sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, michael.strauss@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 paul.hsieh@amd.com, nikola.cornij@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 66a197203794339b028eedfa880bff9367fce783 ]

[Why]
A display clock change hang can occur when switching between DIO and HPO
enabled modes during the optimize_bandwidth in dc_commit_state_no_check
call.

This happens when going from 4k120 8bpc 420 to 4k144 10bpc 444.

Display clock in the DIO case is 1200MHz, but pixel rate is 600MHz
because the pixel format is 420.

Display clock in the HPO case is less (800MHz?) because of ODM combine
which results in a smaller divider.

The DIO is still active in prepare but not active in the optimize which
results in the hang occuring.

During this change there are no planes on the stream so it's safe to
apply the workaround, but dpms_off = false and signal type is not
virtual.

[How]
Check for plane_count == 0, no planes on the stream.

It's easiest to check pipe->plane_state == NULL as an equivalent check
rather than trying to search for the stream status in the context
associated with the stream, so let's do that.

The primary, non MPO pipe should not have a NULL plane state.

Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 8be4c1970628..3bf2ab2ff7f8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -91,7 +91,8 @@ static void dcn315_disable_otg_wa(struct clk_mgr *clk_mgr_base, bool disable)
 
 		if (pipe->top_pipe || pipe->prev_odm_pipe)
 			continue;
-		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))) {
+		if (pipe->stream && (pipe->stream->dpms_off || pipe->plane_state == NULL ||
+				     dc_is_virtual_signal(pipe->stream->signal))) {
 			if (disable)
 				pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
 			else
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index 3121dd2d2a91..fc3af81ed6c6 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -122,7 +122,8 @@ static void dcn316_disable_otg_wa(struct clk_mgr *clk_mgr_base, bool disable)
 
 		if (pipe->top_pipe || pipe->prev_odm_pipe)
 			continue;
-		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))) {
+		if (pipe->stream && (pipe->stream->dpms_off || pipe->plane_state == NULL ||
+				     dc_is_virtual_signal(pipe->stream->signal))) {
 			if (disable)
 				pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
 			else
-- 
2.35.1

