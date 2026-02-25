Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA26Ms7Lnmm0XQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:15:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295441959D9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426C710E72C;
	Wed, 25 Feb 2026 10:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="la/xibG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD29510E229;
 Wed, 25 Feb 2026 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772014537;
 bh=N4OtNjeRF164pYhFMk1PwOt3zRum4vlCnr77dPiFWxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=la/xibG5MYQKoB3+Frv7h0vqztmNR8cS6urwn7RW8FaNdgM3rKHKQSpI1/OqzTbJ1
 K1MbfLEU5M2jt6na6mRs+cFZ1EIaOGVLEiByiO05nLxN4fSVV2XY71etaruG1zVOSA
 m49SzjpL/STTkVw7QFMHXVcVhUDRII+1FOPEutmoNzOUAUjlPgmEYpnwg/AFL2j/+u
 1g07FseCCs9tPjqBepNaZom84bK1BGaB7k5wB7XegDqHbJb6cc04mHaQ6ggMMvEYg9
 s7FwVHC0viCmIc+Q2btIdx5TliedJucJWuYfyL6kW9kDKPSEyFEExT3kr9oAPyceoQ
 MksVNJO0SgXFw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/1] drm: Fix use-after-free on framebuffers and property
 blobs when calling drm_dev_unplug
Date: Wed, 25 Feb 2026 11:15:34 +0100
Message-ID: <20260225101532.13260-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225101532.13260-3-dev@lankhorst.se>
References: <20260225101532.13260-3-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lankhorst.se:mid,lankhorst.se:dkim,lankhorst.se:email]
X-Rspamd-Queue-Id: 295441959D9
X-Rspamd-Action: no action

When trying to do a rather aggressive test of igt's "xe_module_load
--r reload" with a full desktop environment and game running I noticed
a few OOPSes when dereferencing freed pointers, related to
framebuffers and property blobs after the compositor exits.

Solve this by guarding the freeing in drm_file with drm_dev_enter/exit,
and immediately put the references from struct drm_file objects during
drm_dev_unplug().

Related warnings for framebuffers on the subtest:
[  739.713076] ------------[ cut here ]------------
               WARN_ON(!list_empty(&dev->mode_config.fb_list))
[  739.713079] WARNING: drivers/gpu/drm/drm_mode_config.c:584 at drm_mode_c=
onfig_cleanup+0x30b/0x320 [drm], CPU#12: xe_module_load/13145
[  739.713172] Modules linked in: rfcomm snd_hrtimer xt_CHECKSUM xt_MASQUER=
ADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_addrtype nft_compat=
 x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 n=
f_tables overlay cfg80211 bnep mtd_intel_dg snd_hda_codec_intelhdmi mtd snd=
_hda_codec_hdmi nls_utf8 mxm_wmi intel_wmi_thunderbolt gigabyte_wmi wmi_bmo=
f xe drm_gpuvm drm_gpusvm_helper i2c_algo_bit drm_buddy drm_ttm_helper ttm =
video drm_suballoc_helper gpu_sched drm_client_lib drm_exec drm_display_hel=
per cec drm_kunit_helpers drm_kms_helper kunit x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_hda_c=
odec_generic snd_hda_intel snd_soc_avs snd_soc_hda_codec snd_hda_ext_core s=
nd_hda_codec snd_hwdep snd_hda_core snd_intel_dspcfg snd_soc_core snd_compr=
ess ac97_bus snd_pcm snd_seq snd_seq_device snd_timer i2c_i801 i2c_mux snd =
i2c_smbus btusb btrtl btbcm btmtk btintel bluetooth ecdh_generic rfkill ecc=
 mei_me mei ioatdma dca wmi nfsd drm i2c_dev fuse nfnetlink
