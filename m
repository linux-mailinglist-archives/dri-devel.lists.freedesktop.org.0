Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E461FE8D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E11210E37A;
	Mon,  7 Nov 2022 19:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3A10E37A;
 Mon,  7 Nov 2022 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849152; x=1699385152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbychLj35UG52BeJyFodrzsn1Mbvz6gZWxfFiB9Hek0=;
 b=AO2+0bn2HmoE6UAN+KWwMOswv2lRMZVcCYacM5197lf28px5Rx4B2gNw
 Jd7n9Zw+gUco6Eb6WEPezaA8Ma8h8n3JyrJfkdh965DqDsMNmzZEbjKt+
 n25Z4Kb8n7qxQ+rwkIyu8G2FDVYqITnR3TF5TEgWCDGn+Tfc616ISl83G
 HYrWnUYYnLZu99kR8qkVZHP6/J35cydmpqjFlsX+oci0uuYNfjFlH3vrp
 1F8hwrkxqGjd8JruhOZ7i52Nq4uLqk5Kl8PHAAt30QmxPDbe6pJSKj5EP
 1hnQbl8M1H4CD4Gx8Ebo4mMG7NOewG25MtE/S4wB3EukC5XlUq8A6DMh4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308125549"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308125549"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009763"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705009763"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:25:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:25:48 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/amdgpu: Use drm_mode_init() for on-stack modes
Date: Mon,  7 Nov 2022 21:25:39 +0200
Message-Id: <20221107192545.9896-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d9940a3c64dd..7fa4b61bc5bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5685,7 +5685,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	const struct drm_connector_state *con_state =
 		dm_state ? &dm_state->base : NULL;
 	struct dc_stream_state *stream = NULL;
-	struct drm_display_mode mode = *drm_mode;
+	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
 	bool native_mode_found = false;
@@ -5699,6 +5699,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	struct dc_sink *sink = NULL;
 
+	drm_mode_init(&mode, drm_mode);
 	memset(&saved_mode, 0, sizeof(saved_mode));
 
 	if (aconnector == NULL) {
-- 
2.37.4

