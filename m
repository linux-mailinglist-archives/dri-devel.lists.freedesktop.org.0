Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAABAC985
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AD110E575;
	Tue, 30 Sep 2025 11:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IppY4rsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DBC10E56B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3E3E604C3;
 Tue, 30 Sep 2025 11:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6F2C113D0;
 Tue, 30 Sep 2025 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230036;
 bh=jfdzVknbt27HxmQJhWYW7cewyNObAJ41QtcPYohZBOw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IppY4rsgoMLE8DHtmN9Lr3WnprKa/0ux7mU6USAPJIaLiJChZOjUCUODnLVvtWJ48
 s6gyqmexQ/OON27DNVIaBjhVjI86QIgw/8J03oFNw8r7ZY2V/g0bPlk3rZgqRsE6tn
 BOxSBiZZV1rQD2STUeRq+P2Ua9ey0233bP1XUgPg4SxuvArMANViVhxP/Rq/ovU0jV
 t6J5nPXOt2aZAjpTOggJl+I/DcGypFzxVSejG8oXKIaEcAfb22AyE1Iu7wiScfj5kP
 b3OsUR/U785SUMJiPpj4KtwbidiEQyqRzgbMUGxwYK/ZF2E53/ru/DKAZEuoHKy47E
 0H6Zvm6bRLLHw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:26 +0200
Subject: [PATCH v5 11/39] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-11-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jfdzVknbt27HxmQJhWYW7cewyNObAJ41QtcPYohZBOw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jstlnYwHl5NX+OxMtdv762dvY17hddptfBX5Nw2
 d3jS+C3jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRFfsZGxZa82b1xlY3aDBO
 cSw/pB6g2VARVjWFcc9hK9FXBfurLOdduTGx6uqBfLYEkRI3SaVDjA0Pv3RVXvu9JKK5IGpx2l5
 JS5fbFRa3YlQuzOlgnSD1vyxud830433ehx++Wz1l4tPF6SsA
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
2.51.0

