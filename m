Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3547866B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA2510E488;
	Thu, 24 Aug 2023 04:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEBA10E488
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 04:33:22 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-76d80d35762so448290785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 21:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692851601; x=1693456401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbYHPtht31pDWnNKizt7dLhO8dz2qVeAy2pQOUOnpoY=;
 b=HpD5/yjEV9gbcfWpO0/u195JDJPIHHzCl80+6Xapyfah5x2wta7bQ9pp6NgBKBpJnU
 PVyON+bIvKcA5DjiGD8nDLI4OBXgxhAWxDKrKUmlllKq8KjHLIPFGNmUsT7RebR22G/2
 3rKR4QVUuKL4ishp7IiBn+3rWoEj7Lg5y8FwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692851601; x=1693456401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbYHPtht31pDWnNKizt7dLhO8dz2qVeAy2pQOUOnpoY=;
 b=VliMpZgfbMKPjRrk5iy0lVFAGqWYEIBuMxTdgmiOg2XFZE5JAvLCkummR3PWpWH+Ln
 FcUgsA5ZIdKevBiO9EZNrb5rSGSxOx0q/B0g42Of1kddPEWmF2DqUPcPdVDwg+W8h2iT
 I5o9wZjSchAU5HKi2KZyJ6AYTnSbpzIL6gD4Y/iPIrAuBPVOg+1XoUOY9o7CD4qVzwYL
 +2sp4oxi/8rtSXzj2ChdnT8BXwZ/yMrI9mV/xKYBvXhKH8ma2I8pcQEiyPnKXGnCGJCa
 cJuBvWwhMLW+4VZEMwd1N1D2i/Yeh7B88smMlR4WjeutblQGhWWy0CnLVhR2dJhsPDzC
 TQYA==
X-Gm-Message-State: AOJu0YyKLx/c4D1W9udb8UywEnOmN19RYKvE2VW2N4oTTO/EG4QLH2X7
 S/bTJwZ5em3kAf02o2hmS46RseTdS1TXjyPU6tQ=
X-Google-Smtp-Source: AGHT+IEwgphIzgsVT/MGMDFITu0WNe7HEnJmLNjxhl4yegaUOmwRsnrLn1ijvb+iTsc+mSddAw1SwA==
X-Received: by 2002:a0c:8ecb:0:b0:63d:657:4cb9 with SMTP id
 y11-20020a0c8ecb000000b0063d06574cb9mr14409771qvb.42.1692851601499; 
 Wed, 23 Aug 2023 21:33:21 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a0cca83000000b0064910f273aesm4913632qvk.146.2023.08.23.21.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 21:33:20 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/i915/dp_link_training: Add a final failing state
 to link training fallback
Date: Thu, 24 Aug 2023 00:31:04 -0400
Message-ID: <20230824043240.323564-2-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824043240.323564-1-gildekel@chromium.org>
References: <20230818170156.2194015-1-gildekel@chromium.org>
 <20230824043240.323564-1-gildekel@chromium.org>
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
Cc: seanpaul@chromium.org, Gil Dekel <gildekel@chromium.org>,
 navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of silently giving up when all link-training fallback values are
exhausted, this patch modifies the fallback's failure branch to reduces
both max_link_lane_count and max_link_rate to zero (0) and continues to
emit uevents until userspace stops attempting to modeset.

By doing so, we ensure the failing connector, which is in
link-status=Bad, has all its modes pruned (due to effectively having a
bandwidth of 0Gbps).

It is then the userspace's responsibility to ignore connectors with no
modes, even if they are marked as connected.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7067ee3a4bd3..2152ddbab557 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -276,8 +276,12 @@ static int intel_dp_common_len_rate_limit(const struct intel_dp *intel_dp,

 static int intel_dp_common_rate(struct intel_dp *intel_dp, int index)
 {
+	/* This occurs when max link rate drops to 0 via link training fallback*/
+	if (index < 0)
+		return 0;
+
 	if (drm_WARN_ON(&dp_to_i915(intel_dp)->drm,
-			index < 0 || index >= intel_dp->num_common_rates))
+			index >= intel_dp->num_common_rates))
 		return 162000;

 	return intel_dp->common_rates[index];
@@ -318,6 +322,9 @@ static int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
 int intel_dp_max_lane_count(struct intel_dp *intel_dp)
 {
 	switch (intel_dp->max_link_lane_count) {
+	/* This occurs when max link lane count drops to 0 via link training fallback*/
+	case 0:
+		return 0;
 	case 1:
 	case 2:
 	case 4:
@@ -672,7 +679,14 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 		intel_dp->max_link_lane_count = lane_count >> 1;
 	} else {
 		drm_err(&i915->drm, "Link Training Unsuccessful\n");
-		return -1;
+		/*
+		 * Ensure all of the connector's modes are pruned in the next
+		 * probe by effectively reducing its bandwidth to 0 so userspace
+		 * can ignore it within the next modeset attempt.
+		 */
+		intel_dp->max_link_rate = 0;
+		intel_dp->max_link_lane_count = 0;
+		return 0;
 	}

 	return 0;
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
