Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8B80CC00
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 14:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2F610E3EE;
	Mon, 11 Dec 2023 13:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CB310E3EE;
 Mon, 11 Dec 2023 13:56:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 40ED26128E;
 Mon, 11 Dec 2023 13:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E470C433C8;
 Mon, 11 Dec 2023 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702303010;
 bh=bYKkKLzZA8jGXcnt6bR9g4qRqoJgH/dKArVF5Co8L98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LA3EcSqm3uQl/934YG3mOEgOClGDO+z1TEqfFBe8uBCSTYoRi4W9Or7oVif/hHU6/
 bDQwf54YnORtQy7nqyu15upP64xFl/eFOld1PUzgDE5lWkq6JRC72uCxvJTkSloZGw
 +046fblIrCj7ZJuYDXfpvEiTE5MLw/a+fucked6AZRnWnTzCS0YXDL91za0xO7YBWb
 8zwryIS5faNGkbpeHBbJW7VPRoLbwP84VNzU8TUt8nIH3CjlOjhP/2GUmasnuw3Wat
 vocJSUrhez3h2t4RzzKUowtKU36ljM9OfxC70tahEuzpPl4xmi5eKW5bMyNQlGmb+H
 RNK2VIS8MpaSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 23/29] drm/amd/display: Use channel_width = 2 for
 vram table 3.0
Date: Mon, 11 Dec 2023 08:54:07 -0500
Message-ID: <20231211135457.381397-23-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
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
Cc: Sasha Levin <sashal@kernel.org>, felipe.clark@amd.com,
 amd-gfx@lists.freedesktop.org, sunran001@208suo.com,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, ruanjinjie@huawei.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, Samson Tam <samson.tam@amd.com>,
 tony.tascioglu@amd.com, drv@mailo.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit fec05adc40c25a028c9dfa9d540f800a2d433f80 ]

VBIOS has suggested to use channel_width=2 for any ASIC that uses vram
info 3.0. This is because channel_width in the vram table no longer
represents the memory width

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Samson Tam <samson.tam@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index e507d2e1410b7..72891d69afb68 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -2402,7 +2402,13 @@ static enum bp_result get_vram_info_v30(
 		return BP_RESULT_BADBIOSTABLE;
 
 	info->num_chans = info_v30->channel_num;
-	info->dram_channel_width_bytes = (1 << info_v30->channel_width) / 8;
+	/* As suggested by VBIOS we should always use
+	 * dram_channel_width_bytes = 2 when using VRAM
+	 * table version 3.0. This is because the channel_width
+	 * param in the VRAM info table is changed in 7000 series and
+	 * no longer represents the memory channel width.
+	 */
+	info->dram_channel_width_bytes = 2;
 
 	return result;
 }
-- 
2.42.0

