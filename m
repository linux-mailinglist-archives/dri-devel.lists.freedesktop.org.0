Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B652D06C1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E13C6E4EC;
	Sun,  6 Dec 2020 19:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9189A6E4FB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u18so14859730lfd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SfLL6p8Oi2QG40QnuZputxs/YKRkVGSLvwvUqAWetc=;
 b=dzhegX2f5Ql3PjQBuil9z4sEYgr3337KW2qQckQ6pQGqbvHHs3CVckmYm5Un20ZhkN
 wdkTRTeoGd4YUyQFFb9U0U8n93rtfAEylUq//N9tgc51Uj0heyF4pNIBSnYX3+NsBMg3
 VlU4KJFbgS+nYglZ1sGrjauXI4h68vGNSOgCJRgtnTxfmkIhYAinfPZNDvHX3dZZVEpJ
 D8Uhz593GGEn0bnW/ZX+fvM/7cLfUcJ5KPkfia0Y4F+7Jzk8Drd3lORKZBfzTHoV+FZS
 vBppZ4WLbjFRLdfxltCmYT0j7Y1+AMNgraJP+91Ox1B9CubxR0yjYf9zDFUhIyR8iYzU
 sulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/SfLL6p8Oi2QG40QnuZputxs/YKRkVGSLvwvUqAWetc=;
 b=tFhrgRYeI8taR2OQMK7Upo0TAoUlVwVxWCcol074npDqgH8G/LgUQlhr/oiTeCZy6K
 veTJpoP6mt640btmQZGDgLeogiO1L6WRFjEMxMxNBMLgAT07IWJ0kJxQhvn+SDxugmn8
 4GB++z5UyAIfTNAozlpEY8Ii8Wp4HSvOdzjZUCt3WM0cfDefwlVY/12cN4IEsEpdDFwm
 4TltDZ5Jtkfqf7kTiXasQwUI5XoZ9pgXBScsDPU5/LIY7wmSbhBqfPLaDgxHN2xOlmCR
 NSedgiXkCOlPhzP/EwcD0HRk0oXSE0OxavPH5TgUKJiWWavxncl2ZvXaGCOhyaSJuChB
 RhGw==
X-Gm-Message-State: AOAM532RZofkMo9OqCqD2JCHep7Z9aXfegWp98be0+2wQR0yE07JThW/
 er5Dp3L6LyJGwtgqc7bTqN8=
X-Google-Smtp-Source: ABdhPJwxko1cTuuCkRnEsGsx7KovNmq7vPKRcW8CEJXVJu5saQZRJ120DnppqSpeigQFs93cZ9Bi5g==
X-Received: by 2002:ac2:46f3:: with SMTP id q19mr7197990lfo.76.1607281396030; 
 Sun, 06 Dec 2020 11:03:16 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:15 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 11/13] video: fbdev: efifb: Fix set but not used warning
 for screen_pitch
Date: Sun,  6 Dec 2020 20:02:45 +0100
Message-Id: <20201206190247.1861316-12-sam@ravnborg.org>
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

screen_pitch was asssigned a value which was never used.
Drop it to fix the warning

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/efifb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index e57c00824965..b80ba3d2a9b8 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -139,7 +139,7 @@ static bool efifb_bgrt_sanity_check(struct screen_info *si, u32 bmp_width)
 
 static void efifb_show_boot_graphics(struct fb_info *info)
 {
-	u32 bmp_width, bmp_height, bmp_pitch, screen_pitch, dst_x, y, src_y;
+	u32 bmp_width, bmp_height, bmp_pitch, dst_x, y, src_y;
 	struct screen_info *si = &screen_info;
 	struct bmp_file_header *file_header;
 	struct bmp_dib_header *dib_header;
@@ -193,7 +193,6 @@ static void efifb_show_boot_graphics(struct fb_info *info)
 	bmp_width = dib_header->width;
 	bmp_height = abs(dib_header->height);
 	bmp_pitch = round_up(3 * bmp_width, 4);
-	screen_pitch = si->lfb_linelength;
 
 	if ((file_header->bitmap_offset + bmp_pitch * bmp_height) >
 				bgrt_image_size)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
