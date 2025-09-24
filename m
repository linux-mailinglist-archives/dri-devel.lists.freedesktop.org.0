Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407AB9C4C1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 23:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7510E25A;
	Wed, 24 Sep 2025 21:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sLXR2/5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5310E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:46:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 484874350E;
 Wed, 24 Sep 2025 21:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC06C4CEE7;
 Wed, 24 Sep 2025 21:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758750407;
 bh=ckaSwtRPrj356IriTKLthYSjTY99oe1PgyqUXN6/eDg=;
 h=From:Date:Subject:To:Cc:From;
 b=sLXR2/5tlBDoAo+MWC8BCrzcXg4Lodf+O2znxlGGPUCxbmfnu+caHSthpgXZ/h8JS
 fenKE2u2/2HaxNpsrsVmR5RPPsL0KWt1shLEG+W00qUxCvHb8qqwF9XUVxRvzH2EI6
 2mSXHfh30GudnUyf0hnxzuzPG/nwyAmGOLNXjxButbaHkCdgyC71LLeqDYz33Fcfjm
 NRXmxTpurJR7xHuIaDNQ9nYoCTiU6u9qnD1jLgLynfXcQSxwhmDqBJFwKH42kZttAf
 6s6LXllje2kiOdEMNwanpnfLpPR3MjwD+8x7uZ0Boma9iOL7garIIOg8oMpfIo9Juu
 VBYaXc/qoIuuw==
Received: by venus (Postfix, from userid 1000)
 id CB1CF1805CC; Wed, 24 Sep 2025 23:46:43 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 24 Sep 2025 23:46:30 +0200
Subject: [PATCH] drm/panel: sitronix-st7789v: fix sync flags for
 t28cp45tn89
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-t28cp45tn89-fix-v1-1-8e8f52239c84@collabora.com>
X-B4-Tracking: v=1; b=H4sIALVm1GgC/x2MQQqAIBAAvyJ7TthMQftKdJDaai8mKhGIf086z
 sBMhUyJKcMsKiR6OPMdOoyDgO3y4STJe2dQqAw6pWVRdovalGCdPPiV6KbRIBJZ66FXMVHX/3F
 ZW/sAG5u1iGEAAAA=
X-Change-ID: 20250924-t28cp45tn89-fix-0931500ee88a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yo39CeDpYS10BZLVJfancD+PhiXUMdjyCeXd2WEPXNk=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBo1GbDqfNn0D/c1bP94UcM7RFr8hOS6xS7sItSO
 EM3oYksaPuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaNRmwwAKCRDY7tfzyDv6
 mgSVD/9qInDMt1F7V7n52ZgLdiBx1TxisznnPNS/i7G5Qg4z1XLr2ecdzH+KWfuEK7GjO624Xes
 l5hHtt2upTpCIZ2qnWmLYeO6rbepRsyywAgUpqGlJfhcsMD161sNQwKY4r3/V7usUNSLpX94Xng
 i8fk8k2mFYD7hOti8YyFu4RfjlfzQuIFt3fH7r9gt6ykNtRsjMNzfHFu4oFq3irIyZv3ZtBHOcU
 2nafyWbfo4NDBtDBvUltguT/Kt7ROPxeMt40BFRD73NVx4GsAo5SqSRGTwcbHYXEbpL87CuCV18
 MxhWmSjwkp/x0vfQup/HgP4L4QMaRHEF2hGb+X+XqLF1laSvCw45Pm7YUIAQ/0ksxZ2uwLEWkgr
 FkGe2VGe/23zSeDDhaJScs/B2W4J2/A0Zm/bR73+1M0VdIWd7h0flEtsK++xZiX1MhVSRk2oZto
 UthmhA1VcT5LtHz9eoVSZbchh6hN5JhKIIg1iPzUSoIDp3iYW7jhYM/mQRmLYxCyxMwmJYyCUil
 3lIcJlzHO9h8VRyHfBGY0Qr2eU7OhPb+otCx7EE7x+ZFz47RrzkzO9aBg9mBn4pZF3LX9r9rksJ
 pzuiUmaGQwBw6uEvRXqo1e2UBbBZ7e4DJG45pI48SbweJ/g/2YPQyyWwjkJxNlW8woesnGzMut/
 +omS/45E8XIevLA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

I planned to set the polarity of horizontal and vertical sync, but
accidentally described vertical sync twice with different polarity
instead.

Note, that there is no functional change, because the driver only
makes use of DRM_MODE_FLAG_P[HV]SYNC to divert from the default
active-low polarity.

Reported-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Closes: https://lore.kernel.org/all/20250923132616.GH20765@pendragon.ideasonboard.com/
Fixes: a411558cc143 ("drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 04d91929eedda092b966b8cffdef5b267748f190..dedf0a390a88dd45a8179e2d22e872128c87cfda 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -261,7 +261,7 @@ static const struct drm_display_mode t28cp45tn89_mode = {
 	.vtotal = 320 + 8 + 4 + 4,
 	.width_mm = 43,
 	.height_mm = 57,
-	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
 static const struct drm_display_mode et028013dma_mode = {

---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20250924-t28cp45tn89-fix-0931500ee88a

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

