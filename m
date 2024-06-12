Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463B8905E6C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 00:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF1E10E932;
	Wed, 12 Jun 2024 22:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ByBo8gxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9968710E932
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 22:24:54 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-6e9f52e99c2so269642a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231093; x=1718835893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cG9YsnvV0dqFs63XW3w7FcDwXhGHgBYJnS7/vNMDsUI=;
 b=ByBo8gxyw7cbIrmx/A4eVeXJe3Se74vbY7a0Pr2YGvblMSTr/wyrQNsfRK06vzSFZ8
 rQ/gmlO8iFE3GNVDoMxga87f0dEMAkHceFPrm9f73e9WeauispjlRqRvQ1jJBHvWuO44
 kLljK/Smp61Uwc4bNw8vCYfA3VRLLXbqxY4Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231093; x=1718835893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cG9YsnvV0dqFs63XW3w7FcDwXhGHgBYJnS7/vNMDsUI=;
 b=e9MUur7tf8o/MDWJljJqudoXmGTb9KHUdwhdTvisnCjHc+h0E4iOMfRfFscW68DNi8
 l+8eQeNKT0Eb8ELVaEBWSVctwyyNjDtDjWDm2hmIJJoMd7MvRo5x/SoK86xyWTrFIMVm
 p2NiX7XIv4zBdLv8+RRYZVuMhgXZd3G4BeP6BwNajamxhd7jlGhNWvc3uqRaWGCTARt+
 4SuXndsn9wRQ9YnMF+pu3NIKZLcbYqaBhF7YrE/EovV+mteW0WNTlVmj7FSMOP/u8Gfg
 jbijf3r7UPJV8zbimtchaE441xKe3kCYow9EUAC0hAaRPNLffoqGlG63Uvp07mznZBUG
 c7bA==
X-Gm-Message-State: AOJu0Yzm7o/iQccG8fo2n939EIbKTfh5WuFSJHekA9ua0vAxeGgJgnHX
 ggEEa2kVLszfDm2+EmIU9bJ7tUhVSWweLXdBjZkGJDNeQ1fTH2hqCsHm5mnNy4z/uIWqOFt7TH8
 =
X-Google-Smtp-Source: AGHT+IGI/wCAa9iSAbUyULm8uaZzcZmzyBGn6eSxHSxLyKPWYAONixriz1scQsX3eltdmrQaRYhqHw==
X-Received: by 2002:a17:903:1cd:b0:1f7:234b:4f28 with SMTP id
 d9443c01a7336-1f83b60954cmr37501915ad.25.1718231093331; 
 Wed, 12 Jun 2024 15:24:53 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:24:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] drm/arcpgu: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Wed, 12 Jun 2024 15:23:44 -0700
Message-ID: <20240612152336.v2.4.I8a0a246fea222059881d01a8fff2adcf7ef3d7a4@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240612222435.3188234-1-dianders@chromium.org>
References: <20240612222435.3188234-1-dianders@chromium.org>
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

 drivers/gpu/drm/tiny/arcpgu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e..85b21f5aac55 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -412,6 +412,11 @@ static void arcpgu_remove(struct platform_device *pdev)
 	arcpgu_unload(drm);
 }
 
+static void arcpgu_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id arcpgu_of_table[] = {
 	{.compatible = "snps,arcpgu"},
 	{}
@@ -422,6 +427,7 @@ MODULE_DEVICE_TABLE(of, arcpgu_of_table);
 static struct platform_driver arcpgu_platform_driver = {
 	.probe = arcpgu_probe,
 	.remove_new = arcpgu_remove,
+	.shutdown = arcpgu_shutdown,
 	.driver = {
 		   .name = "arcpgu",
 		   .of_match_table = arcpgu_of_table,
-- 
2.45.2.505.gda0bf45e8d-goog

