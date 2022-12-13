Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F07464B7FE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 16:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1E210E0D3;
	Tue, 13 Dec 2022 15:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E6B10E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:03:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h10so15909894wrx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 07:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=QE8TrVlOPagyz/Xf+Vluj5c/1Shf2awMH865U/kgSzo=;
 b=C/D+1izcIet/7EVJRR+V7gM1hheYXcGc9fU6xJvq8OpEfUrdfISAJuzvGCaxG/3gVq
 rmDtB5WFhKizMShvkRA0INKdz9B3LZ9UUyId+2YnixryQO+JQigIkBMgP909XVsQrF05
 v9/xrdgYrXWGZ+CJrkxBe6qcsdWPcXEBaH09Ne847ng0/Qk4N1/30Vv7iqhiLNxnRaEO
 JJOxsDMPP9gtp7/s4OlxHa3v/stCiNDKeqgT9Pgue3fqX8EmFDdB/pOVzFoLfMjcX7uh
 9gG3G/IBY8j7qr0kg8xUy92CEMJAoR93vi8oA1+kBwGsZmfP6UgZQN9m19LHCcSXS2gm
 a82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QE8TrVlOPagyz/Xf+Vluj5c/1Shf2awMH865U/kgSzo=;
 b=bahktT2pEAy+pl3YfDKVhm14LG9ft+cT91OT2d8g+j05UW9dv52douksq2FCOYfB6M
 JPhAKQI/M2zm/ouyVtbP0jFtlCqCsWYA7fK9xkPXqBev2jSUSFSCVtDaLEEH7QLLW0Zc
 wVkRlG9HLL4K/33cCzBqNGAVyaRwOO0t8455gztb3yO4p2xOUNkp2NdWR5vJp7CTkvRL
 84xE9ykLOwJCbTU1nc4+/Gxk0E4QLHVJ299WfHZCeKcrxKao2FrTEuz1SqtaQtqJpbbW
 aI5un/4TbgMYBUy0ztRA0v7y6+h1hd7U2frke56yZSOQk/LPA1dAX9U1Hxzewm6SB+BA
 S9MQ==
X-Gm-Message-State: ANoB5pmuHBOjVu8IadbEIwrULR8g8V7JeNmYwWqc/8PcpXOQE3mU9GbG
 FPN7lP4uAlmk8HTwo7GwBiXDcg==
X-Google-Smtp-Source: AA0mqf4EcXdCATRa0h1bfkO4Qau6rGAOKEKsaonqVOfzHUcWixwCeWZLyX1BCyZnzBymrk8MHvKjlw==
X-Received: by 2002:adf:ee88:0:b0:24a:9b90:b621 with SMTP id
 b8-20020adfee88000000b0024a9b90b621mr11428556wro.30.1670943795967; 
 Tue, 13 Dec 2022 07:03:15 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a4:b85b:2e8b:7dd0:999e])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b00225307f43fbsm15953wro.44.2022.12.13.07.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 07:03:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH v1] drm/bridge: lt9611: Fix PLL being unable to lock
Date: Tue, 13 Dec 2022 16:03:04 +0100
Message-Id: <20221213150304.4189760-1-robert.foss@linaro.org>
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

This fixes PLL being unable to lock, and is derived from an equivalent
downstream commit.

Available LT9611 documentation does not list this register, neither does
LT9611UXC (which is a different chip).

This commit has been confirmed to fix HDMI output on DragonBoard 845c.

Suggested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index ffcdc8dba3798..3ce4e495aee50 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -259,6 +259,7 @@ static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode
 		{ 0x8126, 0x55 },
 		{ 0x8127, 0x66 },
 		{ 0x8128, 0x88 },
+		{ 0x812a, 0x20 },
 	};
 
 	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
-- 
2.34.1

