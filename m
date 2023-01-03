Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F465C8CE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 22:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F9110E22E;
	Tue,  3 Jan 2023 21:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3FF10E22E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XwsmUf7E+00xnCD8y3OWHBc6tkQXC19OyY4TKfj8aLY=; b=sI5z5BmKz8DH2i3QKznDDHS499
 UvhtDL00VHFtqlS4t8/BTLqjOaMzFzm4QBIBNCO+6tw4ZezohCZp+e7adumHlhBuJYyQ7ugZ/iKMJ
 Y7JEEkn0Ls+MzBt/oBFwaqkygZ+7g/zn8ASwx20yEbqip18bwF++hoWqnU+HIynDPqbZj0H2KR2lV
 /3c9UfyQgIkfF+brvesuNxKjUXntCHeNgMHDThx1qBv2HaMYC0P+DV6T21wu4SO+w2A71KupO56PI
 F0zhV5VGeKK01XSsEv7RXeghw/vr1In+Ifn4pClsb1K3x73SMaWF8I5/BvikurvOFnhdpivN1Oqix
 sZ660SeA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pCog2-00GUhr-Qo; Tue, 03 Jan 2023 22:18:31 +0100
Message-ID: <cd5c3f0e-eec1-c492-24af-a0b3efad7e2e@igalia.com>
Date: Tue, 3 Jan 2023 18:18:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
Content-Language: en-US
In-Reply-To: <20230102112927.26565-12-tzimmermann@suse.de>
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

Hi Thomas,

On 1/2/23 08:29, Thomas Zimmermann wrote:
> Fix the color-format selection of the single-probe helper. Go
> through all user-specified values and test each for compatibility
> with the driver. If none is supported, use the driver-provided
> default. This guarantees that the console is always available in
> any color format at least.
> 
> Until now, the format selection of the single-probe helper tried
> to either use a user-specified format or a 32-bit default format.
> If the user-specified format was not supported by the driver, the
> selection failed and the display remained blank.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

I started to get the following warning on the Raspberry Pi 4 Model B
(arm64/defconfig) using drm-misc-next:

[    4.376317] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
[    4.433587] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
[    4.433617] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
[    4.433629] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
[    4.433640] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
[    4.433650] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
[    4.433658] vc4-drm gpu: [drm] No compatible format found
[    4.433854] ------------[ cut here ]------------
[    4.433861] WARNING: CPU: 2 PID: 66 at drivers/gpu/drm/drm_atomic.c:1604 __drm_atomic_helper_set_config+0x2e8/0x314 [drm]
[    4.434172] Modules linked in: btbcm(+) crct10dif_ce reset_raspberrypi clk_raspberrypi raspberrypi_hwmon bluetooth ecdh_generic ecc
pwm_bcm2835 broadcom rfkill iproc_rng200 bcm_phy_lib i2c_bcm2835 vc4 rng_core snd_soc_hdmi_codec bcm2711_thermal cec drm_display_helper
v3d pcie_brcmstb drm_dma_helper gpu_sched genet drm_shmem_helper nvmem_rmem mdio_bcm_unimac drm_kms_helper drm fuse ip_tables x_tables
ipv6
[    4.434322] CPU: 2 PID: 66 Comm: kworker/u8:2 Not tainted 6.1.0-rc6-00011-g37c90d589dc0 #29
[    4.434337] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
[    4.434345] Workqueue: events_unbound deferred_probe_work_func
[    4.434376] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.434390] pc : __drm_atomic_helper_set_config+0x2e8/0x314 [drm]
[    4.434668] lr : __drm_atomic_helper_set_config+0x64/0x314 [drm]
[    4.434943] sp : ffff8000082c3840
[    4.434949] x29: ffff8000082c3850 x28: ffff2d6d448e12c0 x27: 0000000000000001
[    4.434972] x26: 0000000000000038 x25: ffff2d6d448e12c0 x24: ffff2d6d401a0690
[    4.434991] x23: ffff2d6d41f74080 x22: ffff2d6d40d8a400 x21: ffff2d6d433fcc00
[    4.435009] x20: ffff2d6d401a0690 x19: ffff2d6d44b8e180 x18: 0000000000000020
[    4.435027] x17: 0000000000000010 x16: ffffa6757bee52d0 x15: 0000000000000000
[    4.435044] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[    4.435063] x11: 0000000000000000 x10: ffff2d6d43240800 x9 : ffff2d6d44b8e200
[    4.435081] x8 : 0000000000000000 x7 : ffff2d6d44b8e180 x6 : ffff2d6d40d8a400
[    4.435099] x5 : ffff2d6d45e7ca80 x4 : 0000000000000050 x3 : ffffa675498c3bad
[    4.435116] x2 : 0000000000000004 x1 : ffff2d6d4323f080 x0 : ffff2d6d433fcc00
[    4.435136] Call trace:
[    4.435143]  __drm_atomic_helper_set_config+0x2e8/0x314 [drm]
[    4.435440]  drm_client_modeset_commit_atomic+0x140/0x244 [drm]
[    4.435723]  drm_client_modeset_commit_locked+0x50/0x168 [drm]
[    4.436001]  drm_client_modeset_commit+0x2c/0x54 [drm]
[    4.436273]  __drm_fb_helper_initial_config_and_unlock+0x548/0x5a0 [drm_kms_helper]
[    4.436407]  drm_fb_helper_initial_config+0x38/0x50 [drm_kms_helper]
[    4.436528]  drm_fbdev_client_hotplug+0xa8/0x120 [drm_kms_helper]
[    4.436648]  drm_fbdev_generic_setup+0x80/0x150 [drm_kms_helper]
[    4.436768]  vc4_drm_bind+0x1f0/0x22c [vc4]
[    4.436928]  try_to_bring_up_aggregate_device+0x168/0x1b4
[    4.436958]  __component_add+0xbc/0x15c
[    4.436974]  component_add+0x14/0x20
[    4.436990]  vc4_hdmi_dev_probe+0x1c/0x28 [vc4]
[    4.437146]  platform_probe+0xa8/0xd0
[    4.437158]  really_probe+0x130/0x2f4
[    4.437174]  __driver_probe_device+0xb4/0xe0
[    4.437189]  driver_probe_device+0x3c/0x1f8
[    4.437202]  __device_attach_driver+0x118/0x140
[    4.437217]  bus_for_each_drv+0x84/0xd0
[    4.437229]  __device_attach+0xd0/0x19c
[    4.437243]  device_initial_probe+0x14/0x20
[    4.437256]  bus_probe_device+0x34/0x98
[    4.437268]  deferred_probe_work_func+0x88/0xc4
[    4.437282]  process_one_work+0x1cc/0x2c8
[    4.437295]  worker_thread+0x248/0x458
[    4.437304]  kthread+0xec/0x198
[    4.437319]  ret_from_fork+0x10/0x20
[    4.437333] ---[ end trace 0000000000000000 ]---

After bisecting the problem, I was able to detect that the warning started to
appear on the commit 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format
selection").

Do you have any idea on what might be causing this warning?

Best Regards,
- Maíra Canal
