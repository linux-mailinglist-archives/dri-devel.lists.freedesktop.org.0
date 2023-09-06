Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D027935A1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A7A10E571;
	Wed,  6 Sep 2023 06:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140210E565
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:29 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FBEAAF2;
 Wed,  6 Sep 2023 08:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983001;
 bh=qS07ZSZddPWPdiZH9fcpYilEFQ7vrO8rgSwkUV6v1C4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BRHm+MzZM8dWxp6Kt9hY+Wal+sIydjNzQNiOBW7kbZj0axTIPQyL8VnDx2jDlTdKE
 +/55cDkb4BuM/0085HdPw7K1dRGghtLrLfQT+Bnx35olozoiFRvSf26reiHIm/rozW
 FlYYMWxbZEsI1xNhJQPPapU27ZqU3hH1Jsh6+C10=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:49 +0300
Subject: [PATCH v4 02/12] drm/bridge: tc358768: Fix use of uninitialized
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-2-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=qS07ZSZddPWPdiZH9fcpYilEFQ7vrO8rgSwkUV6v1C4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFoTfjmUZzbLnnjzjkFwA1cnTmgbRcNHOwM6
 Uu3TcmQkAyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghaAAKCRD6PaqMvJYe
 9T1SD/9YrG8U5MqiLWkIIq9qTEm1e7ERrvN+fj2RT0jmPHZ3lkkEXiN4OkkQC3AaS06iav8ZlKk
 GIfrAbTnQHxxMIxCmwUfy4mhrgXxKGEADI4Q8UXvQFVMyJkZSsBXPmMo2mQNXYU+rBKzJB0h5it
 t64fqXlCYPA5KCamfmxVzPmRGVbkKIBdS7c0cejGrsygK59H3B4toUDTZGHQRbHXavdaZnNk0Jk
 /hoTSrxn1HAQ/q+3rvvL2dJVlZtkmPycSjPRpHJhLfBOqNAnWM5d8Vdr7ZYLGQ6XJeR6BpK3wYt
 7IFrAfXYduTM+BXzbjAgUrydOFW3oNIEp9p1luz9si6TlldEWWSP9BYK/GYgxbZVHf3YHj0+7zV
 gOjwUYBitNNlWtgVLMLGG3jZi47DO7FB6Elt6PvK7QWon60gS0lVvqo342ErFptg5PW+NLQoDCj
 u3DNqbI5UnHMRWMAvTUaczINGq6kqJ3SOkPNf6BqaxyRibWHCjGWoPNk8z/XjkfCPjQAs5pdXUw
 A2GENeX+WkBxdKl0OkIgtpO7159bFYDPoTPJY7xY48ALs0A4u/g3FAAbCVJ+TauCke/ffvHp4+6
 dgXBGvn06Ab+o/TzmesHcK1VvnPxXarLMVNo6JLFw1J6EfrTTTWfplH9PyRMysGju2bS0ODMcNB
 Fy/hee+vUbChLZg==
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports:

drivers/gpu/drm/bridge/tc358768.c:223 tc358768_update_bits() error: uninitialized symbol 'orig'.

Fix this by bailing out from tc358768_update_bits() if the
tc358768_read() produces an error.

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 819a4b6ec2a0..bc97a837955b 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -216,6 +216,10 @@ static void tc358768_update_bits(struct tc358768_priv *priv, u32 reg, u32 mask,
 	u32 tmp, orig;
 
 	tc358768_read(priv, reg, &orig);
+
+	if (priv->error)
+		return;
+
 	tmp = orig & ~mask;
 	tmp |= val & mask;
 	if (tmp != orig)

-- 
2.34.1

