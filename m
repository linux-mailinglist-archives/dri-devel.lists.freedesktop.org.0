Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4333C253C81
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 06:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F6C6E15E;
	Thu, 27 Aug 2020 04:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E556E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 04:18:22 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id p37so2421294pgl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 21:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+iBH8fkMhRsMfB6f+WMq2adtAVLulFdYcEcXSAwlW/s=;
 b=vR83mH1w9C84iID7BIoTAEfRswCCNSuxpRQCHYO7yBlMZXdf0H5b9E4DcEfsM6FueW
 iBF/tLQuYnNdcCE0jx9ucexvCNthlAeoCw2Iimm63XXblNWBVQp05UNDkx6BdtNnsh8q
 ckAD5W7kxXJM2bGq8Pxq37MNcoqhC+pvfYvirKe7tNqGuNY5AbxTs0TX66r1+LUP/pzr
 ANEcrDpDsrelcyReE5A0PYbzsrunMLMq3HUdMX1EJ/pOI/RbhD0Z4zHmQZ2DKdEIZa+E
 idlqzxC3VINwKe6FeMHebIHre3MCCZkBboTx/10HPgK35tuhGeWnysPrZKCpvwdkaMqG
 LuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+iBH8fkMhRsMfB6f+WMq2adtAVLulFdYcEcXSAwlW/s=;
 b=feTfjO4YNLWnLF0nV37QR4oZFa7DfwBU9t5nY+kTVAyUuFfxzSvEZMBG4Zj/hdohxc
 tNmAd+rBk4xEkdTCLkcPXmYzWfaBfffVKoVeDwCm+We/94XRBHlvNd1VLuAwQ1TbXnIr
 RUZkRLGfFu6D0lBVxIMsSEfXsreCGS/EwNp6IVgBY9M+KaVzQ+OQS99R6nr/35sLPNE6
 tUDl/h1I9wFBuPM3IchpLpO69sOqlPNrSwWY1NXO4Yax3q3ad1ijFyGiNiGnWoHbgtxL
 jjA5JW8CItAliDtEdkEYCGVozar7IdCZunM2d76/NLDK3qurNgggjcqfdrM6R2ugJze6
 5qhw==
X-Gm-Message-State: AOAM53047Ca1CDfD2womaDHOlT7yKisyvP1PhDroJFD3k2Cu5Ky3PtRR
 CYAf1m76QyYsSEWDHQIS4LU=
X-Google-Smtp-Source: ABdhPJwNMlLuNfl5KTwciY4p3OPdmEyHNcsuZBPUxvLvZzQNxKxk9VwNTcgFqZHYApx8dx3M4cA8aw==
X-Received: by 2002:aa7:838d:: with SMTP id u13mr14785423pfm.158.1598501901656; 
 Wed, 26 Aug 2020 21:18:21 -0700 (PDT)
Received: from realwakka.navercorp.com ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id y126sm812010pfy.138.2020.08.26.21.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 21:18:21 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: daniel@ffwll.ch, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v2] drm/vkms: avoid warning in vkms_get_vblank_timestamp
Date: Thu, 27 Aug 2020 04:18:00 +0000
Message-Id: <20200827041800.10229-1-realwakka@gmail.com>
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

Signed-off-by: Sidong Yang <realwakka@gmail.com>

---

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
