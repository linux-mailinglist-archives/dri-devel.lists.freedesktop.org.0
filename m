Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C79BAAEA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 03:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BD410E34F;
	Mon,  4 Nov 2024 02:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="R21pVjKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C567610E34F;
 Mon,  4 Nov 2024 02:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=X0uvyntT+nixWmfkfZaO+hewYcnx9FvDWP3oy6zAFw4=; b=R21pVjKJOa7pixZo
 6613J5exPmGrj/99v9eG6NRSLHGhXQSqpF7k+l7qCPy91ovUNztBlJX+rP9SrlRQjm2/h0eQbfuLS
 p46BVD7C0c9dIfHh9uBsz82TwWyVaLKVT29eljKH9d4SerQRO/JGKbgoMjM+4IkUqPclMmXo3nIPL
 VRHz5hy8OvdwohEpJioc2kj+cAkp/Eh3YN4T5V0B0xznWE5YQ7pf9n51qhHurPE//H8CMwDBctApN
 QZ+elVKat44BV4KuTHOn7io/8F6ydTXko5IyXWfoVbTEIvJqVoNgULNEy18LG+gu1USp/khM3gJ5C
 8r+jSvYUWNt0YTuV1Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t7mzl-00FECw-14;
 Mon, 04 Nov 2024 02:39:09 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 chaitanya.dhere@amd.com, jun.lei@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/5] drm/amd/display: Remove unused
 enable_surface_flip_reporting
Date: Mon,  4 Nov 2024 02:38:48 +0000
Message-ID: <20241104023852.492497-2-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104023852.492497-1-linux@treblig.org>
References: <20241104023852.492497-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

enable_surface_flip_reporting() has been unused since it was added by
commit 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c | 7 -------
 drivers/gpu/drm/amd/display/dc/inc/core_types.h  | 3 ---
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
index ccbb15f1638c..3299684f9a4e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
@@ -83,13 +83,6 @@ uint8_t  dc_plane_get_pipe_mask(struct dc_state *dc_state, const struct dc_plane
 /*******************************************************************************
  * Public functions
  ******************************************************************************/
-void enable_surface_flip_reporting(struct dc_plane_state *plane_state,
-		uint32_t controller_id)
-{
-	plane_state->irq_source = controller_id + DC_IRQ_SOURCE_PFLIP1 - 1;
-	/*register_flip_interrupt(surface);*/
-}
-
 struct dc_plane_state *dc_create_plane_state(const struct dc *dc)
 {
 	struct dc_plane_state *plane_state = kvzalloc(sizeof(*plane_state),
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index bfb8b8502d20..f241316aff82 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -45,9 +45,6 @@
 #define MAX_SVP_PHANTOM_STREAMS 2
 #define MAX_SVP_PHANTOM_PLANES 2
 
-void enable_surface_flip_reporting(struct dc_plane_state *plane_state,
-		uint32_t controller_id);
-
 #include "grph_object_id.h"
 #include "link_encoder.h"
 #include "stream_encoder.h"
-- 
2.47.0

