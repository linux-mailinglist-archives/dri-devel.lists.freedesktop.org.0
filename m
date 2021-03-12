Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325A33876B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929F26F48F;
	Fri, 12 Mar 2021 08:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517E36F480
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 08:14:29 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id o38so15359836pgm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 00:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrZfj0TKtwPIleVkH4vacWXdSkgt1v0Ldrv4uKzvBgc=;
 b=P/is1GlXQepPdQpkHGMeWBTs7DjqwG5qJvvZFbCgOEdoyPl4OUma5at1O4FadtqPsj
 d5A+UocGLHfQPFatN+XHmE8A/6+s4DZm/tEBSp2Oj0oHkZfCvfhLjk++QQ7Rxyp0Qh13
 qA8hyK6jzqNJIprdsi0iAUMrdd8JxITUjKl+AARgARXRa2wYkV7ijzH9CMBTty7BIEOy
 VKosfiPM5zOPQuR+YTC34nxaTS6O1B31RMr/T11AbeLc8SZTk6u5zUD+7e5UIDdIKkNY
 ZdgYKr67BCjPa9AlH0xPra2DOkwZuInoC7rcTsrbLRQA0wzyrJHukn2VgHB740ZoTm5y
 He8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrZfj0TKtwPIleVkH4vacWXdSkgt1v0Ldrv4uKzvBgc=;
 b=WhVMfeTk1G4fwY5cKbJN62bI0ZiX0x9lohAIaHeLqFJ7SBGlMS++VYIG9r4fCYDqMz
 SleEMLOh7/GvDYZlyeFMDXLhiRZBeRIOepscFvWpse51t6Og4QtZ/FWdnYwhfwxuVtaO
 X6dBC9FpeP4KN3htZq+vx0oSRQ0Ah+wuZunpUUsSMaHvSDF29LEikqeDnZ96tR24xvCr
 kpKE6MAI3XRwLOSujFcUrdCVmRNTjH0r75JP1+GZ/pmFSsWUy/7aUetYEdl8CHhx87bI
 UuSiUOAeDPPxrOskw3M/UGHUZdWL2OE3vtODNUNh8BBxMdUHhAeCb/levmmV6ZXKQ9Yr
 whbw==
X-Gm-Message-State: AOAM530fbOEsYIgol2Qdv0RBm25OeCuPKovjFXXOnLfsVDKCIWgQ3ZFl
 3SEv4ePJeShuZeYsUoKIItj5J4RY72VhOymE
X-Google-Smtp-Source: ABdhPJy6OuNANjgeDq5Mt8GNcqHUOhFu42jwCjROe0FOk8+ZgIQeTYwjDyLyQk5/29hZnl6UXRhVSw==
X-Received: by 2002:aa7:9281:0:b029:1ec:48b2:811c with SMTP id
 j1-20020aa792810000b02901ec48b2811cmr11287361pfa.18.1615536868830; 
 Fri, 12 Mar 2021 00:14:28 -0800 (PST)
Received: from ThinkCentre-M83.wg.ducheng.me ([202.133.196.154])
 by smtp.gmail.com with ESMTPSA id y9sm4630067pgc.9.2021.03.12.00.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 00:14:28 -0800 (PST)
From: Du Cheng <ducheng2@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] drivers: video: fbcon: fix NULL dereference in fbcon_cursor()
Date: Fri, 12 Mar 2021 16:14:21 +0800
Message-Id: <20210312081421.452405-1-ducheng2@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 12 Mar 2021 08:32:49 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org, Du Cheng <ducheng2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add null-check on function pointer before dereference on ops->cursor

Reported-by: syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com
Signed-off-by: Du Cheng <ducheng2@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 44a5cd2f54cc..3406067985b1 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1333,6 +1333,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
 
 	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
 
+	if (!ops->cursor)
+		return;
+
 	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
 		    get_color(vc, info, c, 0));
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
