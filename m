Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5586B4ABE4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887910E6B6;
	Tue,  9 Sep 2025 11:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CnJ8/4mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73510E6B9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A8006021E;
 Tue,  9 Sep 2025 11:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650B5C4CEF7;
 Tue,  9 Sep 2025 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417331;
 bh=d4NqmB4yngwN3ydTNRlVMtcFKpzxb7DnXyR4vmL6YS8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CnJ8/4mF63SCu9ncpxtJJUg3Mt5HjpcpBnvi6aYkeZnygadWfauMaPoe7QHcEvXHB
 DFGE4aqSgKRlpSJ8CVIDKc4VNpRAoRCOLH0w5mm5awLyOCycwZObnNhHM1Iuv7wZg+
 QqKHmnTTHid6F8BQAmbx/e2rL7wAMCh/HPijdzdx910sqDIsWS4lHqud7JJ+8tchfb
 v05P5lUmQrS1FfWxTj11I1/bhFISAVDleDltEh7QEU44Kk/3W3LVU1DGvIU8BBL83K
 PSE6ZBndY5HDXVUMc1Ll6bqHULVJ3TcehtlDzsEr/u04Xisvc/R0bokJKNoGEKai1s
 IdL7y6m0dRY9A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:41 +0200
Subject: [PATCH v3 22/39] drm/logicvc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-22-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Paul Kocialkowski <paulk@sys-base.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=mripard@kernel.org;
 h=from:subject:message-id; bh=d4NqmB4yngwN3ydTNRlVMtcFKpzxb7DnXyR4vmL6YS8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+LX9bsolTzCI6P9ZItLDEyAjIqvT9nbPU7Z9x18di
 rIMOMDSMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZSuIexTjew/cOES1UlKfdn
 hq1j79kgcPCXi+u+cE39RQKfLHev5IrXPvh1yex+C6//DXl/InWvMDZ8CPx+l+fXN3fx2lJxvq2
 XtAS60moZ/x26uYdtT6Wce37k7A+FWpfPJv8ra39zWT7xRCoA
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

The logicvc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765378894002fdb02dab16d197c27b1..eab4d773f92b66a9edb9770aa7a95349d665ec18 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -94,12 +94,12 @@ static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
 	int ret;
 
 	if (!new_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state,
-							new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
+						   new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (new_state->crtc_x < 0 || new_state->crtc_y < 0) {
 		drm_err(drm_dev,

-- 
2.50.1

