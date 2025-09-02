Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE426B3FA9C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B0E10E621;
	Tue,  2 Sep 2025 09:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o36wWaQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764D210E621
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D29856020D;
 Tue,  2 Sep 2025 09:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3943BC4CEED;
 Tue,  2 Sep 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805755;
 bh=pFFDzLw9khlKoPyON9xzEz5vMmiuZ0/NFYcYMwpLosM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o36wWaQOVFpNngXPmEouSZo/nPEGS0Ehr6Yu1hRHmHT7YbPQwwcYJXgRO7jGuscNR
 RF8nJAcEUZ7cWX5f5S3PMYea9Hq8hfV0xHth1sBaqImj4eYzIBS4WCpxPkbE5ahRwz
 m3Gvo+HJh9H0ZpQrwq9dMURLlCWEblDKWdeDDXIkyJs4+OhSoyXw7IhUAJ1wxD3qMc
 qrV+EqnbVgIeHpHuxU3J1QrcDZf1pD1csyJ2uT/vvd7XDZFZeP5L6/NWYKMeYWTqxM
 2VeFmmzNjNapj98j6Y0SC/zSqsuXeW9R+5NgZOW/cMvSLX88fPFiBYRggQqPW3WR42
 OgbcVy0vzRujw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:10 +0200
Subject: [PATCH v2 11/37] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-11-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pFFDzLw9khlKoPyON9xzEz5vMmiuZ0/NFYcYMwpLosM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgW0pf7X2dJ6ZL4Ur5DqsV0fDKZeKtp44sq6Lxumm
 IjWbEnZ3zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmYhjG2LBiK3+gV3R2z5Gu
 u0VZcstVRX6JCAgdmGLYH7Eu+WRE87pCP4ZrBebPs7QFNwruOvnqCmPDxCJzf5FnTnP/10Vfjos
 4lD2j+d3t2Jn60ovvaOwM2yRx7MXd5n/ZHq5bb04ST/jMK34HAA==
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

