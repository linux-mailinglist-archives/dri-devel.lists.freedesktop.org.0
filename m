Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7611C88F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9261D6ECB4;
	Thu, 12 Dec 2019 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248BF89415
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 15:49:14 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id b5so7601731ybq.23
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+84MmMAoxZMowKg1LejiSRn+LGavX3XL0RXX6IMOW+w=;
 b=m2NiP0CnGnotNR/yMx/w5OIeIfCUnZkQxMGnHlJQgBxOA/FXbl7y2EYygJSnUU7MrL
 kJ3L4rLG6BKMC6Kw7F601lW847yaNWWQzxCbN9s1MYJ/eu1LeC5BesWLk3yZ3tt2FePN
 92VLc8xSfXsMFhJ4ItMCqBRqc7K/K40iD+AjeKs7eASl25E05/A0xRwMtATFIE75BGE0
 P6839NDZrpb/tdJSU3vkmmUS+e7YjYoAGICMyToI9z5hc49ilIEE5SPTUDNcmV8niTEb
 HhHa8oIT6pJcepbPvKt2SuJctQ0v2091Cw9qWrvd7TEfd5roezf2Rd0FvxgpGZFv/pLU
 wWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+84MmMAoxZMowKg1LejiSRn+LGavX3XL0RXX6IMOW+w=;
 b=Kla/7GuF5hutb9514oyalQbFGMCxLhNYPdNqBu/uVJN5SNscOadUdaWRYG6TmuO9LL
 JY2avBqikoXCGg9ZUn8vcZxiFYKCzzM5MDU8Ab13cSQMg86mexsYZB0hGaqZ0BRtJXfD
 8NU7tl/nJUEs2/dest5U0frbGyIYRIKHLcq6MeqGkjNkDd8zWaIYOWf1I51lA4sYrC/P
 hZkIs8huAELJ9Fa7qZ56oFZwjwLZGAeNo9i70XV4slZqnAF6eKJZUeC3ht8HMlVJnCal
 PaCAUbrzzZAlLIcXoghkPW4JhxW3XUE9Pq9WnNZrDO3k0U5fyv6moL2Ycc79nG7kF/Yz
 5Mig==
X-Gm-Message-State: APjAAAUyHVRSCQyNXPSnjJ43t7FGALUdIPUArK7xGHga9EhvegyyDgR4
 l9cwsD4zhRGdhAjN3QYj1YvZI5HM+6LZ/vSa
X-Google-Smtp-Source: APXvYqzgag2uEK1TrKN/WHaL/XtHsyuWNO7uPzN29U6f0LWDaOKfxY1Ep76cMLNac+NAL6BSwAjUWiYDY6LG4QTQ
X-Received: by 2002:a0d:d247:: with SMTP id u68mr297158ywd.1.1576079353136;
 Wed, 11 Dec 2019 07:49:13 -0800 (PST)
Date: Wed, 11 Dec 2019 10:49:00 -0500
Message-Id: <20191211154901.176256-1-markyacoub@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH 1/2] Return from mtk_ovl_layer_config after mtk_ovl_layer_off
From: Mark Yacoub <markyacoub@google.com>
To: CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/mediatek: return if plane pending state is disabled.

If the plane pending state is disabled, call mtk_ovl_layer_off then
return.
This guarantees that that the state is valid for all operations when the
pending state is enabled.

Suggested-by: Sean Paul <seanpaul@chromium.org>
To: CK Hu <ck.hu@mediatek.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniele Castagna <dcastagna@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 4a55bb6e2213..526b595eeff9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int src_size = (pending->height << 16) | pending->width;
 	unsigned int con;
 
-	if (!pending->enable)
+	if (!pending->enable) {
 		mtk_ovl_layer_off(comp, idx);
+		return;
+	}
 
 	con = ovl_fmt_convert(ovl, fmt);
 	if (idx != 0)
@@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
 	writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
 
-	if (pending->enable)
-		mtk_ovl_layer_on(comp, idx);
+	mtk_ovl_layer_on(comp, idx);
 }
 
 static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
