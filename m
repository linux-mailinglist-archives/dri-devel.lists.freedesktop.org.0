Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAEE2D63BC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 18:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866166E430;
	Thu, 10 Dec 2020 17:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9666E430;
 Thu, 10 Dec 2020 17:38:23 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id v29so4845481pgk.12;
 Thu, 10 Dec 2020 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaSoQbWkGk9rnWSYO+eot2cz4dRr33/1PTssSbr1rxY=;
 b=kkPwCwYaLd/fKBtLL8cs8L6+Ee10drce68MuF+qZ7QPJexL0P7fkH8QBvm1C/z1vSn
 bCll7cpDomOrdbgxNqbhUQNxNZ32t4cXNbCQ/s3djNXehteFKuB2b5evNmW1RmvISzxw
 nK8eLHEcnB0yWKIjMxqgpYd5NxXfVHZRQnSDTKJteVK+EVxMPMpDSYa2cCqApm3Jto7o
 /GnNPOUzdJz5HEDNu6Eqgf3e4lwfLhLGcvGWg3Jycytgs3Ml09bvjCj6niUo5NcPqrX3
 wp5BOqOQVRXWgRsK17LgTg2gddYcW2HOp64OyY04twHvAAdOHH2mtSJtY8kNh9s/4ylf
 goIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaSoQbWkGk9rnWSYO+eot2cz4dRr33/1PTssSbr1rxY=;
 b=H3wh9itTxcjVIz0Cg96/RvGWdb7Fesb7dRuR+g0w7ZgLaPfXnoxlHPbnR/ILFKIKo4
 dmClF46NLt2rQ7cEPXzYTV966NJJhqPTgKgQVAnHnQFv7MqDKz8EggFEld3YO13QK/dr
 E/59hoJ9XHQXy6g/4J5uqqz4/kgpWwoJWtmkPRlHoEo4HDUzPQkfgJxcttAbPRSbDEKa
 h9sqBu7JcAeIMiezMGQdmPBDaCAR8bih0nGs/JXznffjCVIqFCykbaYVeSDnBpndADo3
 ikSLgFMJ2O6Td3OGh/smwRCmvFS8yphEdKtKOZZQGKRbwTNFhKZBbKuXlmyIlFR1uNfM
 9B3Q==
X-Gm-Message-State: AOAM530fBAnm5XJF64Wbz2cuVTMNLvEV13FAvd2e38GAz7sn0j6u2XGo
 MSpmKlJv3iIDqVXT7gUS1BT9pVmgVG0=
X-Google-Smtp-Source: ABdhPJwgIDldLpEhYXjnyvvcLDonLUncqif9qMLnfoECHv0QXwm1hcK64UfF7veC5/3U6/ojHnbenw==
X-Received: by 2002:a17:90a:3ee3:: with SMTP id
 k90mr8624318pjc.164.1607621902369; 
 Thu, 10 Dec 2020 09:38:22 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 f5sm7095009pfg.1.2020.12.10.09.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:38:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix WARN_ON() splat in _free_object()
