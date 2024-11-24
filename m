Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD589D70B1
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D410E4F0;
	Sun, 24 Nov 2024 13:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VhgsHv3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D146F10E4EF;
 Sun, 24 Nov 2024 13:37:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C04F1A40B51;
 Sun, 24 Nov 2024 13:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7CAC4CECC;
 Sun, 24 Nov 2024 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455471;
 bh=V6S5MdxUmQ3fdq5coagMohxAg3fw0nkc2PZWB5gcInA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VhgsHv3gnMIakqZkPM2KX9YwizQEhUM7nkSiRMXSZm86obsEz/LCuSl+2NccXNKyi
 uKJi2ZFS9ZFlyrpSOAGy8Watb6MiEGxR50i4GZ4ku4nho/M0nAPU7tQCmdIOH2Hz29
 OrTYn5k4cx4NwEdaImgl8B04nhZC4UUNtUo6blXU/CpMas2RJJqn2PJEdOoHCKj3CT
 tbrqv60JNcxmyrOwi/epdiy6Db1w4BQyQMgzfAaxLKvkld4KHwd4DNItaC5FDZjP3O
 2f7MvWN4mltEam1XZnZjdFcNZAMZ7yZdnEBrU4pzIqQusI2jVjZSlut3luS+L1zSBy
 u6Bz+7R6J+bmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, nicholas.kazlauskas@amd.com, alvin.lee2@amd.com,
 charlene.liu@amd.com, hamishclaxton@gmail.com, sohaib.nadeem@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 081/107] drm/amd/display: parse umc_info or
 vram_info based on ASIC
Date: Sun, 24 Nov 2024 08:29:41 -0500
Message-ID: <20241124133301.3341829-81-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit 2551b4a321a68134360b860113dd460133e856e5 ]

An upstream bug report suggests that there are production dGPUs that are
older than DCN401 but still have a umc_info in VBIOS tables with the
same version as expected for a DCN401 product. Hence, reading this
tables should be guarded with a version check.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3678
Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index c9a6de110b742..902491669cbc7 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -3127,7 +3127,9 @@ static enum bp_result bios_parser_get_vram_info(
 	struct atom_data_revision revision;
 
 	// vram info moved to umc_info for DCN4x
-	if (info && DATA_TABLES(umc_info)) {
+	if (dcb->ctx->dce_version >= DCN_VERSION_4_01 &&
+		dcb->ctx->dce_version < DCN_VERSION_MAX &&
+		info && DATA_TABLES(umc_info)) {
 		header = GET_IMAGE(struct atom_common_table_header,
 					DATA_TABLES(umc_info));
 
-- 
2.43.0

