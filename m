Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286766B81B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 08:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2A110E296;
	Mon, 16 Jan 2023 07:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDC610E1D1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:22:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gz9-20020a17090b0ec900b002290bda1b07so5856080pjb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 23:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tZlwyHU0q6JC27YvA9BdhJPum2JD/n8URNFA6KT24h8=;
 b=kMmQfKb+r0zYkzjchG3CDWSWiBDiHYXVp0qckSFSQ3tkW1Zdr/t0ip0Ka1dbJpkV86
 uOsS29nMm4DhliSASwTKPhH6Yi1alB2pWZpgKE041O4xGqgN6r9EVElvOFjvAWCrEp1n
 OYc7pkUNobj334k8wQCWQVbXkzt4e+6zP05dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZlwyHU0q6JC27YvA9BdhJPum2JD/n8URNFA6KT24h8=;
 b=5wOFNr3u4kWD3QT6VeLqvi4rf6DO6LUH7FxO31+5ZH3o/RYOszrDEixbbp+n6GJ1JZ
 0CjKkSgb1x4xPeTD9OJsGLCj8hJv9UGcS9T04khHH9JffTLiVU4XWqQodsPIrs1jYoFH
 xZ7hWuLZar7HoAY3ltZmxr01eii0poc1mi/wM123STsGQ4hHmU9h5ECgaQBHZC1VpxEg
 3OLGcaPE1Es9SUArVuon+qhGypzQBYVo4k9k4/gPeRBVua7IiTiBUhp4BESe9Y4APUPn
 w3de28ycRB+bqd+GdBXlLUJVzQT6S+Kkk0z7LMGn2BLmfG0ULnaKW7n+GFQaAhNj64tm
 Lb0Q==
X-Gm-Message-State: AFqh2kpIX3wBhfmXmsJgqo8bJB7A+cqb1eLnkG6WBSJodQ0Ni6aUx/wa
 8LBbsS23rLeZBcSZRD8VpuECYA==
X-Google-Smtp-Source: AMrXdXv6cJL4sQfDq1pWG9nkD07x02Vr+YMkorxnY8N600H0+OQXSdHux62G0+tx1XA6TMncyyr/wg==
X-Received: by 2002:a17:902:834c:b0:194:4ad0:88d6 with SMTP id
 z12-20020a170902834c00b001944ad088d6mr19415846pln.29.1673853760054; 
 Sun, 15 Jan 2023 23:22:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1d4f:b969:9e53:5eb0])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1709026acc00b00189d4c666c8sm3328206plt.153.2023.01.15.23.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:22:39 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: Drop device lock before
 drm_helper_hpd_irq_event()
Date: Mon, 16 Jan 2023 15:22:34 +0800
Message-Id: <20230116072234.3970768-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: linux-kernel@vger.kernel.org, Xin Ji <xji@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device lock is used to serialize the low level power sequencing
operations. Since drm_helper_hpd_irq_event() could end up calling
.atomic_enable, which also calls power sequencing functions through
runtime PM, this results in a real deadlock. This was observed on an
MT8192-based Chromebook's external display (with appropriate patches [1]
and DT changes applied).

Move the drm_helper_hpd_irq_event() call outside of the lock range. The
lock only needs to be held so that the device status can be read back.
This is the bare minimum change to avoid the deadlock. The lock could
be dropped completely and have pm_runtime_get_if_in_use() increase the
reference count, but this is not the same as pm_runtime_suspended().
This also causes the internal display of the same device to not
function correctly. Both the internal and external display of said
device each use one anx7625 bridge.

[1] https://lore.kernel.org/dri-devel/20230112042104.4107253-1-treapking@chromium.org/

Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
FWIW I'm aware that this driver could be refactored a lot better.
The work function might be simplified and merged into the threaded
interrupt handler. The .detect op should be reading the HPD state
from the hardware, not some cached state.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7e1fb93a6ce4..bf1770b79bba 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1597,18 +1597,17 @@ static void anx7625_work_func(struct work_struct *work)
 
 	mutex_lock(&ctx->lock);
 
-	if (pm_runtime_suspended(&ctx->client->dev))
-		goto unlock;
+	if (pm_runtime_suspended(&ctx->client->dev)) {
+		mutex_unlock(&ctx->lock);
+		return;
+	}
 
 	event = anx7625_hpd_change_detect(ctx);
-	if (event < 0)
-		goto unlock;
+
+	mutex_unlock(&ctx->lock);
 
 	if (ctx->bridge_attached)
 		drm_helper_hpd_irq_event(ctx->bridge.dev);
-
-unlock:
-	mutex_unlock(&ctx->lock);
 }
 
 static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
-- 
2.39.0.314.g84b9a713c41-goog

