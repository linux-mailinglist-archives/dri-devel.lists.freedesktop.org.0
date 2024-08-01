Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA643943A83
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D24010E75F;
	Thu,  1 Aug 2024 00:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L6PDliWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4A10E758;
 Thu,  1 Aug 2024 00:16:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7472D6130B;
 Thu,  1 Aug 2024 00:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76435C116B1;
 Thu,  1 Aug 2024 00:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471366;
 bh=BevY77iRPP2rcLSSLdc/Qw8M9iWbWGhbWK26o/OAXLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L6PDliWVkPxhq9W8L3IBIFwvjG66PZil7XgeILDiBh4bkD7DG9wm/NNZl7Ca752vw
 s6D3M99Kl6tuBQJ+YfweoEOXjdojmzhC3EhJOMF7KjGTek2aaX6rLiguMW4VDvQa38
 eRsv29iDlhsPWsMYCcvYm7ptTByGuiwOjWTOqooBjOI1DU3fyqMYJIv5kzfKeNBY2P
 6YdcEX/q9NIHR1u/PlE2Psp4caHUMg0Anp/TQtIKv+HSQqTeUnKzFkPFOh7ARseG8d
 prYzs1AUtm8walo0LJeBtJ6JEZ95ZcdMrMlqVUbEQShXOdYTulYxKPYn/ncEn3Cisg
 Wgg3OWCQmyUUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Ovidiu Bunea <ovidiu.bunea@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, charlene.liu@amd.com, Qingqing.Zhuo@amd.com,
 wayne.lin@amd.com, ahmed.ahmed@amd.com, wenjing.liu@amd.com,
 daniel.miess@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 078/121] drm/amd/display: Disable DMCUB timeout
 for DCN35
Date: Wed, 31 Jul 2024 20:00:16 -0400
Message-ID: <20240801000834.3930818-78-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 7c70e60fbf4bff1123f0e8d5cb1ae71df6164d7f ]

[Why]
DMCUB can intermittently take longer than expected to process commands.

Old ASIC policy was to continue while logging a diagnostic error - which
works fine for ASIC without IPS, but with IPS this could lead to a race
condition where we attempt to access DCN state while it's inaccessible,
leading to a system hang when the NIU port is not disabled or register
accesses that timeout and the display configuration in an undefined
state.

[How]
We need to investigate why these accesses take longer than expected, but
for now we should disable the timeout on DCN35 to avoid this race
condition. Since the waits happen only at lower interrupt levels the
risk of taking too long at higher IRQ and causing a system watchdog
timeout are minimal.

Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 28c4599076989..915d68cc04e9c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -785,6 +785,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.ips2_entry_delay_us = 800,
 	.disable_dmub_reallow_idle = false,
 	.static_screen_wait_frames = 2,
+	.disable_timeout = true,
 };
 
 static const struct dc_panel_config panel_config_defaults = {
-- 
2.43.0

