Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39CA248FDB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086716E13A;
	Tue, 18 Aug 2020 21:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC186E13A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so16232274qtp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BHKVTNTGi6cHfaoZOy7Gxm7/imbWNMc5S3azkaOfSS4=;
 b=aLn0H7GBvwyQ/HZxxp4tCqSHaWYd8rqy0KER63R+Mr0coGXd8mLYQR/5NOFJLgmXRS
 mHLfZ8hNJ50kk02N4dz0+zcP/DVFe+sLPn0ke/Xoqp9To1NvaZWyxvWHnzElLUmRae1Y
 /KxdWDHenvRjL9yn9ak3rNgBmJsT8XezkjZAw0JwEdLTG68GqM6OXs98dC01AOFxCZ5x
 p9UCZuZqr2BUq/u9oB6Y+AB2/fQhEcOG64+3/ZSRv0VEzrU4tHU4Ay76bYxSj3yz7PzO
 Bdi5nHOjmS/dubbxgsCf13/N6t95vwJIZ3wsbWwXzGkyMzL8JmqfETCN2+VEzEgEC7Lf
 yaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BHKVTNTGi6cHfaoZOy7Gxm7/imbWNMc5S3azkaOfSS4=;
 b=L6NSJLwaQu2vJ3wA6bPn2mBrjto7rLZk2b5xVQKFwl9jdAOPzLxfFonckMrVr6lY0W
 M2pngAtfQ6aHTtEjRTPevZybppDD5nXz0TZYGsPnIyvD7i4jh2apiyqjTHsa9b56woN9
 ruxENQSMk5KM1YMYpuiD8bT1pFn5mpFj1ikqB7GLrXv3aM17qGc+6QhvujNbmgkI3Rg0
 jG5L+JDqKr89rBy2y6w56ejxsRfCnwL33pk0xSOzIfpataiqc5M7pqGibDUnQ6n6zEED
 aUXsLq+g6xatn1ekcUCi00zgnAYDVWYbzGCWbgykIwC6lhyDKH7DYJDVY/8tXC5LuIU8
 zFnw==
X-Gm-Message-State: AOAM5303t36VhttLJn96R0hv5fP43as2ukKiKysJ9WkF13aDTc8Tlj5x
 oJWFBAEbNZHMse9JCHCi0jBwzrZ/PId+Vw==
X-Google-Smtp-Source: ABdhPJytjSuMmDlf2tRAqTfPkOfsavaSvT/tEytG1YIwHnUzpOz2ZGwe/HD1fpI9JnRAgV1ko51cAA==
X-Received: by 2002:ac8:318e:: with SMTP id h14mr20657597qte.245.1597784718162; 
 Tue, 18 Aug 2020 14:05:18 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id t12sm21191885qkt.56.2020.08.18.14.05.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:17 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 01/14] drm/mipi_dbi: Convert pr_debug calls to
 DRM_DEBUG_DRIVER
Date: Tue, 18 Aug 2020 17:04:57 -0400
Message-Id: <20200818210510.49730-2-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 230c4fd7131c..e233b6da7cca 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -764,9 +764,7 @@ static int mipi_dbi_spi1e_transfer(struct mipi_dbi *dbi, int dc,
 	int i, ret;
 	u8 *dst;
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
-		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
-			 __func__, dc, max_chunk);
+	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
 
 	tr.speed_hz = mipi_dbi_spi_cmd_max_speed(spi, len);
 	spi_message_init_with_transfers(&m, &tr, 1);
@@ -888,9 +886,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
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
