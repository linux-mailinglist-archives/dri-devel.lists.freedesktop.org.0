Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A1871FAEF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 09:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072C210E62B;
	Fri,  2 Jun 2023 07:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4C110E56B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 14:48:37 +0000 (UTC)
Received: from fpc.intra.ispras.ru (unknown [10.10.165.6])
 by mail.ispras.ru (Postfix) with ESMTPSA id B17374076277;
 Thu,  1 Jun 2023 14:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru B17374076277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1685630438;
 bh=r9sMHMiXrbhy7C+21akEGSbG3LyQKzFWYpKX8g3KZvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VaYHgFvPhdR0AuoOlH2kxWpO5TvNt0Bc8jC7ZOQ16/N3Df/ZL+v5JR2HWcNFg4m1b
 NJ4p/9tituVcqzVUVkYqdX3yqkqeS4le4oRhtuZJqH7Rc8xEE41wZgKKMl6jw9AE85
 5L+W+iUwluA3s5AIa7K8XY2gNstWS5biG6v9VVtc=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [PATCH 5.4/5.10 1/1] drm/atomic: Don't pollute crtc_state->mode_blob
 with error pointers
Date: Thu,  1 Jun 2023 17:40:16 +0300
Message-Id: <20230601144016.475176-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601144016.475176-1-pchelkin@ispras.ru>
References: <20230601144016.475176-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Jun 2023 07:26:38 +0000
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 fuyufan <fuyufan@huawei.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

commit 439cf34c8e0a8a33d8c15a31be1b7423426bc765 upstream.

Make sure we don't assign an error pointer to crtc_state->mode_blob
as that will break all kinds of places that assume either NULL or a
valid pointer (eg. drm_property_blob_put()).

Cc: stable@vger.kernel.org
Reported-by: fuyufan <fuyufan@huawei.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220209091928.14766-1-ville.syrjala@linux.intel.com
Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 25c269bc4681..b6062833370f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -75,15 +75,17 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 	state->mode_blob = NULL;
 
 	if (mode) {
+		struct drm_property_blob *blob;
+
 		drm_mode_convert_to_umode(&umode, mode);
-		state->mode_blob =
-			drm_property_create_blob(state->crtc->dev,
-		                                 sizeof(umode),
-		                                 &umode);
-		if (IS_ERR(state->mode_blob))
-			return PTR_ERR(state->mode_blob);
+		blob = drm_property_create_blob(crtc->dev,
+						sizeof(umode), &umode);
+		if (IS_ERR(blob))
+			return PTR_ERR(blob);
 
 		drm_mode_copy(&state->mode, mode);
+
+		state->mode_blob = blob;
 		state->enable = true;
 		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
 				 mode->name, crtc->base.id, crtc->name, state);
-- 
2.34.1

