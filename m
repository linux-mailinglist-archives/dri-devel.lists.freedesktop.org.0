Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2624B4ABD2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1A10E6B4;
	Tue,  9 Sep 2025 11:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iMFSt3cw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848C310E6AC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CD50442BD;
 Tue,  9 Sep 2025 11:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEDFC4CEF5;
 Tue,  9 Sep 2025 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417301;
 bh=45qXCq0r3ieNw6wBl7f4Vb0/4JcYiN+8JfsVh+VfjBQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iMFSt3cwrgNeZvpGJ9shUlliYRbtRE9J3FDAO3PKdKyMrkQh8e4xQE4TznqaniEOc
 ZVuh+FqkMvMDHXCIF6UL39LFPySGkhyD8KEkqWENxsBChsOfaRmgkT7QYyjJFB+eYi
 G0mh8lIvseIOyu7/hmGUZ+W8TvR1lIAmWIvamZJ7jAUSiw20TEW8idNPT7ahFWshEf
 5xUygUQ/sQtOSNF6OuPcx2kDaiOHMOZ3A5594vkH9z9i0c0UXnsSes6ueVVojyMKZT
 9bzO77QoyqMIV5oD2mJtUygkE3tsNFHtxyoEm40tQku+Z6uuasc0gk1ilr92rg+3TJ
 uFObvC/kEsfQQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:30 +0200
Subject: [PATCH v3 11/39] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-11-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=mripard@kernel.org;
 h=from:subject:message-id; bh=45qXCq0r3ieNw6wBl7f4Vb0/4JcYiN+8JfsVh+VfjBQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+NVW8yi3LN0qlLN+k23/3PP5c4NzPukY7Zsg+fj2N
 0a5fTw3OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE1LMZG9qiChVf3POOexKv
 y98VPfGgamKn1k3bySmSDAairL462rmN2aaeXwym3pnp8HLvRIlLjA23LU67MEzob8qcuL044+e
 Bc2f83Ji+es2T//T91LzJ501+Hpi5W4zx95rg79Xh6R4nhaQB
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

The ingenic IPU atomic_set_property implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called during the state building process, before
atomic_check, and thus before the states are swapped. The existing state
thus points to the new state, and we can use
drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 26ebf424d63ec21ccee80221745c3e8bcc6b3d7f..2574a4b4d40a2c27cb212114117829d9f6ab3ddb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -703,11 +703,11 @@ ingenic_ipu_plane_atomic_set_property(struct drm_plane *plane,
 
 	mode_changed = val != ipu->sharpness;
 	ipu->sharpness = val;
 
 	if (state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 
 		crtc_state->mode_changed |= mode_changed;
 	}

-- 
2.50.1

