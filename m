Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133374B1F8E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5CF10E9F1;
	Fri, 11 Feb 2022 07:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71810E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:38:52 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so8075585pjl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 02:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81HmC6N36AUv3DS+gd84GgUi8DyL6BEk+8tTF7TOR9A=;
 b=klBWVq+VcpD1JwYhqrguON/wgfmRIoeAkScl31urYeBrPusoY43z4JDi85XGNQ/nAi
 HNpnPOrNRyM/rETRpPRxnLjtBJaagIoMTide+qa+TG0/D6Z3ZuGMpG7qqNbcmsdxzBPr
 Cs6gy3oP686jfbbE1xNzeAz2dv27FFO/FDo2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81HmC6N36AUv3DS+gd84GgUi8DyL6BEk+8tTF7TOR9A=;
 b=NdSSXF+EOySkP1hHhVyq1aS8/nXji1cEH5CRpucIuzfpxZVVVnvWITouay2wqgoiY1
 ut10VhXkPoHMNi22IdjwS6i28Fyd6gI9b1EsKu/TKjrabup8JNCw6shSZcw/Fyl283Om
 fR7/af/ZujI34GctGzIPkfuoayfJLHsDWsxjHDOpl2Esac429lPr2UCHg27ue2nEWTEI
 Thpc/7szvPmz1bmIEQvXm3lqs/AIfGAXinWVOvuDi3WKr5mjan4XqtM05fBLSIMKSSLW
 1R9V45LBWFVjntgzhe5ddItAXxzIE09Wqcg6Z16ejVskZLT+DYuLJmLJBvkvwmSYgufk
 v2OQ==
X-Gm-Message-State: AOAM531DXyHBTj/JS2TyKrJed8y1tMqvDCdD1nX4xh1T+U4W7gV1qrCx
 /eI21sZFotagumO60dS71FM8sw==
X-Google-Smtp-Source: ABdhPJw6jVYVhpS6k6vjV9oF1u9DeF+GSlGVoL2BQ6ahDbbjqdm4ZYNVRMvJVMCT6iAALcoRHBUljQ==
X-Received: by 2002:a17:902:8f92:: with SMTP id
 z18mr7040383plo.42.1644489532286; 
 Thu, 10 Feb 2022 02:38:52 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:b164:4f36:23f1:78c])
 by smtp.gmail.com with ESMTPSA id c4sm10941176pfl.131.2022.02.10.02.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 02:38:51 -0800 (PST)
From: Pin-Yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: anx7625: Fix overflow issue on reading EDID
Date: Thu, 10 Feb 2022 18:38:27 +0800
Message-Id: <20220210103827.402436-1-treapking@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---

Changes in v2:
- add "Fixes" tag
- collect review tag

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

