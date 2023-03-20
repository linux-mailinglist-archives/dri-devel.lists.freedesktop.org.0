Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47A6C153D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2F910E5C2;
	Mon, 20 Mar 2023 14:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2015410E5BE;
 Mon, 20 Mar 2023 14:45:10 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so12623446pjt.5; 
 Mon, 20 Mar 2023 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LG2BAueGKKjRd5oOzkHW01KAXz7hJtO0YTeAZX7ebQ=;
 b=JYMfuqbtpiJILVkp0uoqa+oBsFme/4zOTzeVWYi3j3wR1ZQJWuMq7gV27NVroQ4Cof
 DvrYwJDRdr8vjUe7AoOTjec4wKPvjzpSGWLEwjaFkMJH0s8z+PQvoCMmcpojocLE7ybO
 oo+/Hl2TVSIoCQa+s4zQECFi1GZGH4VbTC86Yqlf91CDneoARc4TOJ4Z2guCXmZDIpSu
 /196tgzmV3xQEvnInxfSyu1LNUDP3vSbz96LAF3Eqc21Kvo8zow4uMY7aNpcZ4+NT4Yg
 MDg9DNeVPHKmg+hxMcvtXfab3OuON64cpe+DAyLDIvSqDWJdJRf7qPJfP/BVFmTravPm
 rQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LG2BAueGKKjRd5oOzkHW01KAXz7hJtO0YTeAZX7ebQ=;
 b=FNSF6By1JrQcRPKgOYKZFUxKOnmFo+cTQKyRCZOdIQjxuh/IAkEyriKn7Q+xG76vUm
 8PbhhuNrDyd2AmAyTrF0yg19uLvJDtalAFkqus298jwoYcnCWDXW6O9Y7cl6TdBJBF5P
 71Zs4TbX5S2Y5OQFV5eZENi4rXv4DPXZfOIQteeDX0+ap4rV+drwHkdpyyD+5Ky6E6Bw
 wni6yZWq0jwPOSbowj+rYb+VaFKRBTWbzCaTDyOEXlgeFUr0m6+6maxfxjcU1WZ0rNpU
 ODxGIbLh6/29D9oWElmDBr1UH2nVJ4DzM+gWY4jB80dMOfYUQGxsLhgFDrzD7LQxd4kf
 HDRQ==
X-Gm-Message-State: AO0yUKWFUu+c81t9PmbkzzePeYfRH29qdtOuYoPNgSwFScT8SRevcwfm
 t+X618UmfswBiT5NHsSgqTRrJI7ibso=
X-Google-Smtp-Source: AK7set8ZMssF9rVaP9Q2tyqSeIvwgvafCYLFB4nuIVnqISbFD6NVpbGZbgq3RCYIRz5Qz1iGPiJ1mg==
X-Received: by 2002:a17:902:c40a:b0:1a1:b9e0:fa1c with SMTP id
 k10-20020a170902c40a00b001a1b9e0fa1cmr10839593plk.0.1679323509573; 
 Mon, 20 Mar 2023 07:45:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 io7-20020a17090312c700b001a1ca6dc38csm2920651plb.118.2023.03.20.07.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/23] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
Date: Mon, 20 Mar 2023 07:43:40 -0700
Message-Id: <20230320144356.803762-19-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
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

