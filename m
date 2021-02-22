Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10664320F72
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 03:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642926E49C;
	Mon, 22 Feb 2021 02:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8F96E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 02:33:28 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id dg2so3296601qvb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 18:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=77SIxwK7sPd7Oh43tr5tVprXJdbF07Fj+RJwVLkQb/M=;
 b=HcapsVznwHgvIsDOa7BL6a9/98H/vdRyHVNPD42icKLvFM0by2XABaTa5l6+joOZUn
 7k26m3QMVoVtO3gP5pAlJa3RZfiukJFwhMPVm1h83eWooiVfguh91OWD2GBoD7PBV5Cc
 Pk1Xywbyad+Ja26umqcay8CMbA98X5zq82+YCRg5VgSYA+IoCUcCyw8dv6ZjY5ha0oVx
 MqD6iS5OBbrrFIu0am1vCvlsecSZEvypLNRK+qIZABPaOz+h84iq0KW/bnAoV7XrwJXR
 G/IWK6YxeGugDucDmLHTur1/Ne1Hl1wXspgaO+0a3Xoud7Ox804Clr1WxSF8wcdRgMkl
 axaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=77SIxwK7sPd7Oh43tr5tVprXJdbF07Fj+RJwVLkQb/M=;
 b=KECV/5WytNfD240swChLSldo4N0XcckJmwiqwgZl8aRMf9VnxkQxmp1xHjeQ/2bp8d
 RlQD0dsVw1H+vfW+W4hnVDSl0vxqcKfzRoryeJaIeSOwdEgaGbiNGGzMFD/SswcWR2Fl
 QzlEaMMMbyyDz8sINdb9n+AYUOMu7Pu0EIFdpc1N0+8KevN3+JnQHZ//YTCXCCykha+n
 g7TfUMrKtLffDku0dx+NNiE3uzYoZPf1WK9YGuj6QJjPDB4JbyPAg6LdEJWh6nv6QTzp
 eCu+SQ4ySaIWRgNGT/Ppfevqs61lzAKBHilxx72pUuEXlgo5BW0rF2UijUgTeEWuRHYF
 uV7A==
X-Gm-Message-State: AOAM530chyU7VLFxYURdf00VTZ79w3xSRpxe4O1oZXFGWXcX4TIUHjdk
 hS4Jfub0AL3d1VkU0NPwNrQ=
X-Google-Smtp-Source: ABdhPJwY3Vr7GwRdmr68MNB0jkE0SBmGa7EsF/bv1G8wvWkZ3BB/w7+BJHv0iPlTlkXS4NxJ0r6Leg==
X-Received: by 2002:ad4:458b:: with SMTP id x11mr10562187qvu.24.1613961207847; 
 Sun, 21 Feb 2021 18:33:27 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:1ca0:2636:8c3e:6a9])
 by smtp.googlemail.com with ESMTPSA id l137sm11645418qke.6.2021.02.21.18.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 18:33:27 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ast: fix memory leak when unload the driver
Date: Sun, 21 Feb 2021 21:33:22 -0500
Message-Id: <20210222023322.984885-1-ztong0001@gmail.com>
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

a connector is leaked upon module unload, it seems that we should do
similar to sample driver as suggested in drm_drv.c.

Adding drm_atomic_helper_shutdown() in ast_pci_remove to prevent leaking.

