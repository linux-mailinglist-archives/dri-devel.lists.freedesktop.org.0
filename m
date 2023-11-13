Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30F7E9B07
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4E10E353;
	Mon, 13 Nov 2023 11:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228710E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40859c466efso33254375e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874650; x=1700479450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=XKMbrChvYXXicBq6jLNwD42PEV9jd4gKy8NE6qCuNnIjWbfgNrbpcSUd15RvLAa3H+
 uWF45S//rD3v3zRxhQuVsQjOLbbGcPOZ6IKJaroDq+aBLgrzusH3YMg0uO35KtMd61eW
 CSc3q3xKSy7auvaVOZNjE/OPyrgDgbzhscmCLKYoTIssay2oG7DO04/ikPusk+4Ly9vc
 Z0mykrb/1GnYAwBfx/8/LXVxeBFvLv9jEjWUw8LZe/Nh7FcJcYg/Z2Z1epTc85zVFY8F
 7bV2wdBzKWoDVXnWc09Lyh90+8YQJpgpmxJ/LJffmHqKFL78bb2M+RpArRlrDuyFXjIT
 xsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874650; x=1700479450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=X+OdfU6LJhxkV//Mo7t5uP0ekYYd3V3rg/Ofd5o2brOq2IiIAVn1TMe8VvHmNwSC52
 cBSSaV7cZn5g6prJtl/mNtCPFNibHW5v/Sbrg5epX0/3ZJQ4tpN3kNN1U2BN+EKq+neA
 3lyOtYX1brqwzhUlVBnm2+DXIUVjtQ+tYAC0ent0/XEGhSpQLsuISFst7WpCKHK76E56
 s3AiVvvaONHZoZCR1/RVXalvQfqqWzMkjVP6rIyJ9/p0iGVP2yC/2xPQEh8U6PqPOq+G
 3h06vdhhAiwS7YLDZqXGC4XPxnhUgUfKK93G+kf6L8IwV7otpxv0Gx/N1cLkepCDWAyn
 RDJA==
X-Gm-Message-State: AOJu0Yw/P02wvTBnHWt9btAAfnmD/z+VMiN2LwB/RgOmzzTgk0erma3r
 c+RCT39DTMNRfk+1Ag4yQgI=
X-Google-Smtp-Source: AGHT+IFLTl+fAOmA9wfAnqq5QL35Y8l0EQWxEuKGeK/UmNhJYPQBWfJpPA26uHWh9GGQv+cTL2zTow==
X-Received: by 2002:a05:600c:348f:b0:406:411f:742e with SMTP id
 a15-20020a05600c348f00b00406411f742emr5433441wmq.34.1699874649928; 
 Mon, 13 Nov 2023 03:24:09 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:09 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 10/20] drivers/video/fbdev/cyber2000fb.c: remove I2C_CLASS_DDC
 support
Date: Mon, 13 Nov 2023 12:23:34 +0100
Message-ID: <20231113112344.719-11-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/cyber2000fb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 52105dc1a..79775deda 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1234,7 +1234,6 @@ static int cyber2000fb_setup_ddc_bus(struct cfb_info *cfb)
 	strscpy(cfb->ddc_adapter.name, cfb->fb.fix.id,
 		sizeof(cfb->ddc_adapter.name));
 	cfb->ddc_adapter.owner		= THIS_MODULE;
-	cfb->ddc_adapter.class		= I2C_CLASS_DDC;
 	cfb->ddc_adapter.algo_data	= &cfb->ddc_algo;
 	cfb->ddc_adapter.dev.parent	= cfb->fb.device;
 	cfb->ddc_algo.setsda		= cyber2000fb_ddc_setsda;

