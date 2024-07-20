Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161C9380EA
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 13:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7088710E1F3;
	Sat, 20 Jul 2024 11:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="ImRbiEIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Sat, 20 Jul 2024 11:14:01 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461210E1F3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 11:14:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WR3cQ2zBBz9sT7;
 Sat, 20 Jul 2024 13:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1721473542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ayY6GD/gdW87r++iKcpJaxb+ElUUfdFidDGr/Tu/uvI=;
 b=ImRbiEIBJuX7dvH/SELcHhOajn+hQqAaP0gJ4nElO5E37AFg3ZJpH+Gm2EsUnn5GW8+HK2
 +/dPKofPKCjCcMM96jBW2Ie3D+W5dhcfdeXUqBCOAOc7F6mY3u8f10Xg7kdwc+Vtuzbmp1
 kfLAMDh1nH6fXf9bExWrczJee8NL4C+GsGNJFac5TR0trdKudvdlFPLj50jrs8fFgkrOQd
 ulDD700pXQCSo8mKZdyL6GbKvW8VrmLviwyMKvE3k5qxPUKk/GeeRt6kkppNVc3DNddyLG
 tYI9fmLFWtmWFFrmT2Pn36RszG6s0fK+NrDc5EjG40DCl04qCA/xHp6DTFHk6Q==
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: [PATCH] drm/edid: add non-desktop quirk to Pimax VR Headsets
Date: Sat, 20 Jul 2024 13:03:14 +0200
Message-ID: <20240720110437.251252-2-contact@scrumplex.net>
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

See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/40

Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
---
 drivers/gpu/drm/drm_edid.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..41879d67599d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -237,6 +237,11 @@ static const struct edid_quirk {
 	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
 
+	/* Pimax VR Headsets */
+	EDID_QUIRK('P', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('P', 'V', 'R', 0x101a, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('P', 'V', 'R', 0x101b, EDID_QUIRK_NON_DESKTOP),
+
 	/* Sony PlayStation VR Headset */
 	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
 
-- 
2.45.2

