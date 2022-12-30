Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722865A4FC
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C762310E11F;
	Sat, 31 Dec 2022 14:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD03E10E067
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 06:36:02 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-15027746720so8881309fac.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 22:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GAvkJUoPDYmWRhAwgSj95u5byto+2nWkIpy69HcVzzA=;
 b=chmxPcmZDfrqDkOb6grw5n9WABwC7AWm9NlE1JDaiZZVXSjJ0sTBOCA65G6ANggrp4
 vZhXEMQwEMhw1TnKRlDtIz2+9kmySb60qBl9lliQwjy225K7qGxeKyjp17ocxLHj21F1
 WjWW/Keir209f60myxHUh3MLgunDT8F4a6B3p7bRkTPDvWCyBqQMOovUxaJ3B/fIg1/x
 QwTtfarB29BSW6+WY9me3g666RVfvCG3JXyF4K3VOZPdLEX85petPfRFz7tcAy9WXG6G
 kz6aEl4nTZwiwAMyjwk6erNtMiqGF4ANOl62eqOcqxiaxWTaz2bhHAZ8gjLkhsiz+bnN
 E9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAvkJUoPDYmWRhAwgSj95u5byto+2nWkIpy69HcVzzA=;
 b=HTFokjdJY9r4qYZOfqzvwqVMvrPv9O0pkT8D540piHWjsN0hNXTmEZq95nv8BHN5L1
 3m2ZGuBhn1mMcEiK76V1s9K+kvvpR6ozRBh8W2z3i4OJox+n2ePIEDK2q0tOhpCXWPVu
 QfVVD+TdsBF3p8kF2yLThTRJA6Igl/ZMu8hkKI1uYwueLcWbENLBqiVIo/D4vW5R6HWV
 JBaETOBeu2sd72tW4y9097cQBs3NL4fU7FiSYMsNs93xfaa0ZxM3JeywxuPr7vVS4koI
 tuflFD6nEouwGPDM0w6jXdAbeW0VDJgbCwKM/cODilFBTX47Vt6E9A3JRw5um74BPTl1
 hvwQ==
X-Gm-Message-State: AFqh2kqfX91zjoVjnJpafB6uP08FqDE2zb3hYZ1cP0EqGhZtW1I2QK+l
 qawS9z1TdDYyw4t5/Yg6tGo=
X-Google-Smtp-Source: AMrXdXu8tuII+NQ94TSjxHteZaU5UKVhWyRIdtPSP8n4vzqiJe3EBkB9K95dp/oEC/QKGMbL8PYeng==
X-Received: by 2002:a05:6870:be85:b0:144:4c04:4b73 with SMTP id
 nx5-20020a056870be8500b001444c044b73mr15306401oab.50.1672382161887; 
 Thu, 29 Dec 2022 22:36:01 -0800 (PST)
Received: from protoss.cs.ucr.edu (protoss.cs.ucr.edu. [169.235.26.60])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a4abe8a000000b004a0ad937ccdsm8281508oop.1.2022.12.29.22.36.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Dec 2022 22:36:01 -0800 (PST)
From: Hang Zhang <zh.nvgt@gmail.com>
To: 
Subject: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
Date: Thu, 29 Dec 2022 22:35:28 -0800
Message-Id: <20221230063528.41037-1-zh.nvgt@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 31 Dec 2022 14:30:00 +0000
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
Cc: linux-fbdev@vger.kernel.org, Hang Zhang <zh.nvgt@gmail.com>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In do_fb_ioctl(), user specified "fb_info" can be freed in the callee
fbcon_get_con2fb_map_ioctl() -> set_con2fb_map() ->
con2fb_release_oldinfo(), this free operation is protected by
console_lock() in fbcon_set_con2fb_map_ioctl(), it also results in
the change of certain states such as "minfo->dead" in matroxfb_remove(),
so that it can be checked to avoid use-after-free before the use sites
(e.g., the check at the beginning of matroxfb_ioctl()). However,
the problem is that the use site is not protected by the same locks
as for the free operation, e.g., "default" case in do_fb_ioctl()
can lead to "matroxfb_ioctl()" but it's not protected by console_lock(),
which can invalidate the aforementioned state set and check in a
concurrent setting.

Prevent the potential use-after-free issues by protecting the "default"
case in do_fb_ioctl() with console_lock(), similarly as for many other
cases like "case FBIOBLANK" and "case FBIOPAN_DISPLAY".

Signed-off-by: Hang Zhang <zh.nvgt@gmail.com>
---
 drivers/video/fbdev/core/fbmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 1e70d8c67653..8b1a1527d18a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1182,6 +1182,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 		console_unlock();
 		break;
 	default:
+		console_lock();
 		lock_fb_info(info);
 		fb = info->fbops;
 		if (fb->fb_ioctl)
@@ -1189,6 +1190,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 		else
 			ret = -ENOTTY;
 		unlock_fb_info(info);
+		console_unlock();
 	}
 	return ret;
 }
-- 
2.39.0

