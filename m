Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C03722C3
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 23:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB776E423;
	Mon,  3 May 2021 21:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B740F6E423
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 21:59:17 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id m37so4800953pgb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C70V1ep2OC0kZd3ksfbxSiRkqnQcxIJ5Zt5dguO6jEA=;
 b=ddABHDYPpcDSWspsVe5JjaRfWW2WGzybj41mDN4dyyhwjLnvgl8JpgEMRrm0zl8014
 sghhgQqUZi2bnSITlK49Sqef/89J5Z0uzWa29w7OYowYEtVZghumEDiQhCbYWYhRuDeL
 8Ga3xvrQTHc+QoTZKO6w2zXurJ7km4LRNn3M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C70V1ep2OC0kZd3ksfbxSiRkqnQcxIJ5Zt5dguO6jEA=;
 b=ODRM7xzfy7LC07LFNa92Lkc2utJdxMo8AYfr1c8RgMRlgAedK1KwVBg9J2JQFj93Qf
 RopKUc8ojPI472HUstfuLM0yJAtPLpiDEG1zu5MEzstFcWJwqaClvlBkS3OPVwWsT558
 Kz83CX4UkXErheoZKaMj22dYKJkx5rXF+TyBhGmuEaFUdLDVyABPXODtqymEU9O8kmDN
 e8hVu592aEyFzRDJGCI6j9QFNeeuYE+ddxesQRu3kIaubPuRoQ+I0VW5RSm4iU7SXBxh
 6NdCyhfSxDItlEkLUnlN+cML2lzRcPiM16kab0jqvtR4UzobnjBRpQKwleDfNUwq1iKP
 Y+rg==
X-Gm-Message-State: AOAM5315EmKJPu/HJj0XQPOJgeA7YmO+fnJKKVuwRw++tbrMGAUmnhH4
 P3Z2zuvdkwP85tSlSwCNqULmiw==
X-Google-Smtp-Source: ABdhPJxCffXNMJSO10RrlyG4KuAU0sSx6Cz3Lg0v+K+XZhSsqwIjdP9TiZSAgQzu7azyCwAucvUELg==
X-Received: by 2002:a17:90b:3684:: with SMTP id
 mj4mr958049pjb.50.1620079157449; 
 Mon, 03 May 2021 14:59:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:a592:ac50:b17b:5c43])
 by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:59:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v6 1/5] i2c: i2c-core-of: Fix corner case of finding adapter
 by node
Date: Mon,  3 May 2021 14:58:40 -0700
Message-Id: <20210503145750.v6.1.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_find_i2c_adapter_by_node() could end up failing to find an
adapter in certain conditions. Specifically it's possible that
of_dev_or_parent_node_match() could end up finding an I2C client in
the list and cause bus_find_device() to stop early even though an I2C
adapter was present later in the list.

Let's move the i2c_verify_adapter() into the predicate function to
prevent this. Now we'll properly skip over the I2C client and be able
to find the I2C adapter.

This issue has always been a potential problem if a single device tree
node could represent both an I2C client and an adapter. I believe this
is a sane thing to do if, for instance, an I2C-connected DP bridge
chip is present. The bridge chip is an I2C client but it can also
provide an I2C adapter (DDC tunneled over AUX channel). We don't want
to have to create a sub-node just so a panel can link to it with the
"ddc-i2c-bus" property.

I believe that this problem got worse, however, with commit
e814e688413a ("i2c: of: Try to find an I2C adapter matching the
parent"). Starting at that commit it would be even easier to
accidentally miss finding the adapter.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Later patches in this series won't work right without this one, but
they won't crash. If we can't find the i2c bus we'll just fall back to
the hardcoded panel modes which, at least today, all panels have.

I'll also note that part of me wonders if we should actually fix this
further to run two passes through everything: first look to see if we
find an exact match and only look at the parent pointer if there is no
match. I don't currently have a need for that and it's a slightly
bigger change, but it seems conceivable that it could affect someone?

(no changes since v1)

 drivers/i2c/i2c-core-of.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..de0bf5fce3a2 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -124,6 +124,14 @@ static int of_dev_or_parent_node_match(struct device *dev, const void *data)
 	return 0;
 }
 
+static int of_i2c_adapter_match(struct device *dev, const void *data)
+{
+	if (!of_dev_or_parent_node_match(dev, data))
+		return 0;
+
+	return !!i2c_verify_adapter(dev);
+}
+
 /* must call put_device() when done with returned i2c_client device */
 struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 {
@@ -146,18 +154,13 @@ EXPORT_SYMBOL(of_find_i2c_device_by_node);
 struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
 {
 	struct device *dev;
-	struct i2c_adapter *adapter;
 
 	dev = bus_find_device(&i2c_bus_type, NULL, node,
-			      of_dev_or_parent_node_match);
+			      of_i2c_adapter_match);
 	if (!dev)
 		return NULL;
 
-	adapter = i2c_verify_adapter(dev);
-	if (!adapter)
-		put_device(dev);
-
-	return adapter;
+	return to_i2c_adapter(dev);
 }
 EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
 
-- 
2.31.1.527.g47e6f16901-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