Date: Thu, 10 Dec 2020 09:40:28 -0800
Message-Id: <20201210174028.2060883-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Iskren Chernev <iskren.chernev@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[  192.062000] ------------[ cut here ]------------
[  192.062498] WARNING: CPU: 3 PID: 2039 at drivers/gpu/drm/msm/msm_gem.c:381 put_iova_vmas+0x94/0xa0 [msm]
[  192.062870] Modules linked in: snd_hrtimer snd_seq snd_seq_device rfcomm algif_hash algif_skcipher af_alg bnep xt_CHECKSUM nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_counter xt_tcpudp nft_compat cpufreq_powersave cpufreq_conservative q6asm_dai q6routing q6afe_dai q6adm bridge q6afe q6asm q6dsp_common q6core stp llc nf_tables libcrc32c nfnetlink snd_soc_wsa881x regmap_sdw soundwire_qcom gpio_wcd934x snd_soc_wcd934x wcd934x regmap_slimbus venus_enc venus_dec apr videobuf2_dma_sg qrtr_smd uvcvideo videobuf2_vmalloc videobuf2_memops ath10k_snoc ath10k_core hci_uart btqca btbcm mac80211 bluetooth snd_soc_sdm845 ath snd_soc_rt5663 snd_soc_qcom_common snd_soc_rl6231 soundwire_bus ecdh_generic ecc qcom_spmi_adc5 venus_core qcom_pon qcom_spmi_temp_alarm qcom_vadc_common v4l2_mem2mem videobuf2_v4l2 cfg80211 videobuf2_common hid_multitouch reset_qcom_pdc qcrypto qcom_rng rfkill qcom_q6v5_mss libarc4 libdes qrtr ns qcom_wdt socinfo slim_qcom_ngd_ctrl
[  192.065739]  pdr_interface qcom_q6v5_pas slimbus qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qmi_helpers rmtfs_mem tcp_bbr sch_fq fuse ip_tables x_tables ipv6 crc_ccitt ti_sn65dsi86 i2c_hid msm mdt_loader llcc_qcom rtc_pm8xxx ocmem drm_kms_helper crct10dif_ce phy_qcom_qusb2 i2c_qcom_geni panel_simple drm pwm_bl
[  192.066066] CPU: 3 PID: 2039 Comm: gnome-shell Tainted: G        W         5.10.0-rc7-next-20201208 #1
[  192.066068] Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
[  192.066072] pstate: 40400005 (nZcv daif +PAN -UAO -TCO BTYPE=--)
[  192.066099] pc : put_iova_vmas+0x94/0xa0 [msm]
[  192.066262] lr : put_iova_vmas+0x1c/0xa0 [msm]
[  192.066403] sp : ffff800019efbbb0
[  192.066405] x29: ffff800019efbbb0 x28: ffff800019efbd88
[  192.066411] x27: 0000000000000000 x26: ffff109582efa400
[  192.066417] x25: 0000000000000009 x24: 000000000000012b
[  192.066422] x23: ffff109582efa438 x22: ffff109582efa450
[  192.066427] x21: ffff109582efa528 x20: ffff1095cbd4f200
[  192.066432] x19: ffff1095cbd4f200 x18: 0000000000000000
[  192.066438] x17: 0000000000000000 x16: ffffc26c200ca750
[  192.066727] x15: 0000000000000000 x14: 0000000000000000
[  192.066741] x13: ffff1096fb8c9100 x12: 0000000000000002
[  192.066754] x11: ffffffffffffffff x10: 0000000000000002
[  192.067046] x9 : 0000000000000001 x8 : 0000000000000a36
[  192.067060] x7 : ffff4e2ad9f11000 x6 : ffffc26c216d4000
[  192.067212] x5 : ffffc26c2022661c x4 : ffff1095c2b98000
[  192.067367] x3 : ffff1095cbd4f300 x2 : 0000000000000000
[  192.067380] x1 : ffff1095c2b98000 x0 : 0000000000000000
[  192.067667] Call trace:
[  192.067734]  put_iova_vmas+0x94/0xa0 [msm]
[  192.068078]  msm_gem_free_object+0xb4/0x110 [msm]
[  192.068399]  drm_gem_object_free+0x1c/0x30 [drm]
[  192.068717]  drm_gem_object_handle_put_unlocked+0xf0/0xf8 [drm]
[  192.069032]  drm_gem_object_release_handle+0x6c/0x88 [drm]
[  192.069349]  drm_gem_handle_delete+0x68/0xc0 [drm]
[  192.069666]  drm_gem_close_ioctl+0x30/0x48 [drm]
[  192.069984]  drm_ioctl_kernel+0xc0/0x110 [drm]
[  192.070303]  drm_ioctl+0x210/0x440 [drm]
[  192.070588]  __arm64_sys_ioctl+0xa8/0xf0
[  192.070599]  el0_svc_common.constprop.0+0x74/0x190
[  192.070608]  do_el0_svc+0x24/0x90
[  192.070618]  el0_svc+0x14/0x20
[  192.070903]  el0_sync_handler+0xb0/0xb8
[  192.070911]  el0_sync+0x174/0x180
[  192.070918] ---[ end trace bee6b12a899001a3 ]---
[  192.072140] ------------[ cut here ]------------

Fixes: 9b73bde39cf2 ("drm/msm: Fix use-after-free in msm_gem with carveout")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 68a6c7eacc0a..a21be5b910ff 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -990,6 +990,8 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 		if (msm_obj->pages)
 			kvfree(msm_obj->pages);
 
+		put_iova_vmas(obj);
+
 		/* dma_buf_detach() grabs resv lock, so we need to unlock
 		 * prior to drm_prime_gem_destroy
 		 */
@@ -999,11 +1001,10 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
+		put_iova_vmas(obj);
 		msm_gem_unlock(obj);
 	}
 
-	put_iova_vmas(obj);
-
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
