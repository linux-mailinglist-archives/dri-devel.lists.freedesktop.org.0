Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A37F1FA9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67A910E1B5;
	Mon, 20 Nov 2023 21:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7083010E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859c466efso20392835e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516794; x=1701121594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Upu++zhA/RZdGnIiB8rFAnP6PssgAuOHlFea851Ots=;
 b=B561az9zpITMzqfwePegggn0xfpUK1KGzMTPx0Ob+83Oa4mL0vKKEBxjyw4CkkjOEQ
 AJlFpUw0azVqoW1NAKrfZu8yAlrNe37LXA5kO4IvXonBHXI8QPwy1FWoEMgu+CZ4e7pF
 i9Xi4XDJfhgoqe+EAgHdFHbQE33UM1YCS/VpNDZzBl1wXQfdXyF7soHUuLbP3EzmLUxt
 4QC0MOkcaoaIXuzgVM1q1x40ho1Kq2N2i5ngfCaMGTEM1aLC8HS/pUs1VIfX3OXCMUbQ
 tTiOw9VdqKuxEKLpohGO7z+WcRvLb9QeXjMcdzcZgA7YvGRWbEHZtgZPirINplNhCBOe
 S9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516794; x=1701121594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Upu++zhA/RZdGnIiB8rFAnP6PssgAuOHlFea851Ots=;
 b=fFRdVdFklE4P3fKZRQ9xcaX4cMxR+1W3vM/GBDBPDUEefNQZg78Vfpl7OXwHUdffzF
 h8+/mfynsPpDs5CYh4OjZ5d+row7pZqpamFfFUTbVp3gBEY91dOxFAGNtXF01UbOhI8x
 4Y69oFtV/1+JcTJOvxa+qm3eM59t6bT9bI5UHch3xrZOnQH627PG+c5i3A8GKWk8amfR
 XOzQ5m9wmZDQPrAmh/0ThVAtxnnhFdTQcGWtw47uzuFEZXBL5Izv9aziwgEUdU6gRa0a
 qeEJ8iiceGJ4bgahfWSLv402RBNvbyRwogfTFXbEFnG6XPf0+ThJ60mzjAi1OxHG6Qfy
 P5hg==
X-Gm-Message-State: AOJu0Yy75c8JuZD2B5p5+zVqI9cm5jdSeAM6EaDniUua7y30s8LkejvQ
 2JzulYfmff125p9vgSnOK2M=
X-Google-Smtp-Source: AGHT+IGShYbCS8GN/5rAfdvOMeC0Rmm3E5GPr3cI5QbDT98zWYVN+PfkHaKPIKb7avI0dpivwWZpug==
X-Received: by 2002:a05:600c:4f81:b0:405:39c1:a98b with SMTP id
 n1-20020a05600c4f8100b0040539c1a98bmr7120058wmq.20.1700516793380; 
 Mon, 20 Nov 2023 13:46:33 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:32 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 06/20] drivers/video/fbdev/core/fb_ddc.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:09 +0100
Message-ID: <20231120214624.9378-7-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

Acked-by: Helge Deller <deller@gmx.de>
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
 

