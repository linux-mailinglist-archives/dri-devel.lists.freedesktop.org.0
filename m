Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED57F5B64
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE66B10E6FA;
	Thu, 23 Nov 2023 09:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5AD10E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:55 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a06e59384b6so38899466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732453; x=1701337253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1X2LDaMbB0c5HZoTNyhIjHAhgnohEDN3uV01ROjEnUc=;
 b=dqEBfFh/wMUWgp1//DTG8m/dorpcmffMLKwX+MRbSORgBxSxHbFlXAZ+ztPIukxwgU
 HtstUkVyqcXacHgSCeG5/EAj6PmxU6kQ9CAuBFm+NsqN6XGNdYIA4R2ZZWptlNvQkype
 umiZo6Og7/BHQ+Ew+MXUBlmZ6sFSWzmkwy09+qSMv0QDj8cdc9PvjB65MTHokqKc04/H
 lnuNftYBuhacN7Q3RgvL93n75i1wbWvV6sbVZNZuSnua/Cl3Bay8ltuyoBQyqGEPKoEp
 +Dx+7SdqNb8kSPQ3/AMOFuU9kBOpvnUGeRf+7bFIeBMstmR1KEUOT6RISEyCeVqFqmAx
 aYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732453; x=1701337253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1X2LDaMbB0c5HZoTNyhIjHAhgnohEDN3uV01ROjEnUc=;
 b=ld95CvW3Vd/43vDqWB2iyb+JMKp++MFryhCpHzy+zdpmtxperO3YzqWtFaiuhoUc1E
 w9xQfPnSglALsIlM2WQk4yvkHJZ6YZG1Y4732pui2EaX8hCW312aq9KKnkrTuwEVZAK/
 pOy5OE/2GHcC4ghUTprNt0e0tdkKL0esLAckgg/NUDqRcmaZKyQyCD7MNCs1vhUWDOiF
 +t36wHWS7Uz9EshfzmvfHr56YSJiZnkp2CPLZedSKMJ2EPjWDAZ2aZ6h5y0U8X9CSHDP
 AOZrjxlKXNyERBQ+dnb6jCIxU9SwvL6u6BmoHm+RCcbwJXJBva3EBzIsAqg4rKJmptmV
 bItg==
X-Gm-Message-State: AOJu0YxSXBxM0ZTPzzUJOk2b0KI/HLQ4xIV5w4dqC/IHGIUg6FlRyAVl
 +y0otwZdLcYdM9FYzy+nhmM=
X-Google-Smtp-Source: AGHT+IG2ldSIvJkPOWRUMwqptBELwha4P3UEDAWFeFhYxPAf0Hq1Cr63BHUft7JxbUZhAWi2pEm5Tg==
X-Received: by 2002:a17:907:9382:b0:a00:9550:b08b with SMTP id
 cm2-20020a170907938200b00a009550b08bmr3262185ejc.24.1700732453321; 
 Thu, 23 Nov 2023 01:40:53 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:52 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v5 10/20] drivers/video/fbdev/cyber2000fb.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:30 +0100
Message-ID: <20231123094040.592-11-hkallweit1@gmail.com>
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
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
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

