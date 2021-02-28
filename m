Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809A327044
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 05:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05436E0F7;
	Sun, 28 Feb 2021 04:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8B66E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 04:46:33 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id b14so13450852qkk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 20:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pp1NDptXLpgMs6Y9kcffno2o0nPwQQkewth041jNW4I=;
 b=nEtfEecLdq2WmHSwjp1AllXlI192bn15pGwqOVmK93EX/las5J3lX9DilPt1+uLW1K
 deZKTQ4dWzlV6AL4uDtLSklhbqjYM3RHw+Sdlu1yxKh8yCC6xyt0kHjUaPuHHzr4MxRY
 cs3YNCVNZ75h3xOjaP56ZZnl+wlE1YndzRvs99/axIAZT3WMFw+s8SrGOvQAQNgp/oYS
 EMYSehSwS6Cg3Dd4bDXSJUIASti6QwaMESvMt9Hei7Hct1myX+h6oT26H9ICbjq8t0zm
 nDa1TSX5B7wCkhteguLAOijZuXKRXZvseRuT9DcxQ8KclELAlCryBctAOitwatCk1qWX
 ENLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pp1NDptXLpgMs6Y9kcffno2o0nPwQQkewth041jNW4I=;
 b=X7Zz0hB1DSq/MJhpPA7Pq9/F8m3UMNubocZ29BnuQRiEHbr2UuOLO1bvStVlPFpqTa
 cjEP3WFOLH8mnsPxAqv0RI8qsJsO+9oDYwemOJKfkqeQtBu9B8g9ejPIpORug9ChFYkQ
 ZAlm9QFhzqmT92weO2VriX3ENnoWmlPogrmoAXF6o5oYk2aTB2Wk/zKjN2gBxJPPttyr
 dhSWY1utsO2elkB92mYZQSORfK1uIyvI6P3UVHrQ1fxbnmvwU218YICRmi5uK3XhTh8z
 SZ1SDcWGYC29ipV6gEnMG/iGUfSDGNiwuMiC7n3MI7oEQd8/M0nCfDxmgtbnsKNk8L9q
 V9Mg==
X-Gm-Message-State: AOAM5323ovQNqHiaz2C6PT+Wy52s8ZL/a8XVPvVeiDyiGkKNSKuUmOqM
 uwMvDFqOjmEqlvJSGPYa+xE=
X-Google-Smtp-Source: ABdhPJzH46iCTCbKlHVKZCz6qPa/WoA7zCbYltBScVy9f3K/D00QckID1sUzgQmQy/iOnqLQ3VsOEA==
X-Received: by 2002:a05:620a:1477:: with SMTP id
 j23mr9488182qkl.486.1614487592451; 
 Sat, 27 Feb 2021 20:46:32 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:94d2:9984:c3fe:c09a])
 by smtp.googlemail.com with ESMTPSA id j20sm10050656qtl.36.2021.02.27.20.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 20:46:32 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/fb-helper: only unmap if buffer not null
Date: Sat, 27 Feb 2021 23:46:25 -0500
Message-Id: <20210228044625.171151-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: ztong0001@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_fbdev_cleanup() can be called when fb_helper->buffer is null, hence
fb_helper->buffer should be checked before calling
drm_client_buffer_vunmap(). This buffer is also checked in
drm_client_framebuffer_delete(), so we should also do the same thing for
drm_client_buffer_vunmap().

[  199.128742] RIP: 0010:drm_client_buffer_vunmap+0xd/0x20
[  199.129031] Code: 43 18 48 8b 53 20 49 89 45 00 49 89 55 08 5b 44 89 e0 41 5c 41 5d 41 5e 5d
c3 0f 1f 00 53 48 89 fb 48 8d 7f 10 e8 73 7d a1 ff <48> 8b 7b 10 48 8d 73 18 5b e9 75 53 fc ff 0
f 1f 44 00 00 48 b8 00
[  199.130041] RSP: 0018:ffff888103f3fc88 EFLAGS: 00010282
[  199.130329] RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff8214d46d
[  199.130733] RDX: 1ffffffff079c6b9 RSI: 0000000000000246 RDI: ffffffff83ce35c8
[  199.131119] RBP: ffff888103d25458 R08: 0000000000000001 R09: fffffbfff0791761
[  199.131505] R10: ffffffff83c8bb07 R11: fffffbfff0791760 R12: 0000000000000000
[  199.131891] R13: ffff888103d25468 R14: ffff888103d25418 R15: ffff888103f18120
[  199.132277] FS:  00007f36fdcbb6a0(0000) GS:ffff88815b400000(0000) knlGS:0000000000000000
[  199.132721] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  199.133033] CR2: 0000000000000010 CR3: 0000000103d26000 CR4: 00000000000006f0
[  199.133420] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  199.133807] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  199.134195] Call Trace:
[  199.134333]  drm_fbdev_cleanup+0x179/0x1a0
[  199.134562]  drm_fbdev_client_unregister+0x2b/0x40
[  199.134828]  drm_client_dev_unregister+0xa8/0x180
[  199.135088]  drm_dev_unregister+0x61/0x110
[  199.135315]  mgag200_pci_remove+0x38/0x52 [mgag200]
[  199.135586]  pci_device_remove+0x62/0xe0
[  199.135806]  device_release_driver_internal+0x148/0x270
[  199.136094]  driver_detach+0x76/0xe0
[  199.136294]  bus_remove_driver+0x7e/0x100
[  199.136521]  pci_unregister_driver+0x28/0xf0
[  199.136759]  __x64_sys_delete_module+0x268/0x300
[  199.137016]  ? __ia32_sys_delete_module+0x300/0x300
[  199.137285]  ? call_rcu+0x3e4/0x580
[  199.137481]  ? fpregs_assert_state_consistent+0x4d/0x60
[  199.137767]  ? exit_to_user_mode_prepare+0x2f/0x130
[  199.138037]  do_syscall_64+0x33/0x40
[  199.138237]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  199.138517] RIP: 0033:0x7f36fdc3dcf7

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b9a616737c0e..f6baa2046124 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2048,7 +2048,7 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 
 	if (shadow)
 		vfree(shadow);
-	else
+	else if (fb_helper->buffer)
 		drm_client_buffer_vunmap(fb_helper->buffer);
 
 	drm_client_framebuffer_delete(fb_helper->buffer);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
