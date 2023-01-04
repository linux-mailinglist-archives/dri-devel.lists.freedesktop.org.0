Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947365D0B7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139410E132;
	Wed,  4 Jan 2023 10:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F92D10E132
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nDwbdzze0m7rkXNVr0rLJ7mBoT6ba2Jk6+NIu59pzU0=; b=dMR2Bqi2NX1vFitg5GsNcGER3F
 9PuvvTyVwdrH91pdMW33uYHWLEbpRQMkoV/M0tjTF87qan8enDENB8wxFDh5/Wnn2zE7/DpaLAnO7
 Lc6roYbhdAvuSyQTREzxTcVl9DSJ0Qum0udXiswOW5+QVFgRiiGPBfyt3Z/ugpC6LSUI0rctQBHnL
 XjMTPjd1Ebvv5RcGTcyMizsMPi2hkk+y2o0Ceo/k53ouHqXCPTLzGoccmAwLTbXBtv0Gr9IGoLRdx
 S/qTgBUpGUrh/2pxWsF4+7FrI3OeLme6TeP42uBKGgRjG3BGR+p1CI/gLgkG86xDlQAofaZNyV0gu
 VJApYN7A==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pD16L-00Gw4l-KC; Wed, 04 Jan 2023 11:34:29 +0100
Message-ID: <e84e9a28-3f7c-6f12-53d4-9d1023aa9d18@igalia.com>
Date: Wed, 4 Jan 2023 07:34:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>, daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <cd5c3f0e-eec1-c492-24af-a0b3efad7e2e@igalia.com>
 <afb68161-1f16-41ec-1883-7e79c201e9b6@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <afb68161-1f16-41ec-1883-7e79c201e9b6@suse.de>
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

