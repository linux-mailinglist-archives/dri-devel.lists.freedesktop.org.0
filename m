Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73597969B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 14:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B544B10E14D;
	Sun, 15 Sep 2024 12:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kGt1mAJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557610E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 12:39:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-374b5f27cf2so2404490f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726403993; x=1727008793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zAJvtt6cCaAPu3t5jkNa8gI7ECPeAAidmTEnPEphaJs=;
 b=kGt1mAJhklg1a468IjvXspRd8uzOVmlESO4hteNILYrgPl5sskJ9ehbT0lx79hKjIS
 P/ZpmAQk7seVpVjB5mNFd9sWE6nKD9Lan+7s3qmJe1rRlBUByOP1ufrIKfwldNwXqqz/
 z7DiuBFGtyTGzObJ8BoLOH3kFENNk9xnfOPlUec3XV2bDmRqsdudDxLwfjct6ark2stA
 BwaTqibJS/6zYY1zxJwEGUQqE/pu1BtzfkO4apQ3vNFoVBaSY1kX6yGgeASvt3R4Hx3X
 n0/kL+VN0IhESgQfIuhTVOXoHnDP0lokCF30CHlLl7J0T30rTTC4VudEawL4KAYLOxfh
 oWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726403993; x=1727008793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zAJvtt6cCaAPu3t5jkNa8gI7ECPeAAidmTEnPEphaJs=;
 b=PfqzxO//LpKrcNwHO3hePb5AVQYRFKiPAEthUInQgqhyE2TWTbILqB6eanuEYcRZxp
 IBikW8t/GBjh/7X7BOOoRmUWnMDE9XQpR8N4sk2BS9sqZP73BFtZmzqV1/yxoDLwysnY
 Zk62KFgDaLvlRy7jm8e38w8BMm+CBfEIUonqC2UNbxGu5yHVaPS7lInfTHzELFFgR64P
 Gh2ldQLO3vYcuGKs/NspuDtlGqkg4lpWNZ35MNNvh+MwS69aHWGbQVCv3piZJQ1elp8J
 jZ4u4WJQX7FybnKjQCIWhpK3YJdfs/3W6VOc6cBZ4/xnLd0xGGuMwSzE/ez89/DqIBk1
 8q7g==
X-Gm-Message-State: AOJu0YzWijTUkQSEj6zEQc4C3669PdCd14BjctJzYgjQQb1NqIqqMUOI
 iI5LKR7MdjRa1rv5jZPhkbmtx8VEw6OCLcuxUWTFkQrUPWHQxC07
X-Google-Smtp-Source: AGHT+IHBPPBKefp8NRK/dgswYdOSXCV8qCsyXvN01NXfuxQbDklw/gSHxJdtyH6/9QHf15El0OwTqA==
X-Received: by 2002:a5d:5e0b:0:b0:378:e8cd:71fa with SMTP id
 ffacd0b85a97d-378e8cd72fbmr2497222f8f.39.1726403993391; 
 Sun, 15 Sep 2024 05:39:53 -0700 (PDT)
Received: from void.void ([141.226.169.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e72e4a46sm4599867f8f.14.2024.09.15.05.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 05:39:53 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/rockchip: Fix a typo
Date: Sun, 15 Sep 2024 15:39:43 +0300
Message-Id: <20240915123943.105118-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.h b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
index 441248b7a79e..c7780ae3272a 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
@@ -77,7 +77,7 @@
 #define SOURCE_PIF_PKT_ALLOC_WR_EN	0x30830
 #define SOURCE_PIF_SW_RESET		0x30834
 
-/* bellow registers need access by mailbox */
+/* below registers need access by mailbox */
 /* source car addr */
 #define SOURCE_HDTX_CAR			0x0900
 #define SOURCE_DPTX_CAR			0x0904
-- 
2.39.5

