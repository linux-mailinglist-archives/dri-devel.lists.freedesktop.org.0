Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7B7EE7FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245BD10E6D2;
	Thu, 16 Nov 2023 19:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE9E10E6C4;
 Thu, 16 Nov 2023 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sh2QR9XsW8jBe5ryTEQ7qQTAEw8NWtaK/mohcfq1WQE=; b=n7l2j0a3vyv9G8AjpIjK5Xf1XO
 kYibeRy6e9U2W6nEZjj820AkOBIl71om4ogBk3Wwg1C6qy1oz1yMAqMzb9PMKvlT3YonbccVy4cYg
 ZpCjhbB5wxYWLf953MdABpYMfyQyPvx3aX7OjV4vMN2ZX7TW5ShSwfTJ2ciNC92biyi2nY7Eq5pry
 HAc7wrWbu5syN53POK05WEa3vIssGDfJwy1RjgAvy1L/IBRZgTZCCqeIHpct99o6ogjV0mKjLevax
 059NvzXX+Odq0L+7jXFvP8oTi7+s1cZHNJOYomXlSkSIm8ubfM6uO+n7SD90k8pnB6INaN22EJOOm
 6di9oQHg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iWG-0048Yy-A1; Thu, 16 Nov 2023 20:59:20 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 29/32] drm/amd/display: copy 3D LUT settings from crtc
 state to stream_update
Date: Thu, 16 Nov 2023 18:58:09 -0100
Message-Id: <20231116195812.906115-30-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

When commiting planes, we copy color mgmt resources to the stream state.
Do the same for shaper and 3D LUTs.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 277b4bc82bcf..ef39255bb37e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8369,6 +8369,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				&acrtc_state->stream->csc_color_matrix;
 			bundle->stream_update.out_transfer_func =
 				acrtc_state->stream->out_transfer_func;
+			bundle->stream_update.lut3d_func =
+				(struct dc_3dlut *) acrtc_state->stream->lut3d_func;
+			bundle->stream_update.func_shaper =
+				(struct dc_transfer_func *) acrtc_state->stream->func_shaper;
 		}
 
 		acrtc_state->stream->abm_level = acrtc_state->abm_level;
-- 
2.40.1

