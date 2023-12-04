Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00D803FC7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 21:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C477E10E3F5;
	Mon,  4 Dec 2023 20:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D6210E3F5;
 Mon,  4 Dec 2023 20:35:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB6B9CE12EB;
 Mon,  4 Dec 2023 20:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8F6C433C8;
 Mon,  4 Dec 2023 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701722154;
 bh=a0s+k8aeyTC35CbI0jKcj2VEDUuAAbSTdZ1FtFsjqqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Al45rq+vzekfOwbePlSFKyw0NtukIY9X4RhmsLbz74CjEe6ja/u32J2jcJIl6rJ42
 JehVYq0q9a3zxCpmzHvxie80tvayoBFuNvZcvh99Zk5CY2/OOMB8fYRvitIVrM23Ig
 r6UMfGki6LnIF/1Ex24WmgUSMX3uMJqPNmGFeN/IM4hQc5oM2wJD6SgtJYYJd0W/xT
 TBUVXm51EQyztlLhOJVKSG3oTO1gdIISYvdLwaoqdT05vUCqN1CTb/wcLReKQty9Uy
 TcgQf8I1DmSAiM6M0eP/jV9XKP1ptBvP7KeLvc7QmwxF9Wh608062xoT0n/Tph8iw/
 uWSZoVZKT8WjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 13/17] drm/amd/display: update dcn315 lpddr pstate
 latency
Date: Mon,  4 Dec 2023 15:34:58 -0500
Message-ID: <20231204203514.2093855-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204203514.2093855-1-sashal@kernel.org>
References: <20231204203514.2093855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.65
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
Cc: trix@redhat.com, dri-devel@lists.freedesktop.org, Josip.Pavic@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene Liu <charlene.liu@amd.com>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, HaoPing.Liu@amd.com,
 Jingwen.Zhu@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>

[ Upstream commit c92da0403d373c03ea5c65c0260c7db6762013b0 ]

[WHY/HOW]
Increase the pstate latency to improve ac/dc transition

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 893991a0eb971..28b83133db910 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -324,7 +324,7 @@ static struct wm_table lpddr5_wm_table = {
 		{
 			.wm_inst = WM_A,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
@@ -332,7 +332,7 @@ static struct wm_table lpddr5_wm_table = {
 		{
 			.wm_inst = WM_B,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
@@ -340,7 +340,7 @@ static struct wm_table lpddr5_wm_table = {
 		{
 			.wm_inst = WM_C,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
@@ -348,7 +348,7 @@ static struct wm_table lpddr5_wm_table = {
 		{
 			.wm_inst = WM_D,
 			.wm_type = WM_TYPE_PSTATE_CHG,
-			.pstate_latency_us = 11.65333,
+			.pstate_latency_us = 129.0,
 			.sr_exit_time_us = 11.5,
 			.sr_enter_plus_exit_time_us = 14.5,
 			.valid = true,
-- 
2.42.0

