Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA2B80380
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B6210E87E;
	Wed, 17 Sep 2025 14:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M3CAgBR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1E110E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 674A56023B;
 Wed, 17 Sep 2025 14:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB968C4CEE7;
 Wed, 17 Sep 2025 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120467;
 bh=TNcCR5150kLhwNACC2WvMyuz+jymvPTzr2MA017mAVE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=M3CAgBR1kGZnGwua0CFryoqVV9vdlTl1d1DBbyDC3FVxMiG3KySWKxmg8LotOlDzB
 Ddi2qyE157R+h0AHacIKE/6xkysBZ/Ro8ou0vPUN5UE96RvL0nA2jcJzs1jgJDT8ab
 R57ag43Cg9EJiuoGs5O74R3ohFcQ0ahhEH+xQ8ZtfZfRgfWt6SSfz8aO2x9iVydJ22
 PWfBebOfHH10gFaOegiuXDl/G+tUJ+T41A1qJIy2QFPLfPoTgEY5a1URFZgfv2OQeH
 CC+2+vliaETj/fRiHSxUCq8WFnyIwppc+P6u7jfu41q2qKt1QbobUugutf3pV5TX4b
 oco+zHttpjf6Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:15 +0200
Subject: [PATCH v4 34/39] drm/framebuffer: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-34-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TNcCR5150kLhwNACC2WvMyuz+jymvPTzr2MA017mAVE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq5jfiOzIvjkyf3fqs/+9ZKLS447KvZFWoT7y5XIo
 20zjuxd1DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmsvYbYzV7aHh0/mvOZ3/j
 blednHHEimfTHuO/zKEswtY34/qemT4ReKv54XbL5LMlU+dsvy9g95axmuXQ0Ul3c57Pcqm7Grz
 zfsj3e21VDWLKrrxmDObKWwO3/pn6dH74D095tvXl0XsO7T/IBAA=
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

