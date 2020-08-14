Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB92446BD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2236EB13;
	Fri, 14 Aug 2020 09:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F826EB13;
 Fri, 14 Aug 2020 09:05:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k20so7301553wmi.5;
 Fri, 14 Aug 2020 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRT5IxQW31/cWLOlxefHWhvflnlqyP6TcqmdhPBQu3E=;
 b=gpvcCjXtfa5TJBoLojYNhodiFxl3dssIiiPpW649i3FkUCzofAQNFBgI2yb253DFIC
 lBiYPbCeC8SxI6QDBwFngeQb2jQjKlPzBkCouDkvqswPWCnJrwQA7gX5a1I15kJLOqfG
 F9I7Ysi0hU6EnabUyIBQv44uT/aWJP/pWQOoMdzsDK1qz7I+uo8c8YOkspG3natl9Ead
 KDYP5Rr2ZcGnl+L+xFTFbf3IOb3vLs38Zh+Sm+RR1u65PV6jaJZF/MH2DvtgSKCU8NPT
 UgkQdQthlDrYbN8RZglMawQqC0ZePiKF2SQr7eWH4+kyt5z11uirIIWYkCijVD+H1B3c
 EGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRT5IxQW31/cWLOlxefHWhvflnlqyP6TcqmdhPBQu3E=;
 b=h6FrMtCiicq8SMMKZfwx4xzoiq+cgbltv4M8CjvgUHP186WgMD5L/UzyCUB3Y2zV0e
 vvHwmVN5gUbKTsaFUIDUY82YZIDswcG+WkM+pIzNVrHq8Fr/k1X3AqJdMsRxWsz79Wsc
 qBlDuwcII4xoBQmeKPQ6QoJwrPRyNcmUSOkUYbblJEOMQMcpN7N4CcIrxRE6ECjyjtOW
 oa7rNVOP7IVDQNpAGvxqh05VzcL57hz/i/vaGOnLuBqpX3ikZcC4esegDC6JS8Z8w9Jj
 kHyIYvGLtBd0Z8LdOzC23Ubyk2LfVS1LVq2t/VNThp4LUg2q8w00kK/6OZBCaA8bM6B/
 2VDw==
X-Gm-Message-State: AOAM533fSQYjL+DjkU/PcoHwlyOjhjVifU0PPzNnQEVB4FLhbrmR4m7a
 M5ACZMIuomVRC6muxBI1Yxk=
X-Google-Smtp-Source: ABdhPJxFOVHTXeF5CW+md3xRzIj05YXUjn0KLfX6SFojUdOXMVIJ6AB7QEqc/h1xOAQRM/T/Ef0U8g==
X-Received: by 2002:a1c:38b:: with SMTP id 133mr1580959wmd.153.1597395933750; 
 Fri, 14 Aug 2020 02:05:33 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id m14sm14046745wrx.76.2020.08.14.02.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:05:33 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/etnaviv: add total hi bandwidth perfcounter
Date: Fri, 14 Aug 2020 11:05:03 +0200
Message-Id: <20200814090512.151416-4-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814090512.151416-1-christian.gmeiner@gmail.com>
References: <20200814090512.151416-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two perf counters represent the total read and write
GPU bandwidth in terms of 64bits.

The used sequence was taken from Vivante kernel driver.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 35 ++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index 782732e6ce72..b37459f022d7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -69,6 +69,29 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 	return value;
 }
 
+static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
+	const struct etnaviv_pm_domain *domain,
+	const struct etnaviv_pm_signal *signal)
+{
+	u32 clock = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
+	u32 value = 0;
+	unsigned i;
+
+	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
+		clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
+		clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(i);
+		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+		value += gpu_read(gpu, signal->data);
+	}
+
+	/* switch back to pixel pipe 0 to prevent GPU hang */
+	clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
+	clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(0);
+	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+
+	return value;
+}
+
 static u32 hi_total_cycle_read(struct etnaviv_gpu *gpu,
 	const struct etnaviv_pm_domain *domain,
 	const struct etnaviv_pm_signal *signal)
@@ -102,8 +125,18 @@ static const struct etnaviv_pm_domain doms_3d[] = {
 		.name = "HI",
 		.profile_read = VIVS_MC_PROFILE_HI_READ,
 		.profile_config = VIVS_MC_PROFILE_CONFIG2,
-		.nr_signals = 5,
+		.nr_signals = 7,
 		.signal = (const struct etnaviv_pm_signal[]) {
+			{
+				"TOTAL_READ_BYTES8",
+				VIVS_HI_PROFILE_READ_BYTES8,
+				&pipe_reg_read,
+			},
+			{
+				"TOTAL_WRITE_BYTES8",
+				VIVS_HI_PROFILE_WRITE_BYTES8,
+				&pipe_reg_read,
+			},
 			{
 				"TOTAL_CYCLES",
 				0,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
