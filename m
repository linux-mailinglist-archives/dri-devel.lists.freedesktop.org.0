Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82081F212B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF7A89E38;
	Mon,  8 Jun 2020 21:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F76989E11
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:20 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g11so2598886qvs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fSV0plHNICcey+d5PgbYTWUOPiO4OxuQOOITA9OIC4I=;
 b=CfZbfsiKXW3Hdu2U8BpaMFpjWqFWpJcgn8dGQJHpZO3HctotL+Z6CsEvT3lSmm2AkI
 +NmBMJJ9SyXTYRc6YIkGrf8FzWye54+0yaB05AVON9xyfidZFGB47NAGal64vLGoIg7m
 Usv7kxERMeYWXKPC1zkz5uTFr+OhPuuc22fqOjZ7VPMYZn4cRHKM4qO15BMuupp/8NYr
 Dm3wTdKahs4py/+BFOqhblqAQWMcgf+4wvBfTZxcLzT68XGvHHlix05sFafQ0DHqGn/G
 ypmeEFuPOE/i8CJ2LnbHO3dfstUrh9Cp0eQB0gDVSbEL6P/O+uSHfRaN2dTVcyKv1Gi0
 I36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fSV0plHNICcey+d5PgbYTWUOPiO4OxuQOOITA9OIC4I=;
 b=a1/nxAz0oacJywC+1I+krCHnwHH3kud7dc2b7cZbYKG2LrC91wWC4lFbhjxn/0RfG7
 8EUxjBC7boGWBcyVaPRa5r55RjLauZSTcZzwblFaY7ealAuG+kqKV9Qwa//2xWdN1XoR
 ovUo4uCpECrhGhg1pU9V9jRUR2lYedv5yoiCLDd2ypgo5765FEPzQ0OsVn4FpurXnm7a
 Xi9k2Zn3Xnr9UsgRWedHP9wz+xk0alNCNIEYX2x3IcTJI8rAop/ggxOhsXnCskUNmK6X
 O+h4e3d9cOPPKBw+GXhFWXxI6B1OXLicFfTmlHHcobzFC3jiixzQ+XQx8nj75Y1NBbjd
 mung==
X-Gm-Message-State: AOAM5327XcTJ+xBKeZB4V27RqKuf5kwHnhaw3xDoSMDFkERT85tHMOqW
 CB2/cmkbqbqlmNu9LXysU2IjJdc/nks=
X-Google-Smtp-Source: ABdhPJx7bpLerv0Ttkg4fz3fi3Cfj/4s6rnupNIU94+71vBIrg0FScv5JSA9QCjPVQiAiJdnj5h2Ow==
X-Received: by 2002:a0c:ed26:: with SMTP id u6mr591369qvq.141.1591650318988;
 Mon, 08 Jun 2020 14:05:18 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id i3sm8071302qkf.39.2020.06.08.14.05.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:18 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/13] drm/mipi_dbi: Convert pr_debug calls to
 DRM_DEBUG_DRIVER
Date: Mon,  8 Jun 2020 17:04:51 -0400
Message-Id: <20200608210505.48519-2-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Use the drm logging helpers to output these messages to ensure they'll
be included by the drm tracefs instance.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/drm_mipi_dbi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index fd8d672972a9..ff6f83eeee09 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -769,9 +769,7 @@ static int mipi_dbi_spi1e_transfer(struct mipi_dbi *dbi, int dc,
 	int i, ret;
 	u8 *dst;
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
-		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
-			 __func__, dc, max_chunk);
+	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
 
 	tr.speed_hz = mipi_dbi_spi_cmd_max_speed(spi, len);
 	spi_message_init_with_transfers(&m, &tr, 1);
@@ -893,9 +891,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
 	max_chunk = dbi->tx_buf9_len;
 	dst16 = dbi->tx_buf9;
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
-		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
-			 __func__, dc, max_chunk);
+	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
 
 	max_chunk = min(max_chunk / 2, len);
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
