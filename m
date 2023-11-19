Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170397F05C8
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D80D10E1DC;
	Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254E710E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5482df11e73so3121468a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393318; x=1700998118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=SCDC2n0qZLB+i9e6+xtodVyWznFGI3PXmTn2iEFrBENYIYakxPo+A66FJGJ4OQG0nu
 amGNRdK8DQh89qaPt0zlyTX7gJIPNw245mZwl0rCSo/E0JJYiFrjz1WbNhWdxOuzGIkS
 5fe4Hma+kT+6QJTZEQ8yBeGDwNM2vH8oq+VlzsmsWtIJY4kZ0FHrGHeVSioEEahKlLTn
 JUuqhNrg4Ee53Ll98eWzrCCMAEuMQj+sSfPZBYVjbeYfuHGT0lHHe1hXNDnJ0esO7VsK
 G13BY9Qu2XQ6oFhpP93u4CNNNgQYcoLlBWD4k8Rbge5vET9z7lQ+pk7ippnf1QmdVAs+
 jeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393318; x=1700998118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=WVmr+czMqBt+VY/YhDAfC0dwHCEda4rt9QFTVTsEeQMUyWi3ORi3ntgn2lttNwiNFD
 3DPk9Wb2CpDdCNgtEKdZKnV3tuXABKWR8CGPI080lUxPkwRhMt9DfnfrlMOoOe8nXKUu
 MsZa0/SvlQLQq33KfvbRjouB26X/pf1L4fs3JmP8oXQhOoAu3I/GwRKYOWrfCYybdWTm
 X7VXAJ9rNN1U1ToMQbyzuGZZbkHrEFLQupIFEKIkqnHya2u9pwl0jdLhnF5gndvwVzdk
 ZfuGZWXdozhUMI4m7zXMtBnPvW3l+3uTMqzQZenyjIyG9TXL5DRQQGBGIqds1KN/+xdk
 kMlg==
X-Gm-Message-State: AOJu0Yytax7z8st0dVarwwJcmzj+1Swgjq39pmp2xg7wGJmBS33dgUKl
 AOv8yy1zQel8m/dyajtJN18=
X-Google-Smtp-Source: AGHT+IFZggot9AqS3X6Qt+Jt5dcuKalJ7+U5FRGLkcM87LKer+UjD3CjY5GltxnAdA4qRjb5SMpr7Q==
X-Received: by 2002:a17:906:10cc:b0:9fc:1236:beff with SMTP id
 v12-20020a17090610cc00b009fc1236beffmr1696210ejv.65.1700393318307; 
 Sun, 19 Nov 2023 03:28:38 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 10/20] drivers/video/fbdev/cyber2000fb.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:15 +0100
Message-ID: <20231119112826.5115-11-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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

