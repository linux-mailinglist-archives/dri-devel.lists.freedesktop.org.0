Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712293444F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 23:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60FE10E158;
	Wed, 17 Jul 2024 21:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YVfC1SDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63F210E158
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 21:58:51 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1fc569440e1so1975515ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721253531; x=1721858331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FiSxCmxpPDKVe52INJHPWGzjKnAAp4bqiCfzE7BK3HE=;
 b=YVfC1SDqpiu10Gn/dTsRyBjtvKODOVHSQ34h/28XMzouFV29iFw/3EFZtKtrB2OOkP
 54156+h5C//eEz4zmxQCTwkrZWK4SKinvp0YhxRqwmCyJiH4W3yerRWxexWyyiOnNp5U
 3dU2EwGPM99QeDvWINA7qUXv07ZA+lmR36qBGMcbjudjCCxDGJVXPvKOHr01fW6b4jzE
 IspE5/jz1fs/l/SXSb+CVMELvQ6/hnNf4QrMEAu1rZrM32id2hMBlL0We4ckDECMh4su
 Yz6apjcvNUAbbiz/sJCRszwh5xFypm7Izz9+4bk+dRL1PrW3seNw3e9hnhNOGii5cduq
 odZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721253531; x=1721858331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FiSxCmxpPDKVe52INJHPWGzjKnAAp4bqiCfzE7BK3HE=;
 b=wu7wS70hTzoFxmRCMwZus9uSgYqI2/GeCrvwFRnujP/87ah1CtI1VDWvkB7go+MydJ
 eQVUCz/zhaS3wpDVHH4EQgzUzQ3Xzg/ZvAm3qSMsVH1NezxQlACSIO7bKZDRdQ6/eDNz
 y5TJbIQEIc9LF2E2cxLWXDLeMyQPbH15iBieOU51CDC14kFuJpmN8L7PRP9K4zv5Dqxg
 kjqoz7e/Crb2n2OuIn2zRPzn1qGYFDBBb7f1Cn+Ni1gcyEc5ZpvAsGSmcKTh0ZnnQo/4
 FI5E/s8zLTLrkMRghiB2uRRrAGmJgK41/ppc1j6X1R6zNp2xupgrrpdBDTvu6x4H8pGW
 Cfwg==
X-Gm-Message-State: AOJu0Yx7Hv6D7tyqwHd2O3fVj/4NCp9qlHPZ5HAmNFD++1VvwXMsr6aL
 KgIT7+Iw9ddSx/8wO0F6D9mVHIaDF46g18gVHwvJLxS4XlijsgPaFiF+Sg==
X-Google-Smtp-Source: AGHT+IFXDAvBMkEMStSH4nurfzh3TYRGe+QjxqF6ssIkAMTxdRiDG9y2G34vCgMvRl51AInSKSBemA==
X-Received: by 2002:a17:902:db07:b0:1f7:2293:1886 with SMTP id
 d9443c01a7336-1fc4e165dffmr28196225ad.12.1721253530525; 
 Wed, 17 Jul 2024 14:58:50 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc5aa6esm79662475ad.299.2024.07.17.14.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 14:58:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
Date: Wed, 17 Jul 2024 14:58:46 -0700
Message-ID: <20240717215847.5310-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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

From: Rob Clark <robdclark@chromium.org>

Just a guess on the panel timings, but they appear to work.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
find any datasheet so timings is just a guess.  But AFAICT everything
works fine.

 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 38e5178f55ac..411b7218af55 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1966,6 +1966,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
+	EDP_PANEL_ENTRY('S', 'D', 'C', 0x4189, &delay_100_500_e200, "ATNA45DC02-0"),
+
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	{ /* sentinal */ }
-- 
2.45.2

