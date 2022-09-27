Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD85EBBFE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629C10E083;
	Tue, 27 Sep 2022 07:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E526C10E083
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 07:51:34 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1od5NM-0005jE-U3; Tue, 27 Sep 2022 09:51:32 +0200
Message-ID: <bb11dc94-6878-9aac-96a3-f7c15566e0d3@leemhuis.info>
Date: Tue, 27 Sep 2022 09:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
 #forregzbot
Content-Language: en-US, de-DE
To: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1664265095;
 6d9c8cb7; 
X-HE-SMSGID: 1od5NM-0005jE-U3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 22.09.22 16:54, Marc Kleine-Budde wrote:
> Hello,
> 
> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
> 
> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]                                                                                                                          
> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> 9-01)                                                                                                                                                                                           
> | [    0.000000] Machine model: Raspberry Pi 3 Model B+           
> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11 
> 
> As soon a the vc4 module is loaded the following warnings hits 4
> times, then the machine stops.
> 
> | [   66.839210] Console: switching to colour dummy device 80x25
> | [   66.861282] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
> | [   66.868418] ------------[ cut here ]------------
> | [   66.873110] WARNING: CPU: 3 PID: 611 at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:456 vc4_hdmi_reset+0x3e8/0x540 [vc4]
> | [   66.883495] Modules linked in: vc4(+) ccm cpufreq_userspace cpufreq_powersave cpufreq_ondemand cpufreq_conservative nls_ascii nls_cp437 vfat fat ext4 mbcache jbd2 hci_uart btqca btrtl btbcm btintel btsdio bluetooth bcm2835_v4l2(C) bcm2835_mmal_vchiq(C) jitterentropy_rng
> | videobuf2_vmalloc sha512_generic videobuf2_memops rt2800usb snd_soc_core videobuf2_v4l2 rt2x00usb microchip videobuf2_common snd_bcm2835(C) rt2800lib snd_pcm_dmaengine sha512_arm64 bridge videodev snd_pcm rt2x00lib snd_timer aes_neon_bs lan78xx mc cec stp snd mac80211 aes_n
> | eon_blk rc_core brcmfmac llc drm_display_helper soundcore drm_cma_helper of_mdio cpufreq_dt drbg libarc4 fixed_phy drm_kms_helper brcmutil fwnode_mdio libphy ansi_cprng cfg80211 vchiq(C) ecdh_generic raspberrypi_cpufreq ecc bcm2835_rng crc16 bcm2835_thermal rng_core rfkill
> | pwm_bcm2835 bcm2835_wdt leds_gpio fuse drm configfs lz4 lz4_compress zram zsmalloc ip_tables x_tables autofs4 btrfs blake2b_generic xor xor_neon raid6_pq zstd_compress libcrc32c
> | [   66.883758]  crc32c_generic xxhash_generic dwc2 udc_core roles usbcore sdhci_iproc sdhci_pltfm crct10dif_ce crct10dif_common usb_common sdhci bcm2835 i2c_bcm2835 phy_generic
> | [   66.987722] CPU: 3 PID: 611 Comm: insmod Tainted: G         C        5.19.0-1-arm64 #1  Debian 5.19.6-1
> | [   66.997253] Hardware name: Raspberry Pi 3 Model B+ (DT)
> | [   67.002549] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> | [   67.009610] pc : vc4_hdmi_reset+0x3e8/0x540 [vc4]
> | [   67.014426] lr : vc4_hdmi_reset+0x24/0x540 [vc4]
> | [   67.019153] sp : ffff80000ab83660
> | [   67.022510] x29: ffff80000ab83660 x28: 00000000055fd460 x27: ffff000009465080
> | [   67.029753] x26: 0000000000000000 x25: ffff800008fbe740 x24: ffff800009d582f0
> | [   67.036995] x23: ffff00000dabb000 x22: ffff000005144000 x21: ffff000013dc7180
> | [   67.044237] x20: 0000000000000000 x19: ffff000009465080 x18: ffffffffffffffff
> | [   67.051479] x17: 0000000000000000 x16: 0000000000000000 x15: ffff000013dc7f14
> | [   67.058721] x14: ffffffffffffffff x13: ffff000013dc7f10 x12: 0101010101010101
> | [   67.065963] x11: 0000000000000040 x10: fffffffff8858c10 x9 : ffff80000173ceb4
> | [   67.073205] x8 : 0101010101010101 x7 : 0000000000000000 x6 : ffff00000b3ad140
> | [   67.080447] x5 : ffff000009465ca8 x4 : 0000000000000000 x3 : ffff000009465ca8
> | [   67.087689] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff800001753090
> | [   67.094932] Call trace:
> | [   67.097407]  vc4_hdmi_reset+0x3e8/0x540 [vc4]
> | [   67.101869]  vc4_hdmi_runtime_resume+0x74/0x360 [vc4]
> | [   67.107036]  vc4_hdmi_bind+0x218/0xa20 [vc4]
> | [   67.111407]  component_bind_all+0x130/0x290
> | [   67.115653]  vc4_drm_bind+0x10c/0x2e0 [vc4]
> | [   67.119936]  try_to_bring_up_aggregate_device+0x230/0x320
> | [   67.125411]  component_master_add_with_match+0xd4/0x11c
> | [   67.130710]  vc4_platform_drm_probe+0xd0/0x110 [vc4]
> | [   67.135787]  platform_probe+0x74/0xf0
> | [   67.139501]  really_probe+0x19c/0x3f0
> | [   67.143213]  __driver_probe_device+0x11c/0x190
> | [   67.147719]  driver_probe_device+0x44/0xf4
> | [   67.151872]  __driver_attach+0xd8/0x220
> | [   67.155760]  bus_for_each_dev+0x7c/0xe0
> | [   67.159649]  driver_attach+0x30/0x40
> | [   67.163272]  bus_add_driver+0x154/0x240
> | [   67.167162]  driver_register+0x84/0x140
> | [   67.171051]  __platform_driver_register+0x34/0x40
> | [   67.175821]  vc4_drm_register+0x5c/0x1000 [vc4]
> | [   67.180456]  do_one_initcall+0x50/0x240
> | [   67.184347]  do_init_module+0x50/0x1fc
> | [   67.188150]  load_module+0x1c5c/0x2060
> | [   67.191951]  __do_sys_finit_module+0xac/0x130
> | [   67.196369]  __arm64_sys_finit_module+0x2c/0x40
> | [   67.200964]  invoke_syscall+0x50/0x120
> | [   67.204766]  el0_svc_common.constprop.0+0x4c/0x100
> | [   67.209626]  do_el0_svc+0x3c/0xd0
> | [   67.212987]  el0_svc+0x3c/0x100
> | [   67.216174]  el0t_64_sync_handler+0xbc/0x140
> | [   67.220502]  el0t_64_sync+0x18c/0x190
> | [   67.224216] ---[ end trace 0000000000000000 ]---
> | [   67.228942] ------------[ cut here ]------------
> 
> Is this a known problem?

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced v5.18..v5.19
#regzbot title dri: vc4: Raspberry Pi 3 Model B+ hangs in
vc4_hdmi_runtime_resume()
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
