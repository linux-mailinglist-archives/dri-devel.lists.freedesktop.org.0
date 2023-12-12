Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772E80E08C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E910E23E;
	Tue, 12 Dec 2023 00:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127410E091
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 00:56:06 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d336760e72so1011675ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 16:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702342565; x=1702947365;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VII/LMlRWrPvYBfcRDAQD7A22/Kx5Gqvp4PO6BWVrDg=;
 b=Lf30+ijQB+IboTFgdmOH+6Rnqx1op/tJ62V7lKAArAqAgdNjGO0fiGrCY2YAg171ep
 qp3AvP0dPtFQfqtNI9KLjDZnAauH3WU08tuRrODaA5lmp2Q5R4E5ll83TfHx99ck/TPI
 IY4j9ZX58nCsFk9ZbaGFReWQgVXwm1mYCcr2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702342565; x=1702947365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VII/LMlRWrPvYBfcRDAQD7A22/Kx5Gqvp4PO6BWVrDg=;
 b=mHJsGTvPxcqp95263si9aLkR0SUAeJ9KQxY1L9ddBwR5kUi1tTeca6MUFYQzxI+zC1
 p+WMQZFzGvOsMJ7euE/zPilqBle3mR5SeBcrJwfaCMgjM5MZ44+BHCOsSWos/NIe9H22
 o3PuRM+x/oAPX+LR5TUbRfylpNgc1XXCgjc2klOVgSunyf13BQeVd09revqz7P+m1dt3
 QdvmJ6832qkzvLy7g7EFu3LtJmJpFsCjsNPWh6fCcSUA5rmSNRUhpqptsLKHlCnnLEhP
 VQ0Efjv3bfcKC9vep8hzBsI1gnUwC4SrarCDCiA/Bbgo1LFmHv91/pfOS56faSygCWZ2
 2hnw==
X-Gm-Message-State: AOJu0YwFDA42VshuNR2O1v4lhldHhREXBrPNraYwcXyQ8tdhiANOfZeh
 P1npMAIUHCe0ko4GWv0MkWCZ0988/d7Ch6cdW5JEu146
X-Google-Smtp-Source: AGHT+IHFyTsa/iL05H+WM4XTWvOGMGTVZlGEhQBpQMBoRW2cN0R6Hrp3MXN3u+9yFFV1wxd9YuCrhQ==
X-Received: by 2002:a17:903:1206:b0:1d2:f388:6df3 with SMTP id
 l6-20020a170903120600b001d2f3886df3mr6013703plh.48.1702342565555; 
 Mon, 11 Dec 2023 16:56:05 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:5c08:e1ed:d922:d30c])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902694a00b001cc311ef152sm7251271plt.286.2023.12.11.16.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 16:56:05 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi86: Never increase the length when
 reading from AUX
Date: Mon, 11 Dec 2023 16:55:27 -0800
Message-ID: <20231211165526.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211165526.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
References: <20231211165526.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
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
 linux-kernel@vger.kernel.org
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

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5b8e1dfc458d..7ff465241267 100644
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

