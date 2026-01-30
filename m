Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOB1CfVpfGn+MQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:21:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED6B8467
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7FC10E17E;
	Fri, 30 Jan 2026 08:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="NT83+Wmo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HovWDy7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jan 2026 08:21:04 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8789510E17E;
 Fri, 30 Jan 2026 08:21:04 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769760836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7bQd1+7m3lsuZIhcWMwp9xr1uDmooNzD6Ae24hF2fF0=;
 b=NT83+WmoZrkFPecs+M1ecniXmhvEFOB7ewI/6H4/sl03PDHUC1MUL0o6q8E2pfS2nF9v/C
 0OAyTWKQgdkg2j1IyZrpfTDYTXjO4szJDBr7DnO8scEaeMgNS+nbQMOGLhke0RlMKwq6/X
 CC7quvlPCjWnilf12Wf6JQZDhkqJGe4uXhwmtztvuldH1uIyOblMhhmIm/6vwpdqXSl1sy
 nx6Q7wSGcmgwq1vz/v70jTYNMKLdOtNMILj/9sh5CIsxc3BFUfZmbHOikQkoF9cNev1o2t
 cq1NpR08+j/9nnvb35rntJ9VuTj+jPNEubRNs7LrK0Rv9KEuRENT+z8ilhK0/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769760836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7bQd1+7m3lsuZIhcWMwp9xr1uDmooNzD6Ae24hF2fF0=;
 b=HovWDy7xuJ0nxgilscdt7w+r1mroJhkfnbgSwtgzOteB7EooltFmDsTPVS4bW660s7UISv
 iQplaRz3wUtr8aAw==
To: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: nouveau regression with 6.19.0-rc7
Date: Fri, 30 Jan 2026 09:19:55 +0106
Message-ID: <87ldhf1prw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 75ED6B8467
X-Rspamd-Action: no action

Hi,

On my workstation I have been using 6.19.0-rc4 with no problems. This
morning I switched to 6.19.0-rc7 and now my graphics explodes when the
nouveau module is loaded.

Right before the explosion I hit a WARN_ON. I plan to bisect this
further, but I am posting here first in case the problem is obvious due
to recent drm/nouveau changes.

Here is the kernel log upon loading the module:

