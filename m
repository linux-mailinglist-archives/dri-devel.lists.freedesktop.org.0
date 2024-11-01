Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0519B9764
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 19:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFBA10E9F2;
	Fri,  1 Nov 2024 18:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZAhpaBEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9810E9F1;
 Fri,  1 Nov 2024 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1rNIllVm8irZBshB7g/xMpsH8r3PsuoB4xB5fC9wdnE=; b=ZAhpaBErtf5A69797CUNNEW3Jl
 s9cK4EDa2cFUJ2OSRdAgVKfxjI0goTDqVYaK60teEaFAJDojz6ILaJDSGowclTsfLkI9U7iRY9mfY
 tyLdZrcACaCsvRND9keK+fbHSVv8qeYU0tGrbZqfqnfx0eoM7jhcuWmeqP4WTaIo8ogrv62aOK2Io
 4GXO3R3bWfbB74mEVQLovfNhP/aixZbK8qw7ZoczElAi90Hr5K5nWcPkxkFQ+BC/WG30NNhRrFkz3
 lMhcRAt5hAZfNMhTiS+ajXOyQiUNLw5ozR29Gbmq2oNcLOtg6THs3Fup3KROg/HPsv7j3MZ+aGfCk
 iAIlIaCQ==;
Received: from [189.78.222.89] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t6wJj-000XDx-Bm; Fri, 01 Nov 2024 19:24:15 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 01 Nov 2024 15:23:48 -0300
Subject: [PATCH RESEND v9 2/2] drm/amdgpu: Enable async flip on overlay planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-tonyk-async_flip-v9-2-681814efbfbe@igalia.com>
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
In-Reply-To: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es, 
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.14.2
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

amdgpu can handle async flips on overlay planes, so allow it for atomic
async checks.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 495e3cd70426db0182cb2811bc6d5d09f52f8a4b..4c6aed5ca777d76245f5f2865046f0f598be342a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1266,8 +1266,7 @@ static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state;
 	struct dm_crtc_state *dm_new_crtc_state;
 
-	/* Only support async updates on cursor planes. */
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+	if (plane->type != DRM_PLANE_TYPE_CURSOR && plane->type != DRM_PLANE_TYPE_OVERLAY)
 		return -EINVAL;
 
 	new_plane_state = drm_atomic_get_new_plane_state(state, plane);

-- 
2.47.0

