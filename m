Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F5248FDC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0CC6E139;
	Tue, 18 Aug 2020 21:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571C6E139
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:21 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v1so8429541qvn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OMkgS3KJ9eUsffAjes/ogVCJh1BrcgeqLuYwbEpCi+w=;
 b=FzaLrikmaqeXQHzfAdHz3UYiz6xwuuMKPobOdOB6BQ2Tt/v3zt7cdOIEyIoPPMdBJq
 IY1s0yXQ7R2GmHa/9dCL7BuvLVBsez3HQWe8FDqg1YCsYu1XSYE5L5ZDNJrHvcnqoxr8
 8ad6lPxPvORQDRZinoN/nPQ0TxqlOi6EtjLu/8kouP8A1fe7bp1fmwvPVPZ95NiuSv4h
 54tx6Omwx4dySDMXt9QDHQmCdwOO90LYucKTWbEzi22+Y/O14camwDkkkgscWVxlw7bo
 MLzsao7yVf9n0V1yM8prd2825VKy1B2PMBp9Ek1Y0au5jn4jGXV5odFAu7KkYSoA1INY
 y8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OMkgS3KJ9eUsffAjes/ogVCJh1BrcgeqLuYwbEpCi+w=;
 b=M+0O/nn2wiZxqTndg/+kzuY5rO0fBIGW5lsfVV1M55Ckg4s+bf4QxdE2EUvU0UY/vG
 86iFDP2zcCA/XI3ZfBFSl2fNl5RO8w4KNBWIXJ9nNUCWgWY1LUVFHkSMiuidTsnn+TbD
 /KK7e0D+ENGMVaFxYmF5OYcFE2NsGPDEM//ECBVZTEisolPnVuphLW486aFU59RvnuXq
 C9L1N9v4IVmEK5qjOq2QW0g4rSY9GcYvFYlXLBs435zk5Rgb4FnLNTsnA8ys+DnaK9Nv
 ImoHI48WturcVZSi7RLqZ5q3EnXwYoPrrOOXE/+SsmdtJ/hUbLji+G7+IjgRnNjMNDhj
 x0qA==
X-Gm-Message-State: AOAM530jqY5aK+R0QhBZ/LsWl1aT93uRQIGezGcfQYVNHvWyZ1325YrO
 9fD1jZrYla+kkoJQtHcOjYbvGLc29FjVUg==
X-Google-Smtp-Source: ABdhPJxqXc5HOTkRijQQ27tVB/9ydAcnZoNYiQe3hhhZJTQHmNxh4zZn2Ped2za+V8SFBpjODg8LQw==
X-Received: by 2002:ad4:444e:: with SMTP id l14mr20280865qvt.111.1597784720166; 
 Tue, 18 Aug 2020 14:05:20 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id g55sm27132608qta.94.2020.08.18.14.05.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 02/14] drm/sil164: Convert dev_printk to drm_dev_dbg
Date: Tue, 18 Aug 2020 17:04:58 -0400
Message-Id: <20200818210510.49730-3-sean@poorly.run>
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

Use the drm debug helper instead of dev_printk in order to leverage the
upcoming tracefs support

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-3-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/i2c/sil164_drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index 741886b54419..b315a789fca2 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -43,11 +43,6 @@ struct sil164_priv {
 #define to_sil164_priv(x) \
 	((struct sil164_priv *)to_encoder_slave(x)->slave_priv)
 
-#define sil164_dbg(client, format, ...) do {				\
-		if (drm_debug_enabled(DRM_UT_KMS))			\
-			dev_printk(KERN_DEBUG, &client->dev,		\
-				   "%s: " format, __func__, ## __VA_ARGS__); \
-	} while (0)
 #define sil164_info(client, format, ...)		\
 	dev_info(&client->dev, format, __VA_ARGS__)
 #define sil164_err(client, format, ...)			\
@@ -359,8 +354,8 @@ sil164_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	int rev = sil164_read(client, SIL164_REVISION);
 
 	if (vendor != 0x1 || device != 0x6) {
-		sil164_dbg(client, "Unknown device %x:%x.%x\n",
-			   vendor, device, rev);
+		drm_dev_dbg(&client->dev, DRM_UT_KMS,
+			    "Unknown device %x:%x.%x\n", vendor, device, rev);
 		return -ENODEV;
 	}
 
@@ -389,7 +384,8 @@ sil164_detect_slave(struct i2c_client *client)
 	};
 
 	if (i2c_transfer(adap, &msg, 1) != 1) {
-		sil164_dbg(adap, "No dual-link slave found.");
+		drm_dev_dbg(&adap->dev, DRM_UT_KMS,
+			    "No dual-link slave found.");
 		return NULL;
 	}
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
