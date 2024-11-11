Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31D9C3F75
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6C10E2D2;
	Mon, 11 Nov 2024 13:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7886810E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 13:22:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 00B5FA4162E;
 Mon, 11 Nov 2024 13:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F336C4CED5;
 Mon, 11 Nov 2024 13:22:12 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm: Remove redundant statement in drm_crtc_helper_set_mode()
Date: Mon, 11 Nov 2024 21:21:49 +0800
Message-ID: <20241111132149.1113736-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
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

Commit dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers")
removes the drm_bridge_mode_fixup() call in drm_crtc_helper_set_mode(),
which makes the subsequent "encoder_funcs = encoder->helper_private" be
redundant, so remove it.

Cc: stable@vger.kernel.org
Fixes: dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers")
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/drm_crtc_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 0955f1c385dd..39497493f74c 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -334,7 +334,6 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		if (!encoder_funcs)
 			continue;
 
-		encoder_funcs = encoder->helper_private;
 		if (encoder_funcs->mode_fixup) {
 			if (!(ret = encoder_funcs->mode_fixup(encoder, mode,
 							      adjusted_mode))) {
-- 
2.43.5

