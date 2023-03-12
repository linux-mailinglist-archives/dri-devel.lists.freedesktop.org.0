Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1076B6B41
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B98110E413;
	Sun, 12 Mar 2023 20:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1001F10E413
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 20:42:45 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id k2so2957243pll.8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LG2BAueGKKjRd5oOzkHW01KAXz7hJtO0YTeAZX7ebQ=;
 b=o6Q8Q10OxuBDZmjDEuj2Y0nzd08O4SmkNr7icIu4A9ga7782yiqyFRevK97HPgKyFZ
 6qkbvhSNrBGhQpxnDY402WtIbd1G4UBrLLETBRvCoEjPwmhVWuVcznthcpwUo92+mojw
 4uwJLnWSzukpVg2j87ZJnFnMfMDvRNPgUJexVJ2GzpCshxiyhRxT3MkZEt7+m3lP3A8e
 RUJJeZCTmHckq7flx6Olfmh7eNr9szbof0gd1O1WuP1T46bdjxQTZSmHKvy3HzWR59Lu
 /kA3/Aqul4HsLTsD321WiqJQNTo2DI/NP6YT3RLZ5NH1HCuw1vPP7jOOmqLnLZP7A5/6
 uylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LG2BAueGKKjRd5oOzkHW01KAXz7hJtO0YTeAZX7ebQ=;
 b=iVicy0YIqa06VsgG69x0hjR/3HwDKrcwuuYNM5oGomb6Bp27RoJbEaMZtP/rz9/Vhb
 6DFBAoOLraqJYRV9ivSU7gaisltistWG2j/eeczLLpTwWqpEtwqawiqZQdEkW9X+1sfP
 50fLvD4hMJ3GGYYRhyPV6BCW6y314XZt3iRX6RScEUSs41ze6iz0oLibLpm3dEi6XwgD
 +8bmMYextGfmzFuABDs1DL4a69XU56QmSD1sZXHI0ZdFb/040TDtkw+0MOrb3sqhXsKh
 QWK9FmA+rSBRIA6yiT144CU2Iu7sXo1QUKGaRTozl5MCo92L6ic2crJyj7VBDp1ayLg3
 casQ==
X-Gm-Message-State: AO0yUKUKC1X3/Qa+DQ8o/fqvjK7mZb0UWCk3H+s8JBjJIritC+yCY8oo
 KjaLs9RMdsuV2dMn60XtiHLU0VyxZZM=
X-Google-Smtp-Source: AK7set9HqHg61quU96CXyCxA74hP/mhbXO2z8J3uqAl4XHL/YO/JW0G0ml5eubnXv6Zs7wdSTVStgw==
X-Received: by 2002:a17:902:ea0e:b0:19c:d663:a31b with SMTP id
 s14-20020a170902ea0e00b0019cd663a31bmr38298904plg.24.1678653764503; 
 Sun, 12 Mar 2023 13:42:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 kv12-20020a17090328cc00b0019bd934434esm3269700plb.53.2023.03.12.13.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
Date: Sun, 12 Mar 2023 13:41:37 -0700
Message-Id: <20230312204150.1353517-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar to the previous patch, move the allocation out from under
dev_pm_qos_mtx, by speculatively doing the allocation and handle
any race after acquiring dev_pm_qos_mtx by freeing the redundant
allocation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/base/power/qos.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index f3e0c6b65635..9cba334b3729 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -922,12 +922,16 @@ s32 dev_pm_qos_get_user_latency_tolerance(struct device *dev)
  */
 int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 {
+	struct dev_pm_qos_request *req = NULL;
 	int ret;
 
 	ret = dev_pm_qos_constraints_ensure_allocated(dev);
 	if (ret)
 		return ret;
 
+	if (!dev->power.qos->latency_tolerance_req)
+		req = kzalloc(sizeof(*req), GFP_KERNEL);
+
 	mutex_lock(&dev_pm_qos_mtx);
 
 	if (!dev->power.qos->latency_tolerance_req) {
@@ -940,7 +944,6 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 				ret = -EINVAL;
 			goto out;
 		}
-		req = kzalloc(sizeof(*req), GFP_KERNEL);
 		if (!req) {
 			ret = -ENOMEM;
 			goto out;
@@ -952,6 +955,13 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 		}
 		dev->power.qos->latency_tolerance_req = req;
 	} else {
+		/*
+		 * If we raced with another thread to allocate the request,
+		 * simply free the redundant allocation and move on.
+		 */
+		if (req)
+			kfree(req);
+
 		if (val < 0) {
 			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
 			ret = 0;
-- 
2.39.2

