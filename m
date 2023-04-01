Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3606D3266
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 17:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AC910E105;
	Sat,  1 Apr 2023 15:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A0710E105
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 15:38:11 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id l7so23434709pjg.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680363491;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hqFog0EPi7cc7jTi4SQHHm60kq3S4Ku+FYssibLDulE=;
 b=PIAQVgWrwX7mWOViq/0HRPOO2TQURrQ0yUv/Ex2hyIAMb49v3Ddote57S2KhyJpEYX
 qHJ8jPSUT2wf2amPnwOsAKJLzcwubD0OBTi2875zzfRe7LM38kxYs0Xb6l1bwd2yUU4W
 cQOAQrvhEh6uzNNurNuxNPj9IHA3UqJLFlwAklAYUFkf3ZMn89KJjGlFjJ0SgE8Cpr0a
 NlX3bHRSwhpvQxDdENlUHrTyUTFkXomVTlGujHakxo7dSc9jGRPw1Xxk4KEoSClr0+ET
 IG4Lc9IJk3ffGo4khN1XOYeQNn6ldl1qUg30Rmdwrkn+68s9ZDVx2hU/xRfSHHrLiW4r
 x7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680363491;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hqFog0EPi7cc7jTi4SQHHm60kq3S4Ku+FYssibLDulE=;
 b=2CE2dwx3ij4eKt+nKTpXzvh/C1nmEu1ruPW9O7XVTMhXQMw0IDWkFXEXyRpQnJrzux
 Jvog/0xa9MK6+2pYHLelOw7iQLhNb2E7KvrhPpW7SSQEqewZGJ2xAlf3m4lqqNxhyTFd
 e87lhSaS6UfdJjM6FHmbKon8Ma2+wCvVQ8PetgwEWX6rkpnYraNdhH5OX1rU4RYdh/nU
 FWOojU2YCKj+WQr9hHTrXCFbDlW0LPOc+aTBPiR1RDYDG/AsYDrKLBxGFhoAV0LVJzEX
 jyl0egKltLFblQ0diqStDMifPXE6Q6ZA6iU3zT2JnyrF0nnzHVoK3rU4zvchSEJBx+kp
 +ZGg==
X-Gm-Message-State: AAQBX9dRE2rpRakWnEzWRXwRTCvd4ZJtk/DiBl3GOdLuoHhv2z4rHYGi
 OPiy7HCWsoduLHZhFqR0BAIljdhKS1s=
X-Google-Smtp-Source: AKy350bYx/r/sVzUWr1sjtDCKXZWvcOM2M0Db1J3dLpQBa5ivBOTw0PGcUU75aLfD7Unb4HQ3VskRg==
X-Received: by 2002:a17:902:e744:b0:19d:1fce:c9ec with SMTP id
 p4-20020a170902e74400b0019d1fcec9ecmr38680787plf.37.1680363490968; 
 Sat, 01 Apr 2023 08:38:10 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1709026b8800b0019a74841c9bsm3476873plk.192.2023.04.01.08.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 08:38:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vblank: Fix for drivers that do not drm_vblank_init()
