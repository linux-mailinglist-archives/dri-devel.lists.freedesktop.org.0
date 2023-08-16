Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142DC77E03D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 13:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D266710E34A;
	Wed, 16 Aug 2023 11:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFF510E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 11:25:49 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29871D92;
 Wed, 16 Aug 2023 13:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692185075;
 bh=3BEyrzp4IUiLGe9w3xtacn7Yy6nvFBbT4HOk9yd56NA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PwyClJyGiTaBplHC3RSEylTjB+qWvimMlOWACblDqNfEWk1Joqc7n17EtCH5vj5WA
 uF/awlU+fQ1pVaZrPyJy03XgPZNMUyfiZlI5Hnf33maF7LM49qYS/ZKTXxujHM7i7B
 h98qiem4VwpLm5JUEGj+hhGykvYB3fapNWWhwudg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 16 Aug 2023 14:25:05 +0300
Subject: [PATCH v2 02/12] drm/bridge: tc358768: Fix use of uninitialized
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230816-tc358768-v2-2-242b9d5f703a@ideasonboard.com>
References: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
In-Reply-To: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3BEyrzp4IUiLGe9w3xtacn7Yy6nvFBbT4HOk9yd56NA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk3LI0/EHCNZvMIu3aVBbp1Z7MswxNqg10WZwwQ
 FOTnz2j426JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNyyNAAKCRD6PaqMvJYe
 9So7D/0YzkazixpuRfx6fd/gk7EGJztOFzgzCcSqp3qnbeg4nYfTnHY9GOgLWumkR6aqGbbM9+n
 13LWMb4iJt8rQZ5wz+kH3HdvN6GuxbiB5sjvtzlcir+QMcZd8yfyIXq1jnv9F+X2O3V4WA754Z8
 OE8sDEhOUhUW0lhu++q8sB4YmiZmov+lXlXCdSvwSo5nfSHx8WUY09hYuGnCP76QXKBz0NUJSCi
 SrVVrAO4GUPcn1KhXXd96/iSHXmbiCFel5SYGiqu9eSvXSLpVnuCCwEyBW2WJfLPhWGQBVMYGUx
 klN2QcoSwnVPMXGwjYGyyY9aDSOkFMT+3k0OhuNEeWfRXsdgLG9eNqrYOvPFs2bZI3oHLLOxVA2
 zPHsORvsUUtntFuei9ifb48Eb24aXq3Q8KDKWGSE/tOud6CP+QxeXyRClTJ5cejo0fE/LkgIBPA
 e2TC2XQ2R5bkIO5fx2vqF+qyHtnCWPWCaxVjdSUEl+RYjJjUSBtnM9A7XEKUYBXKl2z7CUZd7jm
 VvAc17epEkb6m5Lb1b5+mgK73DYsBuJKPd3jTaex3Tr4+93IQUGWHUewZjU9mHFYGl6mscAsaOU
 OlA0GrzvCoxOeMxf9y3P1tXNpnaVwO0hX5HVY/8NH6a+yxrGqbMDGV39TNxn5t8m2G4uCiBpgKg
 rerq44LQJOBdJuw==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports:

drivers/gpu/drm/bridge/tc358768.c:223 tc358768_update_bits() error: uninitialized symbol 'orig'.

Fix this by bailing out from tc358768_update_bits() if the
tc358768_read() produces an error.

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
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

