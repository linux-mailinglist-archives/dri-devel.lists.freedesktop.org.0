Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CB2C0ADB5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 17:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD5710E237;
	Sun, 26 Oct 2025 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XC5+hyva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5276010E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 22:42:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-427015003eeso3037340f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761432134; x=1762036934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXq2mQ4sAJmwho7etnf6FLZOIO7gybFmwHnhQ+k6dI8=;
 b=XC5+hyva+7AARkZyYmAfL3q5m6byBUb0c6ys1+D/f0ECnLnFcI+jtZPmYfXuMpy0Ux
 Hlp0K89qGEsvdIplnx2J0ZI/kXhDq+gH/bD+uKxlYXJ9d5Snn1oeDySZf3cTMQ8PEUWM
 gMT7BepJvAuKaiQClqLxEOwEr1GayUnFjmrFqtFkVY4ymIOPApUQ+9xhYDaPIyYrPyz3
 eLvvnnqETqRjjIJswP3lzgMJbOlx5gloWmz9k8SudOr9B6dgyLgor6gBOQm3LImKLWTJ
 RtEs+q4e+lVXvTDjyBSbxbM6mWNKqfym1ni0mft7fhPXj/KOk8st21d3ojKovVURKxQT
 9QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761432134; x=1762036934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZXq2mQ4sAJmwho7etnf6FLZOIO7gybFmwHnhQ+k6dI8=;
 b=A/6E8tUNVEPiJoY6fGms6vdMb5qOFptALa5a/2Y+am2ckzZm0nZG/7W/iZjgrWw2t0
 +oOoAcS4x9HSr4VOdKior1NcBeuZLcy8x94tOeeOTLww/HwotD1g5rmj5hP8RqjwEoTz
 xhpqIjRgNwWUiSJH0Iyy5XrZRuMJKsc5qD6MR6oOQHHaAITFivwEILXBhtI8wsJvS1aD
 cyXZgXhla53DxbrWGSh18Ke2l91ZP5udi5ffYvN9ak1+fm/PYW6eBf2nOpax6O4cuPIk
 MikpYxidxO+EpkYR2kT15FZo5Y5QCBcBal46+dyKjCuvjLKtAxeVchVfsekHW4GBMdZI
 q9jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqQOlGfg3GNA3mgdd7mZfEXJTmJPnKJeXxucXFUj6Xnqvw3aQ0I6Oim5djeNUWlPVHt6rcYi06v3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe9UUjiFJsZfGoxEYqJ7Mg8fruj8Qx2/pH/6kxrsmydl3y+lEy
 umr3CSZ/AImyXWZlB9k4iIuRmPOQ9EZFgGe3O6sHrlLXXn/zchaEXvY=
X-Gm-Gg: ASbGncvPfcXkLUQi+idhq5PDaKi1cnhw2kOWd8zYZFfa30rzj8vO4tMXoWqoztbVBtP
 4vqh8YfsfmKnFD8dNw1pDH1272F5iKS/HpwMmYCtY1jjEdHGKjuYlUyYJi1+vFMwDh5oKxltXb8
 jo1091bBMpFFZZreekqsK2ZfK6/kKUcSzCk42dGXsy4wSDyMUYDPv3HHuFXyZPaD9srJYu+Khdx
 B/b0cZAyPFh0TZU/5SSphR3VQ9Fg+UFbx4s3TFBtZL6HmVDs/rkSGVNT8KIlfgJjebTHiHwJqIz
 UxyE8CVDQAhRob2wFsRkYjPNYimXg3VX8aB74fIBQ6jWsCPruMCV10O5I13s0OOdyg8e5ifZhP7
 kHdZkv8U5WFI/no/oogrUEGGKSYIK16LaU79E3yM050ITnLWnZ1JroFhT/zGe0R7SBzCFQddiOA
 1KKLquUMhW3tylyPILmqNHAgLmR41DtUYxaD0+CquglxrpYsxWU7/1LrN0Cz7LqF4eSZCn09XFS
 LXzh/Q=
X-Google-Smtp-Source: AGHT+IH5qEmI200tfknZM3nb5ovcfV9MSsErH9Gyktcj7nN/CQ7b7jCUO5zA24B4gpxH66kEW1MyEA==
X-Received: by 2002:a05:6000:41d5:b0:427:666:f9d6 with SMTP id
 ffacd0b85a97d-4270666fa57mr22253037f8f.39.1761432133628; 
 Sat, 25 Oct 2025 15:42:13 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:bad8:a439:d5f7:21de])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-429952cb55asm5742091f8f.17.2025.10.25.15.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 15:42:13 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, fuchsfl@gmail.com
Subject: [PATCH] fbdev/pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS
Date: Sun, 26 Oct 2025 00:38:50 +0200
Message-ID: <20251025223850.1056175-1-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Oct 2025 16:37:16 +0000
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

Commit e24cca19babe ("sh: Kill off MAX_DMA_ADDRESS leftovers.") removed
the define ONCHIP_NR_DMA_CHANNELS. So that the leftover reference needs
to be replaced by CONFIG_NR_ONCHIP_DMA_CHANNELS to compile successfully
with CONFIG_PVR2_DMA enabled.

Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
Note: The fix has been compiled, and tested on real Dreamcast hardware,
with CONFIG_PVR2_DMA=y.

 drivers/video/fbdev/pvr2fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index cbdb1caf61bd..0b8d23c12b77 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -192,7 +192,7 @@ static unsigned long pvr2fb_map;
 
 #ifdef CONFIG_PVR2_DMA
 static unsigned int shdma = PVR2_CASCADE_CHAN;
-static unsigned int pvr2dma = ONCHIP_NR_DMA_CHANNELS;
+static unsigned int pvr2dma = CONFIG_NR_ONCHIP_DMA_CHANNELS;
 #endif
 
 static struct fb_videomode pvr2_modedb[] = {

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.43.0

