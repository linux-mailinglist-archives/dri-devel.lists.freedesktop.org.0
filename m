Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835EBA5AA4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 10:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCBB10E008;
	Sat, 27 Sep 2025 08:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kc7fQMo1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24C910E008
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 07:50:31 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8599c274188so298311685a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758959431; x=1759564231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hgfPKSQNysrHS9dWJ30TPeInwwtlPIqd1YDWoMjDLSU=;
 b=Kc7fQMo1KMHzS99dK3i2BMNC2bMC2HzcN1PfmXJ+d08uwJVNWB0u2gT84ACnwgGCFC
 VGl8/Q42nRDTjYaK9Gcqt10liao71vhWe58LrzNppgYOeCD2Qdh1UEXQmMGvP/ehoXXd
 U0RAJ6EG4omzaPyOUT3YdW9aUSaWjwpUg0VnYijmkeSV4KuiBgSdU/xtpTZBk1eb8jvH
 pxjMkdxbzG8gqxQrYSzlzWGZsjmaYtfHcpTG1Per8BV12hN7la57uLTMzROX7ZBQTuAC
 itlTAmGVlo9oa/UOtkDVafssuM/XrzZ3Im6UYVvOHH0qECocTolpbdHQ4K8s+EK6eXAh
 uZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758959431; x=1759564231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgfPKSQNysrHS9dWJ30TPeInwwtlPIqd1YDWoMjDLSU=;
 b=jbeNwqvTsU/0JZ6gBl6LsSF6rmJQ3eodgQpUM2O4DNiZhVZRRQiyGPbjZajS0w2rt5
 hYt3RSM/A7dHu9eFvQMSGNolfYERIZMJd0NpYWoegiYvvj8mH+QJWiDYTpbhUHucVGu8
 l+nslAH7NkOoZOGqWLfKGDPft1Rl/phVQ2DaDgMiAka6HF3sejoIh4Toru/cz+mNVhLE
 Pe8hl5+SWNcKufhgAZHv63xgu8bDPWE8oJTDSSMkuprUTzIv5Pek1niP0r7/byD9ulV5
 nW/Ag+ucqFECFZfwR9nXKWiQTBNNPYw0ccQR1WleB5w45QrzGkk/p/HNflkh7lXgIRnv
 2O2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/ZgKEUiPKy4IGXCvnPwo60qqbwD79Amoptrf85lQkpkUh3q8Evola3EdzjpEFmac5VzmdlAKSFGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxldDG3A9pAqmghUKhkDy8wDVqe2odXJvoHkhdJ/L+7uXgELRlY
 OmUnZ6ArP01WguDlsfCS1wPcTPvTRpHPxyE0cb314rC9uZAjW9koKWOx
X-Gm-Gg: ASbGnct/Ep9zUSzrdwLFGa7ukQXeGcKN1ewgO0QkU/YpZPzYZAUdm/CSx2H5gzUqnVq
 Hk5QHlaBvuUpe2knCmHarX6YM8oNFNXeH57SA8MBF5sKElRdCuc6zGK1eICL5cHJe9nNT9KirvA
 VRihNdB9cSrOX9hNac5IcfJY9DvVaIPmG1VKjVY5jq/A2YsrIfp3sI1IOPTcqpF/j5g0Oatn4UC
 QPlfND5woGJp9gmPOF46J/6NaG8UOrUBY+oYlAN/BuxAzQqkPU9P2W7mqP5FrgqxsNhCGfbWP0V
 coxtotRh0Q+G7T56070O8cjPV+pziKNr3RItieSb4ty/M58Jeh9y56n+cfIXpO8BwaQzksHccU3
 dM8wwebtxG/Ld8ktvL4fPr7MruKhk
X-Google-Smtp-Source: AGHT+IGDAZZkx3WIl9guUtfSPbuaq94sVuUIs0iollEMe6q0H0aWqiaDGpBWQY8KPFyB2BFDhYgIQw==
X-Received: by 2002:a05:620a:f06:b0:80b:139f:f61a with SMTP id
 af79cd13be357-85ae0527294mr1731949285a.23.1758959430710; 
 Sat, 27 Sep 2025 00:50:30 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::9c5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-85c2737848csm415143585a.3.2025.09.27.00.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 00:50:29 -0700 (PDT)
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Simona Vetter <simona@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Cc: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
Date: Sat, 27 Sep 2025 03:50:09 -0400
Message-ID: <20250927075010.119671-1-albinbabuvarghese20@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 27 Sep 2025 08:12:51 +0000
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

KASAN reports vmalloc-out-of-bounds writes in sys_imageblit during console
resize operations. The crash happens when bit_putcs renders characters 
outside the allocated framebuffer region.

Call trace: vc_do_resize -> clear_selection -> invert_screen ->
do_update_region -> fbcon_putcs -> bit_putcs -> sys_imageblit

The console resize changes dimensions but bit_putcs doesn't validate that 
the character positions fit within the framebuffer before rendering. 
This causes writes past the allocated buffer in fb_imageblit functions.

Fix by checking bounds before rendering:
- Return if dy + height > yres (would write past bottom)
- Break if dx + width > xres (would write past right edge)

Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48b0652a95834717f190  
Tested-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
---
 drivers/video/fbdev/core/bitblit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index f9475c14f733..4c732284384a 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -160,6 +160,9 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 	image.height = vc->vc_font.height;
 	image.depth = 1;
 
+	if (image.dy + image.height > info->var.yres)
+		return;
+
 	if (attribute) {
 		buf = kmalloc(cellsize, GFP_ATOMIC);
 		if (!buf)
@@ -173,6 +176,10 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 			cnt = count;
 
 		image.width = vc->vc_font.width * cnt;
+
+		if (image.dx + image.width > info->var.xres)
+			break;
+
 		pitch = DIV_ROUND_UP(image.width, 8) + scan_align;
 		pitch &= ~scan_align;
 		size = pitch * image.height + buf_align;
-- 
2.51.0

