Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52366D68BE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFBF10E705;
	Tue,  4 Apr 2023 16:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B510E705
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 16:27:19 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id cn12so28738134qtb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1680625638;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JhwrIjGdHvbP7iRYz+GF4I68rmmYmSv00IVMxjU1xN8=;
 b=ZtCNBHqKs8v2GxHBkp3iZsN1/Aj4WowcQaeTkud3ULyCdCXRN3419nTF4lYEw7JCVm
 lINN0tC7Q3eUE2If0tAq2MSpjL3+GB+oggPts/3PIm9kmHzBQEU9c7kqq3FhS+KRW7Pj
 g2zyaBRKwGVb22cEq8jh1O0D4XyxUuP42v+0HT5FeQ5Gi/67Rx5mNT0rEesrbN1OoTtw
 4LWx2qQ8AJ+0p7cbYKm+9+AhMpibKe3nsn4MBkTLdnmS88PGkjgLw7rSDd51LadmyAW6
 8J+ZXzFFxtlb4xt8nqoqw1+dV6pjLDjwGxbjGFJCDQLBjEOH+X3KeHS+rJbfRog0UUSX
 si+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680625638;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhwrIjGdHvbP7iRYz+GF4I68rmmYmSv00IVMxjU1xN8=;
 b=sMOoNM4kImfa/5ffdY27JKXbND2vlaB1Yzmj/XnwLhBYtVTSneNIe9eOB9EReCuHih
 B2aENsOa3rNG2cJSbmfhC4bKua7Jns9koKOe0nDjyIEh5KktrXgZHfw+DdYLCML7Roci
 H/eAc9MKA4nTOQHK+XcHpRbECZuhEHx5Mwo0//jCdAk5fHWYEhZVBHr5Wuj6N3QA5iqs
 dyOV7vEWyVRlfw3dYZB5pIFyGK7vRjg2+CyIhchsDMApLir/xXPdGLpqtiO4EBoR1FIj
 Bt56XZXdwAyRlQlu0Y3hcMqR4YS1u5DGbA0JhkbaEoBr8MCIa/gSezai/nL0tz7zSXFD
 kRCg==
X-Gm-Message-State: AAQBX9eb6gLO6Ym48+5tIi0E6YBvz0xIDapAirJ3gmw8+TSE3B+0Fg4J
 MGtjvNknfcc6H9h56ir6mFoRLQ==
X-Google-Smtp-Source: AKy350ZaeXvGyJjLwmDXCGIwtx/7uoo3VUxwZm26dBp0mZ93D84vaD58lxabDqOzDSs7RSKv/rrIXg==
X-Received: by 2002:ac8:57c3:0:b0:3e3:86d0:4ef8 with SMTP id
 w3-20020ac857c3000000b003e386d04ef8mr37879614qta.28.1680625638589; 
 Tue, 04 Apr 2023 09:27:18 -0700 (PDT)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 m124-20020a375882000000b0073b8745fd39sm3699594qkb.110.2023.04.04.09.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:27:12 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Tue, 04 Apr 2023 12:26:49 -0400
Subject: [PATCH v4 2/3] drm/bridge: tfp410: Fix logic to configured polled HPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v4-2-f983bcef2df8@criticallink.com>
References: <20230125-tfp410_i2c-v4-0-f983bcef2df8@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v4-0-f983bcef2df8@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=thTBke4adSbjQB+Az7ku6gTKJI14U3xmvadZhGFOYMw=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBkLE/YIu6HYilZxFWf+fAQXGrPc3NZJOHfU8IajFHX
 +WG0356JAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCZCxP2AAKCRDc1/0uCzbrqtx8D/
 9eYQrGQHYfDwF38dKrsTbYYGWQkO9RbvLizz2zK6sPjERuElcIyHb1tc87UgrdMz6oVwFvAf9gPSol
 mWEUPGff0hIoNlzeZtDvh+c33wxgQXejInX2eBcPryiU6jOsiQBbutNh9EKRBGa4vDDrxq/UfUiItn
 dHTY0jqxh+gSfWV7bWg0wMankS65kJtnm/wcNit00TMdbrYzjhmNnV9aLsZs2cXRG8InRC7w3db/Hc
 pwi7YQ2/AHR6YKnqvhOM7KTqWb9v2orkiFN6q9zZhaeEwWWgl0tBOR/OfGbdPfkE2uxbVdrAvWyc5Q
 aqd02xIaWKKqxIF2DJx4akESDUex5zzNb0w3wL5+PPenTYcbaHs1tMfvsO7Cgt+Bm5GDstY3BYtT+j
 ij8oaqxmJkK8++3tHCexC/uayQi7sExzN/5P7shgKGbIoi23AkiKjNw7tZ65lA6Vrh+nSNPMMbWVZb
 34datHiI6xJ+spdB0tCALG/SD1s5ImkUXEozuXbh3d2pdZAo/0SOXfr4rYZxP0b1pWG1mUScY+5vcU
 Jm8dWe7KOOxB5DHu0GyzWskm69pu+ZPwUNDdCiYpgU2tBvTtvu4UIy0dwGcOenxLksEnFvjyET1yNV
 tfsUEG65wcUY0k1RqNwXJ7yJd6lOEoS9OBb14yEkjxebzUiOGI0Hgo275XOA==
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

Fixes: 5cafa0f1853b ("drm/bridge: tfp410: Replace manual connector handling with bridge")

Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

