Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0783D15A6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E23A6E97E;
	Wed, 21 Jul 2021 17:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFA86E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:43 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id gh6so1354081qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMkgS3KJ9eUsffAjes/ogVCJh1BrcgeqLuYwbEpCi+w=;
 b=cVxC30l0K9uLAY34QE0ZUqIfCN6pKQaPf0mlzZNbHcDTJSlt38P2I59BinUO0l+4aZ
 gSkIv2PuWgZBg9mWmc9J09MH5awTcq7DUai5aivXJE7dO4xnkY61H7MazMEOToL5q6L3
 qy4w0FbkwMq6bdb55Jvnq46w9CMHYWJVp2JL+oe4D5GGFMtfH28AvCi41JzwlqUOoZ6f
 RjziOLBHgRhklOQzJUw1Nuxr5xWNWCLKYWYaDFFLE81zUddJcXFCBcGsruc+qUBmqq0Z
 4xiqsojOhlPosRozXv+KEG2ajAeo+nfKToFQGYPpluhi5ny3sDASoyp9fFvmTDPH7jb/
 v5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMkgS3KJ9eUsffAjes/ogVCJh1BrcgeqLuYwbEpCi+w=;
 b=J6t/zANErwQrJ5K4+3nAzQXJiWiYuICY0VWmXneukEqTPPaZeJoRwDlykFoDDOdP1c
 8IeFCoh4NIElGNGkUmZ6CGAgs8aYuZic+2Gl3jWED1SptN2SDs562V6fmNXmEdGz4Z55
 upSOd2IDgY0q/XyOshALHqNK+pe1ZXXwWi8y2nudEVq89UPfYw3VgttfgHA2zd4iPl12
 DB5NUTTCOAp9C/Cwc1H3tG30MZzyozW1ALffb7DeAMt58Q113+391a+K9J3zbTJS+SJ+
 lUsFhe2Vzz5MNkizK6QUXsO/Mf34HjnbjTNm2oo+75mfnelGrdvZWGQKMQikF7TE/N6Z
 7jMw==
X-Gm-Message-State: AOAM53317wwT2cy4NLmAgmLxPklO0vhVoMZO0s0TPCzg3+LdlM80Td+7
 zzyV05LjlDL50ECoukZLHSUy6e66U3Wbbw==
X-Google-Smtp-Source: ABdhPJx7URjeVW/I0Hc1Emv4LjeJEdwI6/O3hFdE1arpvwQasXRd3iX/i6qtV2p3SHkWuzQ0JnVSxQ==
X-Received: by 2002:a05:6214:dad:: with SMTP id
 h13mr30570184qvh.26.1626890142102; 
 Wed, 21 Jul 2021 10:55:42 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id r187sm11332988qkb.129.2021.07.21.10.55.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 02/14] drm/sil164: Convert dev_printk to drm_dev_dbg
Date: Wed, 21 Jul 2021 13:55:09 -0400
Message-Id: <20210721175526.22020-3-sean@poorly.run>
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

