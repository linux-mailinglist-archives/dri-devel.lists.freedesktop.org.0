Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98CA70E8CD
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CC910E510;
	Tue, 23 May 2023 22:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B973C10E50D;
 Tue, 23 May 2023 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a1P/4SS1llUWrC9rXM1+Q9ln8xr6omFKwtRilHuxGfE=; b=J6L1Q5fz1JXoisXCZy+sy5oQHz
 2iN/Hq4jNGKTqnTAorBn1hBW2PzspLYzUJuZ9EMzdFwowdkupyiBDRR+Lg385vZ2DDQWdOej4YA/C
 ciR/gbvRxiQKRHLskVdq8V44UfjVKbNRDdwS11gfWsbWQj2jTSnoWPcJW4xYELE8J7siqBCHHC911
 a/rAvsNYb4lty7w1hl0Esna2K3KlAbiBipoITNHIzA4Fk85Uer5Vx+PFoK9FabVNqj2J09VMqIEwD
 27TF9FZ6+UjYZmyB/RFZoEppGwHmBDBlh6k6o7N4g3GQ+f/YTkrNK2OrQNc34LE3MyzD/xWQ2u+Nm
 zhKSaRLQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIF-00HEOv-PS; Wed, 24 May 2023 00:15:47 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 16/36] drm/amd/display: update lut3d and shaper lut to stream
Date: Tue, 23 May 2023 21:15:00 -0100
Message-Id: <20230523221520.3115570-17-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It follows the same path of out_transfer_func for stream updates, since
shaper LUT and 3D LUT is programmed in funcs.set_output_transfer_func()
and this function is called in the atomic commit_tail when
update_flags.bits.out_tf is set.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index f864fd3b6f29..8e8da8c0f8cc 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2609,7 +2609,7 @@ static enum surface_update_type check_update_surfaces_for_stream(
 			stream_update->integer_scaling_update)
 			su_flags->bits.scaling = 1;
 
-		if (stream_update->out_transfer_func)
+		if (stream_update->out_transfer_func || stream_update->lut3d_func)
 			su_flags->bits.out_tf = 1;
 
 		if (stream_update->abm_level)
@@ -2961,6 +2961,14 @@ static void copy_stream_update_to_stream(struct dc *dc,
 		       sizeof(struct dc_transfer_func_distributed_points));
 	}
 
+	if (update->func_shaper &&
+	    stream->func_shaper != update->func_shaper)
+		stream->func_shaper = update->func_shaper;
+
+	if (update->lut3d_func &&
+	    stream->lut3d_func != update->lut3d_func)
+		stream->lut3d_func = update->lut3d_func;
+
 	if (update->hdr_static_metadata)
 		stream->hdr_static_metadata = *update->hdr_static_metadata;
 
-- 
2.39.2

