Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290DEB20010
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF00310E154;
	Mon, 11 Aug 2025 07:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X3JL/M+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75A410E0C1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 11:12:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so18416415e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754737938; x=1755342738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BNqr2noYtj5/iKHD8yrAFo9MADN3PbbGdwwaImthjec=;
 b=X3JL/M+elpavTNkUf0+1oPmCNu5XQ1+e+BWuPG9nD/ItkyaG3a20HFfj6l78O1vjce
 B3RidPHt7eSc/Lf3DxdpOxXG8BuOWfe7r7kxKJeMxpKZSb2bUUBntk2McvPnArDWNhHT
 M7uyYYOuvuPszWU4Al9fXjsSt5XwSVSW/QOwU2eGVEHE/QCubJF4B59zsFKIftWQqfat
 3rB/jVh+e/z2Tav8rjvpdCG3sNCj34brHa4R3fAMgtcRl5IxOmthykkeV9ROL1L+F//S
 cRqxEgDmKkmAvsG9+hslOzPa84XW9fHneRri5WVJ6Tw0VOTWeaITeWd/zwFXC63WfUvv
 rDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754737938; x=1755342738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNqr2noYtj5/iKHD8yrAFo9MADN3PbbGdwwaImthjec=;
 b=MByTTGYqcthEa+LIYN3kY77LqPAJbSY3s7zlFuleNmUT1YYRod1hVHx1sSVNFewnLL
 NmnZ/b2OA6qygNmb1wktbA8Uc4qxoQqGmwwyhuybugyki3uxcGvxshPnTQkh6AhLqstt
 +mEPSWxlNTEOBO/3PhMyqkHrkUrIKKuXZf2XUlO36UYzId3yXaQeM0Fv14wXRTVEJXlu
 VUmqubuuJ5nUPj+s+0QBQVVlFyuJ0ez9FWccxiFelz07f752cdaYzWqpCX/3AJY095f6
 YVNtwvQ2l9Djw9/6vtZHDuzxA+wIh9N5OhgSevkr0GxUamXBfD6Lm3GO0Vl6dWJbyHt9
 bFyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2aP2FnNiYZpQv0cqQ0poJlED7/AvE+UCBcSuImMN6IZr8UrRBqzjDUxA/I7oi7QXVpJDndHaCaGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxCsjDW8a0x0YMxjyh+fEYrgXESO2tcjAQVxC2qw50acxvh3Kc
 9H8nTc58LBHf3AEeYV5dPMdxjQvI4y1G5X8I8X9RBtK0MmPsrmqTNBHM
X-Gm-Gg: ASbGncvmLw8+BOvHnzAt9nrlhdstzKezKJpvC4svMui4+7tzMMtlhYIWjYu0Wxy1Ks6
 7eUqg4V1t1w9EgGDe9im2H85iyJRr1DngOWQhMnqNbuD68iUga+FT1cb9t/VEUZEuHgHq6I4X3W
 Y3tehA0ipuN7vMYXCdzd0znaDYAZ5WbXckKDmq1+qjFM4gZOJIjMMM7wWlwvAuL3l73WK+H9QQ5
 7OcR8s+urpDLhMf6MAC48aAsgRQZ2H8Bkj8skV1K6/Mjrm+5xOoiT7hcab8q1sR8lphSoEw/ZfT
 eyzlmbY+v+mec2zZ3DNujtFWse4J11azOWjDvpVjYEOP3SJVrSDT4SLwPtLelwWI+J4MQ+qBxA9
 ghfXm+riKWb2DR8s881izADmuCrq2nPd6sPYShjs=
X-Google-Smtp-Source: AGHT+IGmd1/DibPEbs3Ynld1GabCFw3/aExk+KV6VBw1GEk4585Fs9anirjuYo29usAS7EZvYyVlOw==
X-Received: by 2002:a05:600c:45cc:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-459f4f2e6d7mr49925915e9.1.1754737937597; 
 Sat, 09 Aug 2025 04:12:17 -0700 (PDT)
Received: from burak-MiniBook-X.. ([2a00:8a60:e00e:10f7:a1c7:d533:5228:9a11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc2647f6sm122340435e9.2.2025.08.09.04.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 04:12:17 -0700 (PDT)
From: Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>
Subject: [PATCH v2] drm: panel-orientation-quirks: Add Chuwi MiniBook X quirk
Date: Sat,  9 Aug 2025 13:12:00 +0200
Message-ID: <20250809111200.10086-1-iburaky.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

v2:
- Changed subject prefix to drm: panel-orientation-quirks

The Chuwi MiniBook X (CWI558) uses a tablet screen which is oriented
incorrectly by default. This adds a DMI quirk to rotate the panel into
the correct orientation.

Signed-off-by: Ibrahim Burak Yorulmaz <iburaky.dev@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c554ad8f246b..c85f63c42bbe 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -282,6 +282,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Chuwi MiniBook X (CWI558) */
+		.matches = {
+		  DMI_MATCH(DMI_SYS_VENDOR, "CHUWI"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MiniBook X"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Dynabook K50 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
-- 
2.43.0

