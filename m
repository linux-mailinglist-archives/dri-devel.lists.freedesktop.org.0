Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C697F5B51
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A8D10E6FC;
	Thu, 23 Nov 2023 09:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A558710E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso3346454a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732449; x=1701337249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvHXeOl9LDkuvADN7QZ3xhK0GHlO5gQYDZefl63t5jE=;
 b=Nvd33i1aaLLNMZGC8YvwVZ2oevi1uLvA4RZ9HLfVs9VUSvmy53fOqp5JQA6sn2uNXZ
 ultPoy8qCurajlcDkFdFqYz2Z5NPY7EaTxhkv2g2HWgmbz+V8mwVQ6UTlM9zGO0Vv5Ff
 FtYEkYd8bO+21fs68fWSfpSxsuF0TUcCaATE3Waacb9PDXINxnZR0W1RNE5Fp3z8g1YB
 E4BZO0nfD2grAR+SF+0B2sPTudWmt4dKLEHs1ZnkBYkobv/0QPKZu75LPe8Sw//WsXTP
 FrkSctaicbuSbmvCKgSyKh7eaTmgxhi1BswnotdZhd2iHjeyH7vfLPjDenqHc79iu3zX
 F9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732449; x=1701337249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvHXeOl9LDkuvADN7QZ3xhK0GHlO5gQYDZefl63t5jE=;
 b=cY+eSTYMCjqc3LPYWf3V3H3WlgQwhGxb8zDB+hfEW1BwdAN320NzEPBIh+gZQt1C5o
 AxD42j3GL0KEHFkdVJfaRu+RSwRdhVPNTXyfWAJWWYMtEOAaGEriNCHiQUuBw7KjB082
 oWfeLd25viPiR84AvRaOOId9KkkQaSXzJ3jtic+YyRCCby1skHurnufBKJfVDgdXEDuf
 /sJigPJxzFBQNJ3MCdtQmo1BWRZeFVDxTxAWPH0rrGjrjncLSeceDYDYEQ6vB2f27xdR
 8F8daSirh10PrVrGNNZOvkEjlTcgoE/JoUwpeU3ZTQDuwQbK8AMpZhayWjbI0hftTC+a
 JlCA==
X-Gm-Message-State: AOJu0YxufaM7ffx1/kGuQDpCj+ESld1VXkst8HI/QRQHmCWfNGRJBvU6
 ULeZoy5axs79O/PVduuev6k=
X-Google-Smtp-Source: AGHT+IE+Nr8u8YtY1qrwt9z7+2FQgdGwO8TfYUwKqW78GiAu5HXb3TRPaqDDQPPM8YSMZBIRnZFVyQ==
X-Received: by 2002:a17:906:3299:b0:9ae:659f:4d2f with SMTP id
 25-20020a170906329900b009ae659f4d2fmr2095489ejw.26.1700732449059; 
 Thu, 23 Nov 2023 01:40:49 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:48 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v5 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:25 +0100
Message-ID: <20231123094040.592-6-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Helge Deller <deller@gmx.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
 - fix compile error
---
 drivers/video/fbdev/i740fb.c              |  1 -
 drivers/video/fbdev/matrox/i2c-matroxfb.c | 15 +++++----------
 drivers/video/fbdev/s3fb.c                |  1 -
 drivers/video/fbdev/tdfxfb.c              |  1 -
 drivers/video/fbdev/tridentfb.c           |  1 -
 5 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 1897e65ab..9b74dae71 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -163,7 +163,6 @@ static int i740fb_setup_ddc_bus(struct fb_info *info)
 	strscpy(par->ddc_adapter.name, info->fix.id,
 		sizeof(par->ddc_adapter.name));
 	par->ddc_adapter.owner		= THIS_MODULE;
-	par->ddc_adapter.class		= I2C_CLASS_DDC;
 	par->ddc_adapter.algo_data	= &par->ddc_algo;
 	par->ddc_adapter.dev.parent	= info->device;
 	par->ddc_algo.setsda		= i740fb_ddc_setsda;
