Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B66697E9AEF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9613010E344;
	Mon, 13 Nov 2023 11:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046710E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083f613272so37353895e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874646; x=1700479446; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=A+Wdc9KmwX5Wy0zV9CPmJHVvuVLfIVGLVKvZeQkC8EekMIh3ao/Dz0RfGRPIYH6gsT
 oGeEiYKe+xiwzGgF4lJGSeK0NnEYCrdUqVoXnec4JH402H2ZMrkFIWpkPGQbZCIRm0FJ
 AU5IzzP3T25fr0a3nN1qGp03jZMlINddPeZ5H4bi/QfjFP8Eippdkuvw7hnf4QFUWInk
 4gI9WpfqP2XurVuSDbUMaZIpsHai7FXKlSHqj+ejicI9TxridZyQ4/vG6DGqvQFqR6da
 e40jGsHkgIZbbYBv5tF1N3RqZtTSHcneRg1aRkTCwo21RSJRgctcofStzBExamQYt4nU
 1h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874646; x=1700479446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=mX/mAIi9kuDgaGGSfMHzBA8a14sd7nhvIwXqP44px4wc6/WGgRsxmAc13fpAv9A0Yg
 cKL+yhSg2K0ohowqBgXh1wStZ3XIHZg1yviQ/u5cX6ph/8P9sJdZWy6wmp4JAhhJBrGp
 e4OVr3+HbLttkFKGOPzbTY0x+mRl8iUfQLJjc+VNvpVXdgyHYaSiHaF3AzyX2NrNEHlX
 XEWeWZbRMRiff0SAVPHN4tL6FM0tibRr/5R7+745TSs8ECavPnI1v2VMsqwOHbrkme3q
 sby5lPGy0N3YreSkCCONJDWgaP4LXhyHLYboDsU8G/9EZvGs61aDtc0bcDAhxwgEh4WJ
 EqjA==
X-Gm-Message-State: AOJu0YwwcL2OxWFWxyln92wYprbPsC3TjWudz8rjT6bpNO+YCixUaKvi
 O+k3h2pRUOfdxNSKWfsJAbs=
X-Google-Smtp-Source: AGHT+IGL3EktaBJFjj+0Glil7T8bNSbTgzf/Pqk4mNBNsYEc7WZFPHt2hi+DW9OAvH9O20i3TarP6A==
X-Received: by 2002:a05:600c:1910:b0:40a:3e41:7df1 with SMTP id
 j16-20020a05600c191000b0040a3e417df1mr5289314wmq.37.1699874646477; 
 Mon, 13 Nov 2023 03:24:06 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:05 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 06/20] drivers/video/fbdev/core/fb_ddc.c: remove I2C_CLASS_DDC
 support
Date: Mon, 13 Nov 2023 12:23:30 +0100
Message-ID: <20231113112344.719-7-hkallweit1@gmail.com>
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
 drivers/video/fbdev/core/fb_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_ddc.c b/drivers/video/fbdev/core/fb_ddc.c
index 8bf5f2f54..e25143219 100644
--- a/drivers/video/fbdev/core/fb_ddc.c
+++ b/drivers/video/fbdev/core/fb_ddc.c
@@ -116,7 +116,6 @@ unsigned char *fb_ddc_read(struct i2c_adapter *adapter)
 	algo_data->setsda(algo_data->data, 1);
 	algo_data->setscl(algo_data->data, 1);
 
-	adapter->class |= I2C_CLASS_DDC;
 	return edid;
 }
 

