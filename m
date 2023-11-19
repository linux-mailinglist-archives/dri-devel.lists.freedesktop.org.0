Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B97F05B5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98F110E1D2;
	Sun, 19 Nov 2023 11:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58610E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:39 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so479277466b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393318; x=1700998118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=c6al4HvQMhOyrwduPG4xTeIzawLllWUbeZ7aDTWTo7/xsVxau9RycKYE5UgmAALn7D
 CtMfRM1NLfq1xSWOCwoKWTCYAKZBg/9h7v7Fc1Zii/BiAnm5oJPEWjC1zaGP60yZ+G5u
 GWX4WnXuui9LZJ3Z58CAiiFBbk83hKtMoC3Di/HdoXsD19m9fIbdrPJaWaThL0AstXjS
 e5Eye0q5uv79nw7CNRyM+638IZJSOA218g3L+8C2LJ5/q4Vao/EOP2mHhqP/W5xN1WOj
 EyLroWSWueXBGRf2Z5ArAyF2Wmiv7WVatYOVQ7uyAUORLvyvhphnurFL5if/xlNFuCHw
 1R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393318; x=1700998118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=jXNYEOPPpRyktlOqFQEpUsG9wYGllUO/LMaTxU6a6TN4U0SlmvdVy9NTWiOneo0SrJ
 vYOLSU3DBb2xATc4SbcI9zTgBl+4xGm8+k3pATnWhuWrY2v1oveRLAkYet9e4nLFH7vK
 5oArIRnAfPy10D/nQpjT2DsB3PIu70+v1yzrnnCwk3UZuhEX9aayqbdaNPIrVvn/P94X
 mkeI5WYx4lcxGgCMzf7p8loXBYBg9bVf45mJ1Giv2lsGcw7dvQq4M4DuEROqF2oJn/hb
 QfoluGz5HzbkqRf5RaXamsaOiP21RaEhzfAyJdIaek+R4jWkwKP0jmmu6WL70R97hwsU
 ievw==
X-Gm-Message-State: AOJu0YwG6DEoW7ninT7HYYwEB66KaDI4CcqLAYVeKEyrlnTU+q8wu18z
 3J5bkAl0p75dGccrFyXukkA=
X-Google-Smtp-Source: AGHT+IEnmNpCAkcRrOzwrSosgUk4OeD4St9qXEp+f9gvbMOTGQeLWy9ztO80popOTUrnH8s4A6uwug==
X-Received: by 2002:a17:906:520b:b0:9e6:38f2:8439 with SMTP id
 g11-20020a170906520b00b009e638f28439mr2984313ejm.60.1700393317363; 
 Sun, 19 Nov 2023 03:28:37 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v3 09/20] drivers/video/fbdev/via/via_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:14 +0100
Message-ID: <20231119112826.5115-10-hkallweit1@gmail.com>
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

