Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA17E9B00
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8510E081;
	Mon, 13 Nov 2023 11:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083C310E344
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40853c639abso33451345e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874649; x=1700479449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=CWI3PRqLKXaZIWSRoAR7QWWLPVyMZ/jBEHxGEUxPba7uflI5rZmmN6yWRxNNJ71ptB
 VEpL8TiZDgOahFcEXro9ccREK9Rb6eMMrhoyX8wM2RvEam4Kl7bZCaql9m8AUPZwXz1M
 xs6mdLbI1+hZ8GMyPW6ncEkOIeaE98dtSD0N0YTJ8cuTcY8A14FqvmTEJqKJ3SCbNroK
 iBLWetAj35vHIluLVkbE7nDXBhPGr+DnTvTWRHkQmiAJhkHIJ78Uqvk3X9Gh42T6NaIN
 READbt/Ic91HPs9IUrwUyFKgDhiscSeWE2LIaOmEwuFP0IIvwxPbKIlk2KbFpCcDtX6l
 60lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874649; x=1700479449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=cgfPA8ndbivMZUshaIaMCM8NkVJPnJ05G73EjAiARdYt2EjF+RPIDeyx+bPMpyF9PD
 dN0qr+xonkjTjTPZVdXXMPshQg8b8FVawsnlz/TulZg7BnZl/ebpQ/oQfChlm+dqrDFD
 kZTznbzeqrSBhJ3/Od0T6PhdH3+lf2tk3k8Ra+LLbmURSm5KeWY25fki+tiWubggmxuy
 FVUmo00YNAXfJHQwHQ6kqD57wbVqCqvZ2tCQIv2cbW/X9VICe3afdV0q91vDWsuwf9kX
 R7x4iOMbWCwydkcjfMr6apXyiHA5gBDNL1QcSEkBTWPUE0oED0DpVMjXDHUNihPFSSoZ
 9ELg==
X-Gm-Message-State: AOJu0YzrdY9Qg2nVy51J5QSPazEyU9wb8kdB9PlN8fyi+1jG1jqtjL92
 2W/EowyTjkuqdm+Sk6b2f1I=
X-Google-Smtp-Source: AGHT+IFWxagdYbQ04Cy1zXQ8J3RXxuSkeTrcraaBkbbYjfhgHWD8ZbRjLDfDALyWkgIWGKQzSnNbyA==
X-Received: by 2002:a05:600c:4f0e:b0:406:5359:769f with SMTP id
 l14-20020a05600c4f0e00b004065359769fmr5703626wmq.0.1699874649154; 
 Mon, 13 Nov 2023 03:24:09 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC
 support
Date: Mon, 13 Nov 2023 12:23:33 +0100
Message-ID: <20231113112344.719-10-hkallweit1@gmail.com>
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
 linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/via/via_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c35e530e0..582502810 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -201,7 +201,6 @@ static int create_i2c_bus(struct i2c_adapter *adapter,
 	sprintf(adapter->name, "viafb i2c io_port idx 0x%02x",
 		adap_cfg->ioport_index);
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->algo_data = algo;
 	if (pdev)
 		adapter->dev.parent = &pdev->dev;

