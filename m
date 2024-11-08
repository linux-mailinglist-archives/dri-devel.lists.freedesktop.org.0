Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB939C252C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 19:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340F10EA27;
	Fri,  8 Nov 2024 18:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KqKQM9Jg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562210EA1E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 17:11:29 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-20c6f492d2dso26934195ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 09:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731085889; x=1731690689; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sbZQNMHhnIDB6LlVrWgRtNHZEDlsEUv5saNArVcX6Ww=;
 b=KqKQM9JgyldqjZXpLnbYY++YtGtXoB9MwiZ7fgAeHAU2rq6oiEsVJZVHjLUFNY3xW6
 lNhU8fQVfQ1hmtelLtfNIkZGaVLr0Cv4ksI7PkbtT4wIzb0ZCHC7mRf7j9EV7Mq5gz0v
 ktjIG0kzCuJG6GnLMrB7CyutJ31egWIDDf9HV7YCAxv4HYbh+wI3WFwmqIj/Lm/uENsA
 MK37qgr5n3FsS1JcI7JJ3YIOn5xQmSAq1aGz4vSMilDQcSjLddFDGVyS6hUEv1SxPPOI
 Qmaq7UFmYBV3tD1OMZ1GhY2jCNbzTDz1WTnQRpoDtPCo0it3EYIVych5ZBJmFPGUSLrr
 xMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731085889; x=1731690689;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sbZQNMHhnIDB6LlVrWgRtNHZEDlsEUv5saNArVcX6Ww=;
 b=ljOVkAFdttr1TbYmHAeNqoA22WWXZIJ0l0mftezFkmpN/a3U9mX1zQy0jwUQHwj1PV
 vFbrZnLDgU/RN2Xd3cC0KOQCzg4MRrUmrfnGzQI/06eA1hTrnm6jqvcfyjnZtYcEdGPo
 Eh8ghh+AW1u+bAQR7f3G4lXS+5xSneqQlMveVy/qrYhm42yrzldn6PBGkXbNbYjfPLVZ
 RyS2RZ2tq45bbCsr4ciHOn4TMvNRXObA144M0IIGsQ9O+If8Y5OQrMMd885Xi0fQXhZA
 djD/6a3lWARFOwvk8o4O6wRqGrCAcHuwjYBOZIM9ivGzYm3QEnBXSMQcGuRv0KXu2+Ei
 tL4w==
X-Gm-Message-State: AOJu0Yz9rdwbY/MW3NW4eLd9707gmdPdOang9o/xPelrbIcO+CTjWLsx
 GPVPEKqaytDSSQIpiocK5D5V9wATqfk5V2wfhup9BU0RtRsND3Vr
X-Google-Smtp-Source: AGHT+IGFbp0sHbQZd11U8+WwenFkCpy6wg1vmNsP61MUgFATPEkF5h7IluGfoZGyBt4EiXPIDEnnwg==
X-Received: by 2002:a17:903:2344:b0:20b:5aff:dd50 with SMTP id
 d9443c01a7336-2118354c06fmr41686595ad.31.1731085888979; 
 Fri, 08 Nov 2024 09:11:28 -0800 (PST)
Received: from Emma ([2401:4900:1c94:8072:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e580dcsm32877555ad.190.2024.11.08.09.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 09:11:28 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Fri, 08 Nov 2024 17:11:25 +0000
Subject: [PATCH v2] drm:sprd: Correct left shift operator evaluating
 constant expression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-coverity1511468wrongoperator-v2-1-72bc73d8691f@gmail.com>
X-B4-Tracking: v=1; b=H4sIADxGLmcC/42NQQ6CMBBFr0JmbU2nFDSuvIdhgcMAkwglLakS0
 rtbOYHL9/P/+zsE9sIBbsUOnqMEcXMGcyqAxnYeWEmXGYw2FlFXilzMi3XDCtHW17d38+AW9u3
 qvDIaS/2kzhqrISsWz718Dv2jyTxKyLXteIv4S/8UR1SodE2XCksquaf7MLXyOpOboEkpfQHCz
 lPayAAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731085885; l=1718;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=3G6UuML+DndvasPONfiQQ4xb46RlhGddyxDqRIE9TKU=;
 b=Kby/pcYTxftsv3VbDajY2CBoB00Y5NWKrGexQkX2nxR8YjhQO5Ij8h+/H9mDAO4jGppDNjo1s
 GFoMvSsoPfUByMjhWOT2LyQ4Smez6ncwvOBQjujE7Fq2NE7NHLLJ3iZ
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
X-Mailman-Approved-At: Fri, 08 Nov 2024 18:54:06 +0000
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

The left shift operation followed by a mask with 0xf will
always result in 0. To correctly evaluate the expression for
the bitwise OR operation, use a right shift instead.

Reported by Coverity Scan CID: 1511468

Fixes: 1c66496b1391 ("drm/sprd: add Unisoc's drm mipi dsi&dphy driver")

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Coverity Scan Message:
CID 1511468: (#1 of 1): Wrong operator used (CONSTANT_EXPRESSION_RESULT)
operator_confusion: (pll->kint << 4) & 15 is always 0 regardless of the 
values of its operands. This occurs as the bitwise second operand of "|"
---
Changes in v2:
- Added the fixes tag
- Link to v1: https://lore.kernel.org/r/20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com
---
 drivers/gpu/drm/sprd/megacores_pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
index 3091dfdc11e3..43c10a5fc441 100644
--- a/drivers/gpu/drm/sprd/megacores_pll.c
+++ b/drivers/gpu/drm/sprd/megacores_pll.c
@@ -94,7 +94,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
 	reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
 	reg_val[4] = pll->kint >> 12;
 	reg_val[5] = pll->kint >> 4;
-	reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
+	reg_val[6] = pll->out_sel | ((pll->kint >> 4) & 0xf);
 	reg_val[7] = 1 << 4;
 	reg_val[8] = pll->det_delay;
 

---
base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
change-id: 20241105-coverity1511468wrongoperator-20130bcd4240

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>