[  739.713234] CPU: 12 UID: 0 PID: 13145 Comm: xe_module_load Not tainted 7=
.0.0-rc1-valkyria+ #110 PREEMPT_{RT,(lazy)}
[  739.713239] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gami=
ng 3/X299 AORUS Gaming 3-CF, BIOS F8n 12/06/2021
[  739.713241] RIP: 0010:drm_mode_config_cleanup+0x30b/0x320 [drm]
[  739.713306] Code: 70 60 48 c7 c7 7a 8d 28 a0 e8 f1 a6 00 00 48 8d 7d 88 =
e8 88 75 fe ff 48 85 c0 75 e2 48 8d 7d 88 e8 1a 75 fe ff e9 a7 fd ff ff <0f=
> 0b e9 d6 fe ff ff 0f 0b eb 9c e8 55 0b d2 e1 0f 1f 44 00 00 0f
[  739.713309] RSP: 0018:ffffc90025003be8 EFLAGS: 00010283
[  739.713312] RAX: ffff88814675ba08 RBX: ffff88810d778b40 RCX: ffffffff821=
7ed03
[  739.713314] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88810d7=
78b40
[  739.713316] RBP: ffffc90025003c60 R08: 0000000000000001 R09: 00000000000=
00000
[  739.713318] R10: 0000000000000000 R11: ffff888141aeaf78 R12: ffff88810d7=
78000
[  739.713319] R13: ffff88810d778b68 R14: ffff88810d7787d8 R15: 00000000000=
0006c
[  739.713321] FS:  00007f99dd0e5980(0000) GS:ffff888cec878000(0000) knlGS:=
0000000000000000
[  739.713324] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  739.713326] CR2: 00007f9fa46bcac0 CR3: 00000004fe2b2002 CR4: 00000000003=
706f0
[  739.713328] Call Trace:
[  739.713330]  <TASK>
[  739.713335]  ? intel_pmdemand_destroy_state+0x11/0x20 [xe]
[  739.713574]  ? intel_atomic_global_obj_cleanup+0xe4/0x1a0 [xe]
[  739.713794]  intel_display_driver_remove_noirq+0x51/0xb0 [xe]
[  739.714041]  xe_display_fini_early+0x33/0x50 [xe]
[  739.714284]  devm_action_release+0xf/0x20
[  739.714294]  devres_release_all+0xad/0xf0
[  739.714301]  device_unbind_cleanup+0x12/0xa0
[  739.714305]  device_release_driver_internal+0x1b7/0x210
[  739.714311]  device_driver_detach+0x14/0x20
[  739.714315]  unbind_store+0xa6/0xb0
[  739.714319]  drv_attr_store+0x21/0x30
[  739.714322]  sysfs_kf_write+0x48/0x60
[  739.714328]  kernfs_fop_write_iter+0x16b/0x240
[  739.714333]  vfs_write+0x266/0x520
[  739.714341]  ksys_write+0x72/0xe0
[  739.714345]  __x64_sys_write+0x19/0x20
[  739.714347]  x64_sys_call+0xa15/0xa30
[  739.714355]  do_syscall_64+0xd8/0xab0
[  739.714361]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  739.714365] RIP: 0033:0x7f99df4aa146
[  739.714368] Code: 47 ba 04 00 00 00 48 8b 05 c7 0c 17 00 64 89 10 48 c7 =
c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48 8b 45 10 0f 05 <48=
> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e 0f 1f 84 00
[  739.714371] RSP: 002b:00007fffe4b8fc00 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000001
[  739.714374] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f99df4=
aa146
[  739.714376] RDX: 000000000000000c RSI: 00005561e56d9073 RDI: 00000000000=
00004
[  739.714377] RBP: 00007fffe4b8fc10 R08: 0000000000000000 R09: 00000000000=
00000
[  739.714379] R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000=
00004
[  739.714380] R13: 0000000000000000 R14: 00005561e56d9073 R15: 00005561bb5=
aacf8
[  739.714387]  </TASK>
[  739.714389] irq event stamp: 0
[  739.714390] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[  739.714392] hardirqs last disabled at (0): [<ffffffff81317d2b>] copy_pro=
cess+0xacb/0x2220
[  739.714398] softirqs last  enabled at (0): [<ffffffff81317d2b>] copy_pro=
cess+0xacb/0x2220
[  739.714401] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  739.714403] ---[ end trace 0000000000000000 ]---

....
[  739.714459] ------------[ cut here ]------------
[  739.714461] xe 0000:67:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_hea=
d))
[  739.714464] WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_frameb=
uffer_free+0x6c/0x90 [drm], CPU#12: xe_module_load/13145
[  739.714596] Modules linked in: rfcomm snd_hrtimer xt_CHECKSUM xt_MASQUER=
ADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_addrtype nft_compat=
 x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 n=
