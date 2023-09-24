Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABDC7AC8C0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E786410E19E;
	Sun, 24 Sep 2023 13:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631CC10E1A7;
 Sun, 24 Sep 2023 13:19:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEE6260C3A;
 Sun, 24 Sep 2023 13:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB25C433CB;
 Sun, 24 Sep 2023 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561567;
 bh=1Pyq3dncUK8p5J2LPF3VavG5lJ4d4b1IdIUVjw46iZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kx+tsrqUyR1MyguijuksonPVK8T56GMC/pgm5OFIDOYVdOSdXz7QzAv3bQ1+uoW89
 CuPMXE2GyeEaa+c7LFl7IQruexAxZP+G8TfjjJoGf0FLVDd7jM0UK5pNuOgc42N3zr
 RPCn2WksU3iPpU86dUauq9SZ0IxXaZJONKSkJzkYIznDp3neCYKntvqzvApWVtvob6
 YhgPH3gz9goBDl7s+CR/9F/ECxvtHMv/BQjlB1GVM7VRi+xKLEb4ANFi6cXiMFiCEi
 YpgXZ0+9hfMYYcanf+6IWefg6+DD2cpgvZjBxSaC08fKHSmX6HAXsCanZY/Mn3sqX5
 ch19nwEqVtt6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 13/18] drm/amd/display: Don't check registers,
 if using AUX BL control
Date: Sun, 24 Sep 2023 09:18:50 -0400
Message-Id: <20230924131857.1276330-13-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131857.1276330-1-sashal@kernel.org>
References: <20230924131857.1276330-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.133
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
Cc: Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 mario.limonciello@amd.com, Jun.Lei@amd.com, Sasha Levin <sashal@kernel.org>,
 charlene.liu@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 tony.tascioglu@amd.com, Stylon Wang <stylon.wang@amd.com>, ahmed.ahmed@amd.com,
 Jingwen.Zhu@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Swapnil Patel <swapnil.patel@amd.com>,
 Xinhui.Pan@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swapnil Patel <swapnil.patel@amd.com>

[ Upstream commit f5b2c10b57615828b531bb0ae56bd6325a41167e ]

[Why]
Currently the driver looks DCN registers to access if BL is on or not.
This check is not valid if we are using AUX based brightness control.
This causes driver to not send out "backlight off" command during power off
sequence as it already thinks it is off.

[How]
Only check DCN registers if we aren't using AUX based brightness control.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Swapnil Patel <swapnil.patel@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 52142d272c868..87825818d43ec 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -980,7 +980,9 @@ void dce110_edp_backlight_control(
 		return;
 	}
 
-	if (link->panel_cntl) {
+	if (link->panel_cntl && !(link->dpcd_sink_ext_caps.bits.oled ||
+		link->dpcd_sink_ext_caps.bits.hdr_aux_backlight_control == 1 ||
+		link->dpcd_sink_ext_caps.bits.sdr_aux_backlight_control == 1)) {
 		bool is_backlight_on = link->panel_cntl->funcs->is_panel_backlight_on(link->panel_cntl);
 
 		if ((enable && is_backlight_on) || (!enable && !is_backlight_on)) {
-- 
2.40.1

