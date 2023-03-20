Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79D6C1550
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10510E5AA;
	Mon, 20 Mar 2023 14:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A6A10E1EC;
 Mon, 20 Mar 2023 14:45:16 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id y2so2613851pfw.9;
 Mon, 20 Mar 2023 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTj6lDaB879i6vS4ZDrKb4b2c9OODf1NGI0zVIt2OIQ=;
 b=Bj+oH3CQChclMtHQOjFJOIB+Z7POqoHz3M05DrKcE49Bnf7ohSE3pDsx71PYs3ECvr
 oTHseaJiODm/MyHSlBMBASGteA5HzjOenIVagUXFeZlt7Q+3YFMZoD7rUejgRISy+aVY
 2odaelScwYvdePOWDQYmQtu9g1I2XR+9uN9ba8aIcs04yVVbk2zqIX1fxAN1D/wbDGbE
 GKnk4Dos7F1ERtbzl7QoDAY8Tv0VU4CBkNuZAfbMf6wRdovcBhxA0rKvl1ZusIAFOTqG
 Ji6tDLvUkL6ZHoI/zPauDcA1VF/2Q7lzDyCG6Rg7kTodWzwhyU4JJcSU+8FUk5u7Mgzx
 O7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTj6lDaB879i6vS4ZDrKb4b2c9OODf1NGI0zVIt2OIQ=;
 b=DWME+Vk5vm0B/8Mj9enFr+EsBXia6XTr4yZmYMUpGDNJylGGiJK+bOWE1J/BBmiIUS
 gm6G274S22xC74Vf7xaPcsfGchj+jsT6z/C6H5hrFwz651XLpi9kIdWtcT7D4L9RjhTc
 ugr5h3RFu2/b+g8Z/bvHi8SwzHAavjuKOzqUdXdzG18ruwqPpl4QQCYivu5Cfm64FD9/
 YCodsEyt4bvvo1zD5YmkEZtmdj+Tdc9Dhyi+h6f78xPbOhWut7xVwN6kHhewMKoubdQq
 UwCkhXsc18kW+cwQqTRTsEJoTrGxwsfiX5SLQjI5HX+cqovPgV2TYCQ0ZCBnsCWwzvzd
 VqRw==
X-Gm-Message-State: AO0yUKUzW983F1AJAgQrNigCucFALfXHURkpb6qRnaHrQoBg3EjhrZdr
 6QkKkTPFktWJUUwOZmb/tSDq5u2l8FA=
X-Google-Smtp-Source: AK7set+YZdGvBmz/yJ5ACJx//DaOCsv2sHayWOfLM7STeuIIzbdJFihoX6ELSY7Jku8dzTLjKv9Llg==
X-Received: by 2002:a62:7946:0:b0:625:2636:9cd2 with SMTP id
 u67-20020a627946000000b0062526369cd2mr19429597pfc.18.1679323516022; 
 Mon, 20 Mar 2023 07:45:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 x48-20020a056a000bf000b005a79596c795sm6428405pfu.29.2023.03.20.07.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/23] interconnect: Teach lockdep about icc_bw_lock order
Date: Mon, 20 Mar 2023 07:43:44 -0700
Message-Id: <20230320144356.803762-23-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Georgi Djakov <djakov@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Teach lockdep that icc_bw_lock is needed in code paths that could
deadlock if they trigger reclaim.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/interconnect/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index f7251784765f..5619963ee85c 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1127,13 +1127,21 @@ void icc_sync_state(struct device *dev)
 			}
 		}
 	}
+	mutex_unlock(&icc_bw_lock);
 	mutex_unlock(&icc_lock);
 }
 EXPORT_SYMBOL_GPL(icc_sync_state);
 
 static int __init icc_init(void)
 {
-	struct device_node *root = of_find_node_by_path("/");
+	struct device_node *root;
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&icc_bw_lock);
+	fs_reclaim_release(GFP_KERNEL);
+
+	root = of_find_node_by_path("/");
 
 	providers_count = of_count_icc_providers(root);
 	of_node_put(root);
-- 
2.39.2

