Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE42D06C2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946796E4F8;
	Sun,  6 Dec 2020 19:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA826E4F8
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:15 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d20so14849216lfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nq89nmYMFAZ5g1yAyMZHjiJetWqkZ/9OgWWUFHRT3b4=;
 b=WGpgX85MCpBc/yupm9apVzhUhe6pthypjQPG+TqhMPGOxcNMlZbUgD+wg1Dz9WkZ52
 vgriXDfWnywMSzvVRm98Or4TXWqplwssuHvJWhqEJlz/RY0tbBcVQYoUNBe1Ci6jflLr
 8gY3anClfRCFGPXzpqZjvmL2R+mgwYrBlDTHfC05x5eTOaodG0nDmLYOfOju5EIxSXn1
 ZfRFbvHkGRzw2FnOdGO64khY4a2egIHyqxk6nkb58s+bIHI2TmpmbDBeP0MachGsWcTV
 4J4WxRLcP6p9CMZds7niw/z1J35TMqzqFMbINUCdLemUADLZ0C8d29H7sgAF/DMu3U8S
 fvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Nq89nmYMFAZ5g1yAyMZHjiJetWqkZ/9OgWWUFHRT3b4=;
 b=i9t4YRmwSVtxwLVRvNFUAk7iFB166EsBT32DxZUo8s57MpA0Fsgic7lDZTzpbIPLDq
 bguTXTfH7cmmwoKMtEM25XptA45lKHHudeFzglUQnwUxlTBQ3KrpEp0+7A4k1vkO4VMH
 uDxt7EGOWxHFH/5wpeQXltho3fushUmjKiAMzTiY4CyfqGaLCXNGYMrisPoGq3DFO9Sa
 f07Vl6VAO+qTan1jHAYdCJm7+XLViy20gXOn+7i/w0UMJrX7+zN90tSNhG8MzYXJ32eS
 B+cjt0ojj/7cIS8PdDw8/CyRW6x0XaVMObgevGkelZQA94gdBPI0sAm4v+UPll0IQsby
 fIbQ==
X-Gm-Message-State: AOAM531BEtxd6N/2+X4lbVHSCJNxMtPQD6rQtOZt07JiPm0Mwuyuiym/
 QASErmNl53C7a1jKxQqTFwQ=
X-Google-Smtp-Source: ABdhPJzwaADOyAjTA/hARmZgN7KTVo4qobwfMII7N5adWMTLZMzL8lf7NO0ukXa+upxezM5u7zbd4g==
X-Received: by 2002:ac2:4c8e:: with SMTP id d14mr6892427lfl.411.1607281394385; 
 Sun, 06 Dec 2020 11:03:14 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:13 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 10/13] video: fbdev: gbefb: Fix set but not used warning
Date: Sun,  6 Dec 2020 20:02:44 +0100
Message-Id: <20201206190247.1861316-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206190247.1861316-1-sam@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable "x" was set but never used.
Drop the redundant assignments.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/gbefb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 31270a8986e8..c5b99a4861e8 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -198,7 +198,7 @@ static void gbe_reset(void)
 static void gbe_turn_off(void)
 {
 	int i;
-	unsigned int val, x, y, vpixen_off;
+	unsigned int val, y, vpixen_off;
 
 	gbe_turned_on = 0;
 
@@ -249,7 +249,6 @@ static void gbe_turn_off(void)
 
 	for (i = 0; i < 100000; i++) {
 		val = gbe->vt_xy;
-		x = GET_GBE_FIELD(VT_XY, X, val);
 		y = GET_GBE_FIELD(VT_XY, Y, val);
 		if (y < vpixen_off)
 			break;
@@ -260,7 +259,6 @@ static void gbe_turn_off(void)
 		       "gbefb: wait for vpixen_off timed out\n");
 	for (i = 0; i < 10000; i++) {
 		val = gbe->vt_xy;
-		x = GET_GBE_FIELD(VT_XY, X, val);
 		y = GET_GBE_FIELD(VT_XY, Y, val);
 		if (y > vpixen_off)
 			break;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