[  153.822134] WARNING: CPU: 0 PID: 173 at drivers/gpu/drm/drm_mode_config.c:504 drm_mode_config_cle0
[  153.822698] Modules linked in: ast(-) drm_vram_helper drm_ttm_helper ttm [last unloaded: ttm]
[  153.823197] CPU: 0 PID: 173 Comm: modprobe Tainted: G        W         5.11.0-03615-g55f62bc873474
[  153.823708] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-48-gd9c812dda519-4
[  153.824333] RIP: 0010:drm_mode_config_cleanup+0x418/0x470
[  153.824637] Code: 0c 00 00 00 00 48 8b 84 24 a8 00 00 00 65 48 33 04 25 28 00 00 00 75 65 48 81 c0
[  153.825668] RSP: 0018:ffff888103c9fb70 EFLAGS: 00010212
[  153.825962] RAX: ffff888102b0d100 RBX: ffff888102b0c298 RCX: ffffffff818d8b2b
[  153.826356] RDX: dffffc0000000000 RSI: 000000007fffffff RDI: ffff888102b0c298
[  153.826748] RBP: ffff888103c9fba0 R08: 0000000000000001 R09: ffffed1020561857
[  153.827146] R10: ffff888102b0c2b7 R11: ffffed1020561856 R12: ffff888102b0c000
[  153.827538] R13: ffff888102b0c2d8 R14: ffff888102b0c2d8 R15: 1ffff11020793f70
[  153.827935] FS:  00007f24bff456a0(0000) GS:ffff88815b400000(0000) knlGS:0000000000000000
[  153.828380] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  153.828697] CR2: 0000000001c39018 CR3: 0000000103c90000 CR4: 00000000000006f0
[  153.829096] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  153.829486] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  153.829883] Call Trace:
[  153.830024]  ? drmm_mode_config_init+0x930/0x930
[  153.830281]  ? cpumask_next+0x16/0x20
[  153.830488]  ? mnt_get_count+0x66/0x80
[  153.830699]  ? drm_mode_config_cleanup+0x470/0x470
[  153.830972]  drm_managed_release+0xed/0x1c0
[  153.831208]  drm_dev_release+0x3a/0x50
[  153.831420]  release_nodes+0x39e/0x410
[  153.831631]  ? devres_release+0x40/0x40
[  153.831852]  device_release_driver_internal+0x158/0x270
[  153.832143]  driver_detach+0x76/0xe0
[  153.832344]  bus_remove_driver+0x7e/0x100
[  153.832568]  pci_unregister_driver+0x28/0xf0
[  153.832821]  __x64_sys_delete_module+0x268/0x300
[  153.833086]  ? __ia32_sys_delete_module+0x300/0x300
[  153.833357]  ? call_rcu+0x372/0x4f0
[  153.833553]  ? fpregs_assert_state_consistent+0x4d/0x60
[  153.833840]  ? exit_to_user_mode_prepare+0x2f/0x130
[  153.834118]  do_syscall_64+0x33/0x40
[  153.834317]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  153.834597] RIP: 0033:0x7f24bfec7cf7
[  153.834797] Code: 48 89 57 30 48 8b 04 24 48 89 47 38 e9 1d a0 02 00 48 89 f8 48 89 f7 48 89 d6 41
[  153.835812] RSP: 002b:00007fff72e6cb58 EFLAGS: 00000202 ORIG_RAX: 00000000000000b0
[  153.836234] RAX: ffffffffffffffda RBX: 00007f24bff45690 RCX: 00007f24bfec7cf7
[  153.836623] RDX: 00000000ffffffff RSI: 0000000000000080 RDI: 0000000001c2fb10
[  153.837018] RBP: 0000000001c2fac0 R08: 2f2f2f2f2f2f2f2f R09: 0000000001c2fac0
[  153.837408] R10: fefefefefefefeff R11: 0000000000000202 R12: 0000000001c2fac0
[  153.837798] R13: 0000000001c2f9d0 R14: 0000000000000000 R15: 0000000000000001
[  153.838194] ---[ end trace b92031513bbe596c ]---
[  153.838441] [drm:drm_mode_config_cleanup] *ERROR* connector VGA-1 leaked!

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 667b450606ef..b047c0ea43e8 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -30,6 +30,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -138,6 +139,7 @@ static void ast_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
+	drm_atomic_helper_shutdown(dev);
 }
 
 static int ast_drm_freeze(struct drm_device *dev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
