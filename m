Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E96628DF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C810E4A2;
	Mon,  9 Jan 2023 14:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECC010E438;
 Mon,  9 Jan 2023 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nDAiETVpEvUgb7mqS6Y9TlEIy67mC7r1XqqTtdFTtiY=; b=kHyTtVGwbnVzhzXBtMOs71gktY
 Ie73QRlCKbRBdTSjXoGo/ArajaRk41KPu+1YdmWbhgvc2qKOFPK3gQsrtSiqOq1cgPsTp4WZmJO+4
 0qcBRxvxrKMYIFzdGx6gGfLUUWZ/VHDF31/5SBXqVADhdo2hxhQmfl3CNbOkWWSn9PZ7QQR2hwamb
 6AP2zQ3IHyOs7SBrkeEms8rtNK1ot7SfTdo2gaYYKAzEH6YviSli630lSGSoOaQlohu2svXmQN141
 reDGPodRElCD2SUYzfrqxPWeOJVzTOJZ/NnrOCoq8D8DKiSRZzHoGbNAoHMAUC4lCYx8WMhunx3lb
 yDsf57Yg==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNm-003TyM-TO; Mon, 09 Jan 2023 15:44:15 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 10/18] drm/amd/display: update lut3d and shaper lut to
 stream
Date: Mon,  9 Jan 2023 13:38:38 -0100
Message-Id: <20230109143846.1966301-11-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
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
index 2c18c8527079..88f1130c3b83 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2562,7 +2562,7 @@ static enum surface_update_type check_update_surfaces_for_stream(
 			stream_update->integer_scaling_update)
 			su_flags->bits.scaling = 1;
 
-		if (stream_update->out_transfer_func)
+		if (stream_update->out_transfer_func || stream_update->lut3d_func)
 			su_flags->bits.out_tf = 1;
 
 		if (stream_update->abm_level)
@@ -2911,6 +2911,14 @@ static void copy_stream_update_to_stream(struct dc *dc,
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
2.35.1