f_tables overlay cfg80211 bnep mtd_intel_dg snd_hda_codec_intelhdmi mtd snd=
_hda_codec_hdmi nls_utf8 mxm_wmi intel_wmi_thunderbolt gigabyte_wmi wmi_bmo=
f xe drm_gpuvm drm_gpusvm_helper i2c_algo_bit drm_buddy drm_ttm_helper ttm =
video drm_suballoc_helper gpu_sched drm_client_lib drm_exec drm_display_hel=
per cec drm_kunit_helpers drm_kms_helper kunit x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_hda_c=
odec_generic snd_hda_intel snd_soc_avs snd_soc_hda_codec snd_hda_ext_core s=
nd_hda_codec snd_hwdep snd_hda_core snd_intel_dspcfg snd_soc_core snd_compr=
ess ac97_bus snd_pcm snd_seq snd_seq_device snd_timer i2c_i801 i2c_mux snd =
i2c_smbus btusb btrtl btbcm btmtk btintel bluetooth ecdh_generic rfkill ecc=
 mei_me mei ioatdma dca wmi nfsd drm i2c_dev fuse nfnetlink
[  739.714704] CPU: 12 UID: 0 PID: 13145 Comm: xe_module_load Tainted: G   =
     W           7.0.0-rc1-valkyria+ #110 PREEMPT_{RT,(lazy)}
[  739.714711] Tainted: [W]=3DWARN
[  739.714713] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gami=
ng 3/X299 AORUS Gaming 3-CF, BIOS F8n 12/06/2021
[  739.714715] RIP: 0010:drm_framebuffer_free+0x7a/0x90 [drm]
[  739.714830] Code: 48 85 d2 75 03 48 8b 17 48 89 55 e0 4c 89 45 e8 e8 ab =
40 74 e1 48 8d 3d b4 5e df ff 48 8b 55 e0 48 c7 c1 30 38 28 a0 48 89 c6 <67=
> 48 0f b9 3a 4c 8b 45 e8 eb 9f 31 ff eb c3 0f 1f 80 00 00 00 00
[  739.714842] RSP: 0018:ffffc90025003bb8 EFLAGS: 00010282
[  739.714846] RAX: ffffffffa0b60f69 RBX: ffff88814675ba28 RCX: ffffffffa02=
83830
[  739.714849] RDX: ffff8881033cc9f0 RSI: ffffffffa0b60f69 RDI: ffffffffa02=
35740
[  739.714852] RBP: ffffc90025003bd8 R08: ffff88810d778000 R09: ffffffffa02=
8815b
[  739.714854] R10: 0000000000000000 R11: ffff888141aeaf78 R12: ffff88810d7=
78000
[  739.714857] R13: ffff888237f18600 R14: ffff88810d7787d8 R15: ffffffffa04=
484f7
[  739.714859] FS:  00007f99dd0e5980(0000) GS:ffff888cec878000(0000) knlGS:=
0000000000000000
[  739.714863] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  739.714866] CR2: 00007f9fa46bcac0 CR3: 00000004fe2b2002 CR4: 00000000003=
706f0
[  739.714869] Call Trace:
[  739.714871]  <TASK>
[  739.714876]  drm_mode_config_cleanup+0x26a/0x320 [drm]
[  739.714998]  ? __drm_printfn_seq_file+0x20/0x20 [drm]
[  739.715115]  ? drm_mode_config_cleanup+0x207/0x320 [drm]
[  739.715235]  intel_display_driver_remove_noirq+0x51/0xb0 [xe]
[  739.715576]  xe_display_fini_early+0x33/0x50 [xe]
[  739.715821]  devm_action_release+0xf/0x20
[  739.715828]  devres_release_all+0xad/0xf0
[  739.715843]  device_unbind_cleanup+0x12/0xa0
[  739.715850]  device_release_driver_internal+0x1b7/0x210
[  739.715856]  device_driver_detach+0x14/0x20
[  739.715860]  unbind_store+0xa6/0xb0
[  739.715865]  drv_attr_store+0x21/0x30
[  739.715868]  sysfs_kf_write+0x48/0x60
[  739.715873]  kernfs_fop_write_iter+0x16b/0x240
[  739.715878]  vfs_write+0x266/0x520
[  739.715886]  ksys_write+0x72/0xe0
[  739.715890]  __x64_sys_write+0x19/0x20
[  739.715893]  x64_sys_call+0xa15/0xa30
[  739.715900]  do_syscall_64+0xd8/0xab0
[  739.715905]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  739.715908] RIP: 0033:0x7f99df4aa146
[  739.715911] Code: 47 ba 04 00 00 00 48 8b 05 c7 0c 17 00 64 89 10 48 c7 =
c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48 8b 45 10 0f 05 <48=
> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e 0f 1f 84 00
[  739.715913] RSP: 002b:00007fffe4b8fc00 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000001
[  739.715916] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f99df4=
aa146
[  739.715918] RDX: 000000000000000c RSI: 00005561e56d9073 RDI: 00000000000=
00004
[  739.715919] RBP: 00007fffe4b8fc10 R08: 0000000000000000 R09: 00000000000=
00000
[  739.715921] R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000=
00004
[  739.715922] R13: 0000000000000000 R14: 00005561e56d9073 R15: 00005561bb5=
aacf8
[  739.715929]  </TASK>
[  739.715930] irq event stamp: 0
[  739.715931] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[  739.715933] hardirqs last disabled at (0): [<ffffffff81317d2b>] copy_pro=
cess+0xacb/0x2220
[  739.715938] softirqs last  enabled at (0): [<ffffffff81317d2b>] copy_pro=
cess+0xacb/0x2220
[  739.715941] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  739.715943] ---[ end trace 0000000000000000 ]---

