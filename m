Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED022C763C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434B86ECF4;
	Sat, 28 Nov 2020 22:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D466ECEB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:52 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z1so10598129ljn.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGE3ZlcEoP1SxPsiy77Qp2XR/URo401XNflyUfm64IE=;
 b=NGdAgss+FahUORm2x4DH9YzsRqcLgj0lXXnanlCNTpQqTfgaHVlZbqLKRsMQzZYxr9
 zoNveiLLa1iWP5JzNJVbw2lOPyrYB0Sr9ombxq1voQHGB0Oo0GL1KsoUzlrx5S5Zj56f
 vBruRLtiEHiE1X6vaJoYrf7Du6qhuS43Nd6BzkBFhTZF4pLxxowsP4uUsT58x6nym+Ky
 AznbSHvNNjj+pDf4WbGInBM6Ze0G+zZbUtGflnyzFIGPHXIiuUqYL8MYj+aFqwOMzb0e
 HT14qrtojp/d8CjY0HP3bmUNZP/E3NNfrZqdf5SXo4FDLbagOAzajk3oioHmWKIFT+FU
 UTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RGE3ZlcEoP1SxPsiy77Qp2XR/URo401XNflyUfm64IE=;
 b=X9fz0QZxMLSRJBJWfJygozFEMVMSbVTb8/U67Dps1Y1NIKYXPa/mvJmyi9D18pPbnU
 qOUWAY8Yj1wXVfq64ZXFeynVbCyvKv7GlWuM6UQt7aO2b8DPBltIfX6uQfKzEF+/s657
 gsk+KJqfKRBpmKS+1StIggapFZuzM2BNLYy88mMe2B4Zt6ZMc52Iy3IMMxfh34TYMwnU
 kUroanJDev5PHrTaWUEcfgRJV3cwpcgv7+xHyCUZeSms7KrrGsv1hcY2R+dM7LRWsXJ5
 /xosYThjcRW4hoGoqBQM8fzN7YhUjQ7UvV0cYrgPhZPlXyIkmWuIXiaGeHuRZyKGoUo2
 EuWw==
X-Gm-Message-State: AOAM532wgtW3BQBbpEQ0Q1ShoYmxWpwZTdt46j2As1ZaKiiM/M24uzIc
 Dsfxq1B3SWvgj3h2ScLGIPY=
X-Google-Smtp-Source: ABdhPJxpScsB3nbNJ7Ym+OnGnfIL7YQp8eOIXX03B8zty9uORsv85KSdCb7dN3BdLWsJa159Bj2Bxg==
X-Received: by 2002:a2e:99c8:: with SMTP id l8mr6101773ljj.469.1606603310634; 
 Sat, 28 Nov 2020 14:41:50 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:50 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 15/28] video: fbdev: neofb: Fix set but not used warning
 for CursorMem
Date: Sat, 28 Nov 2020 23:41:01 +0100
Message-Id: <20201128224114.1033617-16-sam@ravnborg.org>
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
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 warnings by removing unused code

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Evgeny Novikov <novikov@ispras.ru>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/neofb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 09a20d4ab35f..c0f4f402da3f 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1843,7 +1843,6 @@ static int neo_init_hw(struct fb_info *info)
 	struct neofb_par *par = info->par;
 	int videoRam = 896;
 	int maxClock = 65000;
-	int CursorMem = 1024;
 	int CursorOff = 0x100;
 
 	DBG("neo_init_hw");
@@ -1895,19 +1894,16 @@ static int neo_init_hw(struct fb_info *info)
 	case FB_ACCEL_NEOMAGIC_NM2070:
 	case FB_ACCEL_NEOMAGIC_NM2090:
 	case FB_ACCEL_NEOMAGIC_NM2093:
-		CursorMem = 2048;
 		CursorOff = 0x100;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2097:
 	case FB_ACCEL_NEOMAGIC_NM2160:
-		CursorMem = 1024;
 		CursorOff = 0x100;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2200:
 	case FB_ACCEL_NEOMAGIC_NM2230:
 	case FB_ACCEL_NEOMAGIC_NM2360:
 	case FB_ACCEL_NEOMAGIC_NM2380:
-		CursorMem = 1024;
 		CursorOff = 0x1000;
 
 		par->neo2200 = (Neo2200 __iomem *) par->mmio_vbase;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