$ sudo modprobe nouveau
[   89.358040][ T1790] nouveau 0000:f0:10.0: NVIDIA NV34 (034100a2)
[   89.428324][ T1790] nouveau 0000:f0:10.0: bios: version 04.34.20.19.00
[   89.440715][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000966 00000966
[   89.446601][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000963 00000963
[   89.454840][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000964 00000964
[   89.463594][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000096a 0000096a
[   89.472202][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000967 00000967
[   89.479793][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000968 00000968
[   89.486440][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000096e 0000096e
[   89.492662][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000096b 0000096b
[   89.497964][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000096c 0000096c
[   89.504276][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000972 00000972
[   89.509852][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000096f 0000096f
[   89.516385][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000970 00000970
[   89.523971][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000976 00000976
[   89.530057][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000973 00000973
[   89.536186][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000974 00000974
[   89.543596][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000097a 0000097a
[   89.549583][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000977 00000977
[   89.555648][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000978 00000978
[   89.562771][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000097e 0000097e
[   89.568637][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000097b 0000097b
[   89.574393][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000097c 0000097c
[   89.581554][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000982 00000982
[   89.586026][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000097f 0000097f
[   89.589673][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000980 00000980
[   89.594189][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000986 00000986
[   89.597294][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000983 00000983
[   89.600195][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000984 00000984
[   89.604299][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000098a 0000098a
[   89.607210][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000987 00000987
[   89.609990][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000988 00000988
[   89.613982][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000098e 0000098e
[   89.616408][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000098b 0000098b
[   89.618675][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000098c 0000098c
[   89.622000][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000992 00000992
[   89.624204][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 0000098f 0000098f
[   89.626327][ T1790] nouveau 0000:f0:10.0: bios: OOB 1 00000990 00000990
[   89.630870][ T1790] Console: switching to colour dummy device 80x25
[   89.632879][ T1790] nouveau 0000:f0:10.0: timer: unknown input clock freq
[   89.633810][ T1790] nouveau 0000:f0:10.0: fb: 64 MiB DDR1
[   89.638796][ T1790] nouveau 0000:f0:10.0: drm: VRAM: 63 MiB
[   89.638901][ T1790] nouveau 0000:f0:10.0: drm: GART: 128 MiB
[   89.639048][ T1790] nouveau 0000:f0:10.0: drm: BMP version 5.39
[   89.639100][ T1790] nouveau 0000:f0:10.0: drm: DCB version 2.2
[   89.639166][ T1790] nouveau 0000:f0:10.0: drm: DCB outp 00: 01100102 00000000
[   89.639216][ T1790] nouveau 0000:f0:10.0: drm: DCB outp 01: 01000100 000088b8
[   89.639257][ T1790] nouveau 0000:f0:10.0: drm: DCB outp 02: 02110212 11b00000
[   89.639295][ T1790] nouveau 0000:f0:10.0: drm: DCB outp 03: 02010210 11b088b8
[   89.639356][ T1790] nouveau 0000:f0:10.0: drm: DCB outp 04: 02010211 11b00003
[   89.642082][ T1790] nouveau 0000:f0:10.0: drm: MM: using M2MF for buffer copies
[   89.643415][ T1790] ------------[ cut here ]------------
[   89.643526][ T1790] WARNING: [] drivers/gpu/drm/drm_plane.c:389 at .__drm_universal_plane_init+0x13c/0x794 [drm], CPU#1: modprobe/1790
[   89.643983][ T1790] Modules linked in: nouveau(+) drm_ttm_helper ttm gpu_sched drm_client_lib i2c_algo_bit drm_display_helper drm_kms_helper drm_gpuvm drm_exec drm drm_panel_orientation_quirks netconsole 8021q garp stp mrp llc windfarm_smu_sat b43 rng_core cordic bcma binfmt_misc mac80211 libarc4 windfarm_cpufreq_clamp cfg80211 snd_aoa_codec_tas rfkill snd_aoa_fabric_layout windfarm_pm72 snd_aoa windfarm_pid windfarm_lm75_sensor windfarm_max6690_sensor windfarm_ad7417_sensor windfarm_fcu_controls windfarm_core snd_aoa_i2sbus snd_aoa_soundbus firewire_ohci ssb snd_pcm joydev mousedev snd_timer mac_hid firewire_core mmc_core snd soundcore rack_meter uninorth_agp agpgart
[   89.644370][ T1790] CPU: 1 UID: 0 PID: 1790 Comm: modprobe Not tainted 6.19.0-rc7 #3 PREEMPT 
[   89.644421][ T1790] Hardware name: PowerMac7,2 PPC970 0x390202 PowerMac
[   89.644458][ T1790] NIP:  c0003d00034f7e00 LR: c0003d00034f85d0 CTR: 0000000000000000
[   89.644497][ T1790] REGS: c00000000c36e9f0 TRAP: 0700   Not tainted  (6.19.0-rc7)
[   89.644537][ T1790] MSR:  900000000202b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 24228248  XER: 20000000
[   89.644625][ T1790] IRQMASK: 0 
[   89.644625][ T1790] GPR00: c0003d00034f85d0 c00000000c36ec90 c0003d000353a900 c00000000c3c9000 
[   89.644625][ T1790] GPR04: c00000000c413000 0000000000000000 c0003d0003dcf918 c0003d0003f0ed30 
[   89.644625][ T1790] GPR08: 0000000000000003 0000000000000000 00000000ffffffef c000000002cd8410 
[   89.644625][ T1790] GPR12: 0000000084228242 c00000000ffff700 0000000022000000 0000000000000000 
[   89.644625][ T1790] GPR16: 0000000000000000 0000000000000000 0000000000000000 000000011cdca6f8 
[   89.644625][ T1790] GPR20: 00003fff81f6ef50 c00000000c3c9000 00003fff81f1d3b0 0000000000000001 
[   89.644625][ T1790] GPR24: c0003d0003f0ed30 0000000000000000 0000000000000001 0000000000000000 
[   89.644625][ T1790] GPR28: 0000000000000000 0000000000000003 c00000000c413000 c0003d0003dcf918 
[   89.644952][ T1790] NIP [c0003d00034f7e00] .__drm_universal_plane_init+0x13c/0x794 [drm]
[   89.645152][ T1790] LR [c0003d00034f85d0] .__drm_universal_plane_alloc+0xb0/0x1ec [drm]
[   89.645330][ T1790] Call Trace:
[   89.645365][ T1790] [c00000000c36ec90] [c00000000053a690] .__kmalloc_noprof+0x31c/0x7b4 (unreliable)
[   89.877044][ T1790] BUG: Kernel NULL pointer dereference on read at 0x00000000
[   89.877069][ T1790] Faulting instruction address: 0xc0003d00034b8a38
[   89.877084][ T1790] Oops: Kernel access of bad area, sig: 11 [#1]
[   89.877092][ T1790] BE PAGE_SIZE=4K MMU=Hash  SMP NR_CPUS=2 PowerMac
[   89.877108][ T1790] Modules linked in: nouveau(+) drm_ttm_helper ttm gpu_sched drm_client_lib i2c_algo_bit drm_display_helper drm_kms_helper drm_gpuvm drm_exec drm drm_panel_orientation_quirks netconsole 8021q garp stp mrp llc windfarm_smu_sat b43 rng_core cordic bcma binfmt_misc mac80211 libarc4 windfarm_cpufreq_clamp cfg80211 snd_aoa_codec_tas rfkill snd_aoa_fabric_layout windfarm_pm72 snd_aoa windfarm_pid windfarm_lm75_sensor windfarm_max6690_sensor windfarm_ad7417_sensor windfarm_fcu_controls windfarm_core snd_aoa_i2sbus snd_aoa_soundbus firewire_ohci ssb snd_pcm joydev mousedev snd_timer mac_hid firewire_core mmc_core snd soundcore rack_meter uninorth_agp agpgart
[   89.877366][ T1790] CPU: 0 UID: 0 PID: 1790 Comm: modprobe Tainted: G        W           6.19.0-rc7 #3 PREEMPT 
[   89.877378][ T1790] Tainted: [W]=WARN
[   89.877383][ T1790] Hardware name: PowerMac7,2 PPC970 0x390202 PowerMac
[   89.877391][ T1790] NIP:  c0003d00034b8a38 LR: c0003d00034b8a1c CTR: c000000001367c30
[   89.877399][ T1790] REGS: c00000000c36e1d0 TRAP: 0300   Tainted: G        W            (6.19.0-rc7)
[   89.877408][ T1790] MSR:  900000000200b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 24224488  XER: 00000000
[   89.877458][ T1790] DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0 
[   89.877458][ T1790] GPR00: c0003d00034b8a1c c00000000c36e470 c0003d000353a900 c00000000c413000 
[   89.877458][ T1790] GPR04: c000000001366400 0000000000000000 0000000000000000 0000000000000001 
[   89.877458][ T1790] GPR08: c00000000c36e620 0000000000000000 c00000000c4130d0 0000000000000003 
[   89.877458][ T1790] GPR12: 0000000024224488 c000000003c33000 0000000022000000 0000000000000000 
[   89.877458][ T1790] GPR16: 0000000000000000 0000000000000000 0000000000000000 000000011cdca6f8 
[   89.877458][ T1790] GPR20: 00000000000000f0 0000000000000043 c00000000d4b28a0 c00000000d4b2800 
[   89.877458][ T1790] GPR24: c00000000c3c9000 0000000000000001 0000000000000001 fffffffffffff000 
[   89.877458][ T1790] GPR28: 0000000000000000 0000000000000000 c00000000bfe8000 c00000000c413000 
[   89.877628][ T1790] NIP [c0003d00034b8a38] .drm_atomic_get_plane_state+0xf0/0x210 [drm]
[   89.877915][ T1790] LR [c0003d00034b8a1c] .drm_atomic_get_plane_state+0xd4/0x210 [drm]
[   89.878074][ T1790] Call Trace:
[   89.878079][ T1790] [c00000000c36e470] [c0003d00034b8a1c] .drm_atomic_get_plane_state+0xd4/0x210 [drm] (unreliable)
[   89.878246][ T1790] [c00000000c36e500] [c0003d000350eb60] .drm_client_modeset_commit_atomic+0xf8/0x338 [drm]
[   89.878427][ T1790] [c00000000c36e690] [c0003d000350f0dc] .drm_client_modeset_commit_locked+0x80/0x260 [drm]
[   89.878607][ T1790] [c00000000c36e730] [c0003d000350f2fc] .drm_client_modeset_commit+0x40/0x7c [drm]
[   89.878786][ T1790] [c00000000c36e7b0] [c0003d00034054d4] .__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0xfc/0x108 [drm_kms_helper]
[   89.878977][ T1790] [c00000000c36e840] [c0003d000340556c] .drm_fb_helper_set_par+0x8c/0xb8 [drm_kms_helper]
[   89.879048][ T1790] [c00000000c36e8c0] [c000000000c1ce2c] .fbcon_init+0x31c/0x618
[   89.879071][ T1790] [c00000000c36e9a0] [c000000000c6b450] .visual_init+0xf4/0x16c
[   89.879087][ T1790] [c00000000c36ea30] [c000000000c6ceb8] .do_bind_con_driver.isra.0+0x274/0x53c
[   89.879103][ T1790] [c00000000c36eb00] [c000000000c6d328] .do_take_over_console+0x1a8/0x2cc
[   89.879118][ T1790] [c00000000c36ebc0] [c000000000c1bb34] .do_fbcon_takeover+0xd0/0x1ec
[   89.879131][ T1790] [c00000000c36ec40] [c000000000c210c8] .fbcon_fb_registered+0x24c/0x2d8
[   89.879146][ T1790] [c00000000c36ecf0] [c000000000c1606c] .do_register_framebuffer+0x1dc/0x2e8
[   89.879165][ T1790] [c00000000c36edd0] [c000000000c161b8] .register_framebuffer+0x40/0x6c
[   89.879182][ T1790] [c00000000c36ee50] [c0003d0003403668] .__drm_fb_helper_initial_config_and_unlock+0x474/0x7f4 [drm_kms_helper]
[   89.879252][ T1790] [c00000000c36ef50] [c0003d00010ec520] .drm_fbdev_client_hotplug+0xb0/0x120 [drm_client_lib]
[   89.879279][ T1790] [c00000000c36efe0] [c0003d000350d278] .drm_client_register+0x88/0xe4 [drm]
[   89.879468][ T1790] [c00000000c36f070] [c0003d00010ec778] .drm_fbdev_client_setup+0x12c/0x19b4 [drm_client_lib]
[   89.879486][ T1790] [c00000000c36f100] [c0003d00010eb15c] .drm_client_setup+0x15c/0x18c [drm_client_lib]
[   89.879502][ T1790] [c00000000c36f180] [c0003d0003d1d5bc] .nouveau_drm_probe+0x19c/0x268 [nouveau]
[   89.880453][ T1790] [c00000000c36f220] [c000000000bd0d14] .pci_device_probe+0x108/0x220
[   89.880474][ T1790] [c00000000c36f2b0] [c000000000cbf938] .really_probe+0x110/0x564
[   89.880489][ T1790] [c00000000c36f350] [c000000000cbfe38] .__driver_probe_device+0xac/0x1ec
[   89.880503][ T1790] [c00000000c36f3e0] [c000000000cc00d8] .driver_probe_device+0x5c/0x120
[   89.880517][ T1790] [c00000000c36f470] [c000000000cc04fc] .__driver_attach+0x17c/0x314
[   89.880530][ T1790] [c00000000c36f500] [c000000000cbc0e8] .bus_for_each_dev+0xac/0x12c
[   89.880547][ T1790] [c00000000c36f5b0] [c000000000cbeee4] .driver_attach+0x34/0x4c
[   89.880561][ T1790] [c00000000c36f630] [c000000000cbe228] .bus_add_driver+0x2a0/0x334
[   89.880573][ T1790] [c00000000c36f6d0] [c000000000cc195c] .driver_register+0x84/0x1b8
[   89.880587][ T1790] [c00000000c36f750] [c000000000bcf8a4] .__pci_register_driver+0x8c/0xac
[   89.880600][ T1790] [c00000000c36f7e0] [c0003d0003d6e2bc] .nouveau_drm_init+0x21c/0x2c0 [nouveau]
[   89.881454][ T1790] [c00000000c36f870] [c00000000000ebc4] .do_one_initcall+0x8c/0x508
[   89.881475][ T1790] [c00000000c36f960] [c00000000020d6e4] .do_init_module+0x70/0x34c
[   89.881491][ T1790] [c00000000c36f9f0] [c000000000210a2c] .init_module_from_file+0x110/0x134
[   89.881505][ T1790] [c00000000c36fb20] [c000000000210cbc] .idempotent_init_module+0x26c/0x34c
[   89.881519][ T1790] [c00000000c36fc70] [c000000000210e40] .__se_sys_finit_module+0xa4/0x188
[   89.881533][ T1790] [c00000000c36fd20] [c00000000002aebc] .system_call_exception+0x16c/0x280
[   89.881551][ T1790] [c00000000c36fe10] [c00000000000b754] system_call_common+0xf4/0x258
[   89.881569][ T1790] ---- interrupt: c00 at 0x3fff820d0174
[   89.881580][ T1790] NIP:  00003fff820d0174 LR: 000000011cdbd338 CTR: 0000000000000000
[   89.881590][ T1790] REGS: c00000000c36fe80 TRAP: 0c00   Tainted: G        W            (6.19.0-rc7)
[   89.881597][ T1790] MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 20222402  XER: 00000000
[   89.881650][ T1790] IRQMASK: 0 
[   89.881650][ T1790] GPR00: 0000000000000161 00003fffd7e3f300 00003fff8217be00 000000000000000e 
[   89.881650][ T1790] GPR04: 000000011cdca6f8 0000000000000000 0000000000000000 0000000000000000 
[   89.881650][ T1790] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[   89.881650][ T1790] GPR12: 0000000000000000 00003fff8217dd28 0000000022000000 0000000000000000 
[   89.881650][ T1790] GPR16: 0000000000000000 0000000000000000 0000000000000000 000000011cdca6f8 
[   89.881650][ T1790] GPR20: 00003fff81f6ef50 0000000000000000 00003fff81f1d3b0 000000011cdc8038 
[   89.881650][ T1790] GPR24: 00003fff81f6ef50 0000000022000000 00003fff81f6eb30 000000011cdca6f8 
[   89.881650][ T1790] GPR28: 0000000000040000 0000000000000000 00003fff81f6ef50 00003fffd7e3f300 
[   89.881812][ T1790] NIP [00003fff820d0174] 0x3fff820d0174
[   89.881821][ T1790] LR [000000011cdbd338] 0x11cdbd338
[   89.881829][ T1790] ---- interrupt: c00
[   89.881837][ T1790] Code: 60000000 60000000 e89e0050 387f0020 4803cbd9 60000000 7c7d1b79 4082ffbc f8410028 7fe3fb78 e93f0140 e9290028 <e9490000> 7d4903a6 e8490008 4e800421 
[   89.881914][ T1790] ---[ end trace 0000000000000000 ]---

When there is no explosion (for example, on 6.19.0-rc4) the final kernel
log entries are:

[   90.039522][ T1790] [drm] Initialized nouveau 1.4.1 for 0000:f0:10.0 on minor 0
[   90.040436][ T1790] nouveau 0000:f0:10.0: drm: Setting dpms mode 3 on TV encoder (output 4)
[   90.227197][ T1790] Console: switching to colour frame buffer device 240x67
[   90.258127][ T1790] nouveau 0000:f0:10.0: [drm] fb0: nouveaudrmfb frame buffer device

Note that this is a big-endian 64-bit PowerPC machine (4K pages).

John Ogness
