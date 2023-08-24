Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5427879A8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1729B10E5B9;
	Thu, 24 Aug 2023 20:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDD810E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:53:57 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-64c5f5d6f04so1562866d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692910437; x=1693515237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbYHPtht31pDWnNKizt7dLhO8dz2qVeAy2pQOUOnpoY=;
 b=NHHKIv0g2gNu0NZm2jVFFZke17sz2Hi1xeg0ElQGA/Jm6r+zD3WQaAJk7nDN0LS+y8
 vLO4VUfRw7aLTyfm43lAv7m5OoHobehqmperJyog7ZK7zWX5qmin4uRax2Kir1bYDGTz
 iYDvcHh804LqL0Hd1sVrwAPOo4QR9a/eHyv+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692910437; x=1693515237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbYHPtht31pDWnNKizt7dLhO8dz2qVeAy2pQOUOnpoY=;
 b=NkGVBsRN8pZCjQCStN0h5fsoB4ZyDV68PkDfWSPM3EF5LogQUsad4xLXZ2qchGq1un
 t3+xpklbyhvqvD0nMhAtoBctZO77+0QzcVNe/bJ8bQ1HUR4ZtchnIPiBPT7FVz2C+M6f
 LcSP0vNZ0iZuLfidY9Skh+y5b31HX/O4E/Aek1/GDhOL2oES+sZ7o3rQlm6fBAlsbX0/
 lhM13setl0mbXyP3cCSKoFEhnxg9spopuIZNOJSH/jzyfttCcZUOn22EDpDzDmnuJlqG
 fGwQ881qBCF/BfIuGOgJLJ7dJvGo6jAoLLI4F3k94wTM5j6YFgMDjG5gSDt1BUZgAfkS
 Y3Zg==
X-Gm-Message-State: AOJu0Yxf4Ysg7C66Ve8HmehUgWk9FRRv8jQSex+TrrLhFy5S36G14Cuy
 z5tA0Dl8unbC/ASRlrCtH05Bcw==
X-Google-Smtp-Source: AGHT+IFiVJOd4KML3x4eVNMPjMGguJR4j6N11CQy6AOXEp4AEnkN6mUalwaiteIIJ5VznutRDCHIZQ==
X-Received: by 2002:a0c:aa42:0:b0:647:290f:b9a with SMTP id
 e2-20020a0caa42000000b00647290f0b9amr14245061qvb.62.1692910436958; 
 Thu, 24 Aug 2023 13:53:56 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a0ce442000000b0064f5020df91sm62038qvm.28.2023.08.24.13.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 13:53:56 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/6] drm/i915/dp_link_training: Add a final failing state
 to link training fallback
Date: Thu, 24 Aug 2023 16:50:16 -0400
Message-ID: <20230824205335.500163-2-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824205335.500163-1-gildekel@chromium.org>
References: <20230824205335.500163-1-gildekel@chromium.org>
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
