Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E391C7AC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429210E0C8;
	Fri, 28 Jun 2024 20:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="d/EGVB6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C6E10E1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:59:05 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fa2ea1c443so8094395ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719608344; x=1720213144;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IORRBfp0Ewdr4NJXGZVsVL9mCEVSyuiUr27OIsqu6N0=;
 b=d/EGVB6NiLaFgtB+4T5Iex6Lyp4DrI6d4BkknN5JtpVQFcveM/gs/wUlgGMZ6Bsdv1
 zWsLXBAJC7KIT2B8MfayNK+5243reyjE0Y9gPdJnuMKd8yDMREPneI+0BPmgxwR29AAZ
 aB/1GHeWbuYUwqHvU6PaJGF4zqjNqp+SqPqCjumMZKQ5Z01xRHLrLv4QkKcVRSENMG1Y
 IIw+FjeV3kKhriPyVsK41R2kzhjcOQueiHmudTKeNoB2yTvh1K4UcnwWqzqtPnAggGnL
 1IzbaeYrds9Jwm0QO+ul+vTcH1IFSTNOtG5UQtiZ4n1dDL0N72NQDSUeB5NdcjI6UFq0
 aGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719608344; x=1720213144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IORRBfp0Ewdr4NJXGZVsVL9mCEVSyuiUr27OIsqu6N0=;
 b=gHCm0c7FvxZzV+GZe9mUEKCD/UDHDjAlOWD1yWf7/X/EX4YkW/X5ADLWqf7bn5p5DP
 vFzdyKD1hpi6L67r6cGavE7MiCdHBiDLd040ggz6dwNRZIQzfAx44mQRmXGPQJDPS0TP
 N0sganImyHTL3YHN1C9b/o7jZSmY+FPWcbSN8292xvFK+s+Jzwy81nbmIDkDwDNphCUq
 01Rxzo3BilxVh8lB3ZFxw7d5suTNpYvw2a7zOry5MQ0sCMwN8RqKdRDtSnuSSInHZiuF
 2w28bJQ2YAMVphSzi/daJuFcn8wHMJjS+axIsmFlJc5SAOjwR5djKcjcuDuXm0Zug8VI
 xu5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkTOCYQT2tit7qL+3vAhE9io+yb4Mh/475kSsH4O67Z6IMjfR1CE73QF+vGIMxqpB6c+4DF9iCy+kkeobCBbvFf6oIt6WZv3KtHsKbIGMk
X-Gm-Message-State: AOJu0Yz1VZRkGeEE87EaCSL5NyugRVobri7Cl7IX2M73qU4piIdWgVYd
 WEeOXbLm2xMm0iTN5ouyCbHPpZYG5TeDWN+SOcM1Zv9CELaccvks/IcI8VSVfw==
X-Google-Smtp-Source: AGHT+IExps8pzKWT7KxzQbIwg1CxXl9puvUHsya+uGADBA82LLEBRmY+uRgHuIHkiWG4e22L8hbQIQ==
X-Received: by 2002:a17:902:e810:b0:1f9:b974:cbd6 with SMTP id
 d9443c01a7336-1fa238e4711mr188163455ad.1.1719608344583; 
 Fri, 28 Jun 2024 13:59:04 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1568f4esm19709635ad.191.2024.06.28.13.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:59:04 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH v4 2/2] drm: panel-orientation-quirks: Add labels for both
 Valve Steam Deck revisions
Date: Fri, 28 Jun 2024 13:58:22 -0700
Message-ID: <20240628205822.348402-3-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628205822.348402-1-mattschwartz@gwu.edu>
References: <20240628205822.348402-1-mattschwartz@gwu.edu>
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

This accounts for the existence of two Steam Deck revisions
instead of a single revision

Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index ac8319d38e37..3f84d7527793 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,14 +420,14 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck */
+	}, {	/* Valve Steam Deck (Jupiter) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* Valve Steam Deck */
+	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
-- 
2.45.2

