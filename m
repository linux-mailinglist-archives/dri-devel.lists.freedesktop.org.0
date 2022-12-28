Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3C65868C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 20:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B1010E208;
	Wed, 28 Dec 2022 19:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA7C10E208
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CME0VTCEG8Ol0tLeuUTDwmV17LZ96Yfdtg340FOOzyc=; b=TAJS1f+tnrmaY4BlhK/SFcKB2j
 Xiy11wKD/CtGdXaqMC851mh6llT7pfEjwVE+9ltuneUDmhAuEK6v8W91HbccKkUnxpuUz5k8klHbv
 iBVmBxlBjneXIPwLRUIICjmpE3UF7QJhu9+94yZvewgZblS90tTRg7oCxdSA1uhw9hq+2tbqW/g5G
 kOJpRFIy24z3Yzk9pWdopzAxuLpyBI+YXkoOPmHWQXynSru852X+/S1tXT5GP6GzS9nETzEjCgIUi
 XRSvEeMJ83BzLSfxoja6MBnOPdadDGcV8rF0OQTGhHna0xRcpuaQsj3FmCmCCWQgKhZI1zVwt5fOr
 MSd0YvOA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pAcQV-00Bp7W-4N; Wed, 28 Dec 2022 20:49:23 +0100
Message-ID: <4c036775-3989-b14a-8f3f-478ef488f108@igalia.com>
Date: Wed, 28 Dec 2022 16:49:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
Subject: Re: WARNING: CPU: 2 PID: 42 at drivers/gpu/drm/drm_modeset_lock.c:276
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>
References: <47a25f27-a3a1-5ec3-0c63-e68d05dff94e@i2se.com>
 <6ebcc09f-47d1-6c08-53f8-0b87ba2d75f6@i2se.com>
Content-Language: en-US
In-Reply-To: <6ebcc09f-47d1-6c08-53f8-0b87ba2d75f6@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

I was able to reproduce this error on drm-misc-next. I bisected,
and I got into commit 6bed2ea3cb38. I noticed that the crtc->mutex is
being locked twice, and this might be causing the problem. I wrote a
patch to try to fix this issue, and after applying the patch, I wasn't
able to reproduce the error anymore.

Let me know if you were able to reproduce the warning after applying this patch.

Best Regards,
- Maíra Canal

---

 From f6c910327d060e2314947e7e456db363a6164a49 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Date: Wed, 28 Dec 2022 16:14:34 -0300
Subject: [PATCH] drm/vc4: don't lock crtc's mutex on reset link
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Current, crtc->mutex is being locked twice: first, by
vc4_hdmi_reset_link() and them, internally, by
drm_atomic_get_crtc_state(). This produces the following output when
PROVE_LOCKING is enabled:

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

So, don't lock crtc->mutex inside the driver and let the right lock be
automatically acquired by drm_atomic_get_crtc_state().

Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ----
  1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0d3313c71f2f..b3b1958b5f4d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -340,10 +340,6 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
  	if (!crtc)
  		return 0;
  
-	ret = drm_modeset_lock(&crtc->mutex, ctx);
-	if (ret)
-		return ret;
-
  	crtc_state = crtc->state;
  	if (!crtc_state->active)
  		return 0;
-- 
2.38.1

