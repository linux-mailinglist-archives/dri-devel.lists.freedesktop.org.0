Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF40772C44
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8838710E331;
	Mon,  7 Aug 2023 17:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF0E10E328;
 Mon,  7 Aug 2023 17:12:06 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bb84194bf3so31304155ad.3; 
 Mon, 07 Aug 2023 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428326; x=1692033126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BWwQKRJpzoHOTxVfrEWi7WrUwdArtmVUIFmQG2FfZk=;
 b=nUcZ6zaKb9oJP6CEIYRcJkVn2doIh/RF8s3VrpAVFmfsq1IIqx19G69U84jz9jzQgY
 cHr+lYbYhmNdbIukaqOqGsPKk2sw7KWC72wtrTjbwCp2nPjSAYHSsMBH7eotQ46I/B5g
 nrRXrNOtuNQ5D77wN3uGg1Kyl8uwOqC3fyBEvWvZPLsblIAAkDYjhjLFN0cHZTIlyy1p
 xqJ+DIubWTGtHZgXWaPwzzkZRHyyhuHowAEJC2+dZuPLFCgSw5RkybhX20f8D894mI3n
 uzwcIeGy9iHqQ7RK7Rgox4rrkdOrpBNCJihzyD4UB+d9OGt8+t7Z2G+lZDzn8OPSEH/w
 aoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428326; x=1692033126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BWwQKRJpzoHOTxVfrEWi7WrUwdArtmVUIFmQG2FfZk=;
 b=ONYlM0HJ40T9wUitOOetZ3YlvgYY0fF90p4nB37o7rOplA2921Biufw5vCuGSFL6SV
 ZI9nuQJMpQRJkI4yj2ojgwosWAeJkgsSFasUFc9ojBfWi0LUjRf+jYfqrYzaEaA8d6qV
 3ixTsj4P427C2LDw7lh3qS9H+Nb0lfIUhpVt/T9j9v8J41YCpJ3s6WjsGJTsRzL5ALug
 r9+jZUNVWUEhK0RpM0IDKNcXbLP4JU/ppdCKhmRFkmFvx5fZ/u67M/IbSRCZTJZ9iaBR
 gtLLouRSMsyLP4G2o+P3lNRNz6Y/bS+W+9fK6Q54cJ8jxtG+utoGDnTnwYhzlOVMCC7c
 hPaA==
X-Gm-Message-State: AOJu0YwX5Z23rWmO0lPu6PQqwo5KM4a1y2h7OrOID5q2tOuUcpPI403R
 xGAkQJm5MsxsN4k/5JherYAFsbiFVwQ=
X-Google-Smtp-Source: AGHT+IHiIsybfpW8I/4HRIF/dVyngB0zec9md5KKieStD7fN6pUtE5S6xEynqQO6g3nIMhlAahP9yQ==
X-Received: by 2002:a17:902:ecc3:b0:1bc:382b:6897 with SMTP id
 a3-20020a170902ecc300b001bc382b6897mr10420079plh.13.1691428325704; 
 Mon, 07 Aug 2023 10:12:05 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a170902b19500b001a1b66af22fsm7155258plr.62.2023.08.07.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:12:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/9] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
Date: Mon,  7 Aug 2023 10:11:38 -0700
Message-ID: <20230807171148.210181-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807171148.210181-1-robdclark@gmail.com>
References: <20230807171148.210181-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar to the previous patch, move the allocation out from under
dev_pm_qos_mtx, by speculatively doing the allocation and handle
any race after acquiring dev_pm_qos_mtx by freeing the redundant
allocation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/base/power/qos.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index 7e95760d16dc..5ec06585b6d1 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -930,8 +930,12 @@ s32 dev_pm_qos_get_user_latency_tolerance(struct device *dev)
 int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 {
 	struct dev_pm_qos *qos = dev_pm_qos_constraints_allocate(dev);
+	struct dev_pm_qos_request *req = NULL;
 	int ret = 0;
 
+	if (!dev->power.qos->latency_tolerance_req)
+		req = kzalloc(sizeof(*req), GFP_KERNEL);
+
 	mutex_lock(&dev_pm_qos_mtx);
 
 	dev_pm_qos_constraints_set(dev, qos);
@@ -945,8 +949,6 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 		goto out;
 
 	if (!dev->power.qos->latency_tolerance_req) {
-		struct dev_pm_qos_request *req;
-
 		if (val < 0) {
 			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
 				ret = 0;
@@ -954,17 +956,15 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 				ret = -EINVAL;
 			goto out;
 		}
-		req = kzalloc(sizeof(*req), GFP_KERNEL);
 		if (!req) {
 			ret = -ENOMEM;
 			goto out;
 		}
 		ret = __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LATENCY_TOLERANCE, val);
-		if (ret < 0) {
-			kfree(req);
+		if (ret < 0)
 			goto out;
-		}
 		dev->power.qos->latency_tolerance_req = req;
+		req = NULL;
 	} else {
 		if (val < 0) {
 			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
@@ -976,6 +976,7 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 
  out:
 	mutex_unlock(&dev_pm_qos_mtx);
+	kfree(req);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_qos_update_user_latency_tolerance);
-- 
2.41.0

