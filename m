Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB97F018E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0857510E33E;
	Sat, 18 Nov 2023 17:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0C988A27
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so3849635e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329352; x=1700934152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=huLXFv48A7Sa6nYsEitWmkgRbjv3iP/K7DOkmhklt28mNxi6AtKOt+IOWWLADHIIbb
 Noy6lG58q2I0NVT7bFtOQDbKAZr1mCJuFMQaCC8e3jHKlEHswcb8qsy5dqZSuRFr5eTn
 zDLRWzioKvCnxwLPZIrLv+t+fen6JdfHlnYaR+CaI1ThDgIFxQbI2XiPVTEvzXRwzZcv
 hy5bIQVQySJf0QfIFjlqOqOiR7dru59rkds7Bnu0y0J9ZQYWqlWsYUenWzxxppZYSUbw
 NRx3quAQwsW+79Aci2Bzvz6lsozgwKW8DXGU8USX6kM3DjWzZS7SUsS8Z8XU11cWfMad
 W9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329352; x=1700934152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=kSwZ9Qn35c6qQQzuX4n3Ktw35KRPvSpYGY/3fCqmDgaovPjiXvWuPbcpGZvYDeypDG
 DB5frVbN2r3TbtZ6TQCk3UF5E3OWqZcrn4VwtFTPro4SJDLZIZz9iU9yofqOQp5HX5Ya
 oAkPGuJOlZBFYytR81vfFLV2sAumPUIxi0UX/M8L6VoY0gsWOYL8UAIQC6HALofSpSMo
 5BXCgZ5KgWHx2qPrnUsnC+XzMjFTKTiegVX/KXCYYOaBmOzEBGeKca50o8gjLTexzGt2
 Dv4o1LwRMSpdq6r2HvE0qWycQNKhNePN771Pu/ajjDF2gvxIjc/63dCy8hv45DxFIkIH
 a1Mg==
X-Gm-Message-State: AOJu0Yzte34w1E2SOwk/TE4C97ajSJI2rxrSNkkOkVlDtNwG/DBGzb1+
 iSEYkr3On32HUHL2ppeGsHpiVA4vwHE=
X-Google-Smtp-Source: AGHT+IF2uuCnONQDkgVMYOEey1RFRUe8GnD9gILj5PaZk9ukHNBactX5XsSTUMsKSBKRWlQHaR36FQ==
X-Received: by 2002:a05:600c:35c7:b0:3ff:233f:2cfb with SMTP id
 r7-20020a05600c35c700b003ff233f2cfbmr2013183wmq.23.1700329351574; 
 Sat, 18 Nov 2023 09:42:31 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 06/20] drivers/video/fbdev/core/fb_ddc.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:06 +0100
Message-ID: <20231118174221.851-7-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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
 

