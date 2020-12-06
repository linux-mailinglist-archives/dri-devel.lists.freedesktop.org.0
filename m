Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC22D06C4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4E26E4FB;
	Sun,  6 Dec 2020 19:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51036E4FB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q8so12622010ljc.12
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GScDic0SzMOywiRur8mCpGJMaQJv67n1BqEnfhPYONM=;
 b=QMkRY6iR3O19IMJtlN+m8w86Axp8od1Z+Rd3idr23N4rt0HINNoZzNcNrb4mNMjjZu
 LtfD2LRDhh3DEyGEelRH+81cqqoQz6u2EGfaFSAaEV4zQVEQ7bdTSmG3CvppgGL4RgWj
 c7Oi5iOg63ZkdJPZC4t0TXvm2CwtDUzgfeudGj2JxAKG2JJV00RNILCmcFohVVoB5GRw
 Lc5MCgm2iKKHIevinvY7+ABLUGJ+6Wgt5evU5xN9dWXBW3BVnKhDDYg5UYkpaodDe+J6
 ppuuuQbWocz5KRVehMqi41+JufRzKHoQeL7FAeA3rqybqK6fKDkrVw+NwXOkDRqusUpM
 lMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GScDic0SzMOywiRur8mCpGJMaQJv67n1BqEnfhPYONM=;
 b=G6RodubVYOBpZ6vq5+oHzvZQs+ArRgQafW1GNMBfEHvzlB8Tu0umg/apXeZyGsvKZb
 /u90nq15xv0xvxSX7V3t9+QW/xGdnbeK1MfFxPGTGGc+hrTet/iz8vNS8+ydvxd7tCVm
 z3x9mWpHIgUykSuCCV22cNRjBn9aAn0YgYofCJqZRTSwHjWIb93IcllyNDxaSwJUvu7F
 Wwj5KCHddp/sMr1z6KpbD6Ly3pHv5uzIr/upsdEbS8Qe/M5EvZWieIW10/qH4z5xnN2N
 +lGg5vWhf3NaxR7Jk/e160WREnly64SSSbCrDXtsmuBZ5WOaBZcNJolTt1K3fTR7sD/1
 g3UA==
X-Gm-Message-State: AOAM530uF3rcm7NnoZvebFIS7jUPfwJC2RB19K4AE8tVaO5SFsF89ADM
 sou9yRFXbBDofxkZ/sUtFjE=
X-Google-Smtp-Source: ABdhPJxrMN/xtNgSlDAS8lye01CuFJ2naATPUBdhH/2vk8CwJU1fz9TzgghOkMOTq4Zk9C0n+Dp+gA==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr7193569ljl.281.1607281399117; 
 Sun, 06 Dec 2020 11:03:19 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:18 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 13/13] video: fbdev: sis: Drop useless call to
 SiS_GetResInfo()
Date: Sun,  6 Dec 2020 20:02:47 +0100
Message-Id: <20201206190247.1861316-14-sam@ravnborg.org>
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

Coverity reported:

    Useless call (USELESS_CALL) side_effect_free: Calling
     SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex) is only useful for its
    return value, which is ignored.

And this is correct - so drop the call.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: Colin Ian King <colin.king@canonical.com>
Addresses-Coverity: ("Useless call")
Cc: Colin Ian King <colin.king@canonical.com>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
---
 drivers/video/fbdev/sis/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/init.c
index b77ea1a8825a..b568c646a76c 100644
--- a/drivers/video/fbdev/sis/init.c
+++ b/drivers/video/fbdev/sis/init.c
@@ -2659,7 +2659,6 @@ SiS_SetCRT1ModeRegs(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
    if(SiS_Pr->UseCustomMode) {
       infoflag = SiS_Pr->CInfoFlag;
    } else {
-      SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex);
       if(ModeNo > 0x13) {
 	 infoflag = SiS_Pr->SiS_RefIndex[RRTI].Ext_InfoFlag;
       }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
