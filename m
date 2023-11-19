Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8DE7F0543
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007F710E1A3;
	Sun, 19 Nov 2023 10:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE9510E1AA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9e28724ac88so474030266b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388897; x=1700993697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=XKZUbPTezbl8MWsDP8w0UTxUs77rsT5iTfPSZbJD2Ws8yohjDhyStfjDq/1gAoDgRl
 MFm8iOVjITSh9fwpk+YCj3KaXDatigK3RNS66b3OdQXGlz1zlDQE+1otL+OOvLi2IUyO
 zvUmka/IRFaRbVSZLSRme9TdMhCeDUPmw2JqVD7iiwRcVdFf/iz6PjEcGmXJRBx9+OCu
 Lq8AHSmt4YvleqfNG8tdE97D5LoPT7bONQbQWC4iys0Kyv0ofnDOAiarOnVv4V8Gq9UN
 x8i5ngyeys1Kl3ejdt56/crxPyfqhxO0yr9gQlHIngjDfKFMa74Vod3H72J7oC1P4AlG
 +IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388897; x=1700993697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytoy8pfr5Vxi1e0JcRyR6n1bj9XY0g4pH3ARHnOackE=;
 b=MFL4uDbTjaOWp7NJs9z2t0ZnR/IINhpaf7Qdzux5Wc/pJ2ZCw7g9FpN3c1kyQou60g
 YK7yKTQCLy19ylIVYpjrj7MmSd+Q1/EU9WG3bMywXb4OSN6vjLHfwX2YRlrwRgOt8oMk
 NgOT12Xr2tBZH+ZHQ1nwL9s1HAXOXkX8YBqMgG6AeFDWLdE91MHaAu7yCYNUgmqkhrYn
 Flc/YMEUGagk3YTv4bQ1G9GvhdphKRrlCSRNvc06wyokI34uXidkuF9c6Ecmy3xgMLt3
 6lxA+IK0+VCdo5sW7tLlv5mmfKDV5rbMC/1/N/G1sDSWhfrOmXR5v8TyG28Rwcjz0K1D
 d23g==
X-Gm-Message-State: AOJu0YxCI9VOjByeikqD3AyIZG8O9X+hFzWcKBJmqW061wsGCJx2+Y/o
 uWXUH27JygyE92Af+MWItlA=
X-Google-Smtp-Source: AGHT+IFOvnTj9XaGTXmf0kg4u9vN5bhBNAlFozIlZLALi3K4N5pNEJsRCsiqKinvY6T58jw2eiJA3Q==
X-Received: by 2002:a17:906:1051:b0:9ef:c408:a4fd with SMTP id
 j17-20020a170906105100b009efc408a4fdmr3609738ejj.14.1700388897489; 
 Sun, 19 Nov 2023 02:14:57 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:56 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v3 09/20] drivers/video/fbdev/via/via_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:34 +0100
Message-ID: <20231119101445.4737-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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

