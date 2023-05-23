Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7E70E8DB
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B40510E520;
	Tue, 23 May 2023 22:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8738D10E50E;
 Tue, 23 May 2023 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hN4T1sFxBmAxQtKV7UiftGk1OHePIMvHNfH5lC7wzkE=; b=Bd6KV+mrJEZxe2C9SMhl4vg483
 WRI+wYCugg2LrjmqFVeh9EkvauIkVOORoODUXrrzb6v9QXlwuT2XNU0pyl3SfASUrkElY1io2EKNF
 mT7UmvFVKPzTcd48PyRHSUrTVz69OkkyLKeaaJAqEbu6/km6x/F/vXqJlecGGq2s8ys3/kn68Z0Zb
 wUuP2hqHmk+rsKhxeGWlptLidsLDT39ZMgA5BtgASjF6gZZv6esLrkh7OIksNQvGDknjM3Yl5iDaT
 lmu8z2f0MHftCf3WytOGMTzs5SO+xYTqEVdVDpTZ8zHXqsHq+iBDPhhsPRfKLe/UjbrjaWwK0GpZy
 0Kykz/mw==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIH-00HEOv-BO; Wed, 24 May 2023 00:15:49 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 17/36] drm/amd/display: copy 3D LUT settings from crtc state
 to stream_update
Date: Tue, 23 May 2023 21:15:01 -0100
Message-Id: <20230523221520.3115570-18-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

When commiting planes, we copy color mgmt resources to the stream state.
Do the same for shaper and 3D LUTs.

Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 14b296e1d0f6..fc5b9a25e22f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8220,6 +8220,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
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
2.39.2

