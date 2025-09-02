Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A712AB3FA9A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651D10E623;
	Tue,  2 Sep 2025 09:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XUArbWzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2435010E623
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0BD1C408BB;
 Tue,  2 Sep 2025 09:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CC3C4CEED;
 Tue,  2 Sep 2025 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805752;
 bh=cDHr5IH8GUt2SjLFPFeYDVvKq6BEonzv+xFSNil/vrQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XUArbWzDlohhjrfF6lH0UNb36aQ19ibSy7RvP+rU34ms/kLjW1mBiybjozYm9htT4
 ZIgZXH/03OFZq4qOecfMpN1giq1AiVfUGM+bl2elFVnt6TurYHxdTdwJlJmC7xMXCy
 wSo5d8Qn4uSVYowBOx7OAmowdAOzy/G/4rcLI035OHQ3M63Pf90q0CZL66HDSS3+K0
 JogE4VAMwMjUob1rSLeFWNSTMaYhPAUbv4LN8Flbk10YbZvQNQZcXDvB7HNKEo6Sw2
 udnWlzKgLLsvXFGRpHNY1Q+X11sMaKMdBcgGXL0E/gr3hmsKIZDdxZs1Y5ehjy6qyn
 e5JhNloqWR3YQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:09 +0200
Subject: [PATCH v2 10/37] drm/atomic: Convert drm_atomic_get_crtc_state()
 to use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-10-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cDHr5IH8GUt2SjLFPFeYDVvKq6BEonzv+xFSNil/vrQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgW4s1xiX7JAiEN1u9nnjGmXsnrfbdweMI8rInH5I
 4fE/aXJHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi8/Yx1jsd5EjfcTbopIq1
 TKl3/T9+/aqfr/9rZ91QleP2MrGxUntxUnV+aferaxs6/VScW05xMzZ80nhTpv/dTFf3wq7ZOR9
 PB3+rWdV8rd9vbWhERh5HzaL7nDHCldzTJ8oc6w3hf+b0kAMA
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

The drm_atomic_get_crtc_state() function calls the deprecated
drm_atomic_get_existing_crtc_state() helper to get find if a crtc state
had already been allocated and was part of the given drm_atomic_state.

At the point in time where drm_atomic_get_crtc_state() can be
called (ie, during atomic_check), the existing state is the new state
and drm_atomic_get_existing_crtc_state() can thus be replaced by
drm_atomic_get_new_crtc_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 15584928f06a9175308c3ef8f1ecbe1b33b17f47..435a93c83149e60e4a1bf4310ee5e865242cac7b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -347,11 +347,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	int ret, index = drm_crtc_index(crtc);
 	struct drm_crtc_state *crtc_state;
 
 	WARN_ON(!state->acquire_ctx);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (crtc_state)
 		return crtc_state;
 
 	ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
 	if (ret)

-- 
2.50.1