On 12/28/22 08:26, Stefan Wahren wrote:
> Hi,
> 
> Am 21.12.22 um 20:46 schrieb Stefan Wahren:
>> Hi,
>>
>> if i enable PROVE_LOCKING on the Raspberry Pi 3 B+ 
>> (arm/multi_v7_defconfig) using v6.1 (didn't test older versions) i'm 
>> getting the following warning:
>>
>> [  204.043396] WARNING: CPU: 2 PID: 42 at 
>> drivers/gpu/drm/drm_modeset_lock.c:276 drm_modeset_drop_locks+0x6c/0x70
>> [  204.043426] Modules linked in: aes_arm aes_generic cmac 
>> bcm2835_v4l2(C) bcm2835_mmal_vchiq(C) videobuf2_vmalloc 
>> videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc 
>> snd_bcm2835(C) crc32_arm_ce brcmfmac brcmutil vc4 snd_soc_hdmi_codec 
>> sha256_generic libsha256 snd_soc_core ac97_bus snd_pcm_dmaengine 
>> snd_pcm sha256_arm snd_timer cfg80211 onboard_usb_hub snd hci_uart 
>> raspberrypi_hwmon soundcore drm_dma_helper btbcm bluetooth 
>> ecdh_generic bcm2835_thermal ecc libaes vchiq(C) microchip lan78xx
>> [  204.043820] CPU: 2 PID: 42 Comm: kworker/2:1 Tainted: G C 
>> 6.1.0-00007-g22fada783b9f #31
>> [  204.043833] Hardware name: BCM2835
>> [  204.043842] Workqueue: events output_poll_execute
>> [  204.043866]  unwind_backtrace from show_stack+0x10/0x14
>> [  204.043886]  show_stack from dump_stack_lvl+0x58/0x70
>> [  204.043903]  dump_stack_lvl from __warn+0xc8/0x1e8
>> [  204.043920]  __warn from warn_slowpath_fmt+0x5c/0xb8
>> [  204.043936]  warn_slowpath_fmt from drm_modeset_drop_locks+0x6c/0x70
>> [  204.043952]  drm_modeset_drop_locks from 
>> drm_helper_probe_detect_ctx+0xd4/0x124
>> [  204.043969]  drm_helper_probe_detect_ctx from 
>> output_poll_execute+0x154/0x230
>> [  204.043986]  output_poll_execute from process_one_work+0x288/0x708
>> [  204.044004]  process_one_work from worker_thread+0x54/0x50c
>> [  204.044020]  worker_thread from kthread+0xe8/0x104
>> [  204.044034]  kthread from ret_from_fork+0x14/0x2c
>> [  204.044048] Exception stack(0xf0915fb0 to 0xf0915ff8)
>> [  204.044059] 5fa0:                                     00000000 
>> 00000000 00000000 00000000
>> [  204.044070] 5fc0: 00000000 00000000 00000000 00000000 00000000 
>> 00000000 00000000 00000000
>> [  204.044080] 5fe0: 00000000 00000000 00000000 00000000 00000013 
>> 00000000
>> [  204.044090] irq event stamp: 33189
>> [  204.044100] hardirqs last  enabled at (33195): [<c03ba3b4>] 
>> __up_console_sem+0x50/0x60
>> [  204.044120] hardirqs last disabled at (33200): [<c03ba3a0>] 
>> __up_console_sem+0x3c/0x60
>> [  204.044136] softirqs last  enabled at (32836): [<c0366478>] 
>> process_one_work+0x288/0x708
>> [  204.044152] softirqs last disabled at (32832): [<c0fb7134>] 
>> neigh_managed_work+0x18/0xa4
>> [  204.044168] ---[ end trace 0000000000000000 ]---
> 
> here are my intermediate results. I'm stuck during bisecting. For the 
> skipped steps either vc4 throw compile errors or X doesn't come up 
> (display goes black before X and says no connection).
> 
> $ git bisect log
> git bisect start
> # good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
> git bisect good 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
> # bad: [33e591dee915832c618cf68bb1058c8e7d296128] Merge tag 
> 'phy-for-6.1' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
> git bisect bad 33e591dee915832c618cf68bb1058c8e7d296128
> # good: [a47e60729d9624e931f988709ab76e043e2ee8b9] Merge tag 
> 'backlight-next-6.1' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight
> git bisect good a47e60729d9624e931f988709ab76e043e2ee8b9
> # bad: [ff6862c23d2e83d12d1759bf4337d41248fb4dc8] Merge tag 
> 'arm-drivers-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect bad ff6862c23d2e83d12d1759bf4337d41248fb4dc8
> # good: [95d8c67187bcfaa519bafcdef9091cd906505454] Merge tag 
> 'drm-msm-next-2022-09-22' of https://gitlab.freedesktop.org/drm/msm into 
> drm-next
> git bisect good 95d8c67187bcfaa519bafcdef9091cd906505454
> # good: [86a4d29e75540e20f991e72f17aa51d0e775a397] Merge tag 'asoc-v6.1' 
> of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into 
> for-linus
> git bisect good 86a4d29e75540e20f991e72f17aa51d0e775a397
> # bad: [65898687cf7392c372ea8d04a88617e2cb794465] Merge tag 
> 'amd-drm-next-6.1-2022-09-30' of 
> https://gitlab.freedesktop.org/agd5f/linux into drm-next
> git bisect bad 65898687cf7392c372ea8d04a88617e2cb794465
> # good: [2d89e2ddfd00ca569dd73883c7c70badbd57f4ac] drm/amdgpu: fix 
> compiler warning for amdgpu_gfx_cp_init_microcode
> git bisect good 2d89e2ddfd00ca569dd73883c7c70badbd57f4ac
> # bad: [1637c315282e97efcb95cc7dfafbb15efa9fa27f] drm/mediatek: dp: Fix 
> compiler warning in mtk_dp_video_mute()
> git bisect bad 1637c315282e97efcb95cc7dfafbb15efa9fa27f
> # skip: [b78e5d830f0db8e6d998cdc5a2b7b807cf463f99] drm/tests: Set also 
> mock plane src_x, src_y, src_w and src_h
> git bisect skip b78e5d830f0db8e6d998cdc5a2b7b807cf463f99
> # skip: [213cb76ddc8b875e772f9f4d173feefa122716af] Merge tag 
> 'drm-intel-gt-next-2022-09-09' of 
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
> git bisect skip 213cb76ddc8b875e772f9f4d173feefa122716af
> # good: [4f96b1bc156e7076f6efedc2a76a8c7e897c7977] drm/todo: Add entry 
> about dealing with brightness control on devices with > 1 panel
> git bisect good 4f96b1bc156e7076f6efedc2a76a8c7e897c7977
> # skip: [165ba1aad164b7d5d5bc327fa511f6ef693b207b] drm/vc4: hdmi: Switch 
> to detect_ctx
> git bisect skip 165ba1aad164b7d5d5bc327fa511f6ef693b207b
> # skip: [c0895f80272cd4100a26129f4fb91a85bf6663a1] drm/vc4: hdmi: 
> Simplify the hotplug handling
> git bisect skip c0895f80272cd4100a26129f4fb91a85bf6663a1
> # bad: [98a65e6d498c46b0beec7a40aac4b3e404642993] drm/rockchip: remove 
> vop_writel from vop1 driver
> git bisect bad 98a65e6d498c46b0beec7a40aac4b3e404642993
> # skip: [385d1bba890f9b94322ca7fdfa778311f1ea0813] drm/modes: Add 
> initializer macro DRM_MODE_INIT()
> git bisect skip 385d1bba890f9b94322ca7fdfa778311f1ea0813
> # skip: [d25654b3fad9906ca80912701fd4bd6e2419f54d] drm/probe-helper: Add 
> drm_connector_helper_get_modes_fixed()
> git bisect skip d25654b3fad9906ca80912701fd4bd6e2419f54d
> # skip: [6d6e732835db92e66c28dbcf258a7e3d3c71420d] drm/udl: Restore 
> display mode on resume
> git bisect skip 6d6e732835db92e66c28dbcf258a7e3d3c71420d
> # skip: [f2912237eb922bf2d4ebf13f3f5f1b25070f1e52] drm/aperture: Fix 
> some kerneldoc comments
> git bisect skip f2912237eb922bf2d4ebf13f3f5f1b25070f1e52
> # skip: [68ded02cb2c23f1aebf026196a793959bd0463dc] drm/scdc: Document 
> hotplug gotchas
> git bisect skip 68ded02cb2c23f1aebf026196a793959bd0463dc
> # skip: [216b9bbaeaea96b7f05c220f61855d174be972d8] drm/probe-helper: Add 
> drm_crtc_helper_mode_valid_fixed()
> git bisect skip 216b9bbaeaea96b7f05c220f61855d174be972d8
> 
>>
>> Best regards
>>
