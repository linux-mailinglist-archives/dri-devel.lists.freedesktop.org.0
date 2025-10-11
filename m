Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F604BCF408
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 13:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A87810E0BE;
	Sat, 11 Oct 2025 11:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wU+qRaDS";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HqwYIq4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC4110E0BE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 11:00:41 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckLHq4BZGz9stL;
 Sat, 11 Oct 2025 13:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760180439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1x43TlScBVkgTwe+twFcrN0NKTp3v9KoE45aWdfu/uI=;
 b=wU+qRaDSnC238O8piX3Zxmf3WrN5Ujvc1+g4qKXrHLCFJsr3X+fe0GOr4BVVI8EbG1cmrD
 1muBi5fHVIK5ocjPBIoMMrhLcdufnYEM31NvnopkKf7KgKja5/X6HOBatIN+Xzpk2EM0Ek
 FZWGTVKJDjSCGmbjaHK2VJz0KcYN8DiwBa1JuXTKEfiQjMF+MDxQ185NiVXiiGqqpvPphC
 18t0/cVvKFJNgmzhvVamebBG4xLeDibK6XhV9uy7wmIcTf6ZPQ26Spa/fbQsLeIHGJpVBZ
 32NUONIv8R2FjzMGqmyvFmuIKDMKbxyFb6AOPA6FnVQsRdfuipf9VJw31JB6aw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760180437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1x43TlScBVkgTwe+twFcrN0NKTp3v9KoE45aWdfu/uI=;
 b=HqwYIq4B0MrnB27VhM7xAEj4XRNMLEYtqpPxsmaO9WZp+kqi6tdelvmEzU/zVcic5lucYj
 xvsasihT26kyENeZz1U+uUTYHQ+hR/kpdXcdERYFDSD1VSjTRvx/IrrC2KnJpDGi4vPBsD
 xpu7z/I//DO/s4/W2CYEPHhYwEC8OcP1ePvsgWdYmYzds9XHZMRcqB0yoIo6FMFG+uvtUX
 UAY4Bih9fRbt7Odq/V00uY0Gi2RW4xZKlWFdShfwRjIwM1qb0E6bkSJeZBM8vXI+Y1M/sB
 PSZfvD33fK4I6ATgV9too3FJWc9l3/6yprZQ3uMpMhhdVOTPRt4qD0nMLJoy3Q==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bridge: lt9211: Drop check for last nibble of version
 register
Date: Sat, 11 Oct 2025 12:59:53 +0200
Message-ID: <20251011110017.12521-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 00a0081c939190bfe28
X-MBO-RS-META: qtz5583iatd1485icuuo9exebbp7migk
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

There is now a new LT9211 rev. U5, which reports chip ID 0x18 0x01 0xe4 .
The previous LT9211 reported chip ID 0x18 0x01 0xe3 , which is what the
driver checks for right now. Since there is a possibility there will be
yet another revision of the LT9211 in the future, drop the last version
nibble check to allow all future revisions of the chip to work with this
driver.

This fix makes LT9211 rev. U5 work with this driver.

Fixes: 8ce4129e3de4 ("drm/bridge: lt9211: Add Lontium LT9211 bridge driver")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 399fa7eebd49c..03fc8fd10f20a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -121,8 +121,7 @@ static int lt9211_read_chipid(struct lt9211 *ctx)
 	}
 
 	/* Test for known Chip ID. */
-	if (chipid[0] != REG_CHIPID0_VALUE || chipid[1] != REG_CHIPID1_VALUE ||
-	    chipid[2] != REG_CHIPID2_VALUE) {
+	if (chipid[0] != REG_CHIPID0_VALUE || chipid[1] != REG_CHIPID1_VALUE) {
 		dev_err(ctx->dev, "Unknown Chip ID: 0x%02x 0x%02x 0x%02x\n",
 			chipid[0], chipid[1], chipid[2]);
 		return -EINVAL;
-- 
2.51.0