...

[  743.186530] Oops: general protection fault, probably for non-canonical a=
ddress 0xdead000000000122: 0000 [#1] SMP
[  743.186535] CPU: 3 UID: 1000 PID: 3453 Comm: kwin_wayland Tainted: G    =
    W           7.0.0-rc1-valkyria+ #110 PREEMPT_{RT,(lazy)}
[  743.186537] Tainted: [W]=3DWARN
[  743.186538] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gami=
ng 3/X299 AORUS Gaming 3-CF, BIOS F8n 12/06/2021
[  743.186539] RIP: 0010:drm_framebuffer_cleanup+0x55/0xc0 [drm]
[  743.186588] Code: d8 72 73 0f b6 42 05 ff c3 39 c3 72 e8 49 8d bd 50 07 =
00 00 31 f6 e8 3a 80 d3 e1 49 8b 44 24 10 49 8d 7c 24 08 49 8b 54 24 08 <48=
> 3b 38 0f 85 95 7f 02 00 48 3b 7a 08 0f 85 8b 7f 02 00 48 89 42
[  743.186589] RSP: 0018:ffffc900085e3cf8 EFLAGS: 00010202
[  743.186591] RAX: dead000000000122 RBX: 0000000000000001 RCX: ffffffff821=
7ed03
[  743.186592] RDX: dead000000000100 RSI: 0000000000000000 RDI: ffff8881467=
5ba08
[  743.186593] RBP: ffffc900085e3d10 R08: 0000000000000000 R09: 00000000000=
00000
[  743.186593] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881467=
5ba00
[  743.186594] R13: ffff88810d778000 R14: ffff888119f6dca0 R15: ffff88810c6=
60bb0
[  743.186595] FS:  00007ff377d21280(0000) GS:ffff888cec3f8000(0000) knlGS:=
0000000000000000
[  743.186596] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  743.186596] CR2: 000055690b55e000 CR3: 0000000113586003 CR4: 00000000003=
706f0
[  743.186597] Call Trace:
[  743.186598]  <TASK>
[  743.186603]  intel_user_framebuffer_destroy+0x12/0x90 [xe]
[  743.186722]  drm_framebuffer_free+0x3a/0x90 [drm]
[  743.186750]  ? trace_hardirqs_on+0x5f/0x120
[  743.186754]  drm_mode_object_put+0x51/0x70 [drm]
[  743.186786]  drm_fb_release+0x105/0x190 [drm]
[  743.186812]  ? rt_mutex_slowunlock+0x3aa/0x410
[  743.186817]  ? rt_spin_lock+0xea/0x1b0
[  743.186819]  drm_file_free+0x1e0/0x2c0 [drm]
[  743.186843]  drm_release_noglobal+0x91/0xf0 [drm]
[  743.186865]  __fput+0x100/0x2e0
[  743.186869]  fput_close_sync+0x40/0xa0
[  743.186870]  __x64_sys_close+0x3e/0x80
[  743.186873]  x64_sys_call+0xa07/0xa30
[  743.186879]  do_syscall_64+0xd8/0xab0
[  743.186881]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  743.186882] RIP: 0033:0x7ff37e567732
[  743.186884] Code: 08 0f 85 a1 38 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 =
ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3=
> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
[  743.186885] RSP: 002b:00007ffc818169a8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000003
[  743.186886] RAX: ffffffffffffffda RBX: 00007ffc81816a30 RCX: 00007ff37e5=
67732
[  743.186887] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00012
[  743.186888] RBP: 00007ffc818169d0 R08: 0000000000000000 R09: 00000000000=
00000
[  743.186889] R10: 0000000000000000 R11: 0000000000000246 R12: 000055d60a7=
996e0
[  743.186889] R13: 00007ffc81816a90 R14: 00007ffc81816a90 R15: 000055d60a7=
82a30
[  743.186892]  </TASK>
[  743.186893] Modules linked in: rfcomm snd_hrtimer xt_CHECKSUM xt_MASQUER=
ADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_addrtype nft_compat=
 x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 n=
