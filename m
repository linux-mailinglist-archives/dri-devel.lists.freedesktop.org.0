Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5C65913E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C4E10E023;
	Thu, 29 Dec 2022 19:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9910E023
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gxhkfvK536AK1vIzUpT9PHkT7vJmK57HHmFM9C9AKjg=; b=XFq5BtmUZzkgDJarku+TLkVViN
 psGM/Jf/GH1gkdDhv2CfCVVG+pCeZ9uPfS8Oy6+YBXxLFi313MnIAkMpa23ZNXXetDB/fzFuaR0tr
 T+0bwBKOOYRAjNsfeS4iq6R2z2rq3o/kb77k7+Z9y8/Xo+cwDqsc3r7eOzQb7m3s3Ucn2XDyx8DDR
 kIQfXWytnNpGh2hEe0A5ArmmOqkFP9TfSkqWDTpK+A7zyifUMh3m5ViDCcybQDbC7SsJDPwPtEHWu
 lucESuBNqOfHbNBzqygTC7IjEh60HGPA+CS55oj1XxwUCk5nZ80NErc0vYCTBSmdU+14hu0BePUOD
 4gVxJWLw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pAyrg-00CoBE-9u; Thu, 29 Dec 2022 20:46:56 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/vc4: drop all currently held locks if deadlock happens
Date: Thu, 29 Dec 2022 16:46:38 -0300
Message-Id: <20221229194638.178712-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If vc4_hdmi_reset_link() returns -EDEADLK, it means that a deadlock
happened in the locking context. This situation should be addressed by
dropping all currently held locks and block until the contended lock
becomes available. Currently, vc4 is not dealing with the deadlock
properly, producing the following output when PROVE_LOCKING is enabled:

[  825.612809] ------------[ cut here ]------------
[  825.612852] WARNING: CPU: 1 PID: 116 at drivers/gpu/drm/drm_modeset_lock.c:276 drm_modeset_drop_locks+0x60/0x68 [drm]
[  825.613458] Modules linked in: 8021q mrp garp stp llc
raspberrypi_cpufreq brcmfmac brcmutil crct10dif_ce hci_uart cfg80211
btqca btbcm bluetooth vc4 raspberrypi_hwmon snd_soc_hdmi_codec cec
clk_raspberrypi ecdh_generic drm_display_helper ecc rfkill
drm_dma_helper drm_kms_helper pwm_bcm2835 bcm2835_thermal bcm2835_rng
rng_core i2c_bcm2835 drm fuse ip_tables x_tables ipv6
[  825.613735] CPU: 1 PID: 116 Comm: kworker/1:2 Tainted: G        W 6.1.0-rc6-01399-g941aae326315 #3
[  825.613759] Hardware name: Raspberry Pi 3 Model B Rev 1.2 (DT)
[  825.613777] Workqueue: events output_poll_execute [drm_kms_helper]
[  825.614038] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  825.614063] pc : drm_modeset_drop_locks+0x60/0x68 [drm]
[  825.614603] lr : drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
[  825.614829] sp : ffff800008313bf0
[  825.614844] x29: ffff800008313bf0 x28: ffffcd7778b8b000 x27: 0000000000000000
[  825.614883] x26: 0000000000000001 x25: 0000000000000001 x24: ffff677cc35c2758
[  825.614920] x23: ffffcd7707d01430 x22: ffffcd7707c3edc7 x21: 0000000000000001
[  825.614958] x20: 0000000000000000 x19: ffff800008313c10 x18: 000000000000b6d3
[  825.614995] x17: ffffcd777835e214 x16: ffffcd7777cef870 x15: fffff81000000000
[  825.615033] x14: 0000000000000000 x13: 0000000000000099 x12: 0000000000000002
[  825.615070] x11: 72917988020af800 x10: 72917988020af800 x9 : 72917988020af800
[  825.615108] x8 : ffff677cc665e0a8 x7 : d00a8c180000110c x6 : ffffcd77774c0054
[  825.615145] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[  825.615181] x2 : ffff677cc55e1880 x1 : ffffcd7777cef8ec x0 : ffff800008313c10
[  825.615219] Call trace:
[  825.615232]  drm_modeset_drop_locks+0x60/0x68 [drm]
[  825.615773]  drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
[  825.616003]  output_poll_execute+0xe4/0x224 [drm_kms_helper]
[  825.616233]  process_one_work+0x2b4/0x618
[  825.616264]  worker_thread+0x24c/0x464
[  825.616288]  kthread+0xec/0x110
[  825.616310]  ret_from_fork+0x10/0x20
[  825.616335] irq event stamp: 7634
[  825.616349] hardirqs last  enabled at (7633): [<ffffcd777831ee90>] _raw_spin_unlock_irq+0x3c/0x78
[  825.616384] hardirqs last disabled at (7634): [<ffffcd7778315a78>] __schedule+0x134/0x9f0
[  825.616411] softirqs last  enabled at (7630): [<ffffcd7707aacea0>] local_bh_enable+0x4/0x30 [ipv6]
[  825.617019] softirqs last disabled at (7618): [<ffffcd7707aace70>] local_bh_disable+0x4/0x30 [ipv6]
[  825.617586] ---[ end trace 0000000000000000 ]---

Therefore, deal with the deadlock as suggested by [1], using the
function drm_modeset_backoff().

[1] https://docs.kernel.org/gpu/drm-kms.html?highlight=kms#kms-locking

Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0d3313c71f2f..dfb7f41b28df 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -402,6 +402,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct edid *edid;
+	int ret;
 
 	/*
 	 * NOTE: This function should really be called with
@@ -430,7 +431,15 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
 	kfree(edid);
 
-	vc4_hdmi_reset_link(connector, ctx);
+	for (;;) {
+		ret = vc4_hdmi_reset_link(connector, ctx);
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(ctx);
+			continue;
+		}
+
+		break;
+	}
 }
 
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
-- 
2.38.1