On 1/4/23 05:14, Thomas Zimmermann wrote:
> Hi
> 
> Thanks for reporting the problem.
> 
> Am 03.01.23 um 22:18 schrieb Maíra Canal:
>> Hi Thomas,
>>
>> On 1/2/23 08:29, Thomas Zimmermann wrote:
>>> Fix the color-format selection of the single-probe helper. Go
>>> through all user-specified values and test each for compatibility
>>> with the driver. If none is supported, use the driver-provided
>>> default. This guarantees that the console is always available in
>>> any color format at least.
>>>
>>> Until now, the format selection of the single-probe helper tried
>>> to either use a user-specified format or a 32-bit default format.
>>> If the user-specified format was not supported by the driver, the
>>> selection failed and the display remained blank.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>
>> I started to get the following warning on the Raspberry Pi 4 Model B
>> (arm64/defconfig) using drm-misc-next:
>>
>> [    4.376317] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>> [    4.433587] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
>> [    4.433617] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
>> [    4.433629] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
>> [    4.433640] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
>> [    4.433650] vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
>> [    4.433658] vc4-drm gpu: [drm] No compatible format found
>> [    4.433854] ------------[ cut here ]------------
>> [    4.433861] WARNING: CPU: 2 PID: 66 at drivers/gpu/drm/drm_atomic.c:1604 __drm_atomic_helper_set_config+0x2e8/0x314 [drm]
>> [    4.434172] Modules linked in: btbcm(+) crct10dif_ce reset_raspberrypi clk_raspberrypi raspberrypi_hwmon bluetooth ecdh_generic ecc
>> pwm_bcm2835 broadcom rfkill iproc_rng200 bcm_phy_lib i2c_bcm2835 vc4 rng_core snd_soc_hdmi_codec bcm2711_thermal cec drm_display_helper
>> v3d pcie_brcmstb drm_dma_helper gpu_sched genet drm_shmem_helper nvmem_rmem mdio_bcm_unimac drm_kms_helper drm fuse ip_tables x_tables
>> ipv6
>> [    4.434322] CPU: 2 PID: 66 Comm: kworker/u8:2 Not tainted 6.1.0-rc6-00011-g37c90d589dc0 #29
>> [    4.434337] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
>> [    4.434345] Workqueue: events_unbound deferred_probe_work_func
>> [    4.434376] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    4.434390] pc : __drm_atomic_helper_set_config+0x2e8/0x314 [drm]
>> [    4.434668] lr : __drm_atomic_helper_set_config+0x64/0x314 [drm]
>> [    4.434943] sp : ffff8000082c3840
>> [    4.434949] x29: ffff8000082c3850 x28: ffff2d6d448e12c0 x27: 0000000000000001
>> [    4.434972] x26: 0000000000000038 x25: ffff2d6d448e12c0 x24: ffff2d6d401a0690
>> [    4.434991] x23: ffff2d6d41f74080 x22: ffff2d6d40d8a400 x21: ffff2d6d433fcc00
>> [    4.435009] x20: ffff2d6d401a0690 x19: ffff2d6d44b8e180 x18: 0000000000000020
>> [    4.435027] x17: 0000000000000010 x16: ffffa6757bee52d0 x15: 0000000000000000
>> [    4.435044] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>> [    4.435063] x11: 0000000000000000 x10: ffff2d6d43240800 x9 : ffff2d6d44b8e200
>> [    4.435081] x8 : 0000000000000000 x7 : ffff2d6d44b8e180 x6 : ffff2d6d40d8a400
>> [    4.435099] x5 : ffff2d6d45e7ca80 x4 : 0000000000000050 x3 : ffffa675498c3bad
>> [    4.435116] x2 : 0000000000000004 x1 : ffff2d6d4323f080 x0 : ffff2d6d433fcc00
>> [    4.435136] Call trace:
>> [    4.435143]  __drm_atomic_helper_set_config+0x2e8/0x314 [drm]
>> [    4.435440]  drm_client_modeset_commit_atomic+0x140/0x244 [drm]
>> [    4.435723]  drm_client_modeset_commit_locked+0x50/0x168 [drm]
>> [    4.436001]  drm_client_modeset_commit+0x2c/0x54 [drm]
>> [    4.436273]  __drm_fb_helper_initial_config_and_unlock+0x548/0x5a0 [drm_kms_helper]
>> [    4.436407]  drm_fb_helper_initial_config+0x38/0x50 [drm_kms_helper]
>> [    4.436528]  drm_fbdev_client_hotplug+0xa8/0x120 [drm_kms_helper]
>> [    4.436648]  drm_fbdev_generic_setup+0x80/0x150 [drm_kms_helper]
>> [    4.436768]  vc4_drm_bind+0x1f0/0x22c [vc4]
>> [    4.436928]  try_to_bring_up_aggregate_device+0x168/0x1b4
>> [    4.436958]  __component_add+0xbc/0x15c
>> [    4.436974]  component_add+0x14/0x20
>> [    4.436990]  vc4_hdmi_dev_probe+0x1c/0x28 [vc4]
>> [    4.437146]  platform_probe+0xa8/0xd0
>> [    4.437158]  really_probe+0x130/0x2f4
>> [    4.437174]  __driver_probe_device+0xb4/0xe0
>> [    4.437189]  driver_probe_device+0x3c/0x1f8
>> [    4.437202]  __device_attach_driver+0x118/0x140
>> [    4.437217]  bus_for_each_drv+0x84/0xd0
>> [    4.437229]  __device_attach+0xd0/0x19c
>> [    4.437243]  device_initial_probe+0x14/0x20
>> [    4.437256]  bus_probe_device+0x34/0x98
>> [    4.437268]  deferred_probe_work_func+0x88/0xc4
>> [    4.437282]  process_one_work+0x1cc/0x2c8
>> [    4.437295]  worker_thread+0x248/0x458
>> [    4.437304]  kthread+0xec/0x198
>> [    4.437319]  ret_from_fork+0x10/0x20
>> [    4.437333] ---[ end trace 0000000000000000 ]---
>>
>> After bisecting the problem, I was able to detect that the warning started to
>> appear on the commit 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format
>> selection").
>>
>> Do you have any idea on what might be causing this warning?
> 
> vc4 wants 16 bits per pixel and 24-bit color depth at the same time. That makes no sense.
> 
> Does it work if you call drm_fbdev_generic_setup() with 32 bpp at [1]? Like this:
> 
>    drm_fbdev_generic_setup(drm, 32)

I wasn't able to reproduce the problem again with 32 bpp. Maybe you could send a patch
fixing it, so that Maxime could that a look and check if there is any problem with using
32 bpp.

Thanks for figuring out the problem!

Best Regards,
- Maíra Canal

> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.2-rc2/source/drivers/gpu/drm/vc4/vc4_drv.c#L391
> 
>>
>> Best Regards,
>> - Maíra Canal
> 
