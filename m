Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E47F018B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13B610E344;
	Sat, 18 Nov 2023 17:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7275910E339
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4084e49a5e5so5442715e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329356; x=1700934156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=Q+p9wbbDp5F9M7Pg8Q56D7ARaJXqCqm9suR1CkZgkFIx0Dc9MHy0wOth6Pbwaf73jj
 oEItFyOz1T4fjOwXYrrtd//yDfpidLdtso+SCvDWqyc7vWlkSAIvPRfXMiUQ9mVKKPNi
 vjhx498xpLO44c0Twtpp1x1Qakt31aOcz4YqR3B484WGGuAAjIAR4+sL6qhoJwezYreh
 1vAnIn4492r33yFzSiVIjoPSOKEOiTgnad3rSy90cHNzofGmk4KsgYY/ZYuIQcDWbJk+
 p1S3sEcfMV+ncizLf3K59IJ7r56BHvYw5/6XciZ66gprifzqCNZZGdbs+ItYNMc9utww
 WXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329356; x=1700934156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
 b=TyBroiJUF4p6Cf+EUEQzGY9DEe2ojH93E7i12hwkJaw4d1DXKHAlsExAPGcXpzcUKK
 x9DwI+evmXe5zJ7ntGU2YzDshXH51tlhasis6fb3fy4dSTi3GMX4NkYSZ8W5/2EQK20H
 LDgJaAaW7eOjuTiqXi/N8R0HuXJoHUlzLIb+gvZE/LrdtypkqH1ewbgvDtO5waxlBo8H
 8ncr3kqTZTStO8pFa+UbBGzo9ccCLNmZ2sm2KUpyj3oA8K7Ic77JFiPcB2m6I2Jm3leg
 LR+I6PE8dvBbjEihFBmMHGbN60Qg4rH3u299ihoiTvwZTP14Lk6dyotrjDPCdOeol7Vi
 pmTw==
X-Gm-Message-State: AOJu0Yy5rCXxCZtYqf2B/0CMVBiXaqlhK4anI1Y7TVsAxsoj31VHgxwK
 a6AhiKxgXwvQSwFsG3zXqR1Llj3mjUU=
X-Google-Smtp-Source: AGHT+IH/UONni9JBi2RCMivHlBv+H1UGwnLkk3yuImh+ir7/RnEejhHlDGLGWXdlNBwBR0HTwihAzg==
X-Received: by 2002:a05:600c:4ec6:b0:409:3f53:c9c7 with SMTP id
 g6-20020a05600c4ec600b004093f53c9c7mr2232492wmq.35.1700329355808; 
 Sat, 18 Nov 2023 09:42:35 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:35 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 10/20] drivers/video/fbdev/cyber2000fb.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:10 +0100
Message-ID: <20231118174221.851-11-hkallweit1@gmail.com>
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

