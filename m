Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0999B4ABF7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51110E6C7;
	Tue,  9 Sep 2025 11:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GjxKDIsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7A710E6C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECCF5404E3;
 Tue,  9 Sep 2025 11:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797B0C4CEF4;
 Tue,  9 Sep 2025 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417364;
 bh=TNcCR5150kLhwNACC2WvMyuz+jymvPTzr2MA017mAVE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GjxKDIsb3WNwZK0eeUzkCDTujvfAHS+e8CFM0O1V2RFkZfxOt026nneP1dTfCtwKe
 t/LObzVTtUg2000XXJhJnIYqryeIaZIuib0QI/8DJFF3p0iPlehuak86rFZzghkFKe
 d9Zbo5ElQ3ozuTqZJPVnuf4w+vTeiD5gkFnsIiQtOWLdJ+MjhYOjeB96stTyT/UkuK
 WSpZR0U6uIs2jnUU8OMP2ZfGbuXT867phSzCxwBPHZO5XnzeRP3dmY1em6ZmJWcieu
 1VEJEz/8iYZ11KJh6yIAbouCMLpj5Lk1CJcULr90uhnUNPQwfxXpxI00s1AElfvOB4
 Zwyuspw4c8PAw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:53 +0200
Subject: [PATCH v3 34/39] drm/framebuffer: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-34-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TNcCR5150kLhwNACC2WvMyuz+jymvPTzr2MA017mAVE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+A0b9geU3ZrxXCn/ZNHBX/lP2RlX9ut2O3o9P/WgN
 XSOi/SMjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARo0bGGu5pv3eK757Puffx
 ecZpm9vXdmnFr4uvMOY9kjNPKi/+/54pNXkn9nrteLxycvi9hsexlYwN15p3R8uu3yFp9GnSSzF
 ZvhXL2b8mPDrR92nz7aroJ8o9B1eKf71xeflSG9v4ZWX6P7YoAAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The atomic_remove_fb() function uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

Despite its name, this function builds and commit a new
drm_atomic_state, and the call to drm_atomic_get_existing_crtc_state()
is part of the state building, thus happening before the states are
swapped.

As such, the existing state points to the new state, and we can use
drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index adbb73f00d68b8fb7c1d99a4209d5b4e91ec5f8d..18e753ade0011b87d0728bdb27d26ea37d75c213 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1046,11 +1046,11 @@ static int atomic_remove_fb(struct drm_framebuffer *fb)
 			drm_dbg_kms(dev,
 				    "Disabling [CRTC:%d:%s] because [FB:%d] is removed\n",
 				    plane_state->crtc->base.id,
 				    plane_state->crtc->name, fb->base.id);
 
-			crtc_state = drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
+			crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 
 			ret = drm_atomic_add_affected_connectors(state, plane_state->crtc);
 			if (ret)
 				goto unlock;
 

-- 
2.50.1

