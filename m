Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC82D06BB
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A66E4D4;
	Sun,  6 Dec 2020 19:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E16E4D4
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:06 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u18so14859351lfd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOGcGZuV1pDdyacp1Yj7CCfxSkcEGtk2M7nbhP+rzwQ=;
 b=W4gYsSCFlMC3r/LTQSkwP0qTVDk1kJpWLdduH1jLyAqllGVDMYSQtNHD4blw1N+er2
 BugriDhBiTiR7o1RzujF9NtuuU75bkJ/e1zB98RoTOdqONoDAQjpknt9NtEy0ztGO+Z/
 y0S6SzoEbDhGl5nvhjjQi380hT99I/TFRGMDxK0NV7z8+vp1An2ttsBS7tU/dEoHTVJe
 ImwLOV15MWtZB1Vd6wFU7zHTj1P+UjwUUsxnpSrsz3wDH96Uy4CQSzco7ZyQGkY9zI1F
 qPX/ubbUWILv3tp4AgxnyahY1Y7CDdN1qyjxUQFsTF7qKlWJ4Mup+ExozfOVk0FioVe8
 odMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UOGcGZuV1pDdyacp1Yj7CCfxSkcEGtk2M7nbhP+rzwQ=;
 b=ArvO/PRFTmjMK2mhQqsJoCXrQkfNA4zExsnXHNtQV1LDjL3dlofH0JwlKfVvqG42dd
 w75wLiCbVvEF8aCOjFeuiu87GQLg6Go6C0JGuEMkUnaDlwEsfDy+ahFM5uZ+/p1Rbahj
 i5MmATosjqluiDhoR6UxXdzsyy1h8uPzS0zJJWuJvlKmrlce2zCKY5WRIdesMiwveXmF
 v6O7icp7GuXg4tfGOU6ppC/i+RJEOESG1iz7wo82b9cV33wxg2c+z+VHaXw3d/hj1ax9
 lHbXXmijeqAMKLKNL1S17GZCcZRmyIomer32eDC+EMgHEg4ZLHGDhG37nBGA5aMOvqCB
 30ng==
X-Gm-Message-State: AOAM531M/yRN2maxnWxciLdK1vFAr8NBy/6yzbzlmiZfbHrlVn6KaVNH
 SgMOuBbqFDisb41wkH1oCx0=
X-Google-Smtp-Source: ABdhPJxsIP6M5qtkKkVSQDTL6GRkXd2Urg3bP3B6nC0o/in7udaqrBXvv8Nl+MDjf6py3v0d86tqOg==
X-Received: by 2002:a05:6512:78f:: with SMTP id
 x15mr7093698lfr.370.1607281385343; 
 Sun, 06 Dec 2020 11:03:05 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:04 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 04/13] video: fbdev: uvesafb: Fix set but not used warning
Date: Sun,  6 Dec 2020 20:02:38 +0100
Message-Id: <20201206190247.1861316-5-sam@ravnborg.org>
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
 Michal Januszewski <spock@gentoo.org>, Peter Jones <pjones@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
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

Fix W=1 warning by deleting unused local variable.

v2:
  - Updated subject (Lee)

v3:
  - Return early in case of an error (Thomas)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Januszewski <spock@gentoo.org>
Cc: linux-fbdev@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/uvesafb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 6c9cfab39313..4df6772802d7 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -560,6 +560,8 @@ static int uvesafb_vbe_getpmi(struct uvesafb_ktask *task,
 	task->t.regs.eax = 0x4f0a;
 	task->t.regs.ebx = 0x0;
 	err = uvesafb_exec(task);
+	if (err)
+		return err;
 
 	if ((task->t.regs.eax & 0xffff) != 0x4f || task->t.regs.es < 0xc000) {
 		par->pmi_setpal = par->ypan = 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
