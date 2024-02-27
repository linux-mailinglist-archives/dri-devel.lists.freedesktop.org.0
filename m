Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09923869FE2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 20:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C6710E97F;
	Tue, 27 Feb 2024 19:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AXdeofrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A3610E9A7;
 Tue, 27 Feb 2024 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wTGx11RonX+yWcXjOmaJVOP9Ie5hGpQbavdwu2FkREo=; b=AXdeofrmlHTisG8Q1+P4DbKkiL
 qp8PVv+dK5bGWUbL3PxnqMqYiiDaDwsp6CClVGo5yZHRGRNk0jLDGcKdEgejBjOwcHxfu/h9C8Wlv
 +O+uS0qWMAiHaPJ+sfFfDa1uTC2Jn40Lb3aUxaKJQ2ThupYMYN2O/JPkapOyBZ+3siwVfhQfWey/a
 1Ex7Z0lbc5E07CCc/3ubNRg7xse1NaPb/vzeCsGM0b4cH23IN9eWNbtgqsQIiwdhf4t8algzpu35b
 PVaJfwIFiD5zoKD+wAF2ZcEX7zFUO8/3LiE8MRgf6ymGJ/rg5SLtrPbc+W4vPNLJjVEUVRg1plz1W
 CJETI/gQ==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rf2od-0040n4-8d; Tue, 27 Feb 2024 20:08:35 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Dan Carpenter <dan.carpenter@linaro.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: check dc_link before dereferencing
Date: Tue, 27 Feb 2024 16:08:25 -0300
Message-ID: <20240227190828.444715-1-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
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

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6683 amdgpu_dm_connector_funcs_force()
warn: variable dereferenced before check 'dc_link' (see line 6663)

Fixes: 967176179215 ("drm/amd/display: fix null-pointer dereference on edid reading")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 32efce81a5a7..46dd06e8fc7e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6653,7 +6653,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	struct edid *edid;
 	struct i2c_adapter *ddc;
 
-	if (dc_link->aux_mode)
+	if (dc_link && dc_link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
 	else
 		ddc = &aconnector->i2c->base;
-- 
2.43.0

