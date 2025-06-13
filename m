Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C9AD9074
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ADD10E9FA;
	Fri, 13 Jun 2025 15:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eWgZMv8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C588A10E9EF;
 Fri, 13 Jun 2025 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vuE+IIRx+9AdFuGpsrjfbgD/yN2Yv8ncxgIQq/YgEg4=; b=eWgZMv8R5FkKJaqVVtuw4PQ4TK
 vNUYKnXpzjQF3sFNeMvj8cTa3jzjXiYVvg67ep3TnxTEuLDAqgmYSbJJYR3vJ1+Q3fkUcyV0AlW/O
 6Hc0x5Mpx0eSClg+FBPlQIKwehhlBTV/uG1VEFQoOTKmBiOmWJKKGI9BNrSYOZ2VkfPYmXGRIxRGj
 +kMjgXiv0aW/MjsSX3GEWtEG6IBwa2rKOSXruGVYCc/4XJqzWFLV01Ps1MpxHgil3EpqsmM+l6Wy8
 JGYXYabDFxPmZRklaVS5biZbQ9/EdrfanxPkBWwPyicogmKhGo4ylEHg8Zho9x4c3RlxK24eN4uSC
 8eXAPTyQ==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ5tQ-00342T-EV; Fri, 13 Jun 2025 17:00:33 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, mwen@igalia.com
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 01/14] drm/amd/display: make sure drm_edid stored in
 aconnector doesn't leak
Date: Fri, 13 Jun 2025 11:58:03 -0300
Message-ID: <20250613150015.245917-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250613150015.245917-1-mwen@igalia.com>
References: <20250613150015.245917-1-mwen@igalia.com>
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
index 78816712afbb..2f806bc6322b 100644
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

