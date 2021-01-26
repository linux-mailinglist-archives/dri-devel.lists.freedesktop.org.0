Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50EE303110
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 02:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E6F6E3E3;
	Tue, 26 Jan 2021 01:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63E6E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 01:18:20 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id q20so9437103pfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ls++7dy/D+OE/0mAqQ1jphnKDBawhWOPw5Hl68YzZ1w=;
 b=Cyi9mPit6QVOeNbwYj3sYqdYucTQltoS+LZ51/lagZE5y/+WXbGIT5fEwOAmwfoFcn
 9aVCh0beghqO+EFoeugRybVafeOjbOb6HZ4PnWXuGgclgUDiXO8LirlTY4YqdyOCG64o
 YnRilRHSE1dRWvETlj2hoEg3v+LRQ9kMIFPps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ls++7dy/D+OE/0mAqQ1jphnKDBawhWOPw5Hl68YzZ1w=;
 b=H3555I78HCutVRsKeex8F2SMmD3p9MHs9xVUVjizsug34264TOswyRmBsVJ+Ql7vx0
 zn6EDbgkYb3wwdk0bk3GsA/mI5lT8rcGVkwV8FXlgmDgCO9g59O9KiW4h5kfTnCkvNku
 PGTt6pY/0bdU5/QCKvIHKPyepu6YItQUVDs9buMDNwnlon9EO/gkpEKOSpMXACJYYm4h
 RnfeTKTLkdZqx/fjrP9HAS8hnRjTY9qgi0lm+iS4Y6C0iHzlzW8TepoWQ3Iyx43mCeeO
 9BpjUxrluEXzY0KZeuAtIXc4LNNopo1yWq2TMOf812YTPVRvdPYwH4WMkIpW5XvceDRw
 Ov+Q==
X-Gm-Message-State: AOAM531QFb8cVMHzVFePYV5Ru8SzFoALPlz8gbYssFm0ZWpL4DYjlrjK
 FeOKW+ae2bMPoLSk8CV0dhhhUqPOO5Zi2w==
X-Google-Smtp-Source: ABdhPJzOy5uWtFIJjmtZn2uW8/3d8qaf1wHw+YrW+ZAtYsAizlSsy77+L1pukRlfkj/rhZPJKA/AOg==
X-Received: by 2002:aa7:829a:0:b029:1c1:1a3f:db25 with SMTP id
 s26-20020aa7829a0000b02901c11a3fdb25mr2821915pfm.60.1611623899866; 
 Mon, 25 Jan 2021 17:18:19 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:19 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Tue, 26 Jan 2021 09:17:58 +0800
Message-Id: <20210126091747.v11.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210126011759.1605641-1-drinkcat@chromium.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 hsinyi@chromium.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPUs with more than a single regulator (e.g. G72 on MT8183) will
require platform-specific handling for devfreq, for 2 reasons:
 1. The opp core (drivers/opp/core.c:_generic_set_opp_regulator)
    does not support multiple regulators, so we'll need custom
    handlers.
 2. Generally, platforms with 2 regulators have platform-specific
    constraints on how the voltages should be set (e.g.
    minimum/maximum voltage difference between them), so we
    should not just create generic handlers that simply
    change the voltages without taking care of those constraints.

Disable devfreq for now on those GPUs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---

Changes in v11: None
Changes in v10: None
Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - devfreq: New change

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 7c5ffc81dce1..a544ae1e560a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -93,6 +93,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
+	if (pfdev->comp->num_supplies > 1) {
+		/*
+		 * GPUs with more than 1 supply require platform-specific handling:
+		 * continue without devfreq
+		 */
+		DRM_DEV_INFO(dev, "More than 1 supply is not supported yet\n");
+		return 0;
+	}
+
 	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
 					      pfdev->comp->num_supplies);
 	if (IS_ERR(opp_table)) {
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
