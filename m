Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E749946A983
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 22:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CB06F972;
	Mon,  6 Dec 2021 21:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708DF6EB4C;
 Mon,  6 Dec 2021 21:15:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3ADE4B81235;
 Mon,  6 Dec 2021 21:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC273C341C7;
 Mon,  6 Dec 2021 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638825303;
 bh=dUqW5jmy37lTCjgJ2ggYyL6p1tYO8IpcNgrJdv/x10I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXBVgIGdn5yJoEnMNM6USc4KCpR6NNlpKW0NXD+uBPMrKybYDlpbyP8s6O5oqBF8G
 U3uPfndsGiRP9abCtNxDCKn4y506p9T9yS3gN8wIWhDaWRalZXbf+/7AiUz76d0rYm
 Urle/jXZxAu5alxPYnrXXwlvUHk/TNEJ8KpmzvA37kkxKjO8Bg4Rz2M8sGMb2LV3oY
 fC/leiZ28WIRlTZiju63w1JWql+tbr4m6xU2xaoyVbArjlfn5Pt8b+18DVH7dcyvJi
 gu4Ecl5RLSlgUdVgOGEJERV0/n00Jf0104Y5mnUqwff3D517tvBT+kMVJ+grlTuuoW
 NequWONn3Sixg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 21/24] drm/amd/display: add connector type check
 for CRC source set
Date: Mon,  6 Dec 2021 16:12:26 -0500
Message-Id: <20211206211230.1660072-21-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211206211230.1660072-1-sashal@kernel.org>
References: <20211206211230.1660072-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dingchen.zhang@amd.com, eryk.brol@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas.Kazlauskas@amd.com, airlied@linux.ie, Perry Yuan <Perry.Yuan@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Perry Yuan <Perry.Yuan@amd.com>

[ Upstream commit 2da34b7bb59e1caa9a336e0e20a76b8b6a4abea2 ]

[Why]
IGT bypass test will set crc source as DPRX,and display DM didn`t check
connection type, it run the test on the HDMI connector ,then the kernel
will be crashed because aux->transfer is set null for HDMI connection.
This patch will skip the invalid connection test and fix kernel crash issue.

[How]
Check the connector type while setting the pipe crc source as DPRX or
auto,if the type is not DP or eDP, the crtc crc source will not be set
and report error code to IGT test,IGT will show the this subtest as no
valid crtc/connector combinations found.

116.779714] [IGT] amd_bypass: starting subtest 8bpc-bypass-mode
[ 117.730996] BUG: kernel NULL pointer dereference, address: 0000000000000000
[ 117.731001] #PF: supervisor instruction fetch in kernel mode
[ 117.731003] #PF: error_code(0x0010) - not-present page
[ 117.731004] PGD 0 P4D 0
[ 117.731006] Oops: 0010 [#1] SMP NOPTI
[ 117.731009] CPU: 11 PID: 2428 Comm: amd_bypass Tainted: G OE 5.11.0-34-generic #36~20.04.1-Ubuntu
[ 117.731011] Hardware name: AMD CZN/, BIOS AB.FD 09/07/2021
[ 117.731012] RIP: 0010:0x0
[ 117.731015] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[ 117.731016] RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
[ 117.731017] RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffffa8d64225bb5e
[ 117.731018] RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI: ffff931511a1a9d8
[ 117.731022] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 117.731023] CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4: 0000000000750ee0
[ 117.731023] PKRU: 55555554
[ 117.731024] Call Trace:
[ 117.731027] drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
[ 117.731036] drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
[ 117.731040] drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
[ 117.731047] amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
[ 117.731149] crtc_crc_open+0x174/0x220 [drm]
[ 117.731162] full_proxy_open+0x168/0x1f0
[ 117.731165] ? open_proxy_open+0x100/0x100

BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1546
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index cce062adc4391..8a441a22c46ec 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -314,6 +314,14 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 			ret = -EINVAL;
 			goto cleanup;
 		}
+
+		if ((aconn->base.connector_type != DRM_MODE_CONNECTOR_DisplayPort) &&
+				(aconn->base.connector_type != DRM_MODE_CONNECTOR_eDP)) {
+			DRM_DEBUG_DRIVER("No DP connector available for CRC source\n");
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
 	}
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
-- 
2.33.0

