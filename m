Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4638B6E69C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 18:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6F410E048;
	Tue, 18 Apr 2023 16:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA4110E048;
 Tue, 18 Apr 2023 16:42:05 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b5465fb99so2049393b3a.1; 
 Tue, 18 Apr 2023 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681836124; x=1684428124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DBjYteFlARZI3kpDkoIEAMndmdFS6IARwATkjleA/Es=;
 b=JIG4s2/Hoz7mreVcQSsElvHacUy2Z3ED/XO7zoHI+ged7p3//5YqorUh5OBG99ioWI
 fp7Px+9ZoAV5VRQ9vVQc7AoL/QPWmX/4RC16l29E4CoMSQwzSTy483z9Wkc1KHrguw1g
 dQ4V8yhvMerKCokRhUuS2Ys0KcCZ8NEbqnBSqnwCCTrDPNqVOuraHOoAstBMcEgLfJUV
 ZsT5FPg/zySNjh4Kf35grdglzNJhd90uDq289EvTKyLIQ/xzKPkdNhfLncrPq6O2TnK3
 4NK9n90BlXKQsIU7Jy1G7YfOqdSNOr2PFpnVPaVlfjHhI+J6cTWQgeOitoOT15rtbqQ4
 s2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681836124; x=1684428124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DBjYteFlARZI3kpDkoIEAMndmdFS6IARwATkjleA/Es=;
 b=gTXFXwFuQkiZZOc6RfSEftYn/Y2yTIpPIHrM7qSgTEmsOV6/+f9Yyw4WzR2gxIaLC6
 yHTY+I/mW81veqH/wNs1kUGv4uo23Z9QXDZDxa4+Zt6si8WYFrGmSLFmeH+1Uty2v4CF
 A8LsjGGttQcjUGNkdhSqP2bLik5/LdcCmjRrBXO0/Z3XvbbSRR5nNWpkz+kUaDEmDnbQ
 qExnnR21KROrCMVaUuekF8lZPz9vimlxFltkpi3rwCY7VMq1x0AJFtvS5Em4XvY508xr
 f3tW9hBonzFgOAAepWvB6ZWH2X+FmffxoiLVPMXTKwTdAC1zI8yQf7EN3AJV0Q8CgDlI
 YUgQ==
X-Gm-Message-State: AAQBX9fYtKJxTe5NblY3G56KrOuCQcTthbUKIv+z1FR7oXdsobtPjE2d
 h5BLSVnVYb26YDp9/4mOV3wSNtr4zzU=
X-Google-Smtp-Source: AKy350YcV6j1lv6XmhOfSNAWDYy73WgCv1F7VXKe1uo1OIl8xC2iEX9Ihpu2om1pKqDrFlg/8Z0cbA==
X-Received: by 2002:a17:903:2291:b0:1a6:6d9f:2fc9 with SMTP id
 b17-20020a170903229100b001a66d9f2fc9mr3187958plh.30.1681836124194; 
 Tue, 18 Apr 2023 09:42:04 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a170902848900b0019a7ef5e9a8sm5445534plo.82.2023.04.18.09.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:42:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/atomic: Don't try async if crtc not active
