Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD1C983BBA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 05:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F65010E4C7;
	Tue, 24 Sep 2024 03:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Sk8ivh6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D010E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:53:24 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7d666fb3fb9so2427339a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727150003; x=1727754803;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zn7NLLo5vu43wPcgUUT5FAE6ycLFHPC4WAcceh7PLg=;
 b=Sk8ivh6hW0Cnp854sc55aLAlzQ1tEPtFxqDsxusDv2XzDLkQxfhTXV0yOngPgx5ECk
 MRQ2LcUkmzfDE0Spg6vGO0ZAnnH7M51Dfjh1Wy7tKYAQtRRhirl26kG4H1O8oW1GzVCU
 zIyU01F07tY9D2ufWMD5JK9mYEV2CILtGXVHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727150003; x=1727754803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zn7NLLo5vu43wPcgUUT5FAE6ycLFHPC4WAcceh7PLg=;
 b=g6kXsgUvxloJHg2SHYKmwSIGOdvXqW0AkvzU8jR1TkuvLzyjS/Pnhey3I7je+bngBU
 sx13iGea4GGsnbxA8r0cMZ0PE+vz+bq7IAZhR0t8cxzlzqJSwQTmq8T6uplfjT4IdmiG
 1a1RVGam+DmMlHPiHvmtweoQevAZ/ndCw1qz1zol8mvX6G1zDoEXZdOrPBL3/Up5SosG
 b9lhluaYSB3y7Ga/P2xrDYDvbvqjrG7RfC+cmFnK8sPCXAH6z86e2D65lNbVyPRlwQLa
 cD/Mq03H9jXawTwtdQOmqX0mZSzIA0YFKjZISP2uiRCmPyNQ1SZwIOE+S2QdO38q8Y2+
 CbSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJs5CtQJWyv85d+qZvkrkEjbazMQ4En77eH7QyC8yJX9ECJB/CmtYJ1t5FD6xl72xVaIVT44vNzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxNIXuL/J8mKUaHhLavKlbjfyWffKx8ncOhyvYVXxxgDwzYs2S
 iAk1WJchwtMzNIOnJWZMrRs/ccUnHesgkgiU3c+Zo0iu+pedXC2X5UtQB3d1dw==
X-Google-Smtp-Source: AGHT+IFX6kIi8aI27QC+U0PJmuzc8q6Ze0ZE/jdApjgn9l0PmrsjgyTyMjAA5F8RaDDP42xYMp4DKA==
X-Received: by 2002:a17:903:1ca:b0:205:753e:e2e6 with SMTP id
 d9443c01a7336-20aed0c3544mr23884325ad.16.1727150003606; 
 Mon, 23 Sep 2024 20:53:23 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:727c:308e:bfa8:9ccb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1869000sm2555335ad.307.2024.09.23.20.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 20:53:23 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/2] drm/bridge: it6505: Drop EDID cache on bridge power off
Date: Tue, 24 Sep 2024 11:51:47 +0800
Message-ID: <20240924035231.1163670-3-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240924035231.1163670-1-treapking@chromium.org>
References: <20240924035231.1163670-1-treapking@chromium.org>
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

The bridge might miss the display change events when it's powered off.
This happens when a user changes the external monitor when the system
is suspended and the embedded controller doesn't not wake AP up.

It's also observed that one DP-to-HDMI bridge doesn't work correctly
when there is no EDID read after it is powered on.

Drop the cache to force an EDID read after system resume to fix this.

Fixes: 11feaef69d0c ("drm/bridge: it6505: Add caching for EDID")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/bridge/ite-it6505.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1e1c06fdf206..bb449efac2f4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3101,6 +3101,8 @@ static __maybe_unused int it6505_bridge_suspend(struct device *dev)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
 
+	it6505_remove_edid(it6505);
+
 	return it6505_poweroff(it6505);
 }
 
-- 
2.46.0.792.g87dc391469-goog