Date: Sat,  1 Apr 2023 08:38:02 -0700
Message-Id: <20230401153802.1066072-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This should fix a crash that was reported on ast (and possibly other
drivers which do not initialize vblank).

   fbcon: Taking over console
   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000074
   Mem abort info:
     ESR = 0x0000000096000004
     EC = 0x25: DABT (current EL), IL = 32 bits
     SET = 0, FnV = 0
     EA = 0, S1PTW = 0
     FSC = 0x04: level 0 translation fault
   Data abort info:
     ISV = 0, ISS = 0x00000004
     CM = 0, WnR = 0
   user pgtable: 4k pages, 48-bit VAs, pgdp=0000080009d16000
   [0000000000000074] pgd=0000000000000000, p4d=0000000000000000
   Internal error: Oops: 0000000096000004 [#1] SMP
   Modules linked in: ip6table_nat tun nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink qrtr sunrpc binfmt_misc vfat fat xfs snd_usb_audio snd_hwdep snd_usbmidi_lib snd_seq snd_pcm snd_rawmidi snd_timer snd_seq_device snd soundcore joydev mc ipmi_ssif ipmi_devintf ipmi_msghandler arm_spe_pmu arm_cmn arm_dsu_pmu arm_dmc620_pmu cppc_cpufreq loop zram crct10dif_ce polyval_ce nvme polyval_generic ghash_ce sbsa_gwdt igb nvme_core ast nvme_common i2c_algo_bit xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multipath fuse
   CPU: 12 PID: 469 Comm: kworker/12:1 Not tainted 6.3.0-rc2-00008-gd39e48ca80c0 #1
   Hardware name: ADLINK AVA Developer Platform/AVA Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 09/08/2022
   Workqueue: events fbcon_register_existing_fbs
   pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : drm_crtc_next_vblank_start+0x2c/0x98
   lr : drm_atomic_helper_wait_for_fences+0x90/0x240
   sp : ffff80000d583960
   x29: ffff80000d583960 x28: ffff07ff8fc187b0 x27: 0000000000000000
   x26: ffff07ff99c08c00 x25: 0000000000000038 x24: ffff07ff99c0c000
   x23: 0000000000000001 x22: 0000000000000038 x21: 0000000000000000
   x20: ffff07ff9640a280 x19: 0000000000000000 x18: ffffffffffffffff
   x17: 0000000000000000 x16: ffffb24d2eece1c0 x15: 0000003038303178
   x14: 3032393100000048 x13: 0000000000000000 x12: 0000000000000000
   x11: 0000000000000000 x10: 0000000000000000 x9 : ffffb24d2eeeaca0
   x8 : ffff80000d583628 x7 : 0000080077783000 x6 : 0000000000000000
   x5 : ffff80000d584000 x4 : ffff07ff99c0c000 x3 : 0000000000000130
   x2 : 0000000000000000 x1 : ffff80000d5839c0 x0 : ffff07ff99c0cc08
   Call trace:
    drm_crtc_next_vblank_start+0x2c/0x98
    drm_atomic_helper_wait_for_fences+0x90/0x240
    drm_atomic_helper_commit+0xb0/0x188
    drm_atomic_commit+0xb0/0xf0
    drm_client_modeset_commit_atomic+0x218/0x280
    drm_client_modeset_commit_locked+0x64/0x1a0
    drm_client_modeset_commit+0x38/0x68
    __drm_fb_helper_restore_fbdev_mode_unlocked+0xb0/0xf8
    drm_fb_helper_set_par+0x44/0x88
    fbcon_init+0x1e0/0x4a8
    visual_init+0xbc/0x118
    do_bind_con_driver.isra.0+0x194/0x3a0
    do_take_over_console+0x50/0x70
    do_fbcon_takeover+0x74/0xf8
    do_fb_registered+0x13c/0x158
    fbcon_register_existing_fbs+0x78/0xc0
    process_one_work+0x1ec/0x478
    worker_thread+0x74/0x418
    kthread+0xec/0x100
    ret_from_fork+0x10/0x20
   Code: f9400004 b9409013 f940a082 9ba30a73 (b9407662)
   ---[ end trace 0000000000000000 ]---

Reported-by: Nathan Chancellor <nathan@kernel.org>
Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 299fa2a19a90..e98e3cefba3a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -996,10 +996,16 @@ EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 {
 	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
-	struct drm_display_mode *mode = &vblank->hwmode;
+	struct drm_vblank_crtc *vblank;
+	struct drm_display_mode *mode;
 	u64 vblank_start;
 
+	if (!crtc->dev->vblank)
+		return -EINVAL;
+
+	vblank = &crtc->dev->vblank[pipe];
+	mode = &vblank->hwmode;
+
 	if (!vblank->framedur_ns || !vblank->linedur_ns)
 		return -EINVAL;
 
-- 
2.39.2

