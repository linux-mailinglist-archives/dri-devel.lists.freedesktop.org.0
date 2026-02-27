Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH52NROzomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B71C1A2A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C62E10E24C;
	Sat, 28 Feb 2026 09:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rcpassos.me header.i=@rcpassos.me header.b="Q78BslMQ";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purelymail.com header.i=@purelymail.com header.b="bgXVljlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE9110E1C4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 23:01:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Q78BslMQ/p7F+ujBEh9dwI0HaQF8BeZiD1W+aJNAMqReDVnXsXBb9PttxaI5/NvadgZcGl2Oxnn4TAFMR0gWS7ku+kp7gdvRlUILoXcpm9DXXmC6Lx8b61xmq/karXnWOXNPuaOOKFyxY6W88ZlkWVmlc2J+D4OzcN/Yt42GM9afjLHHetgFJLN2/Q7adYHArgsBqanFxYdqB/jsL3TabxfPXFitDzHI8Hyn1wKCRV7+OauwGOFsudUFltYNy1cOrI5o/1BZMSeKvv1D4qAcyzNDBrCKB2AN3VF5o7ypX+mwpsiNKEIuyuzrddOLCWZdv8/BcDGyODUtzlXbXPQuLA==;
 s=purelymail3; d=rcpassos.me; v=1;
 bh=rX7wenqbXadkw/eCFpE8kSAWOgl+KlNXGlxRzG1En+I=;
 h=Received:Date:Subject:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=bgXVljlACXtabSk1i9/htsefZh83i1/Axdh/ioS5X8zFmelqDlUthnb/VLstQojiY1BhxbPZBe77QNNpkiIj6Wjhp3YdBv+NbIigQmFZDcmMY6Nu1io6xb1QzmFFfRLB8Qw+TVCHt+kgLQEbnOplmNn7DmyZtVQmRx9kpMuv3+g7p1a2t6cGmZfCTXODReFQ2pf5G1SJ7YfR00IwgdzXwyEzvKQSw0AJsOo/rc6nyJEVX8PQt/+98c++nNLD97Qh3N/fd5Vh6fMyzqkCp8U6OTTAsaj8O9rB4bPpQBAcimA+wPilyB0g50J0Nqd60/HMnLVghUYzXmwf3Qkuwc6nlg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=rX7wenqbXadkw/eCFpE8kSAWOgl+KlNXGlxRzG1En+I=;
 h=Feedback-ID:Received:Date:Subject:From:To; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: dri-devel@lists.freedesktop.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -262709579; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Feb 2026 23:01:32 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 20:01:29 -0300
Message-Id: <DGQ49PK0QE7U.3O1AQPSD6NI7I@rcpassos.me>
Cc: <rcpassos@ime.usp.br>, <davidtadokoro@ime.usp.br>
Subject: [bug report] 7.0-rc1 flip_done timed out: amd igpu off when
 resuming in laptop (regression)
