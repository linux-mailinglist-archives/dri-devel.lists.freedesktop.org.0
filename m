Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812FB4ABE9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8960E10E6BE;
	Tue,  9 Sep 2025 11:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k2Dw1p/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA66E10E6BA;
 Tue,  9 Sep 2025 11:29:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 58C3460237;
 Tue,  9 Sep 2025 11:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5B5C4CEFA;
 Tue,  9 Sep 2025 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417340;
 bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=k2Dw1p/A/OrMqgN+FOPCrXanU/V1sDNUva/XlUOFd2t5IC87HDQL+qd0NTJ4KA9eU
 irkueP9eeBWqnJLEvJurDaffzPZsxC3ETSypX/1/d5ojeHKKE2ncxw5luhhb10wM9i
 82hH+2GxNMjASQWSXs2xNz4kwcJWCBcvPe4SCvf/8lfyG0tPxIUcbVS92CapA0qu9M
 jUSTsBi7kaNpjH/CERfA+MGMsrEoJML50fSl4pz5Y8DAnFTh6JI1ju00zVr4B9T+rh
 Un+hbRkJE3Xdt++xmjtyjr7yIwH28AxvaRFVgcN9/sR1UXsy7eydrvXCduJJfIgc09
 A0Co0b4kQ5o8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:44 +0200
Subject: [PATCH v3 25/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-25-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+HW95CXXqpv+zRd58MyWO7Pl4VOrdwpuh3qudzlXT
 ItKPuzWMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYyvZuxzvR9aJhK/KWErOwn
 ezam/v2W/45zh05WkMOHxas9A0LmmxUIux+0OnbTmNfrgkdbbbALY53S5jv9H4/NemQnqXKJ5cx
 1pkfNd9eY/p7R5M90lb9zQttchhdqxa4ZiX5ZKXe3m1v5XgEA
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

The msm atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 7c790406d533fbabb330c438419efb18204cc4b7..4ca183fb61a95af60ef5a2c011ae6b2a0df963f0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -334,12 +334,11 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc ? new_plane_state->crtc : old_plane_state->crtc;
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	return mdp5_plane_atomic_check_with_state(crtc_state, new_plane_state);
 }
@@ -371,12 +370,12 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
 	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(new_plane_state);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;

-- 
2.50.1