f_tables overlay cfg80211 bnep mtd_intel_dg snd_hda_codec_intelhdmi mtd snd=
_hda_codec_hdmi nls_utf8 mxm_wmi intel_wmi_thunderbolt gigabyte_wmi wmi_bmo=
f xe drm_gpuvm drm_gpusvm_helper i2c_algo_bit drm_buddy drm_ttm_helper ttm =
video drm_suballoc_helper gpu_sched drm_client_lib drm_exec drm_display_hel=
per cec drm_kunit_helpers drm_kms_helper kunit x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_hda_c=
odec_generic snd_hda_intel snd_soc_avs snd_soc_hda_codec snd_hda_ext_core s=
nd_hda_codec snd_hwdep snd_hda_core snd_intel_dspcfg snd_soc_core snd_compr=
ess ac97_bus snd_pcm snd_seq snd_seq_device snd_timer i2c_i801 i2c_mux snd =
i2c_smbus btusb btrtl btbcm btmtk btintel bluetooth ecdh_generic rfkill ecc=
 mei_me mei ioatdma dca wmi nfsd drm i2c_dev fuse nfnetlink
[  743.186938] ---[ end trace 0000000000000000 ]---

And for property blobs:

void drm_mode_config_cleanup(struct drm_device *dev)
{
...
	list_for_each_entry_safe(blob, bt, &dev->mode_config.property_blob_list,
				 head_global) {
		drm_property_blob_put(blob);
	}

Resulting in:

[  371.072940] BUG: unable to handle page fault for address: 000001ffffffff=
ff
[  371.072944] #PF: supervisor read access in kernel mode
[  371.072945] #PF: error_code(0x0000) - not-present page
[  371.072947] PGD 0 P4D 0
[  371.072950] Oops: Oops: 0000 [#1] SMP
[  371.072953] CPU: 0 UID: 1000 PID: 3693 Comm: kwin_wayland Not tainted 7.=
0.0-rc1-valkyria+ #111 PREEMPT_{RT,(lazy)}
[  371.072956] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gami=
ng 3/X299 AORUS Gaming 3-CF, BIOS F8n 12/06/2021
[  371.072957] RIP: 0010:drm_property_destroy_user_blobs+0x3b/0x90 [drm]
[  371.073019] Code: 00 00 48 83 ec 10 48 8b 86 30 01 00 00 48 39 c3 74 59 =
48 89 c2 48 8d 48 c8 48 8b 00 4c 8d 60 c8 eb 04 4c 8d 60 c8 48 8b 71 40 <48=
> 39 16 0f 85 39 32 01 00 48 3b 50 08 0f 85 2f 32 01 00 48 89 70
[  371.073021] RSP: 0018:ffffc90006a73de8 EFLAGS: 00010293
[  371.073022] RAX: 000001ffffffffff RBX: ffff888118a1a930 RCX: ffff8881b92=
355c0
[  371.073024] RDX: ffff8881b92355f8 RSI: 000001ffffffffff RDI: ffff888118b=
e4000
[  371.073025] RBP: ffffc90006a73e08 R08: ffff8881009b7300 R09: ffff888cecc=
5b000
[  371.073026] R10: ffffc90006a73e90 R11: 0000000000000002 R12: 000001fffff=
fffc7
[  371.073027] R13: ffff888118a1a980 R14: ffff88810b366d20 R15: ffff888118a=
1a970
[  371.073028] FS:  00007f1faccbb280(0000) GS:ffff888cec2db000(0000) knlGS:=
0000000000000000
[  371.073029] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  371.073030] CR2: 000001ffffffffff CR3: 000000010655c001 CR4: 00000000003=
706f0
[  371.073031] Call Trace:
[  371.073033]  <TASK>
[  371.073036]  drm_file_free+0x1df/0x2a0 [drm]
[  371.073077]  drm_release_noglobal+0x7a/0xe0 [drm]
[  371.073113]  __fput+0xe2/0x2b0
[  371.073118]  fput_close_sync+0x40/0xa0
[  371.073119]  __x64_sys_close+0x3e/0x80
[  371.073122]  x64_sys_call+0xa07/0xa30
[  371.073126]  do_syscall_64+0xc0/0x840
[  371.073130]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  371.073132] RIP: 0033:0x7f1fb3501732
[  371.073133] Code: 08 0f 85 a1 38 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 =
ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3=
> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
[  371.073135] RSP: 002b:00007ffe8e6f0278 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000003
[  371.073136] RAX: ffffffffffffffda RBX: 00007ffe8e6f0300 RCX: 00007f1fb35=
01732
[  371.073137] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00012
[  371.073138] RBP: 00007ffe8e6f02a0 R08: 0000000000000000 R09: 00000000000=
00000
[  371.073139] R10: 0000000000000000 R11: 0000000000000246 R12: 00005585ba4=
6eea0
[  371.073140] R13: 00007ffe8e6f0360 R14: 00007ffe8e6f0360 R15: 00005585ba4=
58a30
[  371.073143]  </TASK>
[  371.073144] Modules linked in: rfcomm snd_hrtimer xt_addrtype xt_CHECKSU=
M xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat=
 x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 n=
