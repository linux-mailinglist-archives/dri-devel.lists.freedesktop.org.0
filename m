Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD92255A78
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 14:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0BD6E4A1;
	Fri, 28 Aug 2020 12:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63546E4A1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:46:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id p15so410477pli.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LV/s2CXjmyhaK0LBWgRhhTyeIospCDq6TJzHGpvnT6g=;
 b=LWFJgGfDyKBtY5lmHYWRLbRndAjD016GbhtAM2jdvCP4MpD96uhACFDW2/tC1qgetI
 pjEg1cuwysDRp1hauaUd0PV+OvjYYdFqtA/0rCnWwvh2HsY8NkP4Nk2wXw3UqQjqdHi0
 rzfFtqxxfhcIQdKSfxc+Njr+rdFD/efrWPaCsZBYp5mtG2dQsfgCimHs0K9nVIMuZrbc
 kvzpgq8orLyx1gVegYmLbXhBrxpP2vCpcVsnfN9nW7dFUnEPezCW4QCyOMPjr15I6iJ+
 CZyhml0+ucHExmV+BVrpipGTkMX7psbPiH/Z4+oSE9Xu7RsJ4NtiAvcZBcCmOBjtMmjA
 XrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LV/s2CXjmyhaK0LBWgRhhTyeIospCDq6TJzHGpvnT6g=;
 b=Xqe2MfURqHoR5xVm9H9OeXvrhxGK9JjkkmZjhhBEV72OHbufvMm+ix3BIBsKJ/4ca4
 9XVaU4P1hF06Bb4QB5nTyev1gAJT4deOVyCNykL+j7PuCIJ4dugv3qUFDvXIKBZqliTf
 SczzLZwiADo2Tup+OhPjTvvUHCDahA1Yvgu8ydjJH/rJFWsaRmZsJmN2VU/Yo3LL97R8
 UKuMCqrYlvU+HcrMXFRCdLCHg9Eyzw5ol8pktnvP7ogtsIeUaoeQuS6ZdaHsF3vWPkZi
 BBKstkUId6wKhsDB7k0GfqEII0FUnynxF2HxHfOEHIso+rzaor8wYSu8LkSn/1WXE4+j
 M2sQ==
X-Gm-Message-State: AOAM531jxW73Xw67dqdCYNlJUX3/fBOnAjn3giM/4/mhjyJgUlQS7WV1
 2U8MMy5tj9DDy52AE7D5m+M=
X-Google-Smtp-Source: ABdhPJxp/41vncbzOQ0/ckQNO2o3dIOncvs0wTo348fYMlDIw0uCdLBHSseAdneK28/TWPC3VOwyDA==
X-Received: by 2002:a17:90a:de89:: with SMTP id
 n9mr1090213pjv.50.1598618765344; 
 Fri, 28 Aug 2020 05:46:05 -0700 (PDT)
Received: from realwakka.navercorp.com ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id 79sm1665930pfw.97.2020.08.28.05.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 05:46:04 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v3] drm/vkms: avoid warning in vkms_get_vblank_timestamp
Date: Fri, 28 Aug 2020 12:45:53 +0000
Message-Id: <20200828124553.2178-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sidong Yang <realwakka@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch avoid the warning in vkms_get_vblank_timestamp when vblanks aren't
enabled. When running igt test kms_cursor_crc just after vkms module, the
warning raised like below. Initial value of vblank time is zero and
hrtimer.node.expires is also zero if vblank aren't enabled before. vkms module
isn't real hardware but just virtual hardware module. so vkms can't generate a
resonable timestamp when hrtimer is off. it's best to grab the current time.

[106444.464503] [IGT] kms_cursor_crc: starting subtest pipe-A-cursor-size-change
[106444.471475] WARNING: CPU: 0 PID: 10109 at
/home/realwakka/git/linux/drivers/gpu/drm/vkms//vkms_crtc.c:91
vkms_get_vblank_timestamp+0x42/0x50 [vkms]
[106444.471511] CPU: 0 PID: 10109 Comm: kms_cursor_crc Tainted: G        W  OE
5.9.0-rc1+ #6
[106444.471514] RIP: 0010:vkms_get_vblank_timestamp+0x42/0x50 [vkms]
[106444.471528] Call Trace:
[106444.471551]  drm_get_last_vbltimestamp+0xb9/0xd0 [drm]
[106444.471566]  drm_reset_vblank_timestamp+0x63/0xe0 [drm]
[106444.471579]  drm_crtc_vblank_on+0x85/0x150 [drm]
[106444.471582]  vkms_crtc_atomic_enable+0xe/0x10 [vkms]
[106444.471592]  drm_atomic_helper_commit_modeset_enables+0x1db/0x230
[drm_kms_helper]
[106444.471594]  vkms_atomic_commit_tail+0x38/0xc0 [vkms]
[106444.471601]  commit_tail+0x97/0x130 [drm_kms_helper]
[106444.471608]  drm_atomic_helper_commit+0x117/0x140 [drm_kms_helper]
[106444.471622]  drm_atomic_commit+0x4a/0x50 [drm]
[106444.471629]  drm_atomic_helper_set_config+0x63/0xb0 [drm_kms_helper]
[106444.471642]  drm_mode_setcrtc+0x1d9/0x7b0 [drm]
[106444.471654]  ? drm_mode_getcrtc+0x1a0/0x1a0 [drm]
[106444.471666]  drm_ioctl_kernel+0xb6/0x100 [drm]
[106444.471677]  drm_ioctl+0x3ad/0x470 [drm]
[106444.471688]  ? drm_mode_getcrtc+0x1a0/0x1a0 [drm]
[106444.471692]  ? tomoyo_file_ioctl+0x19/0x20
[106444.471694]  __x64_sys_ioctl+0x96/0xd0
[106444.471697]  do_syscall_64+0x37/0x80
[106444.471699]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>

Signed-off-by: Sidong Yang <realwakka@gmail.com>

---

v3:
 - add cc.

v2:
 - modify commit message to make it a bit easier to understand.

---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..09c012d54d58 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
 	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
