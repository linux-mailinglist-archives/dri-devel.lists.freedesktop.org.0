Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A527AB76C5
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C12B10E712;
	Wed, 14 May 2025 20:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CnFXG+lS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F9210E706;
 Wed, 14 May 2025 20:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ZR26E78rQO+U+g1ARlq45lNTPzT9DEbRqA9BEewGsY=; b=CnFXG+lSIjRcRgxciQJLYivQas
 D77ACAz2wBT8XWm8LlQclOqouLb8kn8Qw0DEy7sLLPpI0KpWbVbAqPaZE45KR/oSgGLPavnQJJiZU
 u7XusQFiYvj4slIEtAACyzSckcqWCyWFzZY8iUmfz3ikm5pOJdad8Vt3NIO2fMiOHEVNTFfz93kEi
 /HmxZDSTK/8G+qxLqoQXu349NgcnxLOGVPT6hUKPptIRln+jnI3/i9Eohdz3mAeCjZrkUnAOYYmUj
 OT92alU0UE9XGKnikIq4FnIDxFSsdpa67pY3CjZFsBdHxNR1DswS3IjVIzd/VQw8FTNVoA4X09pij
 vzXmAddA==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFIWC-008Klg-Re; Wed, 14 May 2025 22:21:46 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, mwen@igalia.com
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v3 01/14] drm/amd/display: make sure drm_edid stored in
 aconnector doesn't leak
Date: Wed, 14 May 2025 17:19:08 -0300
Message-ID: <20250514202130.291324-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514202130.291324-1-mwen@igalia.com>
References: <20250514202130.291324-1-mwen@igalia.com>
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

Make sure the drm_edid container stored in aconnector is freed when
destroying the aconnector.

Fixes: 48edb2a4 ("drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid")
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4b4e9241619f..6a85d0ea20dc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7252,6 +7252,8 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 		dc_sink_release(aconnector->dc_sink);
 	aconnector->dc_sink = NULL;
 
+	drm_edid_free(aconnector->drm_edid);
+
 	drm_dp_cec_unregister_connector(&aconnector->dm_dp_aux.aux);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
-- 
2.47.2

