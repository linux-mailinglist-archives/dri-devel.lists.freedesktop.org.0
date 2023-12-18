Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E1817A64
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9068410E10A;
	Mon, 18 Dec 2023 18:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A846010E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:58:10 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-20316647099so2469448fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702925890; x=1703530690;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6nTiiGacCNrmDCbMZV/7f2ztu88BMzgp6UsJ0N8RIdA=;
 b=ZufwvIeaFBWeEiDcuP79dhSGj5Xb/bu/eMkBOHh26L7dZ/tIcqVVi6qjbw4iMorqyc
 yRYQ1uImSxW/TrCzs5m18kjaOSCflgGZSV/9Pjepo3XHojUOv2aeoFJw8pTORGCnwCgV
 vlMl3+b8AcaBrOj7Q+7+ifY6sXHR4a1Ogz2aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925890; x=1703530690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6nTiiGacCNrmDCbMZV/7f2ztu88BMzgp6UsJ0N8RIdA=;
 b=lJ1vXYckXrwErrKENV/v9gg4meitEBP2usP1A5Au7UHJHFHWlHiMZoqiuqtgG+dZqN
 Z2DFMlufYN9XgDqImCf+IXfg4b9jELSpd0R8mtQReiEtsiYlmtvXht+hGSYpg59LEq0c
 xqvMrUJjoCftwPv7wQI+C4NxApGZXNgbnIIEx1M3kXb5jr4NGXe6ZB+HJ8BRrSz6oN/D
 42qbJ50EbaMtcszo4eAgpPVrFEtebXPrulhkg3sRvUsuWTkXkFZCUvoabCY9wzu+pcEB
 +CX4GqR1/b/OPqLWoF66nzyOEmjWdrSxrbBH2BX6lkiISRPmWpa3qPSgqH1/NfkPed/R
 D1zg==
X-Gm-Message-State: AOJu0Yxw34YOHjPzPzF9JuORBs8KVg7B7Kb2nnIQmL3z/+981nkOGlbe
 aHhQku6TMXMre6W1nevF7DUHqXG2UQU6eujxGld4DD58
X-Google-Smtp-Source: AGHT+IHg9ABCbWkA7VoPZPr1sTq1sDouZ3GIy6+HwcJFobGQJk3C/ii80KtyGCsLQvm7zzyFgvOW+g==
X-Received: by 2002:a05:6a20:c488:b0:190:53f9:43ff with SMTP id
 eo8-20020a056a20c48800b0019053f943ffmr7065209pzb.45.1702919117178; 
 Mon, 18 Dec 2023 09:05:17 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:5163:2c6f:e99d:7dd9])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa7814f000000b006cdd00f91fdsm12188049pfn.185.2023.12.18.09.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 09:05:16 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ps8640: Fix size mismatch warning w/ len
Date: Mon, 18 Dec 2023 09:04:54 -0800
Message-ID: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 26195af57798 ("drm/bridge: ps8640: Drop the ability of
ps8640 to fetch the EDID"), I got an error compiling:

  error: comparison of distinct pointer types
  ('typeof (len) *' (aka 'unsigned int *') and
   'typeof (msg->size) *' (aka 'unsigned long *'))
  [-Werror,-Wcompare-distinct-pointer-types]

Fix it by declaring the `len` as size_t.

Fixes: 26195af57798 ("drm/bridge: ps8640: Drop the ability of ps8640 to fetch the EDID")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Sorry for sending this hot on the heels of the other patch, but for
some reason that other patch compiled fine for me until I picked it
back to my downstream tree. I'll see if I can track down why. In any
case, as soon as I see a Reviewed-by tag I'll land this.

 drivers/gpu/drm/bridge/parade-ps8640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index d264b80d909d..541e4f5afc4c 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -210,7 +210,7 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 	struct ps8640 *ps_bridge = aux_to_ps8640(aux);
 	struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
 	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
-	unsigned int len = msg->size;
+	size_t len = msg->size;
 	unsigned int data;
 	unsigned int base;
 	int ret;
-- 
2.43.0.472.g3155946c3a-goog

