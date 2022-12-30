Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA0659842
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 13:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5951810E0BC;
	Fri, 30 Dec 2022 12:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Fri, 30 Dec 2022 12:31:44 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3872110E0BC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 12:31:44 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MuDsZ-1oqOke1YHl-00uakj; Fri, 30 Dec 2022 13:25:37 +0100
Message-ID: <62e1d7f5-a81f-70f4-4691-ef03bc2c6ccd@i2se.com>
Date: Fri, 30 Dec 2022 13:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/vc4: drop all currently held locks if deadlock happens
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221229194638.178712-1-mcanal@igalia.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221229194638.178712-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K4StdgCMhTwhkNLLcloBqoR6Yy39ZComZi2DvjyBHuF6e83wEha
 vtF+uSocuo3nQBvaJKFtHYQULPiNjd6eiRWMrzRuLVhzEwFE27ZgFfGQZck7IOmRck9YfqW
 bfwhdvtKrfwW60HD7petnNwTBjmJ1kgeQ1263BBhri+6lmuXJQ4zt+Hz4mmI4R2BS9GzV/4
 HdyNbCdSK/ETy41/BwdXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QDObWq8+ATs=;TiAoXBzA8m+el5eKlbYacGmCGLf
 0zNB3dqBfnUO8pmoR9q+lRn+h5gh6uly9LcbGFFPRoSnzejCw7gxkiShtIIFHCoAZ/JGdhErT
 Sud0GR/lP9fthoyRWWr93tdXUBhvwmMw7AHHlL9eKpvVsfw1rJWnZoNmYZ1G8YO1SV5BPqSTo
 o386wH6OlJCPOgAkkiuVMPbRuFTrjqcXiLSufEwxHmYmfi5tITTjfjdy3meY84qeIaxyvwsIJ
 FKekvy2DvQN+NO1hjGj2A0Ie9JZFyWwciAAgMsoGG0OXAg/AJjG0XIol8yLtp+0+RPJfLMvoR
 2mhBEKQimH703EDAU42zUKfI5YTPIB+y4/gEoa5ZZaMYYfCfnnS9NOuWJvsvV2MqcQU3YMiBK
 NHPrrWVqHSE0XiH/NVvVRRxDFHairlEJF4jL3uDJwvrpN27AsmuQcnSHLy1PsjsOIq/vsXC0g
 6Ko9qMoGDq/I9tctn2dYfAkhePWpA1EjXtPFTCkyATHK5NUkzYQyxaYs/+uSS1m89oCkfewHz
 hjXJtmXtq4jwDrZP8HvZHvyKPSMv0HMPIrcsYPKwPMbcZf0S5DQKlsh7mZhfTAgEFy3cYMJiF
 XYxU1AQ+7aEBAM9WCj/jBXuVOxWY05Y/ZnN3E5YqOVLdUtWvWByU4A2EbtZxTsLt4dvD9Ziu1
 BbfzCoHhA9PTHLyS/pcBVf35/X+r+Vke+bXHRduejg==
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maíra,

Am 29.12.22 um 20:46 schrieb Maíra Canal:
> If vc4_hdmi_reset_link() returns -EDEADLK, it means that a deadlock
> happened in the locking context. This situation should be addressed by
> dropping all currently held locks and block until the contended lock
> becomes available. Currently, vc4 is not dealing with the deadlock
> properly, producing the following output when PROVE_LOCKING is enabled:
>
> [  825.612809] ------------[ cut here ]------------
> [  825.612852] WARNING: CPU: 1 PID: 116 at drivers/gpu/drm/drm_modeset_lock.c:276 drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.613458] Modules linked in: 8021q mrp garp stp llc
> raspberrypi_cpufreq brcmfmac brcmutil crct10dif_ce hci_uart cfg80211
> btqca btbcm bluetooth vc4 raspberrypi_hwmon snd_soc_hdmi_codec cec
> clk_raspberrypi ecdh_generic drm_display_helper ecc rfkill
> drm_dma_helper drm_kms_helper pwm_bcm2835 bcm2835_thermal bcm2835_rng
> rng_core i2c_bcm2835 drm fuse ip_tables x_tables ipv6
> [  825.613735] CPU: 1 PID: 116 Comm: kworker/1:2 Tainted: G        W 6.1.0-rc6-01399-g941aae326315 #3
> [  825.613759] Hardware name: Raspberry Pi 3 Model B Rev 1.2 (DT)
> [  825.613777] Workqueue: events output_poll_execute [drm_kms_helper]
> [  825.614038] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  825.614063] pc : drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.614603] lr : drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
> [  825.614829] sp : ffff800008313bf0
> [  825.614844] x29: ffff800008313bf0 x28: ffffcd7778b8b000 x27: 0000000000000000
> [  825.614883] x26: 0000000000000001 x25: 0000000000000001 x24: ffff677cc35c2758
> [  825.614920] x23: ffffcd7707d01430 x22: ffffcd7707c3edc7 x21: 0000000000000001
> [  825.614958] x20: 0000000000000000 x19: ffff800008313c10 x18: 000000000000b6d3
> [  825.614995] x17: ffffcd777835e214 x16: ffffcd7777cef870 x15: fffff81000000000
> [  825.615033] x14: 0000000000000000 x13: 0000000000000099 x12: 0000000000000002
> [  825.615070] x11: 72917988020af800 x10: 72917988020af800 x9 : 72917988020af800
> [  825.615108] x8 : ffff677cc665e0a8 x7 : d00a8c180000110c x6 : ffffcd77774c0054
> [  825.615145] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
> [  825.615181] x2 : ffff677cc55e1880 x1 : ffffcd7777cef8ec x0 : ffff800008313c10
> [  825.615219] Call trace:
> [  825.615232]  drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.615773]  drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
> [  825.616003]  output_poll_execute+0xe4/0x224 [drm_kms_helper]
> [  825.616233]  process_one_work+0x2b4/0x618
> [  825.616264]  worker_thread+0x24c/0x464
> [  825.616288]  kthread+0xec/0x110
> [  825.616310]  ret_from_fork+0x10/0x20
> [  825.616335] irq event stamp: 7634
> [  825.616349] hardirqs last  enabled at (7633): [<ffffcd777831ee90>] _raw_spin_unlock_irq+0x3c/0x78
> [  825.616384] hardirqs last disabled at (7634): [<ffffcd7778315a78>] __schedule+0x134/0x9f0
> [  825.616411] softirqs last  enabled at (7630): [<ffffcd7707aacea0>] local_bh_enable+0x4/0x30 [ipv6]
> [  825.617019] softirqs last disabled at (7618): [<ffffcd7707aace70>] local_bh_disable+0x4/0x30 [ipv6]
> [  825.617586] ---[ end trace 0000000000000000 ]---
>
> Therefore, deal with the deadlock as suggested by [1], using the
> function drm_modeset_backoff().
>
> [1] https://docs.kernel.org/gpu/drm-kms.html?highlight=kms#kms-locking
>
> Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

i cannot provide a review, but at least you can have my:

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