From: "Rafael Passos" <rafael@rcpassos.me>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <siqueira@igalia.com>, <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Spamd-Result: default: False [2.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[rcpassos.me : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[rcpassos.me:s=purelymail3,purelymail.com:s=purelymail3];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:rcpassos@ime.usp.br,m:davidtadokoro@ime.usp.br,m:amd-gfx@lists.freedesktop.org,m:siqueira@igalia.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[rcpassos.me:-,purelymail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 731B71C1A2A
X-Rspamd-Action: no action

Hi,

I found this bug while running v7.0-rc1 on my HP laptop.
The laptop returns from suspension when flipping the scren up,
but the iGPU does not. Tested in Fedora and Arch.
Same compilation has no issues in my Desktop (with a 6800XT).

HP ProBook x360 435 G7
CPU is a AMD Ryzen 7 4700U (8) @ 2.00 GHz with Vega iGPU

This started in a compilation (mainline) between Feb 10 and Feb 23.
I plan to do a lot of bisecting this weekend to find the exact cause.
I know ga9aabb3b839a is a good commit, and 6de23f8 is a bad one (the tag).
Hopefully I can submit a patch fixing this bug,
but helping to find it is ok as well.

Here is one sample of the Kernel logs I collected over SSH.

[   98.539672] smpboot: Booting Node 0 Processor 7 APIC 0x7
[   98.543543] CPU7 is up
[   98.544343] ACPI: PM: Waking up from system sleep state S3
[   99.061284] ACPI: EC: interrupt unblocked
[   99.066648] ACPI: EC: event unblocked
[   99.067043] amdgpu 0000:04:00.0: [drm] PCIE GART of 1024M enabled.
[   99.067049] amdgpu 0000:04:00.0: [drm] PTB located at 0x000000F41FC00000
[   99.067070] amdgpu 0000:04:00.0: PSP is resuming...
[   99.067167] amdgpu 0000:04:00.0: reserve 0x400000 from 0xf41f800000 for =
PSP TMR
[   99.157012] amdgpu 0000:04:00.0: RAS: optional ras ta ucode is not avail=
able
[   99.168905] amdgpu 0000:04:00.0: RAP: optional rap ta ucode is not avail=
able
[   99.168909] amdgpu 0000:04:00.0: SECUREDISPLAY: optional securedisplay t=
a ucode is not available
[   99.168913] amdgpu 0000:04:00.0: SMU is resuming...
[   99.169354] amdgpu 0000:04:00.0: dpm has been disabled
[   99.170469] amdgpu 0000:04:00.0: SMU is resumed successfully!
[   99.171833] amdgpu 0000:04:00.0: kiq ring mec 2 pipe 1 q 0
[   99.176522] amdgpu 0000:04:00.0: [drm] DMUB hardware initialized: versio=
n=3D0x0101002B
[   99.176650] ------------[ cut here ]------------
[   99.176652] WARNING: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn=
20/dcn20_hubbub.c:587 at hubbub2_get_dchub_ref_freq+0xa1/0xb0 [amdgpu], CPU=
#3: kworker/u33:7/782
[   99.177462] Modules linked in: uinput rfcomm snd_seq_dummy snd_hrtimer c=
cm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4=
 nft_fib_ipv6 nft_fib sunrpc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 =
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defra=
g_ipv4 nf_tables qrtr cmac algif_hash algif_skcipher af_alg bnep vfat fat s=
nd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrand=
t snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof=
 snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match snd_soc_acpi_amd_sdca_quir=
ks snd_amd_sdw_acpi soundwire_amd soundwire_generic_allocation snd_ctl_led =
soundwire_bus snd_soc_sdca snd_hda_codec_alc269 snd_hda_codec_realtek_lib a=
md_atl intel_rapl_msr snd_hda_codec_atihdmi snd_hda_scodec_component snd_so=
c_core snd_hda_codec_generic intel_rapl_common snd_hda_codec_hdmi iwlmvm sn=
d_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_hda_codec mac80211 =
snd_rpl_pci_acp6x btusb snd_acp_pci hp_bioscfg snd_hda_core
[   99.177516]  snd_amd_acpi_mach btmtk snd_intel_dspcfg snd_acp_legacy_com=
mon btrtl ptp snd_intel_sdw_acpi firmware_attributes_class snd_pci_acp6x kv=
m_amd pps_core snd_hwdep libarc4 uvcvideo btbcm hp_wmi snd_pci_acp5x videob=
uf2_vmalloc btintel kvm snd_seq uvc platform_profile videobuf2_memops snd_r=
n_pci_acp3x sparse_keymap snd_seq_device videobuf2_v4l2 irqbypass snd_acp_c=
onfig videobuf2_common bluetooth rapl videodev wmi_bmof iwlwifi mc snd_pcm =
snd_soc_acpi pcspkr acpi_cpufreq i2c_piix4 i2c_smbus k10temp snd_pci_acp3x =
snd_timer cfg80211 hid_sensor_gyro_3d hid_sensor_magn_3d snd hid_sensor_acc=
el_3d hid_sensor_trigger soundcore rfkill industrialio_triggered_buffer kfi=
fo_buf wireless_hotkey hid_sensor_iio_common industrialio joydev mousedev m=
ac_hid loop nfnetlink zram 842_decompress 842_compress lz4hc_compress lz4_c=
ompress dm_crypt encrypted_keys trusted asn1_encoder tee amdgpu hid_sensor_=
hub amdxcp i2c_algo_bit drm_ttm_helper ttm drm_exec drm_panel_backlight_qui=
rks gpu_sched drm_suballoc_helper nvme rtsx_pci_sdmmc
[   99.177578]  drm_buddy nvme_core ucsi_acpi mmc_core drm_display_helper n=
vme_keyring typec_ucsi ghash_clmulni_intel nvme_auth roles hid_multitouch a=
esni_intel typec cec ccp hkdf amd_sfh video rtsx_pci i2c_hid_acpi wmi thund=
erbolt sp5100_tco i2c_hid serio_raw dm_mod i2c_dev
[   99.177603] CPU: 3 UID: 0 PID: 782 Comm: kworker/u33:7 Tainted: G       =
 W           7.0.0-rc1-auyer+ #3 PREEMPT(full)  89085bfd3471dc2ddc421b17d99=
0c1c500db5584
[   99.177608] Tainted: [W]=3DWARN
[   99.177609] Hardware name: HP HP ProBook x360 435 G7/8735, BIOS S80 Ver.=
 01.17.02 06/07/2024
[   99.177612] Workqueue: async async_run_entry_fn
[   99.177619] RIP: 0010:hubbub2_get_dchub_ref_freq+0xa1/0xb0 [amdgpu]
[   99.178421] Code: 8d 83 c0 63 ff ff 3d 20 4e 00 00 77 21 89 5d 00 48 8b =
44 24 08 65 48 2b 05 84 05 36 d0 75 13 48 83 c4 10 5b 5d e9 af ae 7f ce <0f=
> 0b eb df 0f 0b eb db e8 e2 7a 7e ce 66 90 90 90 90 90 90 90 90
[   99.178423] RSP: 0018:ffffcd310072fc50 EFLAGS: 00010246
[   99.178426] RAX: 0000000000001000 RBX: 000000000000bb80 RCX: 00000000000=
00000
[   99.178428] RDX: ffffcd310072fc54 RSI: 00000000000039df RDI: ffff8ce0148=
00000
[   99.178430] RBP: ffff8ce00f882bf8 R08: ffffcd310072fc50 R09: 00000000000=
0000c
[   99.178431] R10: ffffcd313fecaf00 R11: ffffcd310072f898 R12: ffff8ce00f8=
82800
[   99.178433] R13: ffff8ce00f848400 R14: ffff8ce00dc83e00 R15: ffff8ce0f63=
17ec0
[   99.178435] FS:  0000000000000000(0000) GS:ffff8ce75e767000(0000) knlGS:=
0000000000000000
[   99.178437] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   99.178439] CR2: 0000000000000000 CR3: 0000000211d28000 CR4: 00000000003=
50ef0
[   99.178441] Call Trace:
[   99.178446]  <TASK>
[   99.178450]  dcn10_init_hw+0x186/0x4e0 [amdgpu c06be2407ae9725ac90c67be7=
9bb3ef89e7cefec]
[   99.179286]  dc_set_power_state+0xd1/0x150 [amdgpu c06be2407ae9725ac90c6=
7be79bb3ef89e7cefec]
[   99.180031]  dm_resume+0x12e/0x8b0 [amdgpu c06be2407ae9725ac90c67be79bb3=
ef89e7cefec]
[   99.180833]  amdgpu_ip_block_resume+0x27/0x50 [amdgpu c06be2407ae9725ac9=
0c67be79bb3ef89e7cefec]
[   99.181466]  amdgpu_device_ip_resume_phase3+0x6d/0x90 [amdgpu c06be2407a=
e9725ac90c67be79bb3ef89e7cefec]
[   99.182040]  amdgpu_device_resume+0xbb/0x380 [amdgpu c06be2407ae9725ac90=
c67be79bb3ef89e7cefec]
[   99.182620]  amdgpu_pmops_resume+0x46/0x80 [amdgpu c06be2407ae9725ac90c6=
7be79bb3ef89e7cefec]
[   99.183194]  ? __pfx_pci_pm_resume+0x10/0x10
[   99.183200]  dpm_run_callback+0x51/0x180
[   99.183204]  ? dpm_wait_for_superior+0xf7/0x150
[   99.183207]  device_resume+0x15c/0x260
[   99.183210]  async_resume+0x21/0x30
[   99.183213]  async_run_entry_fn+0x36/0x160
[   99.183218]  process_one_work+0x193/0x390
[   99.183222]  worker_thread+0x1a1/0x310
[   99.183226]  ? __pfx_worker_thread+0x10/0x10
[   99.183229]  kthread+0xe3/0x120
[   99.183234]  ? __pfx_kthread+0x10/0x10
[   99.183238]  ret_from_fork+0x2bf/0x350
[   99.183243]  ? __pfx_kthread+0x10/0x10
[   99.183246]  ret_from_fork_asm+0x1a/0x30
[   99.183253]  </TASK>
[   99.183255] ---[ end trace 0000000000000000 ]---
[   99.299257] usb 1-4: reset full-speed USB device number 3 using xhci_hcd
[   99.307188] usb 3-3: reset high-speed USB device number 2 using xhci_hcd
[   99.404342] nvme nvme0: 8/0/0 default/read/poll queues
[   99.538424] usb 1-3: reset full-speed USB device number 2 using xhci_hcd
[  100.833055] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
22: core_link_write_dpcd (DP_DOWNSPREAD_CTRL) failed
[  100.919764] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
27: core_link_write_dpcd (DP_LANE_COUNT_SET) failed
[  101.006487] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
55: core_link_write_dpcd (DP_LINK_BW_SET) failed
[  102.589793] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
22: core_link_write_dpcd (DP_DOWNSPREAD_CTRL) failed
[  102.676500] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
27: core_link_write_dpcd (DP_LANE_COUNT_SET) failed
[  102.763207] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
55: core_link_write_dpcd (DP_LINK_BW_SET) failed
[  104.398168] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
22: core_link_write_dpcd (DP_DOWNSPREAD_CTRL) failed
[  104.484883] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
27: core_link_write_dpcd (DP_LANE_COUNT_SET) failed
[  104.571597] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
55: core_link_write_dpcd (DP_LINK_BW_SET) failed
[  106.253776] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
22: core_link_write_dpcd (DP_DOWNSPREAD_CTRL) failed
[  106.340510] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
27: core_link_write_dpcd (DP_LANE_COUNT_SET) failed
[  106.427251] amdgpu 0000:04:00.0: [drm] *ERROR* dpcd_set_link_settings:11=
55: core_link_write_dpcd (DP_LINK_BW_SET) failed
[  107.382304] amdgpu 0000:04:00.0: [drm] enabling link 0 failed: 15
[  107.568497] amdgpu 0000:04:00.0: ring gfx uses VM inv eng 0 on hub 0
[  107.568501] amdgpu 0000:04:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[  107.568503] amdgpu 0000:04:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[  107.568504] amdgpu 0000:04:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[  107.568506] amdgpu 0000:04:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[  107.568508] amdgpu 0000:04:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[  107.568509] amdgpu 0000:04:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[  107.568511] amdgpu 0000:04:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[  107.568512] amdgpu 0000:04:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[  107.568514] amdgpu 0000:04:00.0: ring kiq_0.2.1.0 uses VM inv eng 11 on =
hub 0
[  107.568516] amdgpu 0000:04:00.0: ring sdma0 uses VM inv eng 0 on hub 8
[  107.568518] amdgpu 0000:04:00.0: ring vcn_dec uses VM inv eng 1 on hub 8
[  107.568520] amdgpu 0000:04:00.0: ring vcn_enc0 uses VM inv eng 4 on hub =
8
[  107.568521] amdgpu 0000:04:00.0: ring vcn_enc1 uses VM inv eng 5 on hub =
8
[  107.568523] amdgpu 0000:04:00.0: ring jpeg_dec uses VM inv eng 6 on hub =
8
[  107.584564] OOM killer enabled.
[  107.584569] Restarting tasks: Starting
[  107.585190] Restarting tasks: Done


regards,
Rafael Passos
