Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FA6D15CA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 05:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094EF10E2F0;
	Fri, 31 Mar 2023 03:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BBD10E2F0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 03:02:17 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso24063757pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 20:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680231737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tgWvZk/iYpzKLUB9q2hMoB7/A/zWlAyiQxZw3rH6JH8=;
 b=nwdcz7JvfPrKuBBFQbSTVzhnbveNuT0oeykwisT1ina7IqUJiTRcjS2JroFUBNSsmy
 xC6i4I30tn1w9bVPBxXRrAq0+1KV8vSxunewLOqpms6By0zg2pdO+fvyJiIbv0tWauC7
 379VgmdQeQw7CMx+2tJU3li4owlI9njsAI/fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680231737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgWvZk/iYpzKLUB9q2hMoB7/A/zWlAyiQxZw3rH6JH8=;
 b=XXM10m4tFEVElADGP99gUe/y56kBwu55Vm+T4nSLYrHxwbmXcmjz8LpRUnr4xN0Tnp
 hUwq+wIhyB1kZewel1LMxXwmJxyPylrH2gGBFQd67x5IinvS1J/FyFYTp4LdXgpZPyFu
 FSIvPENFpVq50/MWnSKDK8zDEHw9QAf5Zgm8fF3AM9neLeTntvJTaJRbUZX4jpihWi34
 alEAYuIvlgpxq2lUTsoKghT7M3Rxs+kQsCssJWLpkW0JVzVc1FiHxNahextCAUJBl4Fy
 7D5++3WM0EPjMWhf1bHk4jqt3AZR1T6HW1YB8leLrdR7mb9U/42gPDoCS15FN2VCgHyL
 m/DQ==
X-Gm-Message-State: AAQBX9cra2fM+covp3OFwsjV+IE9MyIKrSkBaKObQ1/rqKWqxPQ86Wsx
 hUQzdiQ5H9m4/KiVz/oTHL41HQ==
X-Google-Smtp-Source: AKy350YBPmqeZ+L0wfFVGJRQxmR8TfTsUMdXcRm/uj3m1QuxtTD528I3y2vtYKjKoem8ZXpz56msnw==
X-Received: by 2002:a17:902:e812:b0:19c:e440:9256 with SMTP id
 u18-20020a170902e81200b0019ce4409256mr31915039plg.35.1680231737143; 
 Thu, 30 Mar 2023 20:02:17 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:d07:95ff:f44a:71]) by smtp.gmail.com with ESMTPSA id
 b19-20020a170902d89300b001a072be70desm429750plz.41.2023.03.30.20.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 20:02:16 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: ps8640: Use constant sleep time for polling hpd
Date: Fri, 31 Mar 2023 11:02:04 +0800
Message-Id: <20230331030204.1179524-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The default hpd_wait_us in panel_edp.c is 2 seconds. This makes the
sleep time in the polling of _ps8640_wait_hpd_asserted become 200ms.
Change it to a constant 20ms to speed up the function.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index b823e55650b1..c3eb45179405 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -184,7 +184,7 @@ static int _ps8640_wait_hpd_asserted(struct ps8640 *ps_bridge, unsigned long wai
 	 * actually connected to GPIO9).
 	 */
 	ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
-				       status & PS_GPIO9, wait_us / 10, wait_us);
+				       status & PS_GPIO9, 20000, wait_us);
 
 	/*
 	 * The first time we see HPD go high after a reset we delay an extra
-- 
2.40.0.348.gf938b09366-goog

