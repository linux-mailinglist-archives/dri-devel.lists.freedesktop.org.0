Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44444CB8D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 23:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD8D89907;
	Wed, 10 Nov 2021 22:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE6589DBA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 22:01:31 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v11so16244153edc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 14:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=t+/UxYIfl5RatBgf88GxHq3c/1lj+QC9CslttZQE2n0=;
 b=XePFhcDjf3veMupWj7qjbE9wuUf3H4+tNwcrf0MbU0VUm57qTMNYVGECFwTky+mHLZ
 Nh5bqq+BSowfxER55HHjvsG5gdKkVOmCUJtgE7iBkc10TSxVr9RF5TtF3Dpk1akuzgNL
 XOga0xLUGS/aA2/3hnZ21RxEs6CG7K0RE/M8R3j5bPQaY3SfM+oba/IRUYBYS3/Xd+N8
 i9omVj/yUn4mc7E7Hibcg5N4JfUn8PEySd9J6qnbI/SbalQjg2L5dSGDvyI49dsmRzF/
 fKkUZkrAfXsqiefewSF0B+5bkWMuPhzZC6T/Koor2lE5g0NEapIR/vAfBD0+38+9Jrlh
 HZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t+/UxYIfl5RatBgf88GxHq3c/1lj+QC9CslttZQE2n0=;
 b=ZeEfYi/Cwv5rYbCcGfO59mmEK8kSfFh+iLKDRCXlJdt+hpm9OnODKcE3++UNRhTBGd
 atPUvNv+pGQjE+Wj0CCKjTEVfD21eiUhg5+5nKzT4LgNQjz+kPcq0iKTLSUJrY41e39p
 D3wP8CZecfofSqF323Ezf+K8oa3ouBmETWUNV8GVFv7mBXpBq3gQqx1Oa5CT3XZ4vv7k
 +lslLeqFgwuxVakalwbK/7Wo+GmiJyYwdZNdHsYSjLiezi7G4fcD9j7l4xyq2P9UOpMR
 hOXWdJsJNUofwUyGkbv52CiolzSaSr5IapE0Ks3uLJYJgJS3A4dZEfVQmsbZEXZ6BmHz
 efcQ==
X-Gm-Message-State: AOAM530IzMERDHUhaxoTlZ97a/5m+fkNNWafZ9glHAqKAaHvAcqrL3nD
 jGHnTF8BTc542Vjq/aOMrK0=
X-Google-Smtp-Source: ABdhPJxK6/yGLmroAFvSRxu6YnEA1gPQtfldNnHq8g+RxJwx1YotyOTZJszNtxJtlfSHtau5GzW3pg==
X-Received: by 2002:a05:6402:4255:: with SMTP id
 g21mr3129340edb.256.1636581689660; 
 Wed, 10 Nov 2021 14:01:29 -0800 (PST)
Received: from localhost.localdomain (37.212.broadband9.iol.cz.
 [90.176.212.37])
 by smtp.gmail.com with ESMTPSA id m9sm408476eje.102.2021.11.10.14.01.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Nov 2021 14:01:29 -0800 (PST)
From: Jiri Vanek <jirivanek1@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
Date: Wed, 10 Nov 2021 23:00:50 +0100
Message-Id: <20211110220050.2854-1-jirivanek1@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 10 Nov 2021 22:06:02 +0000
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed wrong register shift for single/dual link LVDS output.

Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
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

