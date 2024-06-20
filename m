Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41863910A7E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B4510EAAD;
	Thu, 20 Jun 2024 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ga77UhTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f99.google.com (mail-ej1-f99.google.com
 [209.85.218.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E61610EAA3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:14 +0000 (UTC)
Received: by mail-ej1-f99.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so134274966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898433; x=1719503233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcP2eWmrAeeT8qr3h7iZC7JLF/ZxrClEr5jIguT22Ko=;
 b=Ga77UhTIodVYMMgNc9zf7RRms3P2/ZyQblkvAMbKJ/Max9eHkh527knjH+U+lM6cRb
 LKPP7WLU8czZ47v9wLnFAFc3ipPBJ7ls/uKOmHcrXpoCg8pkh2ajrlIvXvdCDizZgljV
 Uv5PCa0PJJh3y+iuD2MTgezbbN02kx0mubZi3BNJEQOZZHV7NUOX6IyArH5eqQerpTgD
 6qvc2WQ+DZp4LJaCdLheo6qIUV0FBFhanc51ctaEHyPlgxt4sTn57/cXQXFxrFGZZrZY
 rhRcwaxLkf54WtEQU2/CZri4vD7pQjg7SzCRZ01giI1bEij+6a8TO/34dysF+diNCQfb
 mdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898433; x=1719503233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcP2eWmrAeeT8qr3h7iZC7JLF/ZxrClEr5jIguT22Ko=;
 b=ESi0YeMm9ubbN5lMuVGfC4LEdIXCIUxWXOvTu10p8zhKwiOWZxn3JT1aiND8en55SO
 rOS4CcnViBmqJadcBKVccuy+jgbWOxc1v2gUneeELweeut0Qq220oJe2luVPZk1jXz74
 4YCBBvcvq5pAEj+2z6kxMz8EovX7gmIypaK6xtuXrY40BcaKZ5RcdkN0+sg2fdXUhgRZ
 TeMxdKmjiRmXfsBet4ybmJWuUQT/oU+GV30/7VlxzEKyGD/jUgsiTTkOVkzKpJVVc1CR
 YYfR5bgpmgcbOHgLFPYu60wyg4mv9+DfuSWYwg1iU4EB3jkrOPIyCq3sy73Ktx8Bbh9O
 m0/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQxI+6MhZiGbJKVpbjjAzAAznXiz1zf1RfChG5FFFHR7jfP/jO3XBlxaMYUc7X8cGPk2GkvVW+aiODp3q5EgiDBLObCGajV/RBh0LdHjK7
X-Gm-Message-State: AOJu0Yyzdt5vLnGBZmhxdTblsziP+znLSVb9TkA1Y46mVyLTS+nWQKDB
 Jg/7nImpBYnUUTxREqrIVx5FNFJXRECUErb6rsEMxkFt8VPs6kI7MzHP+OZbC8uwi9FQa3xy0R8
 GxTIBaZ9KIYf8NegdZySR50qSoVavAEn0
X-Google-Smtp-Source: AGHT+IFrwt4HNTv0lN55SUmFRoVtC/fN6ghv+o4fM/xudZK05B4SbrZ54I/Yu91Vy+BX94IkW2TGLNZRzBev
X-Received: by 2002:a17:906:99d2:b0:a6f:4c90:7958 with SMTP id
 a640c23a62f3a-a6fab609d79mr477282766b.12.1718898432717; 
 Thu, 20 Jun 2024 08:47:12 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56d8dc5asm28913966b.85.2024.06.20.08.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:12 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 26/31] drm/vc4: hvs: Rename hvs_regs list
Date: Thu, 20 Jun 2024 16:46:27 +0100
Message-Id: <20240620154632.4125308-27-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

The HVS register set has been heavily modified in the BCM2712, and we'll
thus need a separate debugfs_reg32 array for it.

The name hvs_regs is thus a bit too generic, so let's rename it to
something more specific.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index bd9ae25dbdcf..3f323a9d5e9a 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -33,7 +33,7 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
-static const struct debugfs_reg32 hvs_regs[] = {
+static const struct debugfs_reg32 vc4_hvs_regs[] = {
 	VC4_REG32(SCALER_DISPCTRL),
 	VC4_REG32(SCALER_DISPSTAT),
 	VC4_REG32(SCALER_DISPID),
@@ -1028,8 +1028,8 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(hvs->regs);
 
 	hvs->regset.base = hvs->regs;
-	hvs->regset.regs = hvs_regs;
-	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
+	hvs->regset.regs = vc4_hvs_regs;
+	hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
 
 	if (vc4->gen == VC4_GEN_5) {
 		struct rpi_firmware *firmware;
-- 
2.34.1

