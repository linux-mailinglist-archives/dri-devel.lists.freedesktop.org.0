Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E758C18C5E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE3210E715;
	Wed, 29 Oct 2025 07:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NzAaDKmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C74F10E716
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:49:27 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7a4c202a30aso974898b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761724167; x=1762328967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=;
 b=NzAaDKmTE9NyxvJtuV6gbcyawHp/VGJqXfKSHc0C8dR0Wy2FwbIbGa+7biUyjB/Tna
 GT0Wxn2YSZCC387F2PjjHG2ZINoXZCCVFovi46gmonkrD80+Mk0Y89BdqqkJHVvA4/OK
 Sh8eUOkLhHXGzIQ/spY6afsC5G70sAfDcAtBnEPem0oGVuqAtpwdf59M3VUXCuzcU6Su
 2TmFXHzlgvA1ZI3eC4MlkNOsRdJkNdAVGCyp0oePVVxFg4n6pFBOzEgML9H8c+mPk3W2
 W14Br+v3VQ9cIPXVeJfZDomlhbXW0T7zem20koWSOSyd1iByK2S+Se4EkuRLfQFzQlKu
 1qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761724167; x=1762328967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=;
 b=KAG/uRAKWV18YXXYA5LY7m/b1ZEtzTB2KTCheQeAJgpSa0KyAXUIRMgTO+m49od/h5
 OR3i3mFOaU6oGwz8r9eiHm8PwGe5UJ4rjf6JMlECRfwFvqQaRYMmp9ZZTLRDCkracakU
 arrn1DGe+I2j4mvYmDli7EdpNhr+eqHIZC/aSSsUhhJOWDcs5vsfmIH3m/TynGBZgF2Q
 qhR5kVc/4pWM6hq3SiNDTmu4LZixzCw+QlSh0jwaFdf6R5QplOirvXCh1GRfx/QCMSke
 YYHiT/oHFEGcPEFmxTfYiJymiHBuLNyp6y/hjvRl2ZbwFSR1R6744uLmdLRB1A0hXPGq
 0TNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXywvFlDMB7J0SYvDLOI6lRuJ8F+sjJXmkPFepK3gluprH2EzUBwzmuuNsIF10aYi2hbIXlcJg/3y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzzxf+AKU/pVvi0iW5AMp70W1oCU4XQAsSgigaqWOTmaY3JLjq
 bg1p0mRleTBw1h05wXXrsVmNFwrWUq662QhfPx5vwyX78jg4UN+1A5JT
X-Gm-Gg: ASbGnctTaQa+PL0ijri3Sj8turogxPcsN/Ha1v2FWSQyx+m4i/z3vIJ8CRDiccpSszI
 i0U6FAjLBWkFsW2gOEdxp5sJTiQLnuJX8zs7Te5uTaZH0V5Rdz+RqXWS1y6KTID8A5qfwIHd5C/
 KlA8C1gnktaAOzjsFMfMbR1S2q1rjX3IoWmyDXWThBab6AhikJYkbEmN3J5nKD722AqgA9h/BMM
 q/9lmVmWejfUo3+wjM/EJ3hy61jqnJu+viEwzLyO8So+hp2mm34+BXnxC/HMAwV7tzCSQyICYqV
 hsr4JgsBBjYes59j3uN2eegqivIugWrHPWosPKUwwz1+5z5yZMRmBy7LFjv89g2qACB8sfnRHLa
 TlUztYbSIQHCqA/GYBuiMZFGJwcnxbrZ7hY3b8p31Fo4z5DICtWDNnBXzb21Hr172OC7/SpLIAP
 p3OywIfQNHbWxMGIoUdl3YSA==
X-Google-Smtp-Source: AGHT+IEjGFYHvTA0394tCrKBxDkPiihw2m2Mpe1BSWvzEwpLa5iv/ijoEfCshocB13qZhqbfk34Zvg==
X-Received: by 2002:a05:6a00:4907:b0:7a4:f552:b524 with SMTP id
 d2e1a72fcca58-7a4f552b7d3mr1920900b3a.28.1761724166997; 
 Wed, 29 Oct 2025 00:49:26 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7a41404dddcsm14151864b3a.38.2025.10.29.00.49.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 00:49:26 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/sun4i: Fix device node reference leak in
 sun4i_tcon_of_get_id_from_port
Date: Wed, 29 Oct 2025 15:49:10 +0800
Message-Id: <20251029074911.19265-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Fix a device node reference leak where the remote endpoint node obtained
by of_graph_get_remote_endpoint() was not being properly released.

Add of_node_put() calls after of_property_read_u32() to fix this.

Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine with remote endpoint ID")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..9214769a2857 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -970,6 +970,7 @@ static int sun4i_tcon_of_get_id_from_port(struct device_node *port)
 			continue;
 
 		ret = of_property_read_u32(remote, "reg", &reg);
+		of_node_put(remote);
 		if (ret)
 			continue;
 
-- 
2.39.5 (Apple Git-154)

