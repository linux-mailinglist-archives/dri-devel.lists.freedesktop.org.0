Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E01F212C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784E089E8C;
	Mon,  8 Jun 2020 21:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8DF89E8C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:27 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id di13so3000329qvb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8sO4DzLJZcIOyysAN3LNUsftaBtZy4KrwHzJTDHCkzE=;
 b=LPi1Tnb+Zlp85KbxR3x6qxZtwNu5FBIcDDCON8i7wR0+y7lYbMPwkzCiVpLQcmz65H
 L1busLA7JcheWn5zU1cbkNaR0MQ2Py5wufACz/69umTEU3l1Yp1eyk+d10lTNbiX3KLF
 1a7lD5YLHAfpVYOOTvkAP7QFzNylSHJ0ZHSwPfJRwh3LeeAOz5O0uVNVbn5H7qhuKEJG
 7nAZGtt2ZysUWvJhHz7/cmKDXTB6+XAzWm5OwzbUlwwMz1M0JZONrF2JTx6mslMEcv5Q
 iXIo35nGqLffM6JLMhNqHQEXvXdduwN4cfI/5MdKwQOMHNF/f1Bw+7+QFS0xu6566aBf
 cttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8sO4DzLJZcIOyysAN3LNUsftaBtZy4KrwHzJTDHCkzE=;
 b=FepPLVR5UM5YXLofV80gMw1w+rcVmHGCrtiRXkrgFmmxxVn0Dj8/hbtHtesSCS0tX8
 uK/gvYcBkgjMru/cDqNNCFQZzGJeLMfAGOJqVsuGUlVRJV5O4cKU/NmRnuiCjW3v3iiH
 NKxrChLqeMLkwRAOSxGhBT5iUiIaKHoUwGWlK/DiWeroSkIpZXKpLsCrh0GLCILP++OA
 8WFwTP/4CGcjvJoE5GzEP9Qp7DH3Rm+4zJ7EoRmPt85pOoczDSFg2mvGAzlPMGhr3ZCg
 sWQJ3aFKe91PoqFS73NDH/PWA1J6bW4Tm2RtgleDiQRGhF4SUhsX4tBzDQ/dEP+0EvAZ
 FZ1w==
X-Gm-Message-State: AOAM533rsct74LYmjSKH08YuowiHslnLCjV5T8Xa/VHodIBBTPZTuMzi
 DlOTzkqnB1dVw0b/m68weFPjeUCmp20=
X-Google-Smtp-Source: ABdhPJxG9dA9AObQzNQodbPMS6C/SRodPgyNpfbDZB1+Kyy1f6EcvTOPAE15DHiqLLQ+OrW+pyt5Ww==
X-Received: by 2002:a0c:e385:: with SMTP id a5mr646989qvl.218.1591650326935;
 Mon, 08 Jun 2020 14:05:26 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id b24sm3958798qkj.0.2020.06.08.14.05.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:26 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/13] drm/sil164: Convert dev_printk to drm_dev_dbg
Date: Mon,  8 Jun 2020 17:04:52 -0400
Message-Id: <20200608210505.48519-3-sean@poorly.run>
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

Use the drm debug helper instead of dev_printk in order to leverage the
upcoming tracefs support

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
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
