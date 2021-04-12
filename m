Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88535C1AE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772DE6E3FE;
	Mon, 12 Apr 2021 09:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8620E6E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h4so3157849wrt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=cUCTfH9cQ20lN0ASEY1CcKyAskerlXs7EVSJaa6aV9/KVocXxKC9+GyDoWrNIo/+Z6
 xinJzqXyxeW3D3CAEl7kmAQIl0+SFCe0ibs9Urg8AyOHMFU+E8L1wfOvAu319Atd7xv2
 H9wet+wscvVhrd40D2HQX2U9l3P9Y1QnEieLZdZdvGOdjEJd6vAC3u3OcC2NH1yqaFpu
 wPoBNr6F3CGOwT4rkkJQ3k3I7iKBP38HOBmpHCHl+NZpewk2S8wEyrQg4B/6I86x/qmv
 VRRXKBFZsQaPCgjwZfMM6FezSVukE4fYRjWwFFUWkBDxNqUk/JG6wNERV2ufIjHxFpfj
 wFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=I8wLq2JrOxEqOfn58ZkDiKboSqmuO4oMl6K5OC+EV5Oh2YRiHXqUEP8p1aB//mUrEV
 WAQjKkWdJZKAmwjgP+CmhUllB+60R3EzmljfULEUPYjhf8Z0wQZxn3DE9jVL/KKiypvL
 wKKI0mssCyuQ35QAwfuDxqHtXwwmpW8TCUgWtYfHSOu0vfUr9cF09n3hZMf+SuPs7fRF
 OpYtsRdUia2WRTMhk7e1oe70bON58KgV3WAaEc+JzqrfVkVfW6kvbEhPPk3LXhwjDsjF
 4YT2zSXio+Kg31YBnAIVFIm6Nm4bvVcQappvDU6Qf83SuYA+5MvRfZIsDIcuAAAGk9IQ
 I+GQ==
X-Gm-Message-State: AOAM530RXkKh7FUUTjkh0TwfshhQVo6nytgjLChTGlWAs8XbEp4kyVWm
 5bUC5g6qh34XmUdpkOVDQ/kN7w==
X-Google-Smtp-Source: ABdhPJz96Ixh0rydLkGNtoMbTLcMl1V8ZHJ6OxRZb3g3eu/v9lSIxMYmfdeZLJ4ofiQecixqlveQKA==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr32037266wrz.62.1618220377138; 
 Mon, 12 Apr 2021 02:39:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v2 3/5] gpu/drm: mediatek: hdmi: add check for CEA modes only
Date: Mon, 12 Apr 2021 11:39:26 +0200
Message-Id: <20210412093928.3321194-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs like the MT8167 are not validated and supported for HDMI modes
out of HDMI CEA modes, so add a configuration boolean to filter out
non-CEA modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index dea46d66e712..0539262e69d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -148,6 +148,7 @@ struct hdmi_audio_param {
 
 struct mtk_hdmi_conf {
 	bool tz_disabled;
+	bool cea_modes_only;
 };
 
 struct mtk_hdmi {
@@ -1222,6 +1223,9 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_BAD;
 	}
 
+	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+		return MODE_BAD;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
