Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D728D7074
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 16:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C863A10E071;
	Sat,  1 Jun 2024 14:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2u1SxR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792AB10E0B1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 14:41:18 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7e25bf84b58so119157239f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717252877; x=1717857677; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nvodmy/+o1CpqrThX4vjzT04rOZoUfiprza2mHo3aIg=;
 b=O2u1SxR3NF7bZFzKdHwmbzLR0WkIl6n2Hf4UqYhqdL26CqpD/KbP+UKACsyLHUKbGt
 JotNsDRQSQ1gju9qT7Rzvpkn6xC/CMWuWcOvc2WhUR5KklWzbBgA7fTrbY4uYC/lt1pM
 onpm5A/UCrnA6DnZ+TIklOcELZ/iYRfzdFJU68bRJpvNtloD2vwXeX9oA1i7YWIuFKgs
 Hdxk82lXpftAR4sWuoO7BQ5pIlp8YiEqTP7S0X2tD6COznVSstm0JCzEehmgniswlbTt
 9b1TgPnotXNJRXIeSI+PpQC5j8QcvX6H2JyFIVP9cuNrpV3i5yxB+YQZeMEGtYCQMNNQ
 sWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717252877; x=1717857677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nvodmy/+o1CpqrThX4vjzT04rOZoUfiprza2mHo3aIg=;
 b=DUZ6F7e0ojR4Zzh4bOYV2O87czrudni8gq8OfMgIuCxlClxB4+u06ejvr060TSdLY4
 +AMxbBtYRVs9PuSE2uizYKDDup/d0hybknpQU/+pq7Oj34ToU/lxqzPVp5pddanZPOsU
 rp5iHAmOQ5z4XpRLjLq22rwnZT0TVqM04jq+69QQTLWRZBT/w97vIVfcgQModxJg1n9P
 pj5b+UeP+wACctKcMmjJGU3VcWs7ilZ9WoNRPWBr4idiaPBzu9XpxNdiqiItsCnfY9vE
 6HhqbiDpPBZyQ7BX34fG8SJ/zHtN8Q37+/0x+6AgNPleuwf9pQ2UI5bjFH6go9pHsJYz
 8BYw==
X-Gm-Message-State: AOJu0Yw1Ur9Xk8OIyJ2ZSfHJMwCrANAQ6bSKBqFk4uwFdTYyETlyOeSp
 1wGXJXm72pACrMMWGd8sklozalHOs/B6budmfFlYKaL7225W1NYepnQmttSE
X-Google-Smtp-Source: AGHT+IGKx2NnzelycSxOsglojmYMn4Dyp9V7bQrXTzRbMPzofddfZdHsxjMHGmD35Kk02nnsH0La3g==
X-Received: by 2002:a05:6602:1541:b0:7ea:faad:74c2 with SMTP id
 ca18e2360f4ac-7eaffea6e2emr587615639f.9.1717252876833; 
 Sat, 01 Jun 2024 07:41:16 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:e0b7:c613:ee:e8f3])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eafe603e5bsm107424639f.52.2024.06.01.07.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 07:41:15 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
Date: Sat,  1 Jun 2024 09:41:02 -0500
Message-ID: <20240601144103.198299-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240601144103.198299-1-aford173@gmail.com>
References: <20240601144103.198299-1-aford173@gmail.com>
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

The VFP, HBP, and HSA are divided between the available lanes if
there is more than one lane.  For certain timings and lane
configurations, the HFP may not be evenly divisible. If the HFP
is rounded down, it ends up being too small which can cause some
monitors to not sync properly. In these instances, adjust htotal
and hsync to round the HFP up, and recalculate the htotal.

This allows 720P-60 to operation on an i.MX8MP with a four-lane
configuration.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No changes
V3:  Remove the MIPI_DSI_MODE_VIDEO_SYNC_PULSE conditional as
     requested by Marek Vasut.
     Removed the Tested-by from Szyprowski because I don't know
     if removing the conditional will impact his boards.
     Update commit message

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8476650c477c..e7e53a9e42af 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
+	/*
+	 * When using video sync pulses, the HFP, HBP, and HSA are divided between
+	 * the available lanes if there is more than one lane.  For certain
+	 * timings and lane configurations, the HFP may not be evenly divisible.
+	 * If the HFP is rounded down, it ends up being too small which can cause
+	 * some monitors to not sync properly. In these instances, adjust htotal
+	 * and hsync to round the HFP up, and recalculate the htotal. Through trial
+	 * and error, it appears that the HBP and HSA do not appearto need the same
+	 * correction that HFP does.
+	 */
+	if (dsi->lanes > 1) {
+		int hfp = adjusted_mode->hsync_start - adjusted_mode->hdisplay;
+		int remainder = hfp % dsi->lanes;
+
+		if (remainder) {
+			adjusted_mode->hsync_start += remainder;
+			adjusted_mode->hsync_end   += remainder;
+			adjusted_mode->htotal      += remainder;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.43.0

