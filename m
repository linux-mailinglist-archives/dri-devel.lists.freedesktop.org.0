Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB02C7645
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7E76ED00;
	Sat, 28 Nov 2020 22:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171606E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z1so10597666ljn.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+z/W9959CxKgG4WcN4Iy85oHK/P3LJfjbdab6tB79s=;
 b=ofNdOjN3WlUdlrHX/axL+yDyfNp545lGepiNBKQTQhrGcpIvCOWIuIjmylzgvkYZo3
 zZ/ft8dSvifUehjxethC+jjHyVhbJbbjzOyZv7I45z0hMnk7U/WcWz59qqdRlHjau7Y8
 N/Jpsm0jU14ltV83pn3FBcOgxnP5ZObDgmQ6RYyZTh0MxWUufx5lZXZFbnPzAblh+b7X
 2aVq6lJPoySRtc8kJrl/DwvplCIv5AzOmCPoU306KRinlxOrwDWgnPpmXiseo/BiaShA
 zovEbZQ6radlpeQZs5vPGCcwjpAYs9QIKn569HPMbFl38taCFfnbhp/Lzbx7qFDcJnbG
 Z5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X+z/W9959CxKgG4WcN4Iy85oHK/P3LJfjbdab6tB79s=;
 b=E4fMVBcvpbhKzhKsejSU0+7ZVTajpagGJ+biH0taCDo40V4M9l8eSeLZmEdZVpPQiA
 JHTa2ednKN2boEjF4I5su8iVEe1NMOK+1zGOqW+wqZpMHOYON2C81M7l+s8MKZLXHhH7
 vbUpFnn6YdjBusTDmmiOg6thvj97CvXPDHa5DzmdK/6Gs6gIUSUuYdryJ2Fz46kxthSv
 EcJF2yMzXt3dL7tv7PF3yeAFHeH8WnukTdiNPpzX6BV1IaCM+ptdtcD6tXNXzege8nXu
 qPe90ei17khXXkwkPC67A+61/6gQRSgEcfACqk70fUMYrP3QFvuxFqxG0lK9P4oTiewh
 8IVQ==
X-Gm-Message-State: AOAM5331Fx3eDuGTnV4RREIRbPkRW+uReVZYPxvfWvZ5nx1lJhMn7s7N
 ur+ZYZZ3terX/dcDZnzDWG0=
X-Google-Smtp-Source: ABdhPJwNCw1BRqGWU4zvMymxV8jqichRChera60GIW5wRzO4XHUQq1DJ6DguS8QDaDBs7tzG3iq0Xg==
X-Received: by 2002:a2e:a376:: with SMTP id i22mr6714027ljn.217.1606603299518; 
 Sat, 28 Nov 2020 14:41:39 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:39 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 09/28] video: fbdev: sis: Fix set but not used warnings in
 init.c
Date: Sat, 28 Nov 2020 23:40:55 +0100
Message-Id: <20201128224114.1033617-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix set bit not used warnings by removing the code the assign the
variables and the definition of the variables.
A register read is kept as it may have unknown side-effects.

This removes a lot of unused code - which is always a good thing to do.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/sis/init.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/init.c
index fde27feae5d0..b77ea1a8825a 100644
--- a/drivers/video/fbdev/sis/init.c
+++ b/drivers/video/fbdev/sis/init.c
@@ -2648,7 +2648,7 @@ static void
 SiS_SetCRT1ModeRegs(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
 		unsigned short ModeIdIndex, unsigned short RRTI)
 {
-   unsigned short data, infoflag = 0, modeflag, resindex;
+   unsigned short data, infoflag = 0, modeflag;
 #ifdef CONFIG_FB_SIS_315
    unsigned char  *ROMAddr  = SiS_Pr->VirtualRomBase;
    unsigned short data2, data3;
@@ -2659,7 +2659,7 @@ SiS_SetCRT1ModeRegs(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
    if(SiS_Pr->UseCustomMode) {
       infoflag = SiS_Pr->CInfoFlag;
    } else {
-      resindex = SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex);
+      SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex);
       if(ModeNo > 0x13) {
 	 infoflag = SiS_Pr->SiS_RefIndex[RRTI].Ext_InfoFlag;
       }
@@ -3538,17 +3538,13 @@ SiS_Generic_ConvertCRData(struct SiS_Private *SiS_Pr, unsigned char *crdata,
 			struct fb_var_screeninfo *var, bool writeres
 )
 {
-   unsigned short HRE, HBE, HRS, HBS, HDE, HT;
-   unsigned short VRE, VBE, VRS, VBS, VDE, VT;
-   unsigned char  sr_data, cr_data, cr_data2;
-   int            A, B, C, D, E, F, temp;
+   unsigned short HRE, HBE, HRS, HDE;
+   unsigned short VRE, VBE, VRS, VDE;
+   unsigned char  sr_data, cr_data;
+   int            B, C, D, E, F, temp;
 
    sr_data = crdata[14];
 
-   /* Horizontal total */
-   HT =  crdata[0] | ((unsigned short)(sr_data & 0x03) << 8);
-   A = HT + 5;
-
    /* Horizontal display enable end */
    HDE = crdata[1] | ((unsigned short)(sr_data & 0x0C) << 6);
    E = HDE + 1;
@@ -3557,9 +3553,6 @@ SiS_Generic_ConvertCRData(struct SiS_Private *SiS_Pr, unsigned char *crdata,
    HRS = crdata[4] | ((unsigned short)(sr_data & 0xC0) << 2);
    F = HRS - E - 3;
 
-   /* Horizontal blank start */
-   HBS = crdata[2] | ((unsigned short)(sr_data & 0x30) << 4);
-
    sr_data = crdata[15];
    cr_data = crdata[5];
 
@@ -3588,13 +3581,6 @@ SiS_Generic_ConvertCRData(struct SiS_Private *SiS_Pr, unsigned char *crdata,
    sr_data = crdata[13];
    cr_data = crdata[7];
 
-   /* Vertical total */
-   VT  = crdata[6] |
-	 ((unsigned short)(cr_data & 0x01) << 8) |
-	 ((unsigned short)(cr_data & 0x20) << 4) |
-	 ((unsigned short)(sr_data & 0x01) << 10);
-   A = VT + 2;
-
    /* Vertical display enable end */
    VDE = crdata[10] |
 	 ((unsigned short)(cr_data & 0x02) << 7) |
@@ -3609,14 +3595,6 @@ SiS_Generic_ConvertCRData(struct SiS_Private *SiS_Pr, unsigned char *crdata,
 	 ((unsigned short)(sr_data & 0x08) << 7);
    F = VRS + 1 - E;
 
-   cr_data2 = (crdata[16] & 0x01) << 5;
-
-   /* Vertical blank start */
-   VBS = crdata[11] |
-	 ((unsigned short)(cr_data  & 0x08) << 5) |
-	 ((unsigned short)(cr_data2 & 0x20) << 4) |
-	 ((unsigned short)(sr_data  & 0x04) << 8);
-
    /* Vertical blank end */
    VBE = crdata[12] | ((unsigned short)(sr_data & 0x10) << 4);
    temp = VBE - ((E - 1) & 511);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
