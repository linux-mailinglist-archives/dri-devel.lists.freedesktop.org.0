Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A877F5B4B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC64810E6F9;
	Thu, 23 Nov 2023 09:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEED10E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a02ba1f500fso90834666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732450; x=1701337250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4xwkZlQCS57rh5cLLkPqLJtM9ewQjK5YT1ZnNRRYzc=;
 b=k5FCyJ+wUEZ/S8lRPkseLMDFqOSSqRaBRwluAprHAbt1oN2cvgkCV9eXMJW4FFqSI0
 UqMMgpu37Mi+nBTa7sH6XVZjaZYSTOY8Tm0wu6eSlCt9SwwL6UkoGaYkF/aqK0gbFbwh
 7TKyCIXVyf2ef2otHF8VFACYAKBYgsGRBsFGfjP9z99UgKkkc3J4/JPjq2oVk/rP2Biq
 HgNl/UMLCh0U2QJR6nMXGuCYdAT6qSMtnt4uvd7AMZEkaqoSSOgMz8SUNZwibWx0sO8t
 6MUO81GQrLIh1LzFPzaOMurXSq+txilzf+8riSvpoPDJQ9P3lLSpCMoI7gTOdvd8o52q
 yGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732450; x=1701337250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4xwkZlQCS57rh5cLLkPqLJtM9ewQjK5YT1ZnNRRYzc=;
 b=woz/GNTMUHkQwETsVsDcAq5rjPrrPgoV3HGVr9JoqcAg+9UP0m5OzfdYuJ+1EfOeHk
 Aq+qMIfu+q9I53I61y8ivdYFtKkc5BVlEQXpvBq7o9xUHK8nD/0VGtY9+zSwZDxgOvFn
 rZV3ckwW+5nqTKY9W5SyOpY85qDPCeknMFXuUe+510ZDYwjYu4uIp/086EZAL6LU7b+/
 cJC6nstX2y9ZTgDWSjbba6KvbGXgaqJ73N12zmoLbJE8kWyvfMnvMP1aYJ8tDe89WsC1
 r5Bsw9iLZVgW2uZ9Jg22hD7KaJZKimpgeyl1d66LSqxdnnwEOMPVjAyvJYZDsR0tqzg5
 Nn6w==
X-Gm-Message-State: AOJu0Yyhcc224xBUUtm2RTT/xxM0d7Gxdz///z/JsCeDnAsMeZDCp94C
 74EafzxQXbdeNgCAoG3OtuE=
X-Google-Smtp-Source: AGHT+IHb38lKBzahmB3scsQJ4G9h8mrxfVKAwJLraoLG53oT4I/ucTZBBGxcgUItZfDjTqSw8rrB4w==
X-Received: by 2002:a17:906:7197:b0:9e3:5c27:8862 with SMTP id
 h23-20020a170906719700b009e35c278862mr3223427ejk.27.1700732449746; 
 Thu, 23 Nov 2023 01:40:49 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:49 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 06/20] drivers/video/fbdev/core/fb_ddc.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:26 +0100
Message-ID: <20231123094040.592-7-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Helge Deller <deller@gmx.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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
 

