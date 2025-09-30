Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E47BAC997
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DE610E577;
	Tue, 30 Sep 2025 11:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8bLaxqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A347310E576
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 894CF40476;
 Tue, 30 Sep 2025 11:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C545C113D0;
 Tue, 30 Sep 2025 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230039;
 bh=DEfz7J3avrlo16R62D9lJDLHBoCjqb3rVTcHxihSgGs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Y8bLaxqXQ35h5ZFzBQLry4tnlYPfc1TV02T1t46KlUuLGbB/c2yon5tkXPxC79Wr8
 9Lm9R68g1UEnfj3dtyKfAxusdkFrr0U/1BZE1mMdmo1E05xBWiYdnJ9rOiQZ0TGvB6
 IrNqK27PSqr2TX4WCmuf7+l+uz9crRLAfHhkoT0At9bQtCJzHCbAowpW5YfFptxjBe
 ZzkBIWlp7R0yMgYfqPqBUAaIuYECNcpoQJfTfJjQon29p6Wu41DpPU9N3qHW83Awqf
 mHltiz6b6iUrU/6pdA2YGm88T8MjbjcvH+ulFmeZ5pVmmn35OKnNFmQgWy8cfPWRtH
 bzY0vT0NIR3Jg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:27 +0200
Subject: [PATCH v5 12/39] drm/arm/malidp: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-12-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DEfz7J3avrlo16R62D9lJDLHBoCjqb3rVTcHxihSgGs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6g0pWXcrvjWP6/iYJjsy7fOJxK/hVkesDw4Wf+RB
 0teuu7CjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRKyyM9WF1UwJN+KYpdxgq
 zazW/XH7v+7J+x6e57IFzBZ5XHsRWeodK1k3k/VPovwjlgs/2B9UMTasPHDC/kcm/55fX4KKi4P
 WzC55dofPfObn79f/8Rg/WigcfDv+1h9ZswcZihzixT2Lf8QDAA==
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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
2.51.0

