Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D665462C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 19:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81E10E0FE;
	Thu, 22 Dec 2022 18:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2365E10E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:52:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id l26so514107wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=10Rxo28g/q7ySMjAqH0GsQxy+RL27BYiLoiJUeMFYq8=;
 b=J2GbpH9urbw3FqvpZIl2gmUvt5UhMFSpNvRCo2h6SN06oQfEyrQQS0endJ4xsddBdB
 +//dPWd3KrnIRaKnfnOKOSvE4w5TXPmbwQy48EPqRh+d/xWfTQe1GvICQTwr31IybdJJ
 E/6MtBhsJ2o3tYxxNMKaLFQ9ZhtenbBj7KbvpucHUNmm2pFQ8RSbtmzxwtpbpnJlzkRr
 oOfGyfS2jbuRM9P59nenvJgdIAyB44zs2mH6bcDVwXkIgpLZ/N2pav0MGRhl8clUSaoe
 elVr+ZeXVsfM8Twh711AvGTxK06zyDvcuVC3lx0wRrgZs4AVNc/vDU82PH6mMwM4Kvxu
 dRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10Rxo28g/q7ySMjAqH0GsQxy+RL27BYiLoiJUeMFYq8=;
 b=kpI2dZRp79PMF8mXu8U1bf2OJCX4xMe+4V16DgHa8HmpHVzoQSlLk/zVHQC6vBTtPj
 hB85bqP9Ae8dj7alHUGbLV2u1LiMalSEFuGK897eM8fFzcPFG+m3ao1fiiVftL0M1tpL
 Kow+Nx8qa0QurtPBHAs80S+hDtrFalcJAg1LIXD0o8qIOYLbpZFGnh6sND9MM5QEhFHj
 ugpr7f/8jCT7cE3l92wvx6xp7qNDZlaEJKWT/Gyj61vOCALyg4DK5258PA5l3311p41p
 obcVUf0RZzEURXKVsVXw++enHIyzAksHO6pNEHlpBadiTlN3fJQ/PqiTBn/Jj0jHotLS
 NoLg==
X-Gm-Message-State: AFqh2koP0boHKeoPoDtvYLgGMBHObdb1G32EfvJYtX7i5sanytwgiBpV
 vAG4HuX1jwFrpC5E8QyHGfchZA==
X-Google-Smtp-Source: AMrXdXuNHW5bJgMOCgyUTH0ci74VOtyuQhlhZt2+SeIhO1/JEiH40ko9FhiEwJ5WeY3sIkqFM6ymuA==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id
 n20-20020a05600c501400b003d3446ab46amr5391158wmr.38.1671735165540; 
 Thu, 22 Dec 2022 10:52:45 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa.
 [217.169.15.194]) by smtp.googlemail.com with ESMTPSA id
 hg24-20020a05600c539800b003cf71b1f66csm1829823wmb.0.2022.12.22.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 10:52:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: panel: Set pre_enable_prev_first from
 drmm_panel_bridge_add
Date: Thu, 22 Dec 2022 18:52:13 +0000
Message-Id: <20221222185213.3773336-1-dave.stevenson@raspberrypi.com>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
added code to copy prepare_prev_first from drm_panel to pre_enable_prev_first
in drm_bridge when called through devm_panel_bridge_add, but
missed drmm_panel_bridge_add.

Add the same code to drmm_panel_bridge_add.

Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/bridge/panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 03c3274dc3d9..1708098fba6d 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -404,6 +404,8 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
+	bridge->pre_enable_prev_first = panel->prepare_prev_first;
+
 	return bridge;
 }
 EXPORT_SYMBOL(drmm_panel_bridge_add);
-- 
2.34.1