f_tables overlay cfg80211 bnep snd_hda_codec_intelhdmi snd_hda_codec_hdmi m=
td_intel_dg mtd nls_utf8 wmi_bmof mxm_wmi gigabyte_wmi intel_wmi_thunderbol=
t xe drm_gpuvm drm_gpusvm_helper i2c_algo_bit drm_buddy drm_ttm_helper ttm =
video drm_suballoc_helper gpu_sched drm_client_lib drm_exec drm_display_hel=
per cec drm_kunit_helpers drm_kms_helper kunit x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_hda_c=
odec_generic snd_hda_intel snd_soc_avs snd_soc_hda_codec snd_hda_ext_core s=
nd_hda_codec snd_hwdep snd_hda_core snd_intel_dspcfg snd_soc_core snd_compr=
ess ac97_bus snd_pcm snd_seq snd_seq_device snd_timer i2c_i801 btusb i2c_mu=
x i2c_smbus btrtl snd btbcm btmtk btintel bluetooth ecdh_generic rfkill ecc=
 mei_me mei ioatdma dca wmi nfsd drm i2c_dev fuse nfnetlink
[  371.073198] CR2: 000001ffffffffff
[  371.073199] ---[ end trace 0000000000000000 ]---

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
 drivers/gpu/drm/drm_drv.c           |  3 +++
 drivers/gpu/drm/drm_file.c          |  5 ++++-
 drivers/gpu/drm/drm_framebuffer.c   | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c   |  8 ++++++++
 drivers/gpu/drm/drm_property.c      | 20 ++++++++++++++++++++
 6 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc=
_internal.h
index c094092296448..56834596a496f 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -94,6 +94,7 @@ int drm_mode_setcrtc(struct drm_device *dev,
=20
 /* drm_mode_config.c */
 int drm_modeset_register_all(struct drm_device *dev);
+void drm_modeset_unplug_all(struct drm_device *dev);
 void drm_modeset_unregister_all(struct drm_device *dev);
 void drm_mode_config_validate(struct drm_device *dev);
=20
@@ -133,6 +134,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 /* drm_property.c */
 void drm_property_destroy_user_blobs(struct drm_device *dev,
 				     struct drm_file *file_priv);
+void drm_property_blob_unplug(struct drm_device *dev);
 bool drm_property_change_valid_get(struct drm_property *property,
 				   uint64_t value,
 				   struct drm_mode_object **ref);
@@ -221,7 +223,7 @@ int drm_mode_addfb2(struct drm_device *dev,
 		    void *data, struct drm_file *file_priv);
 int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 		  struct drm_file *file_priv);
