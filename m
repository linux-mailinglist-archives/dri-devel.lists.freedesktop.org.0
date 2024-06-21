Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B591296B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209710F1F9;
	Fri, 21 Jun 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="d6iwMmvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8E310F1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:46 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52ccc40e72eso1717132e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983304; x=1719588104;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS0ZdfQzA/iMqxdfAiA8oHNA466XESazyXLFVDOAupo=;
 b=d6iwMmvFE/qV7LNoZe6tI7obogA781FnMvm9ADS9w4i87fzSuuNLpAOmP2hZfxYcN0
 V1qyuRJE9rk5g0a3TW3lbEbdtQE/foBc3i35fPy8uT3+BjeCNrr2M3atSXFgZ4NxpRz+
 C7vXcI3ZSi4P/qO3PaLxfOAEI7qjJ9pvCU4z83VOcrEO7GbzJdSfm9ULQ+cKuV67b4Kd
 MZlH+X2m68jGvX00RIPTyrju6niiiuxwwazVAD7q5vEmy35EVO0hACYhosdCWWePP7Qj
 fjxL0FGBObiTsgMHaDtfQkGsGZLFGPTTNkcIrxACmN/JZCb65q3IRwRUEWYOaElo1KQF
 ovDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983304; x=1719588104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KS0ZdfQzA/iMqxdfAiA8oHNA466XESazyXLFVDOAupo=;
 b=nXm8c6rAxVKQNKisNXICb2myeMwoZXpdxTunJP/sJKGiKtreEyJKVunr7J2MpCxmHH
 2yYx/tvCl5LMroxFExfigzVFFkga1ljM1I3L89HkI5DXFBvd0lLunUvjNXhMyYyHHdyI
 M6TTc6hrakkIUdbofemKcGGOvpNCaNN2lCioJ/zuHZdHHJt66ONMOX6VSQOpSqlxDBIj
 8wMvq6KiPYkfUaUmIXEBRWiS/vY0SC68/YeM1An7FGPKNl6xNDa89lCIz8FuOpMWUILn
 l04uYenlChwckzU0dUEMIcWlvIvCzNdjeUCorc5LW3vUO3+2hTs0aVO9shNFFaarenpf
 ilEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeK01sFRdY8qoAbWcBfgTEIb+FL5JxeOB4vh5OQioNmbHsCODskcY/x55rW+MRviw2KAx2TSP+AFuFufHKKpTMmTGE7dogyAw4PXcnIxxu
X-Gm-Message-State: AOJu0YzC2DLjHZbkNJA+91fYYoaQxvDfzVyjGxNR1mRdRy2js7K+Q5sj
 ZsFmM2XM9e9m0XACteVVRiG9Mlz9i/9H8MhtPCGkO+Pbuc5ykGjotnOV9eJXsbCy3WenwcxfHRQ
 26NWMlgzFZqpYzj4nvXoUCgkrinFML5LO
X-Google-Smtp-Source: AGHT+IG456hgEIdAO9+lAnIaSgpaiVHmF6W0+bSKB6OQZBgNQZnhtuzTC9a7S9nFxBlu1B28P3bOb2izgMPB
X-Received: by 2002:ac2:4303:0:b0:52c:d7e6:8d73 with SMTP id
 2adb3069b0e04-52cd7e69e76mr1375206e87.18.1718983304582; 
 Fri, 21 Jun 2024 08:21:44 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d208d92sm4856015e9.42.2024.06.21.08.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:44 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 25/31] drm/vc4: hvs: Rename hvs_regs list
Date: Fri, 21 Jun 2024 16:20:49 +0100
Message-Id: <20240621152055.4180873-26-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

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

