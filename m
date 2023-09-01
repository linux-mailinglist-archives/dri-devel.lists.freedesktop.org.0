Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C4790426
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC9C10E80E;
	Fri,  1 Sep 2023 23:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F140410E80D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:34 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68a6f6a66e1so2105433b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611754; x=1694216554;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cc544bXmls05RiqEx12Xvv3H5cbPiv1GFPSua0tXsTc=;
 b=DKW9Dpp5k8bQjCDXcSs8EcQS2KIOq5lRTRy+xqvQr0YEf1idm50sUo30tuMRnRS/9g
 0lj1WPh1Rwzuy7CIjxtXPGtMyaphHqlxIUtyDe75j5TXsIbgsMzv8ptG9jxRHx6tr7PN
 yvwI1aWWOGTdsmQWvUqzxxMAJHENrNSTiDV/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611754; x=1694216554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cc544bXmls05RiqEx12Xvv3H5cbPiv1GFPSua0tXsTc=;
 b=kMFDjBxwWdKhKnQNPgpSMqsbkQXcRvWNmDvaeTcT1a9kBD1IMoAxB1xvJm1XE6jDn5
 Qo96i7qbOrA2BAgBjaRKMKDU8Jjh6n8zMt/Ey9x7A4qAfkqxZgai6qhfRmQiTXcKbIy5
 Rp1VCnlO5ftOvyD/CakC8QkvQZcYJQTwFNRm9qj7twjvX8WneHUaIo03j5RI4aIT3+MF
 9MeQSg32Ob+Rn2ygCJjnj5AQFeL9HBY9/mCZdtK3RDkzghAxIJZbNmqlpVw1EiFt+pQY
 BPwPhcFhYWpL4l44y2pmspHIGJG7R3iJbqCsAobgR/dTUeo22dsMEIumqmjVMc0i0H3K
 Ohvw==
X-Gm-Message-State: AOJu0Ywn+jmZXsSBgru/w5KtoXRSZRVP+NbgYwIKFqzYLyx4sUc7Um+n
 0WKJc9+Seov6Q1CP8mfNe/IPsdPDJ56aHOsXAx6ZJqB6
X-Google-Smtp-Source: AGHT+IGAoNt4CxHEBkp++4gMl/OPzz+Yhylo+U5CTknKu4gd+KmH9VfQD9fB/cKCtbNNcv6lJ8N/6g==
X-Received: by 2002:a05:6a20:7da0:b0:126:9081:2156 with SMTP id
 v32-20020a056a207da000b0012690812156mr5068857pzj.4.1693611754018; 
 Fri, 01 Sep 2023 16:42:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 04/15] drm/kmb: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:15 -0700
Message-ID: <20230901164111.RFT.4.I20cb02bafa7c2368e4bd579df0716eb62a3a21bf@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: edmund.j.dea@intel.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, anitha.chrisanthus@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/kmb/kmb_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 24035b53441c..af9bd34fefc0 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -476,6 +476,11 @@ static int kmb_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void kmb_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static int kmb_probe(struct platform_device *pdev)
 {
 	struct device *dev = get_device(&pdev->dev);
@@ -622,6 +627,7 @@ static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
 static struct platform_driver kmb_platform_driver = {
 	.probe = kmb_probe,
 	.remove = kmb_remove,
+	.shutdown = kmb_shutdown,
 	.driver = {
 		.name = "kmb-drm",
 		.pm = &kmb_pm_ops,
-- 
2.42.0.283.g2d96d420d3-goog

