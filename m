Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21917F1F8E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB0810E1EA;
	Mon, 20 Nov 2023 21:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0388D10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso20388065e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516797; x=1701121597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05TjyImSoTBVtC1xNXeArH35uiTcm8HxTuw7Nbu59W0=;
 b=JfRuFzSabu2Hkk+KhBgXGOLQKTktYV2ZtFLbMr3nHK56w9L9LQ8wNvrKrBYNWUI5R2
 s57Tv76LjQBCyLZxQGZPgyEBf8ISz/S9MdCO9sOpFqxBqczGXB89cSgpwyHbaiI/mdlv
 KZ5rxCOgxIwjC4OJDccqZSrlnDujGK0v1b1167R4h8sY+YzXcQoR49UDyalOnTfGOIe1
 JBJk7MZvfD/ook+rVC/9DyPohM4GKAnLJFJjDA2ME8xguehralfS0vcwL1iVyeA4g6p8
 1DCToy6mGMKkLiTOM2Cb1VYa44qES21U/maloNAPNyiFk7hUO9BskRFhCkyS3wHOv7vv
 hu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516797; x=1701121597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05TjyImSoTBVtC1xNXeArH35uiTcm8HxTuw7Nbu59W0=;
 b=wrxpHJH17cUqDspfSycvw0Z4J6+U/wmk9VUqF/MRVBv7preXH2Cae2kpBm5hcficKy
 sFr/ReWAJFa4spodeS9Nt+zHmP1oYYYGmX8JGTaEvvykEmW02TPP2h+3j4ZSgQg5AlEo
 T6qKoRfuvFLpr1+lUP5p0mKSWWmowy9g0y8Hoad6RCRdUKCUaDF1LRzRbu6x6bprMoev
 SbNJwAo6iEBwV/kZryJ7oRacDYnGvbCZPgrO9J9X5pPTEMHLXqXR6m7gOoDt0KWAABg8
 1kuekjA+0EqXWbZcq+lpysBxcorcoIiIiFSb3eVhcug2azXRk9PaQB3Q0CLUCq3J7Zwr
 Ns5A==
X-Gm-Message-State: AOJu0YwnpZeLP9ebgGbK1btsnc4ADGAv4nnkQLQbacGH87rjuuAv4yyO
 nHpSQw/zk+ie5zYMPuUDJB0=
X-Google-Smtp-Source: AGHT+IHJoVgqVgRHUKYiAlqB4jK5099Vv0cVK0mL31SC+jI+u/8+HbpYjQSSsu7PjIpJalcA1ZWpRA==
X-Received: by 2002:a5d:64e8:0:b0:332:ca10:388 with SMTP id
 g8-20020a5d64e8000000b00332ca100388mr2882898wri.45.1700516796963; 
 Mon, 20 Nov 2023 13:46:36 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:36 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 10/20] drivers/video/fbdev/cyber2000fb.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:13 +0100
Message-ID: <20231120214624.9378-11-hkallweit1@gmail.com>
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
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
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

