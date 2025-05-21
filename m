Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46079ABF024
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 11:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5296C10E6F8;
	Wed, 21 May 2025 09:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="xk/h56i+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D2210E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 09:37:56 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so6560704b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1747820273; x=1748425073; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LO1gHHlVF6gGZvRY9viyv0hbKtAsLTQwKpaodCCIfU8=;
 b=xk/h56i+H1y4KQlc5oydxoEXBrdavR5IKQfrWh0sI/d9BYyvOUVz1fz7LphL9SHr3f
 YA4twahXVbTjuIubEgRaFQF16rI+0lCCgmHvQD6s4XgssMBMlQPAJSg4s8cwiY+gT1hY
 PQ80TJ3M+lPAdMVGqK+8V14LpnNc9M27X0P5gPNuOYflnCpbuLRZLHmkt2dldNFf4Bvg
 ZIu7WCnX4i4oHCSZFRRb+PwKXR3PMfZG4Gkr1CMzLuxO3MtvwcXsbRd+873NQBDlkRfy
 2e19TzZsYEHx2OJS+rzGAueZSrMWKrurJqX+y50jKQIkZ1eKrXPj8HQKX/w3qvC3um8M
 S3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747820273; x=1748425073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LO1gHHlVF6gGZvRY9viyv0hbKtAsLTQwKpaodCCIfU8=;
 b=NaldVUHSyEzYz7WuZbnarOkcW7kgHLf5/bDhrXtQXnhPHKPEZhg4k1cJS79VMDrUNH
 BM0LVqMj5mfTBk+N+CmXiZecvb1F9X3kGd0Xb2oU82/bE2AuKNFwj+pTMQIquOOVDUH8
 ZIhXlpgKf8WhSnsVczmTPw7Q+mWWdKWgfgOgIHdLRNS1335YwOqjz40TsX5s5QclUnd0
 sj5JhmDTvRZspOOxN0WhOj/jQW7FpjeAFjqobbkIpL21vmyKXsDQCB/7MXm22xIgDdvG
 iJhlsxFJXJIJ5vRQSQ0V43YH9aq3PCk3g19NaD8f2WN1xvdJ/D5VSAMNgcJWN3xYyEze
 rhnA==
X-Gm-Message-State: AOJu0YxJsZTgQTVal89COhRjrwh0fXQiO24dIcacUOgfGEGsEbitb2tD
 Awwz2N3hqwKWaWUeP9KskVT0Eh/kX+aZ0QpouUt78cmwf8r7blYqmdW5pvQrDf0qPoY=
X-Gm-Gg: ASbGncvoNk1goErjOe0Pu9mdMPUoUXqlhru3mWyBn8rn8BfSe7/C8vA2GLcB3wJHx1H
 nLqK/Y67sanPl+Bd+8hk/yqdV48Q2tgiIoJOVXf/yGGW1gZLptHGMBm2IYuee0hj4n581b8R6rH
 fEK2ExjLTuAhBOvboLIdv/5N5cwY4CusiuEpRGxLBAq3f01bH766KnQp1+Wb2fgbkaCz1SVIMK2
 7GwTWqbspZgLxP1YE+AF1HveNYRKRGX6nbLins6f3eU5CS3u5uxTiNrJLMLauXVW+F7giZ9iTKx
 NTfv3NWMIBWomkr2zZiIasZ2P8J/2AolF2xqE7Q/GVUJFTYgmNNTKkX5MCyLTCBp8fyo5KER0y4
 18w+fdseMqPP1/Y3c879o1f17y4tU17Gc5CY+/1W2036C
X-Google-Smtp-Source: AGHT+IGj9/GHt1Rkhv1de4jt6AZ2GtCQzoZhDnZ4wR++SUUYWHHoHoOcBO/UQQls4RGHP/cLUW/uhg==
X-Received: by 2002:a05:6a00:ab87:b0:73d:fefb:325 with SMTP id
 d2e1a72fcca58-742a9787708mr27488901b3a.5.1747820272879; 
 Wed, 21 May 2025 02:37:52 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970c6b1sm9575827b3a.59.2025.05.21.02.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 02:37:52 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add KDC KD116N3730A05
Date: Wed, 21 May 2025 17:37:43 +0800
Message-Id: <20250521093743.1057466-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the KDC KD116N3730A05, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 2c 83 20 12 00 00 00 00
30 22 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 4b 44 31 31 36 4e 33 37 33 30 41 30 35 00 e2

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9adbe0f11421..5426648e7116 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2007,6 +2007,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x1220, &delay_200_500_e50, "KD116N3730A05"),
 
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0000, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x048d, &delay_200_500_e200_d200, "Unknown"),
-- 
2.34.1

