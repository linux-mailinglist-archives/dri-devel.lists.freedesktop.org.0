Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B967133AD9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4C46E853;
	Wed,  8 Jan 2020 05:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5DC6E853
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:24:16 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k197so962209pga.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 21:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLPzDvqsyKjpMgl6ZY+ZEjymtgHHsFzBQXHTW4eiM1M=;
 b=S3tVQZXgAvZAvGKT4jucRDlF/M0TWOh+3V7E9ZFoKg0xoIXSRxIr5TYGLCUnvTfS9N
 f+oKg6lg9u0QxJzV+FId6ptqevsKmNbYDMNZJ9DJAVLRY/8KFELoCSNhdge1SKfgY0Xy
 AuK7NrZkfWLHM89vkHp0eJTBqDJW+EynagsuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLPzDvqsyKjpMgl6ZY+ZEjymtgHHsFzBQXHTW4eiM1M=;
 b=hyAt1l9PemT5czcneyJNq4VQtyShURCjjTkrMWP5mvHadNdW/ncfZCkYbLwkxLbVvK
 89DjsEZUybZ69YS6tfFVfaMOCXi/xyB6pkpSFV7ODYG9Q/2kPwXbqnCVqLwws3YwVLxf
 Bpg9LU1v9IQjazErIb233idtFCXWA5BOHqUUNk33udpynqujoEH5B0vQkBYAbneuT84C
 v4gu/fSKmXfe4BVgUCR2P27frVpPLmB4hfD1UfEmh0046SUqsrrcKAN9s6gTaClgFga4
 EBr6G5y0NvEg8a9pihCEHCjKYSLfnz1czv2MOq8LHND4fI3TS+o03ThzHVLzr1tx+Pj/
 8Bkw==
X-Gm-Message-State: APjAAAVVK3FxFP8cOer6Fr6/oE67guNNYrvdGFHpL0x8KXZQp3XA31GY
 BmQsPTktoU0KQWU8vdHQUaoxCg==
X-Google-Smtp-Source: APXvYqzoefkOYFH4FXTTMbYJDxtsQiuVsYfMMaYxsSll0XpoVzmSh/ccdl9HE7eeGAdfYbzMduo/6Q==
X-Received: by 2002:a63:ed56:: with SMTP id m22mr3334545pgk.261.1578461055680; 
 Tue, 07 Jan 2020 21:24:15 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:24:15 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 7/7,
 RFC]: drm/panfrost: devfreq: Add support for 2 regulators
Date: Wed,  8 Jan 2020 13:23:37 +0800
Message-Id: <20200108052337.65916-8-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
devfreq, and provides OPP table with 2 sets of voltages.

TODO: This is incomplete as we'll need add support for setting
a pair of voltages as well.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 18 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbfccb..5eb0effded7eb09 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -79,6 +79,22 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
+	/* If we have 2 regulator, we need an OPP table with 2 voltages. */
+	if (pfdev->regulator_sram) {
+		const char * const reg_names[] = { "mali", "sram" };
+
+		pfdev->devfreq.dev_opp_table =
+			dev_pm_opp_set_regulators(dev,
+					reg_names, ARRAY_SIZE(reg_names));
+		if (IS_ERR(pfdev->devfreq.dev_opp_table)) {
+			ret = PTR_ERR(pfdev->devfreq.dev_opp_table);
+			pfdev->devfreq.dev_opp_table = NULL;
+			dev_err(dev,
+				"Failed to init devfreq opp table: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret == -ENODEV) /* Optional, continue without devfreq */
 		return 0;
@@ -119,6 +135,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.dev_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 92d471676fc7823..581da3fe5df8b17 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -91,10 +91,12 @@ struct panfrost_device {
 	struct {
 		struct devfreq *devfreq;
 		struct thermal_cooling_device *cooling;
+		struct opp_table *dev_opp_table;
 		ktime_t busy_time;
 		ktime_t idle_time;
 		ktime_t time_last_update;
 		atomic_t busy_count;
+		struct panfrost_devfreq_slot slot[NUM_JOB_SLOTS];
 	} devfreq;
 };
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
