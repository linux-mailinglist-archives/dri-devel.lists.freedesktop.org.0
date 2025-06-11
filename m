Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F8BAD63FF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 01:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5786410E756;
	Wed, 11 Jun 2025 23:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rvGeDmRj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oE8eFusl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3510E74E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 23:49:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bHj7F02x1z9thZ;
 Thu, 12 Jun 2025 01:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749685769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gal4hXabFurfA9QGeEXIKzO4wZ6zbjpSU652c76bN8g=;
 b=rvGeDmRjPLP92DzzWR2xRKoaLoYF1YuDm5IPB9CS4rLgyz9YzsUfIjc1iIk3zH2hCIIxj5
 C1N0vLEUnFam35WsEySY1KFi0qc+Dae468g4nI1OaA9eJbuRuk9kKUEvRbB0lahrnaxMWW
 O2TsJcCmdAmR5qdqEqq0gvvU0PlxGh67KSgpePxm6aWBmBlDfnfkcMbts9b20N/BU5ApLV
 62BzeAuel5KzT0PFWX6AKh9weEBFIIlUHSbAfCYhfDtAyecOs/ZoRKfLBSCs870KWMbhkm
 thd7wfvX/5cno3WhVZwNBwelXIzgNVi3csZS0dhC0xKw2D9TfkVH3heXNeg8TQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749685767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gal4hXabFurfA9QGeEXIKzO4wZ6zbjpSU652c76bN8g=;
 b=oE8eFuslJkbVukzvUK4II+FelmU2AFX+vtDbd+9qdIfT7nExfRsigOpbu6n1bVexuodlNh
 GGMH+6jp3ITKu5qkV2SDUEew2TfSgtQqwaCBZ1UEIyQUlnOzSyppMChV2ymlJn80YmnKmD
 m1xgeRpDxULW7t1OO+oGapnlsn8gnUijZheFHxQNj3BBvx+1yNU+mK3sBjcXVSRuaXOjwj
 2oXgCRj3mmi8xI85YChVY8FCelKhyq3wSTFV42gf1PAgNUE/15v+1Q52iq2iffGTRrWeKl
 A7h0G3rXUIsWf6esMW4PW6C+ZDMFRbIV5vi7gEGBAPhuT1RIFJ2iJUUG2djTGg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
Date: Thu, 12 Jun 2025 01:49:01 +0200
Message-ID: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: krmt9hucpdm55z3fm6ypp5963sxt7dyt
X-MBO-RS-ID: 1f6924fa28fca0224f8
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

Use u8 to hold lane count in struct ili9881c_desc {} to avoid
alignment gap between default_address_mode and lanes members.
The ili9881c controller can only operate up to 4 DSI lanes, so
there is no chance this value can ever be larger than 4. No
functional change.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ac433345a179..84927302957a 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -43,7 +43,7 @@ struct ili9881c_desc {
 	const struct drm_display_mode *mode;
 	const unsigned long mode_flags;
 	u8 default_address_mode;
-	unsigned int lanes;
+	u8 lanes;
 };
 
 struct ili9881c {
-- 
2.47.2

