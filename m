Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD52424737
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D408A6EE61;
	Wed,  6 Oct 2021 19:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84366EE21
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:59 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 145so3258418pfz.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm8Ray60W+gsuBVO8IyR/yw2T2Yz5Ywf4X0EOYohXDA=;
 b=M9bnTNDCnWZ/AbmQrReLF0e9g14dbA2hMeAudESF0IRy+EF1EO5K2SqFpOXTYT37uU
 +xiIEGGNUokqXTN+fkT+Ar/FbOVmdVa11MMVtVg+n2H9yF/wuPa634sJWEjxXsnaWnIi
 Jm3hHKiIfWl3hAvdG6otRnoM3OP1/4OE9lnUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fm8Ray60W+gsuBVO8IyR/yw2T2Yz5Ywf4X0EOYohXDA=;
 b=mTjM+zFi7vReWFq3r/hnWQKk0Kv/b+VFoILZoSq8bGJQwVyU9/gfuv+3liGTDZmj/1
 Rwy5JyJG7XAfsTnhYTcorBgUkdzVGghF02y4Tn6+d96Aj5AFLx201zv57ZurlbeyUpIV
 h0aFawMTQd52gCjoPx30CT2/e6OO/0wv87KZzZcsKyu0zc33P/eicbyXoFawNQsVjy/u
 ttAB9tCt9aNNae0hA32L7NTBxymSedsxb3MVgzavHTmEodf7MJK3qI2L66DoQL7dnGyl
 KRwp4xoMhkl8SZ/NeQmMlKcE20MyXUM0lM74Gm8w/UPL8Hh7e/J6Uv22n277x8qmKwi0
 plFA==
X-Gm-Message-State: AOAM5323nX0/qD6xBSjHAk3ddvVrZnaWHn/tfxpg4da9warwXkUarq5H
 xe3JkZ1fWlo91PSFkQn/YL5gfA==
X-Google-Smtp-Source: ABdhPJzpbRB1T9FQhbPMp3f4W/5RvgPd0ymjpSO4hqV8uhllwkUtr714mEwXdatDXZpTyqxVsLio9A==
X-Received: by 2002:a63:7456:: with SMTP id e22mr458679pgn.324.1633549139432; 
 Wed, 06 Oct 2021 12:38:59 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:59 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 31/34] ASoC: codecs: wcd938x: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:38:16 -0700
Message-Id: <20211006193819.2654854-32-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/codecs/wcd938x.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f0daf8defcf1..6033de7f57ef 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4316,8 +4316,9 @@ static struct snd_soc_dai_driver wcd938x_dais[] = {
 	},
 };
 
-static int wcd938x_bind(struct device *dev)
+static int wcd938x_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 	int ret;
 
@@ -4400,8 +4401,9 @@ static int wcd938x_bind(struct device *dev)
 
 }
 
-static void wcd938x_unbind(struct device *dev)
+static void wcd938x_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 
 	device_link_remove(dev, wcd938x->txdev);
@@ -4411,9 +4413,13 @@ static void wcd938x_unbind(struct device *dev)
 	component_unbind_all(dev, wcd938x);
 }
 
-static const struct component_master_ops wcd938x_comp_ops = {
-	.bind   = wcd938x_bind,
-	.unbind = wcd938x_unbind,
+static struct aggregate_driver wcd938x_aggregate_driver = {
+	.probe	= wcd938x_bind,
+	.remove	= wcd938x_unbind,
+	.driver	= {
+		.name = "wcd938x_snd",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int wcd938x_compare_of(struct device *dev, void *data)
@@ -4482,7 +4488,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 	wcd938x_reset(wcd938x);
 
-	ret = component_master_add_with_match(dev, &wcd938x_comp_ops, match);
+	ret = component_aggregate_register(dev, &wcd938x_aggregate_driver, match);
 	if (ret)
 		return ret;
 
@@ -4498,7 +4504,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 static int wcd938x_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &wcd938x_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &wcd938x_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

