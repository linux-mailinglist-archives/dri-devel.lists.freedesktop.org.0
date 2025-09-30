Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E7BAC98E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB1F10E576;
	Tue, 30 Sep 2025 11:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gu7GQzLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2875A10E576
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F8A9604C3;
 Tue, 30 Sep 2025 11:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB52C4CEF0;
 Tue, 30 Sep 2025 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230042;
 bh=TV7kc9Ka6LL3YWwteUnPRomh5WBaCFCmGATqRI0tKlk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gu7GQzLohYSexd5sq2j54CrYaBH3agTzoKa6G3ke3Eo4S7LVwTL3p+ukKJuGPKXm5
 Tkvbyr+BSOdjBnHh7spwZpGWU5n/C73wTCje9AcnLltraWu7mNs2qDS88T/kp+pRab
 h1+WGEbQfz6JAxc102ru1NfC95XHarTheK2C3isRzNVLUPk93YoOJIeXTmInynIMxc
 zA4Ox5gT8tJCJ5G10OiqaAZMd7RNFxo4K3PX+l6TwCUWGgou26wVJl6+ObWVYkrwpr
 Zyw/91Uh1e4enPaM8nMMMZirWDcvglvMW/oWxrF9ZGYOsXPobSt23fjVVfUQDv7AyV
 TLdSaPWeDdRMA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:28 +0200
Subject: [PATCH v5 13/39] drm/armada: Drop always true condition in
 atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-13-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TV7kc9Ka6LL3YWwteUnPRomh5WBaCFCmGATqRI0tKlk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jG+XbcXbBx7+dsUZaUKWf3HZn+ZG77JOP02cmsD
 CVy3fPedkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJML9mbNj68tpnJ8/oKcw/
 79+La2MUd56YKza9lfvjHdMjd/sumDfM4FM6tLpz2oykzZH/5I0MZzI2NDPq9Qj998w++Kfka9q
 WM63mr233i2fv+xMU3HbtmuYOH7932rzTjyYa7P2XKKcScJgTAA==
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

The drm_atomic_state pointer passed to atomic_check is always valid, so
checking if it's NULL or not is pointless. Remove the check.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index cc47c032dbc151a463cbd0b0d048c74c2828f253..12a01a51d6fb7dc0e9264d4e4bf6dc4e1b472cb6 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -92,16 +92,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
 		new_plane_state->visible = false;
 		return 0;
 	}
 
-	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								crtc);
-	else
-		crtc_state = crtc->state;
-
+	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  0,
 						  INT_MAX, true, false);
 	if (ret)
 		return ret;

-- 
2.51.0

