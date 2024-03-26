Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1388BEAA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AC410E36C;
	Tue, 26 Mar 2024 10:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TrLG3q4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8FA10E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:02:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4148f497a2fso2277445e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711447341; x=1712052141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rH2uk+dUlYoWneISw+2iSY12AXnUflXf4kTlEdX1VEg=;
 b=TrLG3q4VHiJKjk51NEgsGtIbqSFAsLTWhYr/gVqdMABUeXg2JDlYZkaUcIQlEce83E
 eYENLW1lT27Q3UEIis8V++xGvPcIAZCnWoYhpeoXzH+gqI74U2XITC8XE9uPxjXbC4xw
 zT7Db9Brmezp3O1Czc116butLR2W8G1wkXLLrTwm25iUyqvEL/wmh6RFJnD3pRpzbvEq
 AiX9QJIcpbEuiioOD4PrQ0pcJ7yA79M/335++By9LswvyZx4SFBvYEYQGzWllHbeFtaT
 x4rVSjTfWuXngzn3ozmq+7an6a+BDzNMnjPk8+l+9SpBb0T4ihlvd4FtGp/gI3M1g8jI
 nCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711447341; x=1712052141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rH2uk+dUlYoWneISw+2iSY12AXnUflXf4kTlEdX1VEg=;
 b=hkcOeZorRF1RY8nGHFkbqD+fmVdZSoV482k3j42RKnrCtXgfGAsUmEP7JvQ4xF2xof
 yoH0CM0Fvw+64Ftuqkb/3oRCFUOrMa/1LnkIetJwHTi5xRw/ZN6YRMhGIelSRWjihgUH
 MuflxgY0ISMJ6mxva8Yc3hXQtcn8BciCwZKbZbuzbK08T0X+rX7fHXVfSuPG88WZOTWq
 AgGl+Dz9Qz8EBZ5DZBooARMIyK2t8WTd62eeO9QdT2FN5Y2HMb6B3ZEv4WofAon7fjUI
 vPQdsCDYX8fuwneO6kbpRs0dbHQy5laVoCjJ6drSOGhzfhvLk20jHZ4Ambp5bjYXjhCv
 x2pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVreDubs3FTExmzcoWpvdiq73FQs5g+8LarACSsKl0g0ZPHGHfwZ3q9PHOEDZy3ScTlRXVcX+LLxaIA8zHKn3csXVbygn6YV6H5oVD6SzHt
X-Gm-Message-State: AOJu0YxMsV32FeDWbhe9ngr/8OF3QEZa7RVDfAJCbg4EtKruwoORT4S6
 hh1eWrgQbvn6eGOIDlPpp0ooJbhZpJsuIEN/17Qgl503YRtPLBZG
X-Google-Smtp-Source: AGHT+IEDcklL7s7XSdqdxsiiNhhq5CFW4ZA+MM5Ng7WIZ+LPtv63W2DfF8RCMPyeUgecR29BiFct+g==
X-Received: by 2002:a05:600c:5120:b0:414:65cb:7e99 with SMTP id
 o32-20020a05600c512000b0041465cb7e99mr1564905wms.26.1711447341002; 
 Tue, 26 Mar 2024 03:02:21 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0041487f70d9fsm7531688wmo.21.2024.03.26.03.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 03:02:20 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/panthor: Fix spelling mistake "readyness" ->
 "readiness"
Date: Tue, 26 Mar 2024 10:02:19 +0000
Message-Id: <20240326100219.43989-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a drm_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 6dbbc4cfbe7e..0f7c962440d3 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -333,7 +333,7 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 						 val, (mask32 & val) == mask32,
 						 100, timeout_us);
 		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readyness",
+			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
 				blk_name, mask);
 			return ret;
 		}
-- 
2.39.2

