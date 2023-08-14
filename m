Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B477BAB5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC67910E20F;
	Mon, 14 Aug 2023 13:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4A10E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:57:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7318660EB3;
 Mon, 14 Aug 2023 13:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897AEC433C8;
 Mon, 14 Aug 2023 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021419;
 bh=0EIFvA5+tRKt9U3IH9IJeiJikcR9vpCTg2DVlFki8rM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jcBvQE5MgxAtWYsKgfg1Wli1ztakkvC+/9bj6uYYd3VIZgzdxLanbFVjuHJR47qwm
 b2fDhc2lEHSSmX2B+0SU2b9aaoQ+Yc/66d2+muQC5rhn611nN4Be9kFwJpuwqAqWN8
 Cdp5q6m8QiPptSqECfPYMOUm6ML57WQT38KWoriVB8ZfBi7yknhhUvLB0N28JHTgYh
 ut0fyDaXkrMb/pERj+FFygZAAqzwPaAfZNR8NKXdKbflQvfUStGxx4d7PzrpHYEiwl
 oiOSqWhPR+XjouVlMeYjHZkxRZFvQwZ0R1Y5P6G7vvBvXJ2oOu1RgNOVtAGsc84odF
 Wj7NgTFv/ro1A==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:24 +0200
Subject: [PATCH RFC 12/13] drm/vc4: hdmi: Create destroy state implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-12-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0EIFvA5+tRKt9U3IH9IJeiJikcR9vpCTg2DVlFki8rM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNr0jlw2e/rjJ8/vmqCvxvEuQXv+1PAsW7apT5hf/
 3iJzNbsjhIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkSjbDj18ObaYXn6yRMJUX
 Pf77T+SmiOvzDr2dsLUw6fne6U2dMgz/g3v3fJsz4cmRU/4+wVf3rJHaaHR+h+gRRTmWwH1/Li3
 8yAsA
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5261526d286f..ac5debd47e99 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -672,11 +672,21 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	return &new_state->base;
 }
 
+static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
+					     struct drm_connector_state *state)
+{
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(state);
+	kfree(vc4_state);
+}
+
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_destroy_state = vc4_hdmi_connector_destroy_state,
 	.atomic_get_property = vc4_hdmi_connector_get_property,
 	.atomic_set_property = vc4_hdmi_connector_set_property,
 };

-- 
2.41.0

