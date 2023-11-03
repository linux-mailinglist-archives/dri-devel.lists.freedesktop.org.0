Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237957E03A0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 14:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBF910E9DF;
	Fri,  3 Nov 2023 13:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD010E9DD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 13:14:27 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A21001B3C;
 Fri,  3 Nov 2023 14:14:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699017248;
 bh=/YMvSFyCzcoztqCvEfSKeF9x2o+k/zCSCqmAdPdzVO4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hCYpRxxV8PjHjoFcF+9rqbCN4DIlOabVHnkAPiROD0z9nLynmkbOGrruqtrAhPjv/
 Z22umNd1TvTs/tpJakQQqru8FERq4FVTmL7Dixy26UIHvK0FNIome8u1QFRu+aDjcL
 xq3e/yUkh701BbcQrT4ZVDfq8HWkozWcrJdFbPew=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 03 Nov 2023 15:14:06 +0200
Subject: [PATCH v2 4/4] drm/bridge: tc358767: Fix return value on error
 case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231103-uninit-fixes-v2-4-c22b2444f5f5@ideasonboard.com>
References: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
In-Reply-To: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Parshuram Thombare <pthombar@cadence.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/YMvSFyCzcoztqCvEfSKeF9x2o+k/zCSCqmAdPdzVO4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlRPIsY9zBPyFLRFuuV2diqQVeV3190D+UyXLZ6
 fMQe8myRu2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUTyLAAKCRD6PaqMvJYe
 9beOEACkjxvj+96UcRM4CbLrb2joKUEkDxw0OQqhopsLE0298zI6t3N/YlL6ppKwaI1Eul01OTm
 oKxiwaLaJeq4VWtPnvbhifeRc8R+QsiIAiusWN3sSv4oaerK/58fscS1mnLuu38Gwr/3jv31fqS
 kk8vqGAVO2H7oNvCndE+tSq2JPBxkwdLeE9QF8/kCXw2DM7PnXb4xmYr4HhgH0vfDfUDQ+2Ct8Q
 Xjqg8mDkNKA5DcgYDWw0mpxMAH34z2P6qgEoW/fDTUGM5M4Dcbkp+LmDIEkNEZ/W0C+45wQ51hh
 nd2bvwUUSDatEQjw9Z6Z1VGanDGdfI8NzdGxd8iCCWyRPm6vIBKZhS59onpsjaLUrA4d43x94jO
 4qxOybMkArBWa4IQfu6So6IFs5s8ksGR7w4nrLbllTwIBLSWyIyjvWmLdMCrTeBkYP54iNyhnLZ
 pTwTl96uR8cAh1Ip/ancXyqNP25L3BnUxJRgdjdpWqcv28Oi4pRFk0oYUihUlbCDEV/fv5L0XU3
 PP0bgZF5V+b0cH07xOejOnGMMcHT0Vf/dmatMReuyNliIKrZeBD60ZrYIEHQCPRJv4WjVvhH94P
 qr+nARHVKkQtc3hCraX0RjnuS6WLjY/affhn9X5hu57k7zqGjxgscc+XJFnZgoyazJ7ZBkvrIdm
 DEwdDpXKnSEj7Mg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the hpd_pin is invalid, the driver returns 'ret'. But 'ret' contains
0, instead of an error value.

Return -EINVAL instead.

Fixes: f25ee5017e4f ("drm/bridge: tc358767: add IRQ and HPD support")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ef2e373606ba..615cc8f950d7 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2273,7 +2273,7 @@ static int tc_probe(struct i2c_client *client)
 	} else {
 		if (tc->hpd_pin < 0 || tc->hpd_pin > 1) {
 			dev_err(dev, "failed to parse HPD number\n");
-			return ret;
+			return -EINVAL;
 		}
 	}
 

-- 
2.34.1

