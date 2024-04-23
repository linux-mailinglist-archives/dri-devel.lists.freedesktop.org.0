Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52C8AFA05
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 23:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6911371B;
	Tue, 23 Apr 2024 21:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xADLuOz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22F611371A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 21:45:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AC954CE131E;
 Tue, 23 Apr 2024 21:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D54C3277B;
 Tue, 23 Apr 2024 21:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713908753;
 bh=kPAxWqzwfWFkFKRta1wn9RWC9so6iinkaagq6SXFmlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xADLuOz0deB+MExsYEEWyMIN9zkV3KA00TLu93VhiY1v+j1KR8+1eCTzLXW6SiBf1
 65qt6lJ/fyCvVbdw0BmOCvwbPjKCTIQBlXgZKN+u8iWTsnAF4119BY+u+R/2JryYGq
 ourQstEf+7P9OaycvCCd02zw2pE9ghdHNNXINbKg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 dri-devel@lists.freedesktop.org, Ian Forbes <ian.forbes@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>
Subject: [PATCH 6.1 129/141] drm/vmwgfx: Fix crtcs atomic check conditional
Date: Tue, 23 Apr 2024 14:39:57 -0700
Message-ID: <20240423213857.406743802@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423213853.356988651@linuxfoundation.org>
References: <20240423213853.356988651@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Zack Rusin <zack.rusin@broadcom.com>

commit a60ccade88f926e871a57176e86a34bbf0db0098 upstream.

The conditional was supposed to prevent enabling of a crtc state
without a set primary plane. Accidently it also prevented disabling
crtc state with a set primary plane. Neither is correct.

Fix the conditional and just driver-warn when a crtc state has been
enabled without a primary plane which will help debug broken userspace.

Fixes IGT's kms_atomic_interruptible and kms_atomic_transition tests.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 06ec41909e31 ("drm/vmwgfx: Add and connect CRTC helper functions")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.12+
Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240412025511.78553-5-zack.rusin@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -793,6 +793,7 @@ int vmw_du_cursor_plane_atomic_check(str
 int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
 {
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
 	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
 									 crtc);
 	struct vmw_display_unit *du = vmw_crtc_to_du(new_state->crtc);
@@ -800,9 +801,13 @@ int vmw_du_crtc_atomic_check(struct drm_
 	bool has_primary = new_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
 
-	/* We always want to have an active plane with an active CRTC */
-	if (has_primary != new_state->enable)
-		return -EINVAL;
+	/*
+	 * This is fine in general, but broken userspace might expect
+	 * some actual rendering so give a clue as why it's blank.
+	 */
+	if (new_state->enable && !has_primary)
+		drm_dbg_driver(&vmw->drm,
+			       "CRTC without a primary plane will be blank.\n");
 
 
 	if (new_state->connector_mask != connector_mask &&