-
+void drm_framebuffer_unplug(struct drm_device *dev);
=20
 /* IOCTL */
 int drm_mode_addfb_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce8..36276ed0b74f4 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -493,6 +493,9 @@ void drm_dev_unplug(struct drm_device *dev)
 	dev->unplugged =3D true;
 	synchronize_srcu(&drm_unplug_srcu);
=20
+	if (drm_core_check_feature(dev, DRIVER_MODESET))
+		drm_modeset_unplug_all(dev);
+
 	drm_dev_unregister(dev);
=20
 	/* Clear all CPU mappings pointing to this device */
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b3021..f52141f842a1f 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -233,6 +233,7 @@ static void drm_events_release(struct drm_file *file_pr=
iv)
 void drm_file_free(struct drm_file *file)
 {
 	struct drm_device *dev;
+	int idx;
=20
 	if (!file)
 		return;
@@ -249,9 +250,11 @@ void drm_file_free(struct drm_file *file)
=20
 	drm_events_release(file);
=20
-	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
+	if (drm_core_check_feature(dev, DRIVER_MODESET) &&
+	    drm_dev_enter(dev, &idx)) {
 		drm_fb_release(file);
 		drm_property_destroy_user_blobs(dev, file);
+		drm_dev_exit(idx);
 	}
=20
 	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ))
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 147ac19f851b2..8325bf59a5eb0 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1236,3 +1236,28 @@ void drm_framebuffer_debugfs_init(struct drm_device =
*dev)
 			      ARRAY_SIZE(drm_framebuffer_debugfs_list));
 }
 #endif
+
+/**
+ * drm_framebuffer_unplug - unplug fb from file list
+ * @dev: drm device
+ *
+ * This function is called from drm_dev_unplug() and removes all
+ * the references to framebuffers from any &struct drm_file that
+ * had opened one.
+ *
+ * This prevents a use-after-free when closing &struct drm_file.
+ *
+ * There is no need to call drm_framebuffer_remove, as the driver
+ * is now gone and will perform it's own cleanup of framebuffers.
+ */
+void drm_framebuffer_unplug(struct drm_device *dev)
+{
+	struct drm_framebuffer *fb, *next;
+
+	list_for_each_entry_safe(fb, next, &dev->mode_config.fb_list, head) {
+		if (!list_empty(&fb->filp_head)) {
+			list_del_init(&fb->filp_head);
+			drm_framebuffer_put(fb);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_c=
onfig.c
index 84ae8a23a3678..afe5a55276ee6 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -68,6 +68,14 @@ int drm_modeset_register_all(struct drm_device *dev)
 	return ret;
 }
=20
+void drm_modeset_unplug_all(struct drm_device *dev)
+{
+	/* With drm_dev_enter() now failing, it's safe to unplug all file_priv->f=
b's and user mode blobs */
+	drm_framebuffer_unplug(dev);
+	drm_property_blob_unplug(dev);
+
+}
+
 void drm_modeset_unregister_all(struct drm_device *dev)
 {
 	drm_connector_unregister_all(dev);
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index f38f2c5437e68..76ff53ed28917 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -1008,3 +1008,23 @@ void drm_property_change_valid_put(struct drm_proper=
ty *property,
 	} else if (drm_property_type_is(property, DRM_MODE_PROP_BLOB))
 		drm_property_blob_put(obj_to_blob(ref));
 }
+
+/**
+ * drm_property_blob_unplug - remove all &struct drm_file references to bl=
obs
+ * @dev: drm device
+ *
+ * This function is called during drm_dev_unplug(), and is intended to rem=
ove all
+ * references to property blobs held by all files, so they are not freed at
+ * file exit, but sooner.
+ */
+void drm_property_blob_unplug(struct drm_device *dev)
+{
+	struct drm_property_blob *blob, *next;
+
+	list_for_each_entry_safe(blob, next, &dev->mode_config.property_blob_list=
, head_global) {
+		if (!list_empty(&blob->head_file)) {
+			list_del_init(&blob->head_file);
+			drm_property_blob_put(blob);
+		}
+	}
+}
--=20
2.51.0