Date: Tue, 18 Apr 2023 09:41:58 -0700
Message-Id: <20230418164158.549873-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For a similar reason as commit f2c7ca890182 ("drm/atomic-helper: Don't
set deadline for modesets"), we need the crtc to be already active in
order to compute a target vblank time for an async commit.  Otherwise
we get this splat reminding us that we are doing it wrong:

   ------------[ cut here ]------------
   msm_dpu ae01000.mdp: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
   WARNING: CPU: 7 PID: 1923 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
   Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp llc tun vhost_vsock vhost vhost_iotlb vmw_vsock_virtio_transport_common vsock uinput rfcomm algif_hash algif_skcipher af_alg veth venus_dec venus_enc cros_ec_typec typec qcom_spmi_temp_alarm qcom_spmi_adc_tm5 qcom_spmi_adc5 xt_cgroup qcom_vadc_common qcom_stats hci_uart btqca xt_MASQUERADE venus_core 8021q coresight_tmc coresight_funnel coresight_etm4x coresight_replicator snd_soc_lpass_sc7180 coresight snd_soc_sc7180 ip6table_nat fuse ath10k_snoc ath10k_core ath mac80211 iio_trig_sysfs bluetooth cfg80211 cros_ec_sensors cros_ec_sensors_core ecdh_generic industrialio_triggered_buffer ecc kfifo_buf cros_ec_sensorhub r8153_ecm cdc_ether usbnet r8152 mii lzo_rle lzo_compress zram hid_vivaldi hid_google_hammer hid_vivaldi_common joydev
   CPU: 7 PID: 1923 Comm: DrmThread Not tainted 5.15.107-18853-g3be267609a0b-dirty #16 a1ffc1a66e79c21c3536d8c9a42e819236e39714
   Hardware name: Google Wormdingler rev1+ BOE panel board (DT)
   pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
   lr : drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x144/0x370
   sp : ffffffc012e2b800
   x29: ffffffc012e2b840 x28: ffffff8083676094 x27: ffffffc012e2bb28
   x26: ffffff8084539800 x25: 0000000000000000 x24: ffffff8083676000
   x23: ffffffd3c8cdc5a0 x22: ffffff80845b9d00 x21: ffffffc012e2b8b4
   x20: ffffffc012e2b910 x19: 0000000000000001 x18: 0000000000000000
   x17: 0000000000000000 x16: 0000000000000010 x15: ffffffd3c8451a88
   x14: 0000000000000003 x13: 0000000000000004 x12: 0000000000000001
   x11: c0000000ffffdfff x10: ffffffd3c973ef58 x9 : 8ea3526b3cc95900
   x8 : 8ea3526b3cc95900 x7 : 0000000000000000 x6 : 000000000000003a
   x5 : ffffffd3c99676cd x4 : 0000000000000000 x3 : ffffffc012e2b4b8
   x2 : ffffffc012e2b4c0 x1 : 00000000ffffdfff x0 : 0000000000000000
   Call trace:
    drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
    drm_crtc_vblank_helper_get_vblank_timestamp+0x20/0x30
    drm_crtc_get_last_vbltimestamp+0x68/0xb0
    drm_crtc_next_vblank_start+0x5c/0xa8
    msm_atomic_commit_tail+0x264/0x664
    commit_tail+0xac/0x160
    drm_atomic_helper_commit+0x160/0x168
    drm_atomic_commit+0xfc/0x128
    drm_atomic_helper_disable_plane+0x8c/0x110
    __setplane_atomic+0x10c/0x138
    drm_mode_cursor_common+0x3a8/0x410
    drm_mode_cursor_ioctl+0x48/0x70
    drm_ioctl_kernel+0xe0/0x158
    drm_ioctl+0x25c/0x4d8
    __arm64_sys_ioctl+0x98/0xd0
    invoke_syscall+0x4c/0x100
    el0_svc_common+0x98/0x104
    do_el0_svc+0x30/0x90
    el0_svc+0x20/0x50
    el0t_64_sync_handler+0x78/0x108
    el0t_64_sync+0x1a4/0x1a8
   ---[ end trace a0f587e1ab9589e8 ]---

Fixes: 52ff0d3073d2 ("drm/msm/atomic: Switch to vblank_start helper")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index c5e71c05f038..3871a6f2d8e1 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -155,6 +155,8 @@ static bool can_do_async(struct drm_atomic_state *state,
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		if (drm_atomic_crtc_needs_modeset(crtc_state))
 			return false;
+		if (!crtc_state->active)
+			return false;
 		if (++num_crtcs > 1)
 			return false;
 		*async_crtc = crtc;
-- 
2.39.2

