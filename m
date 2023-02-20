Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601469D62C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 23:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5974C10E7D4;
	Mon, 20 Feb 2023 22:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0010E7D0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 22:10:44 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id y12so2681216qvt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=THHRayynm5AbgmOQpvB3lJW0friOEzmgv0B/wGzZtaA=;
 b=cd4XXa3fNnrg4LJTnbDxcbv3CN5vQu9dFW7K/yevG1ESO+5qoiYifACic1FvzLTahl
 70UcW1Q8xLIUxahrwD9L377EfRLCR0pWCU2uAdgU42SY+ar3FPPzQ82ksKDUsmgOfys/
 IbntLfDc5qgbr7YeEqCz4BOLKCAOqjoptTEp5cpYWumbWaSYLgUAlx3qC1irSU7kAso1
 lfUCy0ei8319yKCts5WXcg3IHl13OvAH87QidFj9QXgrri/5mSp9e7voGdC5tU+DfFhH
 tSSObiPjVWneoPSyWLHE1OZWO5Wz308RjFowk7hzjgqlzzHyYOXuinnidDaVeDhYL4t9
 dvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THHRayynm5AbgmOQpvB3lJW0friOEzmgv0B/wGzZtaA=;
 b=yFWfxEaeTwDhlWBgStQtUOpz4QjoPEJsyVocS4TZaerdwsJPYJDVcf7KX5uEAjureN
 US8MAxqpO1ofzn8j19bGBaiEmpXnHV/Z4WdsQiFVkejoFMqbMA99y7ByeCnJQubRBBwQ
 XnJBQ96kMxsQxpTVj0+7TxwtBaU6eyU8JiQoXfYqSaJmTkXw5o/fg7v86cdDBvGcUHa3
 Z4GAukZEfnKXJvyUiLJZpVWq3xDesanqVRGLJdrzD70cbaPHmJBs1IjiGQIKdWWmtLAx
 uXHh03rcZ1tOv54R+DWW6z4Ei7x43AHX8Ff9I8mjKrn5gOWkpMPBZdL7Rqh+ZJf5iNZY
 ewqg==
X-Gm-Message-State: AO0yUKU820mT/NfINAoF2Kh3qNOYmEOa5lC9WSH1ejz1MxezR49K1mSC
 jKDWTzUPcyIG+pSwKF+ATuVIbRWXpmDsSdzcPpw=
X-Google-Smtp-Source: AK7set9k8VGbxQBwp63BLeFM6sBGZ9Dgy6JIHVTflubD0lj+FqQd0anGtxp8/ti9qlstxkTSB7LYcw==
X-Received: by 2002:a05:6214:400c:b0:570:ee5c:2953 with SMTP id
 kd12-20020a056214400c00b00570ee5c2953mr5529273qvb.11.1676931043469; 
 Mon, 20 Feb 2023 14:10:43 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05620a024d00b006f9ddaaf01esm9766986qkn.102.2023.02.20.14.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 14:10:43 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Mon, 20 Feb 2023 17:10:34 -0500
Subject: [PATCH v3 2/3] drm/bridge: tfp410: Fix logic to configured polled HPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v3-2-a85d5f0f50f1@criticallink.com>
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=mvqilqhA2ozv8fVrZmSQf6YxF7B70T7NT6GdEuGjaz8=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj8+/gQc8xd6ZnX+LNtCrbMa8giQdgnGzf3ueFThk4
 LUUWk/CJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY/Pv4AAKCRDc1/0uCzbrqqiKEA
 CrUHS+hGQ+sFkAozQQYuVP4QYluZf5P9PCTtwe447h+TIRNyzmn2K5oc8gx5VNI4HAWreqeJoAsm8H
 A+4DbWgt+2ms6pIcgx4qiSrRWYxYjIT47n0HLdrwgZSGtlm94K8B72xhxZjf+3qD0b/xz73/6pgDtH
 IcfH+CZsGWuXNuxeDWK3S6YoqR5BUB3qrp78nJj/gajYET/ny5SfWja0R//ev6VCVP41cVL8az4LRi
 P58udsLnAufv/JcNxd24LfVhf6gaDbjYpI62vgzihCgRhL95hrWYW7KYRWkkRaS5BgcvIZiS9eyg6f
 8XXkijOqjKykbMnTCPVFm5eTzANa8CHekSHZFpx3mL/coXKb249QMED+ug9Osuwes3Gj8KDRqVKUwj
 b2MiTbIouWH/5GVDm8BWsqkj/x3LVbeB8pXiKbRkOMP+mlr9s8jNuc0OScUp3f/IRzAYuJbTd/xorf
 3ttPy7RS2QM2jYgZuZOzKh3dZ4fNqMo/GXY/T2n2sV6bEfxlYkIufxhoIradqG6nioT6Zn+9ebQ9AU
 9UitqfVXvj2toe0IHPVu/Qh4cS+icyCBhJuQG+3RMeDFPrUrR9MCzQylUfXPhGfzuGS68VzwoNLfuq
 VvV3a/oAwQ86bi+J3vTeE0BGC7m005ilVTDoeNjE0fBX6Ot/DF6nuhyQV7Ag==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Williamson <michael.williamson@criticallink.com>

The logic to configure polling (vs async/irq notification) of hot-plug
events was not correct.  If the connected bridge requires polling,
then inform the upstream bridge we also require polling.

Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index bb3f8d0ff207..41007d05d584 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -155,7 +155,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD)
 		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
 		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;

-- 
2.25.1

