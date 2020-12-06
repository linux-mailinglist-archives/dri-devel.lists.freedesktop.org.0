Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28C2D06C3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C3F6E4E8;
	Sun,  6 Dec 2020 19:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3C46E4FB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e7so2430242ljg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sXUs3Mthn2WNxe9bljzB5KJJxtMgTykEfGBU86F6xiE=;
 b=Q4dR21nP1jZzsA/PsBN5qV0FqAKg4TkCjUyfsDCiyitQByJY5pO5fmgCAt3HViK+Vu
 XRUL2l0cD9wsZRjDwcbB0ZkNdr2Ir8Z7fcIEcrCiLQ53YeGHkSqqOUbj4eNSOg27SQ2e
 VuiJFCYExB03CZXF1PU6lkLv//+TmUU088Jb20M90SzVM9CX147uj+6nsdoHGclTz2ug
 h7Enp9lKWI4SeKqcS7nXNJbi6m28/YpB2nLY/XwFy9XMEryms6GgsPuePANX6hSoCvmW
 db092ppYA0YCdY9Z8mQQsgWKkITED7TNoaGGzceIxon6WPvVxvSHD/htfnVZo8eKukOP
 QYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sXUs3Mthn2WNxe9bljzB5KJJxtMgTykEfGBU86F6xiE=;
 b=sXmnYKcv7MzwV25wyzCMq2jZGWvW1EN9xb7YjmIqzcSc13drIOaBkOVTCmEM7zzU8q
 o6lzKXO9q9fMutnlOCZ0n0sDjzEdy1m1LRRDWWnkk4x5J9/d/9SW+NpF+FzAaBHRh7xk
 f7/LL2K8KbcmGgJrPEtg7q2MmdYHGG/TQh2I2gWZGAz04oM22BJ2YTTmcgoZGxl6ahY/
 351aKR7x9EH2YXCL8ncrb77mdeaT2NnfXp0qJlt6EqphY48LfV9Ug8JVbr1PyvCRWzZm
 ZpQxnAOrMNQXoUP+o4YPHAOF0EoTa5DjZivHxJxxwASISEsT4CZyIGLaw2sfoyt33Ndd
 1LcQ==
X-Gm-Message-State: AOAM531NAIZFN/Q+zFmHmwIMnF6VsOG0Wfio+poxAa5OQHOOB11kCv9s
 jGZHNFwBQhoxMq/3/eQWr7U=
X-Google-Smtp-Source: ABdhPJzb0KQuWgqAs1QxpFLIbzjo0hp3iVTcDNFOfPyUb7EI83W2N6g7hHXWSCKUuYPdd+iJRhnYvw==
X-Received: by 2002:a05:651c:10d4:: with SMTP id
 l20mr6957942ljn.389.1607281397682; 
 Sun, 06 Dec 2020 11:03:17 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:17 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 12/13] video: fbdev: controlfb: Fix set but not used
 warnings
Date: Sun,  6 Dec 2020 20:02:46 +0100
Message-Id: <20201206190247.1861316-13-sam@ravnborg.org>
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

The controlfb driver has a number of dummy defines for IO operations.
They were introduced in commit a07a63b0e24d
("video: fbdev: controlfb: add COMPILE_TEST support").

The write variants did not use their value parameter in the
dummy versions, resulting in set but not used warnings.
Fix this by adding "(void)val" to silence the compiler.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/video/fbdev/controlfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 2df56bd303d2..509311471d51 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -64,9 +64,9 @@
 #undef in_le32
 #undef out_le32
 #define in_8(addr)		0
-#define out_8(addr, val)
+#define out_8(addr, val)	(void)(val)
 #define in_le32(addr)		0
-#define out_le32(addr, val)
+#define out_le32(addr, val)	(void)(val)
 #define pgprot_cached_wthru(prot) (prot)
 #else
 static void invalid_vram_cache(void __force *addr)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
