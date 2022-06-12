Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0B548109
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1C910E4F6;
	Mon, 13 Jun 2022 08:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A248C10E957
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 14:49:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 25so4223521edw.8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rSYb7WFjE8zoNskNTn4KK0LTbD3WJCu9gXFXTJhr6NA=;
 b=DpKtqRz965ab2i6y6lqT1h829jS37b9OM/X/HXYgxukSHjmHIso7zrHx2DNMvrGrbM
 VXYrVXtBo7mNpOLdw3oONOrdh3if/xAl00j+2USQGua7DTIBh0weFfBbNQ6Xkqi7I30d
 Sfc/jNM4SrtaeuXWdPhYm/ZoscHgexojfwbCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rSYb7WFjE8zoNskNTn4KK0LTbD3WJCu9gXFXTJhr6NA=;
 b=302T5BKmB6UVPz8t4lUZe0QV3GXdLH48miU6VfbJeT7XszAew8kkCJmwLxHLm5BbQM
 N9OivPvfW+P3DtNI3mFWbQ4HlxwePPxXuQpIYHstIJrpSMO4Ijxcfe41e3BbwvAGw5hU
 T8EI4iGO5BHqVPo+yiY83i5Isne+kQ+0C8jccB5Tgi3pqNbDyLNO70i1PgTdeTjWCjtk
 DHY87KfOdYoHNQIf7RwiC0v+PyEj60wiJGs6SwBtITdsWmMJJUC+IoEcp7yoY2akha2B
 DINH1jZHBFCJybG5k0dHPocnLhuf/woiqlSUbYmp0/FRgb6HP2lKC/INu6X7bj4yoR8G
 47fQ==
X-Gm-Message-State: AOAM532Y5wJVr6IpZ6V3isCrSx77KLosX2K82NdCaShtKAxGQWTWvBXh
 5xYbgOs6WglhVXPlAl02p/k71vaDKC8nGgb4
X-Google-Smtp-Source: ABdhPJz6VW1bBC6PVZCZNV8EQxR11CGCL5uV9+5wD8r+5bBipMpMJseYJtMpdQiGB8ZncgAbn2qkYQ==
X-Received: by 2002:a05:6402:50d2:b0:431:53c8:2356 with SMTP id
 h18-20020a05640250d200b0043153c82356mr41780544edb.300.1655045354020; 
 Sun, 12 Jun 2022 07:49:14 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a0564020c9400b004316f94ec4esm3257076edb.66.2022.06.12.07.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 07:49:13 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Archit Taneja <architt@codeaurora.org>
Subject: [PATCH RESEND 0/2] drm: bridge: adv7511: two fixes for CEC
Date: Sun, 12 Jun 2022 16:48:52 +0200
Message-Id: <20220612144854.2223873-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Jun 2022 08:00:14 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Previously sent back in March, see here:

https://lore.kernel.org/dri-devel/20220319145939.978087-1-alvin@pqrs.dk/

No changes besides rebasing on today's drm-misc-fixes.

Alvin Šipraga (2):
  drm: bridge: adv7511: fix CEC power down control register offset
  drm: bridge: adv7511: unregister cec i2c device after cec adapter

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 5 +----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 4 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 ++---
 3 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.36.1

