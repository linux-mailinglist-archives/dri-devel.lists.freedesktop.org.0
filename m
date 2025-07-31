Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5BCB1792A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 00:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D9010E7F6;
	Thu, 31 Jul 2025 22:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eNlVtNyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2C10E7E5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:36:28 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-875acfc133dso32754039f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753994188; x=1754598988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Bkzmad0FHY3Ddy5NFcMc3+By4Cx3sAMV/rP5o2AEJQ=;
 b=eNlVtNyM+zIruVNUhv8BpxzlZJK6uTAHXpHfQGoVMvMYSoldnKldJ17OQiSBOaO0zk
 RkjpmfkzZSDCmrLOPF/+aj2z55JndS5FuaYefTFcc8n7oz4Sfw2v8cfMjyISsJNWVJr/
 GdMZt4wOaaS1g2er3Y0CuIRKE+XVik/HvLgY/oqnqPnGvNGpylFgoHcloWfRS6GgalV8
 ZQifpGBRHnV2iZiRwj4tr53Npvav52+vpLsk/vkkBr/cOOXL2+mu8IYysmm5qc3TA3r6
 VYlN/KxgTKU6eD4UVphzwlZrnG7AyzqgS8yNPXDocH/ayEtrDC81jnBeYIN+G0fsLq0q
 yrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753994188; x=1754598988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Bkzmad0FHY3Ddy5NFcMc3+By4Cx3sAMV/rP5o2AEJQ=;
 b=MPqvW8gEb5dnrJZQ7AJdUd1cHJ50TygqNEfQCzdtLtVvDk+f+f7xSQ5sQPvlJKGsHl
 ky1U8neFQvv1VtMno3bvmHz3q4gC2n2l/Hvm0k3FeEptXZfIsJWRF8+HjukNJ4hjtE4M
 O5GazneBaJTh76vO2j1CBzp0QtosQPvmtjfl3Ust+oZGAIZyxnuzOWTqPLvGf/xFK+EC
 rVim5d0SU6AINwXnKUeCNfJwvWdTyx81Fbngq4ktw2YFU8ZyTzmWS8JYF4KNG0OCyPjg
 cDEm/FC4TGHvWo4lwHcxF41vd9DMatJeW262Z56fskisOVG016TjtSMPdOWfysBAhYGC
 TdTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDqlTYbUbh96j4zWc3FD/zAp3gZg/sDyjSj3zBUWBr7oWmsLxGJW3QDhx+hS+/0e7EJwbCO3YpHxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzshkHvJSBCg2x0Q26JMznBy9grVPdOjXkOSoSMAiskkVjdK94m
 lgp6BPjokAlu4eadpfQIDmxLDz4tuWbH22Azt6gaNI4gAn51PFWvU67J
X-Gm-Gg: ASbGnct5GK29JG99ji+k92+mdzaNsHGn90GOQojad6SpvHYSlUavQeTlnDCHTFGop8V
 uBze9FwsusJihKgrhDtw/CPCFlnZ7KKuAqKc1s6RNdo4XYs6xdYX3ptiI5RO6K5t1QDpOTHFkl2
 AMJRFQR33ybDrBCGWNx+FTp7/i9U2byNGFvSdAC99T98RDrbXQ7ASfvOJ29/IB01r7koI0bF6rt
 c46UHraKQIUIp+TlUPxccMMWcMj0WCvBxMf5e5YOnANZKLJOhETeuf0l6QJro5HW9fQRaSeM1gg
 WY7lC2h6uEXy1QXrNFOwbw/PPl8cruwLOJm6Eze6k2Hc+6enEvWBNG3w7/vusiNKNVvSuPghILr
 LGPh2AJ+TeH27FnuJ2qS/HVIIJ6b7kWNe86vUnyswIWNrfbGIzk9Osjp/cH7UPvOe8dSAAZPZD7
 G6aRzUkh0MUaKBZg81QZLtWNA=
X-Google-Smtp-Source: AGHT+IHw6r8Lf+6zjHlaPGrM/dmdCKU/6h6oK0JKKrXD5sL3aXoHzVWp5gzJ99Itr+K+yw6WuEQuQQ==
X-Received: by 2002:a05:6602:60ce:b0:86c:ee8b:c089 with SMTP id
 ca18e2360f4ac-8815a870752mr15789939f.3.1753994187605; 
 Thu, 31 Jul 2025 13:36:27 -0700 (PDT)
Received: from localhost.localdomain (syn-035-144-110-073.res.spectrum.com.
 [35.144.110.73]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8814dfab231sm70312839f.28.2025.07.31.13.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 13:36:27 -0700 (PDT)
From: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
To: deller@gmx.de,
	daniel@ffwll.ch
Cc: skhan@linuxfoundation.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 syzbot+c4b7aa0513823e2ea880@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: Fix vmalloc out-of-bounds write in fast_imageblit
Date: Thu, 31 Jul 2025 15:36:18 -0500
Message-ID: <20250731203618.25973-1-sravankumarlpu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 31 Jul 2025 22:40:54 +0000
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

This issue triggers when a userspace program does an ioctl
FBIOPUT_CON2FBMAP by passing console number and frame buffer number.
Ideally this maps console to frame buffer and updates the screen if
console is visible.

As part of mapping it has to do resize of console according to frame
buffer info. if this resize fails and returns from vc_do_resize() and
continues further. At this point console and new frame buffer are mapped
and sets display vars. Despite failure still it continue to proceed
updating the screen at later stages where vc_data is related to previous
frame buffer and frame buffer info and display vars are mapped to new
frame buffer and eventully leading to out-of-bounds write in
fast_imageblit(). This bheviour is excepted only when fg_console is
equal to requested console which is a visible console and updates screen
with invalid struct references in fbcon_putcs().

Reported-and-tested-by: syzbot+c4b7aa0513823e2ea880@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
Signed-off-by: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3f7333dca508..2540d9046161 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -803,7 +803,8 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 				   fg_vc->vc_rows);
 	}
 
-	update_screen(vc_cons[fg_console].d);
+	if (fg_console != unit)
+		update_screen(vc_cons[fg_console].d);
 }
 
 /**
@@ -1336,6 +1337,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	struct vc_data *svc;
 	struct fbcon_ops *ops = info->fbcon_par;
 	int rows, cols;
+	unsigned long ret = 0;
 
 	p = &fb_display[unit];
 
@@ -1386,11 +1388,10 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	cols /= vc->vc_font.width;
 	rows /= vc->vc_font.height;
-	vc_resize(vc, cols, rows);
+	ret = vc_resize(vc, cols, rows);
 
-	if (con_is_visible(vc)) {
+	if (con_is_visible(vc) && !ret)
 		update_screen(vc);
-	}
 }
 
 static __inline__ void ywrap_up(struct vc_data *vc, int count)
-- 
2.43.0

