Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D3813B9F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9F10E25E;
	Thu, 14 Dec 2023 20:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE1E10E25E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:38:13 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6cecb004339so5095359b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702586292; x=1703191092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCuUsFQR6lp6/7dcHWOPjNe2VLvS+gov+CkK1fWJuUI=;
 b=YBsVD4O5IMzoM5Y2X+jIDLMmPq5WXmz0A8GZdJOpyLMGiBoyZX+t8lJOq3hHCpYwU9
 aAHF4FCGZb3D2bfykcYo+y2FvvjcKYiF9mlYceFcNnV11TFcu6NV27i/Psg837pe6Jsl
 Ag90J1hkNf9Dye6u0qPlx7ZJJUstv1SJ2tL1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702586292; x=1703191092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCuUsFQR6lp6/7dcHWOPjNe2VLvS+gov+CkK1fWJuUI=;
 b=CslwgVKcVrIptr+t0IT+u6LbAzCfKxYMjb2ChwHhsb+BH6GLBvblClZYU5u7jfIoey
 EJnGpnlBdOm6WH6m1pTgZY5mqOnGMXmoUqtTZ1Bw2Zir0cU6A/LfCGH9r+BL5342waqN
 XNdG6FHzQGkG7Q9OyKaduyqFleI5INbQz/aMEnLPQJBMGR1smNia4TrN4wrZllTEPVXB
 mRRO4fyDjW7w6nWPN3fn3VtDzMngVTmYsvtbmH+nyZRvNAdhB2Oh8u1kCWWTe5Equrje
 8/CGP10wvie+9UVHCH1sXaRJTY35VMP5FqLTic7KAjHgOAk7iqh10IdWkKE0ZyndlXUU
 17NA==
X-Gm-Message-State: AOJu0Yx9tb5+pPjU/kuYJQoppfIs7KaCBHgq4YoNWgEOEwIzN2otoxCa
 87EyWvClh8WsbVrZNnd5f8pjDckr0gglXzQcUsW4vNMc
X-Google-Smtp-Source: AGHT+IEqBO+G2ecwBpTD5DnxvMh1rm2t6Nq3fzf3H6fhqeSmAfh6caWQ9m9jlmzPR4UB2NwbehmaMA==
X-Received: by 2002:a05:6a21:3398:b0:18c:2287:29cf with SMTP id
 yy24-20020a056a21339800b0018c228729cfmr6588631pzb.40.1702586292209; 
 Thu, 14 Dec 2023 12:38:12 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9d0c:9bd0:17f6:8236])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001cfc2e0a82fsm12799081plr.26.2023.12.14.12.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 12:38:11 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Never store more than
 msg->size bytes in AUX xfer
Date: Thu, 14 Dec 2023 12:37:52 -0800
Message-ID: <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
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

(no changes since v2)

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

