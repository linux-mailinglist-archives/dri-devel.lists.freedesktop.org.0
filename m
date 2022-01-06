Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95769486A3D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 20:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851C610E6F0;
	Thu,  6 Jan 2022 19:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921310E60A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 19:00:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o3so6631559wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 11:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GApfuZwSa5gLOrIFUv10Q+jwtcI8XokWaaN8Migozt0=;
 b=dMDoD0wS6wkdT73t6n4lqSz7LXjMF7Q7BT7h93ZCspVO/J4lDUWaVkxIcFoC6OgoAi
 LigYS4Jq37nDgH+w6B2NbBsSIW/LRqSOgz3qzzuUNNFblYlo+kRARb4jMBBU6VsLoH7M
 Xrx0oX0t/8P4UoP8nvMb4Zk9NY0cTouVYAGe3BmCcHf2ybJ3mEjE7jYsIQSmsCGlz4b2
 8/RMbC9xojPbfPWnXb8ILLkhXAJcFy6Z2WmlrJRIlADOrDfEbjZvYaR/DKU+x3DdU6xO
 vmMPZiNxd82uy+v/u5C3BINmzXCV4HBEwmv5mIDEmzIajBbjxdo+2xXDkD84XKvr6f0T
 pBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GApfuZwSa5gLOrIFUv10Q+jwtcI8XokWaaN8Migozt0=;
 b=wVQ2cRfRLndk4x2QAWcERDi5wrXRvrjPbpPFbffZ+JCU5Or92zlBCoGYnEYA4/2nof
 YK+ytgx1LSELAuCEl9XD9C+zrjflH7jRkx/7A0jys4e/TSKP9CZ35IY5d6auU4c5HNpn
 LwfW1wNie1Dz72IgOm9EgYE4ASz3bzbqqLXEbJniJYbcTj/f7qUuYvg9JP7UmocJANnS
 Jr0z4/4Ec3TpoHYTbpCHlJoaXZxo3rDCrOFMcxT+1bTLFVxaPiudGOT2z72y/5e9W4xD
 f3ISelCn3XfDJGxKNQ1l3kh3od2K20njfW+GLU378NpdoybEGKqnAi/9CpDYmUVLrdRk
 ZeOQ==
X-Gm-Message-State: AOAM5333OuF/RUxC8JWUCDqaSL/S7pB0mlamm1/H6s3XSRh+0OL4yyfV
 MMY7z6LPDWnMK3ePHLUdx5Q=
X-Google-Smtp-Source: ABdhPJzRBPgEFjde8rkHAuo7tRsgCjXw/CujtSuspjwJoOEksMbs2rdDHQQmiMDdOjSh4GHnkx1B0Q==
X-Received: by 2002:a5d:4a8e:: with SMTP id o14mr50283333wrq.441.1641495634341; 
 Thu, 06 Jan 2022 11:00:34 -0800 (PST)
Received: from localhost.localdomain (37.212.broadband9.iol.cz.
 [90.176.212.37])
 by smtp.gmail.com with ESMTPSA id n41sm6835638wms.32.2022.01.06.11.00.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:00:33 -0800 (PST)
From: Jiri Vanek <jirivanek1@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] drm/bridge/tc358775: Fix for dual-link LVDS
Date: Thu,  6 Jan 2022 20:00:27 +0100
Message-Id: <20220106190027.1498-1-jirivanek1@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211110220050.2854-1-jirivanek1@gmail.com>
References: <20211110220050.2854-1-jirivanek1@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Jiri Vanek <jirivanek1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed wrong register shift for single/dual link LVDS output.

Tested-by: Jiri Vanek <jirivanek1@gmail.com>
Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>

---
v1:
* Initial version

v2:
* Tested-by tag added

---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 2272adcc5b4a..1d6ec1baeff2 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
 }
 
 #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
-#define TC358775_LVCFG_LVDLINK__SHIFT                        0
+#define TC358775_LVCFG_LVDLINK__SHIFT                        1
 static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
 {
 	return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
-- 
2.30.2

