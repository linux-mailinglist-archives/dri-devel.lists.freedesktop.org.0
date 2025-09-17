Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F206B80347
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094110E874;
	Wed, 17 Sep 2025 14:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cbD7HbLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4ED10E874
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 054AC4400A;
 Wed, 17 Sep 2025 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B31C4CEE7;
 Wed, 17 Sep 2025 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120435;
 bh=aroUlCeMCynoYWP5WThhBDdmLNk2LhKt3G8zy2OJ0vw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cbD7HbLWLUFVZvxnmtIIG9mGPPpHlY9pOJegNKKb385DNyXQXFCW/IlJ0LLEKhPym
 ihZcuiS8bVLd2Om+KxUv+5oF1J4rfnQElhjvDesmgAFr6UyXdT8vftZh+MHG/2GGJE
 l+iwytTa7kcik+QE6z05tbV0vUoFB8UcC+ZpiCz03P91wOE3f5Caeh7DwKq+hnUmXW
 NlDwdtqhAjwLFRZyaPAW6LSiUMbklfWGf+MH7q5Au+cMyWju8aaRsgYloiMfDVl6IS
 +JR9aWj7j4fAvTnA+PSnuI9n3k7fbkR//7k182UIV3koXBCRVOT6+FYdaFTaGYzYAy
 uwUP54hCCcUkg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:04 +0200
Subject: [PATCH v4 23/39] drm/loongson: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-23-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Sui Jingfeng <suijingfeng@loongson.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aroUlCeMCynoYWP5WThhBDdmLNk2LhKt3G8zy2OJ0vw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq7kXb7dwyprzn8GT5ZiueM9AkE6ntVvfBg99Xk1V
 8aU7rvaMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbSsZqxvlbfhHPaScN+xZdW
 HSmxjhJS/4qP3DeW3VWfwXHy4o6jc4V/HlzvyBg5U8x+83VJb3N3xoYTqqbKAYr/V07PSOcstEz
 q/146I0dwn0f0Td21n35Oj35T6buhMEGumu2+qmTQvapYAQA=
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

The loongson atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/loongson/lsdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index aa9a97f9c4dc28eea3098507ce52e6aa6caa46eb..2967a5cca06936d5d2480fac258b01e11f8d28e1 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -194,11 +194,11 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
 			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (!crtc_state->active)
 		return -EINVAL;
 
 	if (plane->state->crtc != new_state->crtc ||
 	    plane->state->src_w != new_state->src_w ||

-- 
2.50.1

