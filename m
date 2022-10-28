Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74327611DA6
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558F710E8F5;
	Fri, 28 Oct 2022 22:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1001E10E8F3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 22:48:21 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso5741151pjc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 15:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8LWoRkfSMU+CJ60Tm7wanIclajGSfZYvjPsATtyTB9c=;
 b=kEf8pkaqDLyKKPRro1RzlspOqf9bDj9K9tXuJIfimPasVBVuSbh3nXFfHuKj3Ygv/e
 Cb2woLyV/0T4hlBWtL+deoHGD9VfD6aKyLYcAQxvNFDXlnQhUFE87y+LQpwOsBtmz5z0
 nYqVpW7KVwrtYp/ANLZ6FHgmzrBkDHxNW5lig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LWoRkfSMU+CJ60Tm7wanIclajGSfZYvjPsATtyTB9c=;
 b=y2reOPLJv6Pgp4djfGOeP1w7Vu8iZUVxrGGx06AkdXZd7XfEbE//D4XVGV/SZitjTq
 0b++T9a1fWrmkG8TG9tgUU4wmuUia06ns4rN0yusOXYud5ILff4Jgd8Qdi/0YLgfJK6t
 xY92Ey2ID2nKjDxofUz6FA2Y3wSv3GOfC4T6iP4w8W4uZWiTXmXKp4xrsA8Dffmzuumk
 +EDawLPNPrMIOljb/qlvPWdc+bYjufZn3rAhWJ+wZ1ahifPFuw3q/11ZBaliQGfr6kmF
 ZD+b/7aOOh2PGZ7nyW1ynGdgogoC57dTyT2CBv2RQLrKOUgUAFkSXS7D67vez/gCr/iA
 2bQQ==
X-Gm-Message-State: ACrzQf1wWhR6eziMVXkg+n5pZYg237vk9NQ4Ore9yrJiRW1dC/NiuBWr
 uemaxx9dOa+heTu9ugvAzoUaKw==
X-Google-Smtp-Source: AMsMyM55Sd5sOvrhwfrL/VW2HDZO143InZb28UjVPt6odCwiOqgaUH7lbfeXhLdju9NuiBJ7Ch77ng==
X-Received: by 2002:a17:90a:c78a:b0:212:e56b:2b17 with SMTP id
 gn10-20020a17090ac78a00b00212e56b2b17mr1623176pjb.51.1666997300703; 
 Fri, 28 Oct 2022 15:48:20 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
 by smtp.gmail.com with UTF8SMTPSA id
 1-20020a17090a0e8100b002009db534d1sm3010415pjx.24.2022.10.28.15.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:48:20 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui  <Xinhui.Pan@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: Move racy global PMU list into device
Date: Fri, 28 Oct 2022 15:48:12 -0700
Message-Id: <20221028224813.1466450-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
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
Cc: Brian Norris <briannorris@chromium.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If there are multiple amdgpu devices, this list processing can be racy.

We're really treating this like a per-device list, so make that explicit
and remove the global list.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 12 +++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0e6ddf05c23c..e968b7f2417c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1063,6 +1063,10 @@ struct amdgpu_device {
 	struct work_struct		reset_work;
 
 	bool                            job_hang;
+
+#if IS_ENABLED(CONFIG_PERF_EVENTS)
+	struct list_head pmu_list;
+#endif
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 71ee361d0972..24f2055a2f23 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -23,6 +23,7 @@
 
 #include <linux/perf_event.h>
 #include <linux/init.h>
+#include <linux/list.h>
 #include "amdgpu.h"
 #include "amdgpu_pmu.h"
 
@@ -72,9 +73,6 @@ static ssize_t amdgpu_pmu_event_show(struct device *dev,
 			amdgpu_pmu_attr->event_str, amdgpu_pmu_attr->type);
 }
 
-static LIST_HEAD(amdgpu_pmu_list);
-
-
 struct amdgpu_pmu_attr {
 	const char *name;
 	const char *config;
@@ -558,7 +556,7 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
 		pr_info("Detected AMDGPU %d Perf Events.\n", total_num_events);
 
 
-	list_add_tail(&pmu_entry->entry, &amdgpu_pmu_list);
+	list_add_tail(&pmu_entry->entry, &pmu_entry->adev->pmu_list);
 
 	return 0;
 err_register:
@@ -579,9 +577,7 @@ void amdgpu_pmu_fini(struct amdgpu_device *adev)
 {
 	struct amdgpu_pmu_entry *pe, *temp;
 
-	list_for_each_entry_safe(pe, temp, &amdgpu_pmu_list, entry) {
-		if (pe->adev != adev)
-			continue;
+	list_for_each_entry_safe(pe, temp, &adev->pmu_list, entry) {
 		list_del(&pe->entry);
 		perf_pmu_unregister(&pe->pmu);
 		kfree(pe->pmu.attr_groups);
@@ -623,6 +619,8 @@ int amdgpu_pmu_init(struct amdgpu_device *adev)
 	int ret = 0;
 	struct amdgpu_pmu_entry *pmu_entry, *pmu_entry_df;
 
+	INIT_LIST_HEAD(&adev->pmu_list);
+
 	switch (adev->asic_type) {
 	case CHIP_VEGA20:
 		pmu_entry_df = create_pmu_entry(adev, AMDGPU_PMU_PERF_TYPE_DF,
-- 
2.38.1.273.g43a17bfeac-goog

