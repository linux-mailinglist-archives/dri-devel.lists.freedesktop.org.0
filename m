Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE214D2276
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2710E53C;
	Tue,  8 Mar 2022 20:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6717610E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:23:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e24so17344990wrc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXyC5AW49mHHOyaspB0AVoqut4G8nZTKpgTNMZNuGkQ=;
 b=YE3ikwTb5vEazQMOdf5t2mhQdCFCrUylGfLVztMn0JsQ5sHGAF003QZjiCwd5Di4OE
 ch8vMt9MsFW2Uk4VIQ0TXXbw0JxzgbW6LZkixNNDSVQGi0TE+KS0ydhL7mNvod+OvHQ+
 FTzeHMDjFzCvg3qGbG+2QyoEC1zEuTfiT6Uuh7N3D/5TnvuSJlvu/aPZLRDyucuTuiVn
 qVd8sJ3aY3fmIgZNdsgn2Wm+iBHg7PXyaVCjKJ4QXbuV6deIUHgv0KZ4B5bfU4c3WINr
 HCCaZ9GDLpKKudwakKi7v8WMMQ7tLi2gyhEs8hzI/H9VNykYVZXvbOV81YcT57B8iJtx
 cgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXyC5AW49mHHOyaspB0AVoqut4G8nZTKpgTNMZNuGkQ=;
 b=T3IA/nNyYzBZynYBsuT6wFAZgZsCB47dW6WNra61bskKyILYS0aPdXwNSy/sELikOq
 IGebVJKh4trb/2PsTtkQuvqIMbfAvh+uSmWw1dyH+09LJnPvC0cR8/EbUwrPB6T145m8
 v7L5gC/qUI7dIFCXbphLrgJ7RjjWMlfxxr9pCfwq6l47Qr/va295szh8MhojDsGK+0tG
 a9Olxpy6YEgv10cST0xWH3CvH59jz6nlEAXrMT7FQLelfxr51L8XPOrGzGTzykfqpaLi
 xs/AV5wJv2P6imVni3ewIi1G6R8mWO64yfaagLR1+NxqxCEf30PjBACPNT8etJdyodcG
 6sNg==
X-Gm-Message-State: AOAM531Z7eRpKMXzE3tC7jysovOp/RGO+521XouD+qN8FpqK6c21kCiL
 X72pn2xJe8QwqNT/+FCv7qE=
X-Google-Smtp-Source: ABdhPJwGZBW6UGqgP6AXu3Bnw4JCg8loJncWlCnrpwjKMWSgonD6uc188068eNC50h8fIMk7j7fT4A==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr13610952wrf.315.1646771009903; 
 Tue, 08 Mar 2022 12:23:29 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b001f1ffd04672sm4832933wrh.12.2022.03.08.12.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 12:23:29 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: kyro: make read-only array ODValues static const
Date: Tue,  8 Mar 2022 20:23:28 +0000
Message-Id: <20220308202328.104043-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array ODValues on the stack but
instead make it static const. Also makes the object code a little
smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/kyro/STG4000InitDevice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/video/fbdev/kyro/STG4000InitDevice.c
index 21875d3c2dc2..ffeb355c8b50 100644
--- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
@@ -124,7 +124,7 @@ u32 ProgramClock(u32 refClock,
 	u32 ulScore, ulPhaseScore, ulVcoScore;
 	u32 ulTmp = 0, ulVCO;
 	u32 ulScaleClockReq, ulMinClock, ulMaxClock;
-	u32 ODValues[] = { 1, 2, 0 };
+	static const u32 ODValues[] = { 1, 2, 0 };
 
 	/* Translate clock in Hz */
 	coreClock *= 100;	/* in Hz */
-- 
2.35.1

