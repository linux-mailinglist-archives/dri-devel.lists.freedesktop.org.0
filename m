Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518C96FA5B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 20:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09C010EACC;
	Fri,  6 Sep 2024 18:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cELWGBrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8148B10EAC2;
 Fri,  6 Sep 2024 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PTVBJ9gU403oCQFJgGWKfwxVqQcH0KM/Cnc6M+Z/EKQ=; b=cELWGBrhsnL0g8xj+g2myjKZjj
 fxiXozMlZnQHqY0Yu92oVl2n+nhMuoQckwSoYnJqIiwFGwOglAhoTomx3LGxbKe26jWwb1PxM8SVc
 WggMnZ99DWE86Xrb6YDYEdq0cjENnqmngAcodLDKcj1P2yeGBLOc72unf7mOVS6C2UJBkKHhjFYDe
 uZmYnILnMvITdbjR+0eeO39XNnEDPbCdvcmd0G4LV/bn89XbUw+qJdyRO8+4WF6xX8FB7/c1DdDlm
 wXCOyOzLM5Q63PjXgp259ZHv91T0bv0lDzdyUTDCuZm/YopFNVYHSOs+B+GzKj/gVXq60Z1oJYt1J
 mo0cgLkg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1smdM3-00AW7V-3a; Fri, 06 Sep 2024 20:06:42 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC 1/2] drm/amdgpu: Remove dynamic DRM scheduling priority override
Date: Fri,  6 Sep 2024 19:06:38 +0100
Message-ID: <20240906180639.12218-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906180639.12218-1-tursulin@igalia.com>
References: <20240906180639.12218-1-tursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

According to Christian the dynamic DRM priority override was only
interesting before the hardware priority (dona via
drm_sched_entity_modify_sched()) existed. Furthermore, both
overrides also only work somewhat on paper while in reality they are only
effective if the entity is idle, which is something userspace is unaware
of when using the AMDGPU_SCHED_OP_*_PRIORITY_OVERRIDE uapi.

Therefore follow Christian's advice and remove this call completely.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index c43d1b6e5d66..2480b3227dad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -820,10 +820,6 @@ static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
 	struct drm_gpu_scheduler **scheds = NULL;
 	unsigned num_scheds;
 
-	/* set sw priority */
-	drm_sched_entity_set_priority(&aentity->entity,
-				      amdgpu_ctx_to_drm_sched_prio(priority));
-
 	/* set hw priority */
 	if (hw_ip == AMDGPU_HW_IP_COMPUTE || hw_ip == AMDGPU_HW_IP_GFX) {
 		hw_prio = amdgpu_ctx_get_hw_prio(ctx, hw_ip);
-- 
2.46.0

