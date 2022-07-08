Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4D56C168
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A5210EADC;
	Fri,  8 Jul 2022 20:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328AD10EAC4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657313665; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CstdOR1GH8PTss/tJU+TspqDPaPgCuNQmeryFjsonoU=;
 b=TPmZ7n5f1FV3VmbioC9/itJnqP+g7Wd+oEJvJgMscumGiuhjgGrq75k36fLXS2/cnIR/yE
 H0ulKt9cE8YSO7jkAhHeztipZVZmMtGTmHgMw87bRNGh9fZ8harlsb9UYwqjjgmLsKlIWs
 AkzukoBLeReRnCs8F1cNUF+lUN46108=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/6] drm/ingenic: Don't request full modeset if property is
 not modified
Date: Fri,  8 Jul 2022 21:54:04 +0100
Message-Id: <20220708205406.96473-5-paul@crapouillou.net>
In-Reply-To: <20220708205406.96473-1-paul@crapouillou.net>
References: <20220708205406.96473-1-paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid requesting a full modeset if the sharpness property is not
modified, because then we don't actually need it.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 32a50935aa6d..d13f58ad4769 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -697,10 +697,12 @@ ingenic_ipu_plane_atomic_set_property(struct drm_plane *plane,
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
 	struct drm_crtc_state *crtc_state;
+	bool mode_changed;
 
 	if (property != ipu->sharpness_prop)
 		return -EINVAL;
 
+	mode_changed = val != ipu->sharpness;
 	ipu->sharpness = val;
 
 	if (state->crtc) {
@@ -708,7 +710,7 @@ ingenic_ipu_plane_atomic_set_property(struct drm_plane *plane,
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 
-		crtc_state->mode_changed = true;
+		crtc_state->mode_changed |= mode_changed;
 	}
 
 	return 0;
-- 
2.35.1

