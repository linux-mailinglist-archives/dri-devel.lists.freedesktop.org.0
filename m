Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F8B32405
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C2D10EBC3;
	Fri, 22 Aug 2025 21:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OhnS/bvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DA110EBC0;
 Fri, 22 Aug 2025 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dD3ZkCGszJIY9IBVqNSfQOclCaY7aA9fgdNVRwfMbVc=; b=OhnS/bvzMR8lYxydMCG1oHyjpp
 tqFPmr1+5F1z1NLdtkCKW9sDtTcGHj1HFxo5ViASHM8fkP/qrikLyEMfnyJTX6dCTV7fTdXPCOi/c
 I3JTfxfCF7anhaUjoObESmamo8vRxCYiL9L7JvnaSf/OteaU9wQByqm/T+8uCwlwT0UJHz94GlRyq
 wTbIi2JtQMM+5pJeG5xL9p4FdtOFoKGj4cWGX8JRI52Vgj0StD9dwzznFgv9I943Yxu+RdGmOUb1L
 JxpVR8+HpvJyYvLPWbmB7oIOFPDv9bO5AYAFv2COEFHpYipsHKBNPOuGM6+xybkGnulyVbtM+o6j5
 Gcpt7GEw==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1upZ7J-000Hyz-26; Fri, 22 Aug 2025 23:16:09 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Christopher Snowhill <kode54@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 2/2] drm/amd/display: don't update out gamma if out_tf didn't
 change
Date: Fri, 22 Aug 2025 18:14:08 -0300
Message-ID: <20250822211552.1472375-3-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822211552.1472375-1-mwen@igalia.com>
References: <20250822211552.1472375-1-mwen@igalia.com>
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

Whenever a full update is requested, the DC sets out_tf to true, forcing
the output transfer function to be reprogrammed, but without transfer
function settings (neither new nor previous). This unsolicited update of
the output transfer function causes the previous setting, made when user
space modified color management properties, to be lost. To avoid this,
make the out_tf bit state persist through a full update and prevent
reprogramming the output gamma LUT from empty/default data.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index c30d9ee51c83..92775deea650 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2195,9 +2195,11 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 	/* Full update should unconditionally be triggered when dc_commit_state_no_check is called */
 	for (i = 0; i < context->stream_count; i++) {
 		uint32_t prev_dsc_changed = context->streams[i]->update_flags.bits.dsc_changed;
+		uint32_t prev_out_tf = context->streams[i]->update_flags.bits.out_tf;
 
 		context->streams[i]->update_flags.raw = 0xFFFFFFFF;
 		context->streams[i]->update_flags.bits.dsc_changed = prev_dsc_changed;
+		context->streams[i]->update_flags.bits.out_tf = prev_out_tf;
 	}
 
 	determine_pipe_unlock_order(dc, context);
@@ -3034,8 +3036,11 @@ enum surface_update_type dc_check_update_surfaces_for_stream(
 	if (type == UPDATE_TYPE_FULL) {
 		if (stream_update) {
 			uint32_t dsc_changed = stream_update->stream->update_flags.bits.dsc_changed;
+			uint32_t out_tf = stream_update->stream->update_flags.bits.out_tf;
+
 			stream_update->stream->update_flags.raw = 0xFFFFFFFF;
 			stream_update->stream->update_flags.bits.dsc_changed = dsc_changed;
+			stream_update->stream->update_flags.bits.out_tf = out_tf;
 		}
 		for (i = 0; i < surface_count; i++)
 			updates[i].surface->update_flags.raw = 0xFFFFFFFF;
-- 
2.47.2

