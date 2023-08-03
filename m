Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB176F554
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F61610E686;
	Thu,  3 Aug 2023 22:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16510E684;
 Thu,  3 Aug 2023 22:02:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686b9964ae2so1068503b3a.3; 
 Thu, 03 Aug 2023 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100146; x=1691704946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdIQ5YsNyrlOWXwSuXx23oN8qxRbhtWI4ShbAosGVe0=;
 b=sY6tJHcmXKaCE9qCeuSrRxn8tuTREX4eVuSfZvU32Ry0/icJ9OtVDmxhagKAVuyBMG
 SUlXoizmhVMryD/E8eq5VmhsMaFhtRWTcx8Z3VDUZPEoYMQTd6SkR9z7vso9XLWHYkTS
 6G9Ivds6degZQNmEcVjcTyJml6OXTI9ZiM35raRv4xX8Ealp/ILJbHMBVkGxiok4i1jv
 79yixE/qNmhB6NESnN2Zw9tQ5znpOqPcsYkko7KoB2AK/a1bDGMh1E4oYnQh8/heHyfO
 TjaF/icZeS7mS7tCSdKfcxd9dlGz731i4zqGEICpOLuMrrnAaVLJnUCIL9OuxNCX08Xt
 fC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100146; x=1691704946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdIQ5YsNyrlOWXwSuXx23oN8qxRbhtWI4ShbAosGVe0=;
 b=B3FZY0JdoTBDKgijMdzK//40z+yapOV1/2PxjLfHjgIPlppJKN5cRBYl6KAMtmc28F
 UOg8eC022t+eAS4eK2MImBGI9bHRNrHA0rio1IILw8tsDErToLPT+wS/4zL3ckPjMLhG
 X5eICedKi8ytQSY041SJtI+F3G/ozyRJyOepSrfaSagsROSq1Dw1J4zWMQPIXANJQxTL
 1p59uhAQenlVo8GeGMVnYofzUXc9Om8la0mgA2aKji+g8aT+JuQudP87lqymhZhFg4qI
 KiuGVEIY45jU3UkXRMT7WmDkFMaHvjCLznFOeiwdLd4sl0OaMYY1sWTylSR/1pvqYN5d
 /S/w==
X-Gm-Message-State: ABy/qLYSyoG4crkV3urKaLUl77WrYmPkEBOGdCDmfCm86+8HoLOm8ZtI
 LJh8DLIHn5+oKYUgPqkYGLH6vs6+zo4=
X-Google-Smtp-Source: APBJJlFOc6AAnszSskkuTa0g94925qyVeNjNM4id7xkJhDjPBOi6n4upfghDHL/yd0tHm29nnK72Rw==
X-Received: by 2002:a05:6a21:4984:b0:12d:3069:69e1 with SMTP id
 ax4-20020a056a21498400b0012d306969e1mr16263038pzc.60.1691100145981; 
 Thu, 03 Aug 2023 15:02:25 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a62e701000000b00666b012baedsm295147pfh.158.2023.08.03.15.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/9] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
Date: Thu,  3 Aug 2023 15:01:52 -0700
Message-ID: <20230803220202.78036-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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
 drivers/base/power/qos.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index f3e0c6b65635..4537d93ddb45 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -922,17 +922,19 @@ s32 dev_pm_qos_get_user_latency_tolerance(struct device *dev)
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
-		struct dev_pm_qos_request *req;
-
 		if (val < 0) {
 			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
 				ret = 0;
@@ -940,7 +942,6 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
 				ret = -EINVAL;
 			goto out;
 		}
-		req = kzalloc(sizeof(*req), GFP_KERNEL);
 		if (!req) {
 			ret = -ENOMEM;
 			goto out;
@@ -952,6 +953,13 @@ int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
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
2.41.0