diff --git a/drivers/video/fbdev/matrox/i2c-matroxfb.c b/drivers/video/fbdev/matrox/i2c-matroxfb.c
index e2e4705e3..bb048e14b 100644
--- a/drivers/video/fbdev/matrox/i2c-matroxfb.c
+++ b/drivers/video/fbdev/matrox/i2c-matroxfb.c
@@ -100,8 +100,7 @@ static const struct i2c_algo_bit_data matrox_i2c_algo_template =
 };
 
 static int i2c_bus_reg(struct i2c_bit_adapter* b, struct matrox_fb_info* minfo, 
-		unsigned int data, unsigned int clock, const char *name,
-		int class)
+		unsigned int data, unsigned int clock, const char *name)
 {
 	int err;
 
@@ -112,7 +111,6 @@ static int i2c_bus_reg(struct i2c_bit_adapter* b, struct matrox_fb_info* minfo,
 	snprintf(b->adapter.name, sizeof(b->adapter.name), name,
 		minfo->fbcon.node);
 	i2c_set_adapdata(&b->adapter, b);
-	b->adapter.class = class;
 	b->adapter.algo_data = &b->bac;
 	b->adapter.dev.parent = &minfo->pcidev->dev;
 	b->bac = matrox_i2c_algo_template;
@@ -160,27 +158,24 @@ static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
 		case MGA_2164:
 			err = i2c_bus_reg(&m2info->ddc1, minfo,
 					  DDC1B_DATA, DDC1B_CLK,
-					  "DDC:fb%u #0", I2C_CLASS_DDC);
+					  "DDC:fb%u #0");
 			break;
 		default:
 			err = i2c_bus_reg(&m2info->ddc1, minfo,
 					  DDC1_DATA, DDC1_CLK,
-					  "DDC:fb%u #0", I2C_CLASS_DDC);
+					  "DDC:fb%u #0");
 			break;
 	}
 	if (err)
 		goto fail_ddc1;
 	if (minfo->devflags.dualhead) {
-		err = i2c_bus_reg(&m2info->ddc2, minfo,
-				  DDC2_DATA, DDC2_CLK,
-				  "DDC:fb%u #1", I2C_CLASS_DDC);
+		err = i2c_bus_reg(&m2info->ddc2, minfo, DDC2_DATA, DDC2_CLK, "DDC:fb%u #1");
 		if (err == -ENODEV) {
 			printk(KERN_INFO "i2c-matroxfb: VGA->TV plug detected, DDC unavailable.\n");
 		} else if (err)
 			printk(KERN_INFO "i2c-matroxfb: Could not register secondary output i2c bus. Continuing anyway.\n");
 		/* Register maven bus even on G450/G550 */
-		err = i2c_bus_reg(&m2info->maven, minfo,
-				  MAT_DATA, MAT_CLK, "MAVEN:fb%u", 0);
+		err = i2c_bus_reg(&m2info->maven, minfo, MAT_DATA, MAT_CLK, "MAVEN:fb%u");
 		if (err)
 			printk(KERN_INFO "i2c-matroxfb: Could not register Maven i2c bus. Continuing anyway.\n");
 		else {
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 589b349cb..07722a5ea 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -252,7 +252,6 @@ static int s3fb_setup_ddc_bus(struct fb_info *info)
 	strscpy(par->ddc_adapter.name, info->fix.id,
 		sizeof(par->ddc_adapter.name));
 	par->ddc_adapter.owner		= THIS_MODULE;
-	par->ddc_adapter.class		= I2C_CLASS_DDC;
 	par->ddc_adapter.algo_data	= &par->ddc_algo;
 	par->ddc_adapter.dev.parent	= info->device;
 	par->ddc_algo.setsda		= s3fb_ddc_setsda;
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 22aa95313..51ebe7835 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1267,7 +1267,6 @@ static int tdfxfb_setup_ddc_bus(struct tdfxfb_i2c_chan *chan, const char *name,
 
 	strscpy(chan->adapter.name, name, sizeof(chan->adapter.name));
 	chan->adapter.owner		= THIS_MODULE;
-	chan->adapter.class		= I2C_CLASS_DDC;
 	chan->adapter.algo_data		= &chan->algo;
 	chan->adapter.dev.parent	= dev;
 	chan->algo.setsda		= tdfxfb_ddc_setsda;
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 816d40b6f..516cf2a18 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -274,7 +274,6 @@ static int tridentfb_setup_ddc_bus(struct fb_info *info)
 	strscpy(par->ddc_adapter.name, info->fix.id,
 		sizeof(par->ddc_adapter.name));
 	par->ddc_adapter.owner		= THIS_MODULE;
-	par->ddc_adapter.class		= I2C_CLASS_DDC;
 	par->ddc_adapter.algo_data	= &par->ddc_algo;
 	par->ddc_adapter.dev.parent	= info->device;
 	if (is_oldclock(par->chip_id)) { /* not sure if this check is OK */
-- 
2.42.1

