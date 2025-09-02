Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E180B3FABF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5233810E62B;
	Tue,  2 Sep 2025 09:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vI3v42mO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE5D10E63E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D6FB60202;
 Tue,  2 Sep 2025 09:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D865FC4CEF5;
 Tue,  2 Sep 2025 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805813;
 bh=SnF20RcmL4DUkYaTODo6JKC3eNZBw/IKOudcmtndkoo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vI3v42mOHUOCQTCXD8EbpkZItkLenFyR1LP8qyKUvj6vZNqTGa/CVHoWAspyygWBm
 gz7RWMLWJeW+02ZJEAeth8dGaSEFluikQs8BT78UQoLmSYRUXsFpHuGnmzQOk/O/JU
 Z8AVaHAOx2ipBSOCcUNpWnQ7fC9jrr4KM3ajpKI35m09m1hmniN7J0qqo3RFXhZ36o
 hLidn8IIw9Rdw71XdJdrLowUlwlpRj3p4JYzvPb3AlwT7EMEHmNVi1lN9rdXPLK1CY
 d/fR5BHhzTQBAM/jTOi9Hh9Ew8OTasb/U8lecHEyODWKShOzkfSkrzoL54aVfyqarm
 KhcGn2VQqCCkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:32 +0200
Subject: [PATCH v2 33/37] drm/framebuffer: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-33-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SnF20RcmL4DUkYaTODo6JKC3eNZBw/IKOudcmtndkoo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkUVBoa/vVFRzVTZpxF8If31kwv/u7l74mKWpYv53
 C+Rve7ZMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbSO52xYd/8SP14JmGliR1c
 0voTAucfjFh3Kd7c6pbNbfmFBy64u39NnPONwWS1Q8GWe9L3I33yGOsd7vwtNmZU2nNmhbbCTU2
 tiLlnJj3vq3h12LSIh9275Y1lvlb4o7nOn8S2y5crPO+YpAYA
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

