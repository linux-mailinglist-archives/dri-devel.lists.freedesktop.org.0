Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB24AECBE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7498710E372;
	Wed,  9 Feb 2022 08:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A5A10E1C0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 05:54:13 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso2581110pjd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 21:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TyQEiK/jIvd5OoMVeisTCeZTNY4WZ5OI9la4y5vybB4=;
 b=kIKnzrW3esyMqAnXxLx+P3P572h0h2/39Gk52zsDSvXPDw6nanCos/JLS4Go0v0iVZ
 YnzYFZDxWu0lZztIqBlXNL8orJ5l8yUEwAGcFm07wVNelFB1eE2PAO55vJ3GDEo9GnzI
 LMiXTlzeD8MuzzcDSMELZ/3VcsRSGz3o/8zdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TyQEiK/jIvd5OoMVeisTCeZTNY4WZ5OI9la4y5vybB4=;
 b=8MV4mtj7xkfNzpHpCz8twhNHnsE2O1wa8HnIYq5FNbBP/82KMI51y1eIjjWDWtC4YD
 caIaO8UKj8hZqBfR6ugrFRZv/7RSUPlPtG57NZEoz6UtPoXUtXpLr9Q8TgSoan8ALoHe
 fvpSwwxubvlUfiimtLIip+LBV07n9o/92tiXoijQdOq8prQ1myNZ4d3ppRzhWKGM3rAo
 QXMVnoiuHvi7NfazhB8pUBBkDlK67YejKn4gVz3izbTiD3Uz8/8d23BYyrs+0Jwr+Epo
 qmzFBewCkpVASN2Na5fNA7J6hH3izH8K0ZMD2T6IzBVZ8WdsdsKLyutTFGnfDtmo8uQp
 mVqQ==
X-Gm-Message-State: AOAM531k9DwKLr6li4Ctqu/jlFcqLYUVbSE3On6EqTS9TWeX70TLQcJY
 pCXoZSmd0ra13FLJZylDJfPweQ==
X-Google-Smtp-Source: ABdhPJzO1OwnN24Pt7Ry9JWcmRAqqmF8SQtbycKRuOJ8qavPimTxdapkJj1wzR2cTz5upESGCzY7Dg==
X-Received: by 2002:a17:902:74c6:: with SMTP id f6mr913673plt.30.1644386052685; 
 Tue, 08 Feb 2022 21:54:12 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:f66e:fb24:b0e7:d6ba])
 by smtp.gmail.com with ESMTPSA id l22sm18416304pfc.191.2022.02.08.21.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 21:54:12 -0800 (PST)
From: Pin-Yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: Fix overflow issue on reading EDID
Date: Wed,  9 Feb 2022 13:53:27 +0800
Message-Id: <20220209055327.2472561-1-treapking@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Feb 2022 08:39:54 +0000
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
Cc: Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-Yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The length of EDID block can be longer than 256 bytes, so we should use
`int` instead of `u8` for the `edid_pos` variable.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 2346dbcc505f..e596cacce9e3 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -846,7 +846,8 @@ static int segments_edid_read(struct anx7625_data *ctx,
 static int sp_tx_edid_read(struct anx7625_data *ctx,
 			   u8 *pedid_blocks_buf)
 {
-	u8 offset, edid_pos;
+	u8 offset;
+	int edid_pos;
 	int count, blocks_num;
 	u8 pblock_buf[MAX_DPCD_BUFFER_SIZE];
 	u8 i, j;
-- 
2.35.0.263.gb82422642f-goog

