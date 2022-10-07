Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5409D5F7E5A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 21:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A739010E126;
	Fri,  7 Oct 2022 19:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4210E125;
 Fri,  7 Oct 2022 19:53:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p26-20020a7bcc9a000000b003c384e59047so1184094wma.4; 
 Fri, 07 Oct 2022 12:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z8rAF2O4yeCpXpnecitKEaHx4FvdtHm+sRpB2Z22bUo=;
 b=StHGyKvomVuKHeS4JcqqnrXu6vz7Gl8mGv7UkKkDtOsQAALjpB0Ib6Yti3tNPmwr2l
 YQahqqornyZQT6Vw7l+X8PPmRq963saK0sLOtLxPiw1rQI8emHl3NbCgOrgoXsPuwzqB
 5QeaDh5I8qzl0sm7IdXmkE5H7h4JOUDfo7WNYGHk1Tb/PSyUfBJIGItknYanTWduWI8s
 sHQbATmjMCy/CU5B9czznffV52+0Pk00Eu3Bq99TYLdgfY2B2Qyjrb4BnmNaZWKB6tp9
 0L2+VYb5LdXe+AeGgLuOqOWfm5mv/NZkgWb4KLJ7sdAR2m9fY/XRztwc5/8XuA7cBb+K
 T/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8rAF2O4yeCpXpnecitKEaHx4FvdtHm+sRpB2Z22bUo=;
 b=NUVYl4Y0v6ubaf+bDl5nv2ktrMKuP/ZXxWxoDZRA3ertla/GvMkddLLVP8LKMOPgqb
 gFbI4uP3D8gWggQGQWSjEETrgPq8mIiUblJLE7O19+ZA0Z3cgQ7NH9O89SSjfLA6ZUbN
 SEuxAP1cKFygzkL7eX12h/0EYT4dnJYEJ6+HwZk6nhNJRBaHi+4WC7EdAYFR3oHbD4jU
 7mYFjHNGGatPAFGEYoHWa7ojHRk9uecvRlK6ozvY6qv5ortn5bIR73xBVPqtCriq8GxV
 TuingMhdSoCsl03uO5Yy88o6I8NaksoMLWPzeAmCCrN8w+oMiw8/y5uCeNNYU1iEOO+0
 jxFw==
X-Gm-Message-State: ACrzQf3mjS/NNOdq0fyRwrIxiNd99NDLTiyr7UcRulzDByyfgR2xXY6R
 V5xxKetBNpKjvTSlJ2Tepp4=
X-Google-Smtp-Source: AMsMyM7alIwgvl0Zu7M5vCk5X5x6zVQWzj6M6XZlvvnQJWIo43xPeL2gkcOIO8gVIElZyk8Sbqx4/g==
X-Received: by 2002:a05:600c:3d05:b0:3b4:9a42:10d0 with SMTP id
 bh5-20020a05600c3d0500b003b49a4210d0mr4488015wmb.135.1665172426779; 
 Fri, 07 Oct 2022 12:53:46 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l15-20020adfe58f000000b0022ac119fcc5sm2687448wrm.60.2022.10.07.12.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 12:53:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/perf: remove redundant variable 'taken'
Date: Fri,  7 Oct 2022 20:53:45 +0100
Message-Id: <20221007195345.2749911-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assignment to variable taken is redundant and so it can be
removed as well as the variable too.

Cleans up clang-scan build warnings:
warning: Although the value stored to 'taken' is used in the enclosing
expression, the value is never actually read from 'taken'
[deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0defbb43ceea..15816df916c7 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -656,7 +656,6 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
 	size_t start_offset = *offset;
 	unsigned long flags;
 	u32 head, tail;
-	u32 taken;
 	int ret = 0;
 
 	if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
@@ -692,7 +691,7 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
 
 
 	for (/* none */;
-	     (taken = OA_TAKEN(tail, head));
+	     OA_TAKEN(tail, head);
 	     head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
 		u32 *report32 = (void *)report;
@@ -950,7 +949,6 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
 	size_t start_offset = *offset;
 	unsigned long flags;
 	u32 head, tail;
-	u32 taken;
 	int ret = 0;
 
 	if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
@@ -984,7 +982,7 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
 
 
 	for (/* none */;
-	     (taken = OA_TAKEN(tail, head));
+	     OA_TAKEN(tail, head);
 	     head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
 		u32 *report32 = (void *)report;
-- 
2.37.3

