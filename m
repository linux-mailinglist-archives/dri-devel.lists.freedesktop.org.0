Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3E78490D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0254F10E3DD;
	Tue, 22 Aug 2023 18:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF6910E3BF;
 Tue, 22 Aug 2023 18:02:39 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5654051b27fso3065300a12.0; 
 Tue, 22 Aug 2023 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727358; x=1693332158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XShSbqbLSjOdDhersXOLs7lzCQuSfnKt14AX57BEfg=;
 b=pUZ+14WTjGDCf1BQn529IVVAU3hq39BWMLQDcxyh3ZnNRBdW80UywIS+1pmIIApzlC
 qwS842G1JCCQnTm2GE6oMZBJelvEJUhgD2Vt6d+kHraK7Dnkl31KoMaN4WQv2KPpm59X
 7MZU2Ldos4yc3gUepBLpO9lBcwusarlG6zxLEYeX6CEbONCv3dq6NYXvPJNGCVz2TlEF
 8IDQFIcKMxuxoF8DTAbGfanLO9KXBeSmSHFjrWlyJLnWnxFR5OMc7gC1wmwHSesOW1y9
 4VgfyDskCki8nCRAB6ulGOZbQL7awkJoyYTayPWZF9yyiFx8tdwu5nGGw1vPvf66bNRo
 FFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727358; x=1693332158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XShSbqbLSjOdDhersXOLs7lzCQuSfnKt14AX57BEfg=;
 b=Zrz69X8uz+pNlt6O95Pklqo+zTKnIlQosg44llUQ6H6KNNjeGbSFGPPToqqLJmDL+3
 +Cd97KG7LQX071Jx4Wdk/RR1eTvaBDqeXEnne1DlCRNI+61i47a4rwSlOzdgCwg38ygl
 onr+Td6+rE4bs623GJ+HiPOHtAnvjiBeoylAsprXBNGioSzlRikfIp7XJ/NNLyoXhs09
 4xdeddA4gxFx7U/w/S3DInHRgiIomVt4FEan6XLFWt+nI7ySKbDXtnJ1rUvVkQ0XYHo0
 RKCZSdaKP3GscGKiCTrXHUKgtWhQoS6lRHVTyTi0cRaE0NqACjIdlNJtFRNIgBbwi6SN
 Rklg==
X-Gm-Message-State: AOJu0YyC36YfCXPWjsDxX93PWddXsJ0vGqLJVZzBDLORCI5WO4w1jTyF
 zzDuSnxLpgKKHFNJzgMwj4IwVkJDZWg=
X-Google-Smtp-Source: AGHT+IGU2q4GqtMlWZay5JuzPmetg/Z4r0XDExQ7OUUvf4EpBFUGF1s2dS8kYHGsXJw0CZke5NhQ/g==
X-Received: by 2002:a17:90b:2304:b0:269:46d7:f1db with SMTP id
 mt4-20020a17090b230400b0026946d7f1dbmr9862231pjb.32.1692727358080; 
 Tue, 22 Aug 2023 11:02:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 cm1-20020a17090afa0100b0026940eb686bsm9910775pjb.20.2023.08.22.11.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/11] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
Date: Tue, 22 Aug 2023 11:01:51 -0700
Message-ID: <20230822180208.95556-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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
 "open list:HIBERNATION aka Software Suspend,
 aka swsusp" <linux-pm@vger.kernel.org>,
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
index 7e95760d16dc..09834f3354d7 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -930,8 +930,12 @@ s32 dev_pm_qos_get_user_latency_tolerance(struct device *dev)
 int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 {
 	struct dev_pm_qos *qos = dev_pm_qos_constraints_allocate(dev);
+	struct dev_pm_qos_request *req = NULL;
 	int ret = 0;
 
+	if (!qos->latency_tolerance_req)
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

