Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD745B3FA9B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092B710E626;
	Tue,  2 Sep 2025 09:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bq8msoZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E38510E627
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 51A4940A88;
 Tue,  2 Sep 2025 09:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76EDC4CEED;
 Tue,  2 Sep 2025 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805758;
 bh=P70/sU1sHCvD8Y67pNhUMStvfaBiHKT4N9O2UFWmgqI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bq8msoZp20ZqqwCjMB5ahOtAKxK2gy/Wt996vkOznW63X79ZVa6iTY50/+ok6XToY
 jJSJUlsS18q7kmdCNZ5JkVtAi5YaX2g9Y5JpLsCZMOAqHGL/FfgSEYd8+LxK4wd3OK
 JH5QzaN69zpqfI4Qug1k9tKEUIY4vmxO5roOd0A338vlLfWjWHUwNlzr89Osn4bLSF
 LcWW/u0AHqrf21iXU6zCwQdjahdoEGJU8Xa0FA59yX+1u9juH6MPH/VhytzMdcZLdo
 D/vrhoFUIft6Rvg9l2bSB7llYbTfOd2xEE9AbbC6QqWXoqq4hrcQ5k2BrkCl95m9ms
 Z7X1UuNIjcK9g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:11 +0200
Subject: [PATCH v2 12/37] drm/arm/malidp: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-12-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=mripard@kernel.org;
 h=from:subject:message-id; bh=P70/sU1sHCvD8Y67pNhUMStvfaBiHKT4N9O2UFWmgqI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgVonwzdsyxzbi2HS3DBoaVxoTmGGz+prpt1dQdjz
 O2DV+QPdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJLAllrPe6tFv8t4r37r0W
 kwU1HuUvZO3Kl5299mFZ1bz5nRy8q+KFctId7N7fyp1uy9iik6K1n7G+LkJirWkDW0TfWa5Ldqf
 9rN++OLnwZMT3WRsn9yQEpvZ81yzforvcidltYj7TzJ4tk/gA
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

The malidp atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 87f2e5ee87907403fac5386042bd6f313397ba03..f1a5014bcfa1058072e13f1ad8e84c85f52fb156 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -261,11 +261,11 @@ static const struct drm_plane_funcs malidp_de_plane_funcs = {
 
 static int malidp_se_check_scaling(struct malidp_plane *mp,
 				   struct drm_plane_state *state)
 {
 	struct drm_crtc_state *crtc_state =
-		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		drm_atomic_get_new_crtc_state(state->state, state->crtc);
 	struct malidp_crtc_state *mc;
 	u32 src_w, src_h;
 	int ret;
 
 	if (!crtc_state)

-- 
2.50.1

