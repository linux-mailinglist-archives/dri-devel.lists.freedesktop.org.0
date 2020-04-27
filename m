Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E161B99E2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B166E11D;
	Mon, 27 Apr 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF9C6E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:13 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f11so12000049ljp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALkfhn3QaNrniNePVGIjgtDOKGkOGwVOHVa32KEOksM=;
 b=t+8b7WNBct1FDvleiNrbZ4p1S7WPMzxxlY/yghR0Pt8rNy2nZKYF6r03bQFRWTuRnI
 SmsHI//TtmmtdjQwqIDsOTKhswsHh5M7B43zLGDSJfengmwdsbHYJf8SQC6HZoeHKv/+
 0pjXLTvTpldpIPnu53u8v79Aixtvb64sTMEF9F+dDg3lc++nZwVx/k93EWY2ivxXoJAZ
 3Tu5hwJwp9vDU2qJbR7fjHn2caci3kZIKtxTygBFJ6cjldubO9OUdf5lzdb8jhkpnW5/
 LSlBb6AtFKiQiHSNbF0EJCElbYhRVY3q5C+VL+++wKIbUTg96tzW3hMWOTyO+OXuJNvb
 FBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ALkfhn3QaNrniNePVGIjgtDOKGkOGwVOHVa32KEOksM=;
 b=nBbI//YRWONZi4Exar6xol64cHZGaOTvj/uOMrV4vulTRPeaeFvkWnTh9WVCD4/eTY
 mCwMyGYincrrpqMAaBuonyxIH2nA9EqQbXyYx+pYLUT5ZX+qCbYSvFmoNEaeZPh/o3sB
 NVlEp+iUr0gutUGSzeCoCmgAg+gEwOAtZqTdUKWDytl3tCes6QcOiL+n5/S+wbjn7Ebt
 0zLZt7b/cWAs8H7V25XA01JFpssRAEsK46OEToLKILlHNk+AWY3QZnfZjtWto4ma1uS+
 2yLVuS5iLbXtxoXVZXLsm87TLalOXinH6NVJ8n8kyYYx8vAhxp2v9CkCpIq7ATA/MMqo
 6zTw==
X-Gm-Message-State: AGi0PuboMKCJhD3tqk+2bG2XmbItdpCdRoKusvEGIJbqyFnN/yza8WPV
 ZznIfGb2OeQEibASqvGJ5K5mLYom
X-Google-Smtp-Source: APiQypJ0hbH2WmhCkeZX11BVg7+7yMl66mUbCyzIK55wvEioyePz5+DiUZc6ndCkrvtGpX+R4YKadw==
X-Received: by 2002:a2e:7610:: with SMTP id r16mr13946768ljc.156.1587975551930; 
 Mon, 27 Apr 2020 01:19:11 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:11 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 09/21] drm/bridge: tc358767: make connector creation
 optional
Date: Mon, 27 Apr 2020 10:18:38 +0200
Message-Id: <20200427081850.17512-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display drivers are in the new model expected to create
the connector using drm_bridge_connector_init().
Allow users of this bridge driver to support the new
model by introducing support for optional connector creation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 42a153bcde64..991e7d67b692 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1420,8 +1420,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
+		return 0;
 	}
 
 	/* Create DP/eDP connector */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
