Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB96813B8E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C00B10E266;
	Thu, 14 Dec 2023 20:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D96C10E260
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:32:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-286b45c5a8dso8894543a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702585952; x=1703190752;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2YE6Q1lspxSdRvHtWt0D327Ubgh2oADnGrrLN11Egc=;
 b=PlpjO1lSO7ZUMs2w/nqPpZmdcYJ1MztCWVgaZ+VLM99qY+NktASHUMAAn2id5hTvDQ
 GlN76BZHLhEK8itl95iMM6JQnq1vOf9xTaJ6xj5UovE0hFLi3zG2HY7wb6gU/8nc0nus
 v/G3BeAX9PF1hWKKBFC1RU4ZEbVL+15mv5U7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702585952; x=1703190752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2YE6Q1lspxSdRvHtWt0D327Ubgh2oADnGrrLN11Egc=;
 b=w0OLI8cGGOHwBDSvcUlxmtTVpsDJiWRrksXJxKE0cZaUP6MHnKoIb1/eHGyxjH44gf
 EMvQ4ZXfoj3h1R9OrI+nTSgAdW2v3MDh3RVEhx/el7xpAxrUoA1swJ03ExEloZQwXC0k
 DmqnHqq1vZbyw3mcA6kYK7RldlOyVaf+Fr8jWLUTHyAkiQODox+EWOeGmKM+DaK/8oGu
 pqhjLbhF5vH6kBxTJasq/7YCk3hdS6PJbl+riCjkO70wG7r2DNjZEz8E8nxrThU19sqq
 2QB0OetdaYplecbwLtpU5OStq3aqpBiFXNuGkWNpqHpkLLQl6SWbXT/73+EqKLTUpCaK
 /pjw==
X-Gm-Message-State: AOJu0YzoQSEcbg7hXFavgWu3vsVdXxrYHCZ3tmsfZTxuyJgGQmQHlR7/
 O6LbEmw5bYkP8QqBHEquvgKOrEN+kqmFCB3ojl/Bjg==
X-Google-Smtp-Source: AGHT+IGNPg13lWVuRvuzTZ1e20CqXVgpjSGrsj9auMAxG5qBysEZ8PL64spXTG5LUtb8S2nor6ulXg==
X-Received: by 2002:a17:90a:8543:b0:28a:ce23:af33 with SMTP id
 a3-20020a17090a854300b0028ace23af33mr3823080pjw.42.1702585951955; 
 Thu, 14 Dec 2023 12:32:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9d0c:9bd0:17f6:8236])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a018500b0028658657e9csm14636228pjc.46.2023.12.14.12.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 12:32:31 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Never store more than
 msg->size bytes in AUX xfer
Date: Thu, 14 Dec 2023 12:32:06 -0800
Message-ID: <20231214123205.v2.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214123205.v2.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
References: <20231214123205.v2.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For aux reads, the value `msg->size` indicates the size of the buffer
provided by `msg->buffer`. We should never in any circumstances write
more bytes to the buffer since it may overflow the buffer.

In the ti-sn65dsi86 driver there is one code path that reads the
transfer length from hardware. Even though it's never been seen to be
a problem, we should make extra sure that the hardware isn't
increasing the length since doing so would cause us to overrun the
buffer.

Fixes: 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux failures")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Updated patch subject to match ps8640 patch.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9095d1453710..62cc3893dca5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -527,6 +527,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	u32 request_val = AUX_CMD_REQ(msg->request);
 	u8 *buf = msg->buffer;
 	unsigned int len = msg->size;
+	unsigned int short_len;
 	unsigned int val;
 	int ret;
 	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
@@ -600,7 +601,8 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	}
 
 	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
-		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
+		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &short_len);
+		len = min(len, short_len);
 		if (ret)
 			goto exit;
 	} else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
-- 
2.43.0.472.g3155946c3a-goog

