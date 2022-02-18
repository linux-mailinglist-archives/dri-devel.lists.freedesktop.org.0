Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDA4BB629
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D1110EAD8;
	Fri, 18 Feb 2022 10:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6325F10EB78;
 Fri, 18 Feb 2022 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178667; x=1676714667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSQdB0vwC6YXJ2Jhjl2aK0gT9Jca40OlOstRdm+C/6E=;
 b=RhTvp3VWJOxMSVNY7kIf7rQMCZ2LA9qvsxgK/JHGw7tLay0B7EGiUV5R
 Wl1ynFOv8iElAirkbL6Ziu0tldHHw+m+pIvrG1C9sk9xM7fkByFdJJHf9
 pYgnqG42oh51Vq12ahOJxX1TJlYptl2LiaLf9ffI1UQVx5V95lQMfKtIH
 pFIFxAZWsbq99n4JQ6ka5Knf57i40bsrJwpN1aAVlqe2wGuskXm4QJuQN
 HAY3EbBzapyS6XHdJWvogo9+5SHmCx/bprpXPovHozEOEU/9pDGJL4/FW
 WuyJGM6fC9xbSdKrBAu8tYoHeyToM/fwUpk9EgS3JJwsQxAQHRHYkIhP9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="275693599"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="275693599"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="505337204"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 18 Feb 2022 02:04:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:22 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/22] drm/amdgpu: Use drm_mode_init() for on-stack modes
Date: Fri, 18 Feb 2022 12:03:44 +0200
Message-Id: <20220218100403.7028-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head, or that we aren't copying
over another mode's list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 65aab0d086b6..bd23c9e481eb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6361,7 +6361,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	const struct drm_connector_state *con_state =
 		dm_state ? &dm_state->base : NULL;
 	struct dc_stream_state *stream = NULL;
-	struct drm_display_mode mode = *drm_mode;
+	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
 	bool native_mode_found = false;
@@ -6374,6 +6374,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 #endif
 	struct dc_sink *sink = NULL;
 
+	drm_mode_init(&mode, drm_mode);
 	memset(&saved_mode, 0, sizeof(saved_mode));
 
 	if (aconnector == NULL) {
-- 
2.34.1

