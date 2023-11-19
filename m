Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E127F05BE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572AF10E1DE;
	Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E6810E1D0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so4933583a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393315; x=1700998115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=nsJCRXQfiKMfxrblMcHM7UoioSJR/jn6wU6I7oQSFVMV3jH14d9CMyrmCbtYv8H0oB
 MxqrX6MJFxqIWJ2mtOlJK2+eBSNFagnVR3qIjybtcJLwNxoXsoWvhWry9NmaZV1BBg1E
 jVqIhsfwIXRiS1dgZJs25+26p3vr2FA7J2CPtIZj67NMoA85IvhTO/bdW9fUQls61cKq
 jT1kc5iA4qTKRDbhzUo24+IDnhUQuueZLuP2c6NWUxh/iMQh6d6lg/KmnkH74J2j8oCs
 IJZT/K+NpuU1BX6TwoMhFTY4zScZFVlkc3JvsUcGJ0rbOiWQxBnHmSSRl51xOLaCCKHU
 8qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393315; x=1700998115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
 b=T8e4gvkuICnH8yzQZ5EMlv7mUrZBDuiCqe2o2qnLxUObE9CSG8sXxKfo+prIPkF3Sq
 GOB+GaSuKdI761L6C1dYv1va9CDFCf3oZhgiz0sPUcDWSkjD3fBSuMCFScpX1KkmSvZa
 hnZOjvBF1BeQI52MKHwEogV/C0r4TQXfKzJZo2qmQQuvhfUaNH9dIjCLAU90Zh6vyKBi
 SwPcboe2xIoTGtzL/2znPuF0WoxSUYst2dcCReTmyVfNerVWtljqoNczPtbm8aMxOnvJ
 jYVFbYM/mgwjGwOzqmcv754WgbN/gJ47zt0fLyOrOZLYg8DmCYnBQMvuYVV1EDTSDbFo
 Va/g==
X-Gm-Message-State: AOJu0Yz+Gvza/sqPFQwZoo7WgOccT0z3RK6BEFE4DXFc5QNo2Hr3+HEx
 vB8V2C6eggDDNkB1KtCljp2xVI2TBuQVWA==
X-Google-Smtp-Source: AGHT+IGjalgverwn4S+5/ObyVC+zY2/IsZIJGBRuqRZihGBcwWfCh8FC+wiaF3tbr+HAjd7T9RyHjQ==
X-Received: by 2002:a17:906:1b:b0:9e2:af56:c380 with SMTP id
 27-20020a170906001b00b009e2af56c380mr3594717eja.6.1700393314983; 
 Sun, 19 Nov 2023 03:28:34 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:34 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 06/20] drivers/video/fbdev/core/fb_ddc.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:11 +0100
Message-ID: <20231119112826.5115-7-hkallweit1@gmail.com>
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
 

