Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661397E395
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 23:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3312E10E34F;
	Sun, 22 Sep 2024 21:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LabCxgon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A236910E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 12:12:20 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7a9ae8fc076so385952385a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727007139; x=1727611939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=VS1hIkkrLN57v3P9cwhdNl/6iwD4+WEDwLLcb3wVylw=;
 b=LabCxgon/4r6NzcAqNPtK1/76Vbz98FdvahSqb73fyzWRKtgwZbT29RMyVUo6zOCGj
 kWTe4xNJ787oT3dAizAta6pnpPa68Dz6DNZCk5rx7MiYeGgcPfUuKXnHfUiea+sR8e6j
 9kNem/HNJ1OVoGwUj5k1ENTC8FiUsCGgdQkquMlX18xZwGReDfMvgoUtRkyISz53UuRU
 fk2ngXOTIqfAefosVQMbYLPQdIY51sNoU1ns/q6hR/oTXGhQFBS3d0JJYbHXoAiWZKdT
 gDB3N7KgZjpt2ZbucSzu6mIXtCXIuXEm7VnuKt+8hEOuQ9aLpsGPL8P9eH95LQs8PKaB
 hlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727007139; x=1727611939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VS1hIkkrLN57v3P9cwhdNl/6iwD4+WEDwLLcb3wVylw=;
 b=CadbEnM+O7psme33QeVJPOzGjXt8z1MPGIV0ER19ZjKjeh5pjwFS5J43ccPIMAJqi5
 BtB42k0m2G93BydXfG77ZD2ppyp7gQdPKRrU3/sEWg8wDnjk/hEefyZXvg4NinQcGN2w
 vpxG5b5M7UtWJvrU7lnHMhrY/xDMhRSmO4YGhRBNX2xlI5y4CnQx3UA7kMDKDM7RD2Cn
 LhQ+gH8KiqiiBNjFANIitispn3ADxHx+1tjkJHO+a0okQY7p68C8OHX8bwX2zOORQYlZ
 a9YhtCt5MfwiFsJofSDNhDn0oFvNepdOXHt1Mdz9za77d9Us+T9UEjl9ZrU4s9TeuakU
 GJrA==
X-Gm-Message-State: AOJu0Yy9Yu66zbnovjY+Oz4ah+JYywXIQycib8J0oLOUnoL4goJE4JZZ
 E3vB+Kq1SUnT/icjZ16MsHSb5Eb5tY3nSUt/1PTT54gGF0dLOdICk5PAj6pg
X-Google-Smtp-Source: AGHT+IHh67MorNuxN6aG8qz3DGbqWTu7y0US26POxQ3cxkCURnlAu9OcRt9UFB3mno1C1NTNDRjQBw==
X-Received: by 2002:a05:620a:178b:b0:7ac:a0e6:70c with SMTP id
 af79cd13be357-7acb8e0fbedmr1357396685a.60.1727007139164; 
 Sun, 22 Sep 2024 05:12:19 -0700 (PDT)
Received: from fabio-Inspiron-3583.. (201-43-119-188.dsl.telesp.net.br.
 [201.43.119.188]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7acb08d9098sm376545085a.111.2024.09.22.05.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 05:12:18 -0700 (PDT)
From: Fabio <joakobar2000@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Subject: [PATCH] staging: fbtft: Changed calls to udelays() functions for
 usleep_range()
Date: Sun, 22 Sep 2024 09:12:13 -0300
Message-Id: <20240922121213.4260-1-joakobar2000@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 22 Sep 2024 21:03:01 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replaced two lines of calling  udelays by usleep_range() functions, adding
more efficiency due to the need of long-lasting delays of more than 10us.

Signed-off-by: Fabio Bareiro <joakobar2000@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..edd467c6bf1a 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 150);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 150);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.34.1

