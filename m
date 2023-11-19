Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FA7F0533
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B66910E1A5;
	Sun, 19 Nov 2023 10:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7593910E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9e2838bcb5eso473470166b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388895; x=1700993695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=CH7UWnraT/ArktHEXi83qgiUmHry2K8i/Kchaj2tzAeRgkWR7r20RG5ubyQ9QkPZVU
 gDPdqb1woJjpV1Z+KF2+QCi4PRVAF/SxbSocYECPCq1OtUPzuLyf7Wb03VOLrsYuE9qz
 C+B6bnQjT/+UR1rBVygT4SsozUDFkA9OOA9PP7sRFvSO5bM3rBMQSw4Hmnk0pmrRj7dk
 USwCaQdD/EAWMy25FHVxCnDzDZ3PklZ0PDygEM3GF4mQRwWm8DR0N/KkDW6ZUAkpfEI/
 PZk7FR6tQzZ9UPAGB01Y0JiUqSFqI9LdU43N0X0ykY0LRkiIxiJoSjD/AsfFy8KfMcio
 gWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388895; x=1700993695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=mqJ07Bz7gwFaBBCtmSU+lHj24pPvMWXV3XrI0TO0xQvmMlpjTzH4S1QcDpb8qg9AFv
 rfPBzVd4jtqOb7hdpZOanRMasPp5bn/84bu+4fugI7/+GA4a7Yva8PTZlKDx2H3fvJy6
 Sl+wOAz54Fy/7QNMmdmYsWWzY+egGzyCRQb1A2qHY7XjKOLf4UCNuwXepwgzYknck5kK
 +oU0qrQOkt9aU4/AAjAH3MG2r2iRolZnGH2IiCEsdVXqDzoA4mNG8oEjXdaa7J4b3rVi
 9t12VhZgdJgTX7f4SqNH5z7nmJ5Lu2AYhwzqypMOvTHFkbFZOgMCkKVGGXujAMtq+nCp
 OLVw==
X-Gm-Message-State: AOJu0YwD3ept0FfuNeGGLST2MxvZzLbijFEuXqPuOaDgrvDIVuQXSME3
 +nbU99/ARjSSrt1vnpObX6U=
X-Google-Smtp-Source: AGHT+IGBo5TDe+9oNNSJJ/7D94Y6LpcpavrjXJu+KHrikjnvpOJEV08xR/3GbhvbP9lm9HCrbdPOJQ==
X-Received: by 2002:a17:906:74c1:b0:9fa:fb8c:3904 with SMTP id
 z1-20020a17090674c100b009fafb8c3904mr2090466ejl.65.1700388894616; 
 Sun, 19 Nov 2023 02:14:54 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:54 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 06/20] drivers/video/fbdev/core/fb_ddc.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:31 +0100
Message-ID: <20231119101445.4737-7-hkallweit1@gmail.com>
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
 

