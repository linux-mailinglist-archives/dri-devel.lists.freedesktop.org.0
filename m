Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39EE69C015
	for <lists+dri-devel@lfdr.de>; Sun, 19 Feb 2023 12:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A699D10E0E9;
	Sun, 19 Feb 2023 11:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79F810E0E9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Feb 2023 11:46:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4PKNzr1FXvz9sTx;
 Sun, 19 Feb 2023 12:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676807176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8s5cyNEZ69bCI7i4TE/gwmJDIVWf0jgsyM+wk8nT1gY=;
 b=s3wUanb3YMmzXRANmsUL8lF+o9wOEVWd3y/FWEjtg+7HBePxjG3AreJ23l6BxZtNaPsvB6
 0LBtV2Tyf17CzJcwwrq905k6uBdrBs1MPVipxfe4ITTKtEPe8KdPtdPDLL2ZlKKIvIwqSZ
 xUXSQeefBi5+YJLoUN6Y8qSRfMNlI8spIaVqrrZ02Uwut5tUrNeSGGlZuYSsY9vLOrvSV8
 XQuxZ2BtLc8LYzuy1D3MCMBzKh/Og+O206xdb+vqtBENxQub+D6XuQ2TCptObgc61Lu9vX
 doSpstvqiKbAas+ZPWJLb/CyhaAE2tuVu5naGAJkXlna4z7OzD2Zsut5sL++1A==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] drm/panel: st7703: Fix vertical refresh rate of XBD599
Date: Sun, 19 Feb 2023 12:45:53 +0100
Message-Id: <20230219114553.288057-2-frank@oltmanns.dev>
In-Reply-To: <20230219114553.288057-1-frank@oltmanns.dev>
References: <20230219114553.288057-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PKNzr1FXvz9sTx
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
Cc: Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the XBD599 panel's slight visual stutter by correcting the pixel
clock speed so that the panel's 60Hz vertical refresh rate is met.

Set the clock speed using the underlying formula instead of a magic
number. To have a consistent procedure for both panels, set the JH057N
panel's clock also as a formula.
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..cd7d631f7573 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -139,7 +139,7 @@ static const struct drm_display_mode jh057n00900_mode = {
 	.vsync_start = 1440 + 20,
 	.vsync_end   = 1440 + 20 + 4,
 	.vtotal	     = 1440 + 20 + 4 + 12,
-	.clock	     = 75276,
+	.clock	     = (720 + 90 + 20 + 20) * (1440 + 20 + 4 + 12) * 60 / 1000,
 	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	.width_mm    = 65,
 	.height_mm   = 130,
@@ -324,7 +324,7 @@ static const struct drm_display_mode xbd599_mode = {
 	.vsync_start = 1440 + 18,
 	.vsync_end   = 1440 + 18 + 10,
 	.vtotal	     = 1440 + 18 + 10 + 17,
-	.clock	     = 69000,
+	.clock	     = (720 + 40 + 40 + 40) * (1440 + 18 + 10 + 17) * 60 / 1000,
 	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	.width_mm    = 68,
 	.height_mm   = 136,
-- 
2.39.1

