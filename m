Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2C58189B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8B95F62;
	Tue, 26 Jul 2022 17:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E127D95F50
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:52 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p1so5467330plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmvETZN5Ha+yireouc7YVcvDiIVXAJJg/FoKJ92DJjU=;
 b=MksWHjPQg4rbAGIfFOV3GYEdoFoi5JyDDguOZEgeL+RCBQgPgco2HmMrFOUgzGPoWg
 IhcI7KjBNIb5SMTaglpPg92MUIaWzAid8OQ0WLOYidBVYnBfsdNEwQLxmKxck3xftLI5
 fwCVZ3cEMwKVvXZTJlqZGKrQWBkmucHSRozEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmvETZN5Ha+yireouc7YVcvDiIVXAJJg/FoKJ92DJjU=;
 b=qSpuJlJitir9g8gLnQ5xVnFi9buspSQCwNvGj9fpiRtnjAkwo7ttUDZ822+jxnxnr9
 CVBhb+Nu1rSf+jR30iVl1njO8LP/BEuAHVV4Jr0KcjovPMg/2nGjld2TpqXnufZdtH3S
 aHh2yHea2Bv02IvDtTgzy5MgiE9vNh5uECNiGYEL7gMwXFJz3mshmTQXs/kjzFGlEzbu
 XBYUasqz9IFhVphqEzCf9igZYdJzsJ8436COlkKsOlLZvd2gzw+TfKdRrJQct3c5fTpC
 CmrrwyvW+xYz+cUQDfP1599M6xJ8mZaPvsju/nnFGHdHce04c7VSMaAAH9tYHYS8v8zu
 22Mg==
X-Gm-Message-State: AJIora9RXVTviXZhT6uRSsLNCJBNCoXBzyGZFutLVVOq1iypOeBIOU63
 B3bWkOYZB0y84OXPBWmpT95UcQ==
X-Google-Smtp-Source: AGRyM1u3xzf+HZdNlx0FPajthsuPbfpneKaEGEFjTphXREaGSlyM06EiwS5p9j+HCf/rC2oEpPwDRQ==
X-Received: by 2002:a17:902:7c0d:b0:16d:500b:1255 with SMTP id
 x13-20020a1709027c0d00b0016d500b1255mr16942650pll.98.1658857132520; 
 Tue, 26 Jul 2022 10:38:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 6/7] regulator: core: Allow drivers to define their init
 data as const
Date: Tue, 26 Jul 2022 10:38:23 -0700
Message-Id: <20220726103631.v2.6.I38fc508a73135a5c1b873851f3553ff2a3a625f5@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
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
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers tend to want to define the names of their regulators somewhere
in their source file as "static const". This means, inevitable, that
every driver out there open codes something like this:

static const char * const supply_names[] = {
 "vcc", "vccl",
};

static int get_regulators(struct my_data *data)
{
  int i;

  data->supplies = devm_kzalloc(...)
  if (!data->supplies)
    return -ENOMEM;

  for (i = 0; i < ARRAY_SIZE(supply_names); i++)
    data->supplies[i].supply = supply_names[i];

  return devm_regulator_bulk_get(data->dev,
                                 ARRAY_SIZE(supply_names),
				 data->supplies);
}

Let's make this more convenient by doing providing a helper that does
the copy.

I have chosen to have the "const" input structure here be the exact
same structure as the normal one passed to
devm_regulator_bulk_get(). This is slightly inefficent since the input
data can't possibly have anything useful for "ret" or consumer and
thus we waste 8 bytes per structure. This seems an OK tradeoff for not
introducing an extra structure.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Allow drivers to define their init data as const") new for v2.

 drivers/regulator/devres.c         | 28 ++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 9113233f41cd..32823a87fd40 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -166,6 +166,34 @@ int devm_regulator_bulk_get(struct device *dev, int num_consumers,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_bulk_get);
 
+/**
+ * devm_regulator_bulk_get_const - devm_regulator_bulk_get() w/ const data
+ *
+ * @dev:           device to supply
+ * @num_consumers: number of consumers to register
+ * @in_consumers:  const configuration of consumers
+ * @out_consumers: in_consumers is copied here and this is passed to
+ *		   devm_regulator_bulk_get().
+ *
+ * This is a convenience function to allow bulk regulator configuration
+ * to be stored "static const" in files.
+ *
+ * Return: 0 on success, an errno on failure.
+ */
+int devm_regulator_bulk_get_const(struct device *dev, int num_consumers,
+				  const struct regulator_bulk_data *in_consumers,
+				  struct regulator_bulk_data **out_consumers)
+{
+	*out_consumers = devm_kmemdup(dev, in_consumers,
+				      num_consumers * sizeof(*in_consumers),
+				      GFP_KERNEL);
+	if (*out_consumers == NULL)
+		return -ENOMEM;
+
+	return devm_regulator_bulk_get(dev, num_consumers, *out_consumers);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_bulk_get_const);
+
 static void devm_rdev_release(struct device *dev, void *res)
 {
 	regulator_unregister(*(struct regulator_dev **)res);
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 5779f4466e62..bc6cda706d1f 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -244,6 +244,10 @@ int __must_check regulator_bulk_get(struct device *dev, int num_consumers,
 				    struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get(struct device *dev, int num_consumers,
 					 struct regulator_bulk_data *consumers);
+int __must_check devm_regulator_bulk_get_const(
+	struct device *dev, int num_consumers,
+	const struct regulator_bulk_data *in_consumers,
+	struct regulator_bulk_data **out_consumers);
 int __must_check regulator_bulk_enable(int num_consumers,
 				       struct regulator_bulk_data *consumers);
 int regulator_bulk_disable(int num_consumers,
-- 
2.37.1.359.gd136c6c3e2-goog

