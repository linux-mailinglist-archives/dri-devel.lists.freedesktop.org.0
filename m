Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DD2E6F74
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ACE892E2;
	Tue, 29 Dec 2020 09:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADC98930B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 18:39:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 190so206075wmz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 10:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eAfxEH9esfhpiv4Co1s9xEbTa1KclcxNe0HYE/BNPIE=;
 b=fQAZm5gln5XMN9RoxDBKtzBujLmYHHODFRcZERiwcrsNkge2gsCY+aEiGyxXLXQd2U
 Ath2432C43Wspy4TjYv/sbG2b1Be43nMBukPROoa6nr72uJ41+JehAw1W6M/zgmEDBVF
 1z0HSikqcsFKA3ZQtFdoKINBrswdyk1qdLUcJ0zwnKx5kcMLV4YAY4MqeaOGfVtSyFZF
 9WAKpxGLj3HDt3U5fYm1S0IBOgikGbum+5Qe8JQhPOlRToLVzCICK4q1VwtQWl4nCBuI
 b5EnKAxq7mfizmUAoZeHhDrVD3r5+yOOdWqFyGUaGocsp741vm+dGDgeSBSwQxv/9duA
 mPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eAfxEH9esfhpiv4Co1s9xEbTa1KclcxNe0HYE/BNPIE=;
 b=DWpi4FrpXYmeH4SOopDHfm7qGItR4rORo2XgIzu+LWenb2CaLSBU3GwH/DZ6v/byRr
 82DJHLEK03O+JXcBSSsPUrx3UDNGwpdgMaI8stMJjFaW25QpTkUw7od4JhRh7MqvmQrT
 BmGpIVibJG7s+2x0kWnxv7FiFlvyrPpnszjpXMulYdZZvIV/kPWUnkWiZORltOmmxVQT
 uY52j2lUkamhEMbi4b1MRxFEzBviD/GKqft0YakftTyYl3VGxb69PSVHX+/jIw1U9WOp
 lB6piLo+Hgf3+QYKsp/U5NvBwMxw3dczZj7mrhAe2lIBEc3WK5m7Su6f/FxLmbFL+3/t
 hjyQ==
X-Gm-Message-State: AOAM532DWI+QJxJUjrdhLme2EEAL8xzsvnAqDVn2JyvEqiQdL6dTcP4Q
 /O7ZtVgGNgyXmUa6oehCQKI=
X-Google-Smtp-Source: ABdhPJwLhKZzEgkxf7AQy4uplw3Q9H+1icEL/u4rJR/8iTSpnL43y+So+MTGwE1SmOeS7fHq79nxRA==
X-Received: by 2002:a1c:6856:: with SMTP id d83mr181421wmc.119.1609180778037; 
 Mon, 28 Dec 2020 10:39:38 -0800 (PST)
Received: from morpheus.home.roving-it.com
 (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
 by smtp.googlemail.com with ESMTPSA id z2sm202478wml.23.2020.12.28.10.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 10:39:37 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: simplefb: Fix info message during probe
Date: Mon, 28 Dec 2020 18:39:34 +0000
Message-Id: <20201228183934.1117012-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The info message was showing the mapped address for the framebuffer. To avoid
security problems, all virtual addresses are converted to __ptrval__, so
the message has pointless information:

simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes, mapped to 0x(____ptrval____)

Drop the extraneous bits to clean up the message:

simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/video/fbdev/simplefb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 533a047d07a2..62f0ded70681 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -477,9 +477,8 @@ static int simplefb_probe(struct platform_device *pdev)
 	simplefb_clocks_enable(par, pdev);
 	simplefb_regulators_enable(par, pdev);
 
-	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
-			     info->fix.smem_start, info->fix.smem_len,
-			     info->screen_base);
+	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes\n",
+			     info->fix.smem_start, info->fix.smem_len);
 	dev_info(&pdev->dev, "format=%s, mode=%dx%dx%d, linelength=%d\n",
 			     params.format->name,
 			     info->var.xres, info->var.yres,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
