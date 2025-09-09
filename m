Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B745B4ABFE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800BD10E6CE;
	Tue,  9 Sep 2025 11:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vml2uwWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89E410E6CE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E8406021E;
 Tue,  9 Sep 2025 11:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8806EC4CEF5;
 Tue,  9 Sep 2025 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417375;
 bh=waVGEXJV6pf+Zx1gbOBpgiakDJ7zc18IhinVqlLSylk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Vml2uwWxxhX05VIP8eRb+ucWkc1rc2CPgZAdtkoENxjC8HF/iq8VB19H0yiDzLOcL
 7pNJWh/LUxGtdUsGVix9mNGOhnHrfzoaGFONCtz7p5PrMbyhsNGndB+45+jtlmz5p3
 c/8ETq3xN4XM9upYwc/CSTsJolElvTVL5N4kJDnAp5LOhNmcz0iZr3GkvoIcnCRmhP
 IBYmCalMjXjic7A/iLVP24imCjRPGJg/laIISeG95bOHqOQ2hdszBtxv6JRxBQ1+f1
 LMYXU36Jzj/FFezWmA3G0NgpTmfE5ieG4xsgiuBvLdWWVtSso+n+Run3XD1JlS+gPB
 O8hof9BL+S+Yw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:57 +0200
Subject: [PATCH v3 38/39] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-38-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=waVGEXJV6pf+Zx1gbOBpgiakDJ7zc18IhinVqlLSylk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+I2MNp9X++gzUa1mc2TaHmbD20a1z9cnvpjO/MV1i
 /sR/ZCZHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAicoWM9Tnm856Gsh/o5Er+
 ufDgyoXXWR+EzNg0waI6lf3h5oV6H0RnCO24d6uyWkDpa8sUnldukxkb5met5Tjf++FR9H61kOv
 OlqEX/l2+5iwscHxWYpPM//3X8wr7JKzO+G9nY6ysn2B0ry0AAA==
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

The drm_atomic_get_private_obj_state() function tries to find if a
private_obj had already been allocated and was part of the given
drm_atomic_state. If one is found, it returns the existing state
pointer.

At the point in time where drm_atomic_get_private_obj_state() can be
called (ie, during atomic_check), the existing state is the new state
and we can thus replace the hand-crafted logic by a call to
drm_atomic_get_new_private_obj_state().

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d6a53b678e7b52c0852b2e590d8bc041616cb80d..754981ead01ffa27434be55079e9f967eb576be5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -829,18 +829,18 @@ EXPORT_SYMBOL(drm_atomic_private_obj_fini);
  */
 struct drm_private_state *
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 				 struct drm_private_obj *obj)
 {
-	int index, num_objs, i, ret;
+	int index, num_objs, ret;
 	size_t size;
 	struct __drm_private_objs_state *arr;
 	struct drm_private_state *obj_state;
 
-	for (i = 0; i < state->num_private_objs; i++)
-		if (obj == state->private_objs[i].ptr)
-			return state->private_objs[i].state;
+	obj_state = drm_atomic_get_new_private_obj_state(state, obj);
+	if (obj_state)
+		return obj_state;
 
 	ret = drm_modeset_lock(&obj->lock, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.1

