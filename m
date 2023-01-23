Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA143677FF6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1BA10E4D3;
	Mon, 23 Jan 2023 15:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE3210E4D1;
 Mon, 23 Jan 2023 15:37:42 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id k13so11815985plg.0;
 Mon, 23 Jan 2023 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bqm/b4+IUdS1MqzQZf17cD89gtcHvfXYnuA2GMItHy8=;
 b=BeoLm0GehG2RTvXfpa3TJlY/SMshWzp1bpns58/nwqsEifYxf7ekkD81AfXJagIOB+
 UwAIUci/GqYTsUdXnuChLkVGcn4T3p+5uaKqwcLNqvnWDcMrSJANvtyZBCbtN2jWDxf5
 xPZJKPW9mL/HwXGKP1o6XJmkUxIkmAUXgz3uArCcSb3MCMl9GJ96KThvVJTuhP8c7mwi
 KGxfbUstxf/dJP4hjJttF8HclYAjm1Fh54CnnMfMaNXpNjc3okJlYaBi6GcVQ23E2OFA
 seXpNS0ZQYAJ/7latTNsL3P9YxlsQLnB6SXm1OyZuvUJQyK1ZWD1h3fdozu7KQjgIOt/
 7Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bqm/b4+IUdS1MqzQZf17cD89gtcHvfXYnuA2GMItHy8=;
 b=ydr2c7k3UR6CKvQJqHfho5vnSjujflt8T8uzX9RwPAT2f+RuW+p9/aZJA4Hhgomo6z
 TSmktQ5YP5wodLo0m+9nQ4YvyKdVqY4jq53UB01MJ75+m0reor8OXOKIicLA07sB38ro
 2aqfAOHy3xFsmpa70ZlYwDM+E87vSoms4OMDAD6m+S9MWtfAgnYWBjRjuNOSrlH9AlPo
 BcCYP6eY5EFSFKrmIpuQ6I6WV+zOFkXodBTgcxiv/r7/LkjugaLBJ3YDARIaHaXjtg+M
 oq0PtHM2n6o8prejmjWl0sS6X6qgmLqdG5UcBpxUeomgrZVMSpP0ccgRUAgYakl+ElM3
 3f2w==
X-Gm-Message-State: AFqh2kpdsLt5DVmyJEQU4jyZABbSIYWN0gzxfJTq/Og+HREVipM6ZBiY
 xVBghZT1nr9F/kEFFBp8wCg=
X-Google-Smtp-Source: AMrXdXse4poj4j7/kfYLEJ+8471w5Y524fdoIV5ZbcJvP4IGR3j2MuWF5o0LGi9ty84jgW5rm9vbvg==
X-Received: by 2002:a17:902:e403:b0:194:3dd0:e332 with SMTP id
 m3-20020a170902e40300b001943dd0e332mr21920673ple.69.1674488262052; 
 Mon, 23 Jan 2023 07:37:42 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a170902db0300b0018963b8e131sm10333712plx.290.2023.01.23.07.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:37:41 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: linux-pm@vger.kernel.org
Subject: [PATCH] PM / devfreq: Fix build issues with devfreq disabled
Date: Mon, 23 Jan 2023 07:37:45 -0800
Message-Id: <20230123153745.3185032-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The existing no-op shims for when PM_DEVFREQ (or an individual governor)
only do half the job.  The governor specific config/tuning structs need
to be available to avoid compile errors in drivers using devfreq.

Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Assuming this doesn't conflict with anything else landing via another
tree, an a-b to land this via drm/msm-next would let us un-break builds.
(And also start removing "select DEVFREQ_GOV_SIMPLE_ONDEMAND"s added in
various places to try to work around this issue.)

 include/linux/devfreq.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index 4dc7cda4fd46..7fd704bb8f3d 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -273,8 +273,8 @@ void devm_devfreq_unregister_notifier(struct device *dev,
 struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node);
 struct devfreq *devfreq_get_devfreq_by_phandle(struct device *dev,
 				const char *phandle_name, int index);
+#endif /* CONFIG_PM_DEVFREQ */
 
-#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
 /**
  * struct devfreq_simple_ondemand_data - ``void *data`` fed to struct devfreq
  *	and devfreq_add_device
@@ -292,9 +292,7 @@ struct devfreq_simple_ondemand_data {
 	unsigned int upthreshold;
 	unsigned int downdifferential;
 };
-#endif
 
-#if IS_ENABLED(CONFIG_DEVFREQ_GOV_PASSIVE)
 enum devfreq_parent_dev_type {
 	DEVFREQ_PARENT_DEV,
 	CPUFREQ_PARENT_DEV,
@@ -337,9 +335,8 @@ struct devfreq_passive_data {
 	struct notifier_block nb;
 	struct list_head cpu_data_list;
 };
-#endif
 
-#else /* !CONFIG_PM_DEVFREQ */
+#if !defined(CONFIG_PM_DEVFREQ)
 static inline struct devfreq *devfreq_add_device(struct device *dev,
 					struct devfreq_dev_profile *profile,
 					const char *governor_name,
-- 
2.38.1

