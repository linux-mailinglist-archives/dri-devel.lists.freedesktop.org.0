Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779033D15A5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02BE6E8E3;
	Wed, 21 Jul 2021 17:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C1F6E8E3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:38 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id q190so2897591qkd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQx4vJF4nbTnubt+y8ro7ehWlOgw15WaIAgLNO4/XuU=;
 b=XuZXBkQQry7q5e1MlK1YEWdcRwdoh3d/1GvYWZbcbsQs6tPyKXr4hNgoZXtkGPbM3U
 zXvHm8bl8b+KlsEEL+b0R/NYYGVmmAs0OxjAwNwOpuiRZPRoU1EeMq20lSoATy8xbXy+
 Iz3ZWmjGLZsLbYkqrWyn6HqMsfWL9Bgppv16SO4kpxllj5OvZI3AV+Kx9DaCOM1iPlX9
 I9LNMH8fjrtFBTOmsNDl+EK9MGYhMXRBXDcwFFtn1EGhRW8clqtvEL7+6jB/pPFUQktt
 vnKO0IXpmPkWrH1oi1Uqwv1l7mASh9INKqeURN8XWc3nP7693ML8sWMNAntOLIXhZWVc
 tmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQx4vJF4nbTnubt+y8ro7ehWlOgw15WaIAgLNO4/XuU=;
 b=sdmzx8T/hd7GNvGQ1KRIbiQjynGFJHym065sZeI84IksfwfQowOS94EiHY0LCJHiGc
 BQvnagxLY6P/8vhfPZx9jJq8BRPOPzawOK8BcWM2xxpZ4r1LnPPKviq5/rOGa+blR0y1
 vGnCbJYgJT2cwVbR9pb+PDHAfX8xxKGNzYfdbv0zJMuXyzKui4sgTKI2H6WdS/erBXJ1
 QVvt9kRYyvolvc85r4JuhYIydpk+LaddXLMfX9KDuUnKe87agXRk5BeZG4AWZYMRap6c
 Uj91uQC12OuwY7+mb1VRdRxTLARXbjznHJ28kPO45giyh1kLCGwZuWsY9odhgEmRvPaJ
 lb0w==
X-Gm-Message-State: AOAM530kzEs1eDUzyPv2L3HoTtSJrRi+8iWG/Ha42wVzn9q15ip5gWFf
 J8gQh1WcZeJUHkl4xjITqK95oUTla4Y59A==
X-Google-Smtp-Source: ABdhPJzc+Z5xa05OLI8fVMC34IItRiMQ8fyFNJLoHQtSy2KF7wwKN9kpTUbeufcQbt5OgFPTacBHOg==
X-Received: by 2002:a37:62d1:: with SMTP id w200mr36074421qkb.11.1626890137604; 
 Wed, 21 Jul 2021 10:55:37 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id z9sm3636608qtn.54.2021.07.21.10.55.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:37 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 01/14] drm/mipi_dbi: Convert pr_debug calls to
 DRM_DEBUG_DRIVER
Date: Wed, 21 Jul 2021 13:55:08 -0400
Message-Id: <20210721175526.22020-2-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Use the drm logging helpers to output these messages to ensure they'll
be included by the drm tracefs instance.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-2-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/drm_mipi_dbi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 10b4e59384ae..2f661d7ff774 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -763,9 +763,7 @@ static int mipi_dbi_spi1e_transfer(struct mipi_dbi *dbi, int dc,
 	int i, ret;
 	u8 *dst;
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
-		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
-			 __func__, dc, max_chunk);
+	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
 
 	tr.speed_hz = mipi_dbi_spi_cmd_max_speed(spi, len);
 	spi_message_init_with_transfers(&m, &tr, 1);
@@ -887,9 +885,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
 	max_chunk = dbi->tx_buf9_len;
 	dst16 = dbi->tx_buf9;
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
-		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
-			 __func__, dc, max_chunk);
+	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
 
 	max_chunk = min(max_chunk / 2, len);
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

