Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD77A6C9C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 23:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34DC10E0D7;
	Tue, 19 Sep 2023 21:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F184310E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 21:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/oH0Z1QQBDn2Iy3tuYTjNJfqUIo2zMmkvRQAY1VAzIfWdYPh8fwm9W5B1apKoRvIsfy5sZXlqXwEIASaym/JHzkcpf47U6lJRuezSA9VQxhD31qaivIKaMv6WxpN5teDbo84xRvqM5+Zbs8clKSRVhwrZf1jDfP5f6eSxL2GhBq7QXvhRgKc8fNOEWwaVV9DMs4IcW8TEEEFrIAbXssOQnOe++8aLpOFuUsq4qo3JU44ec9+t0AYwqyJCCwzVqBrgr5TL3nll4xnF3fbXcYk+ehhLMlXF37MplsYmJ9RBv84ymWg6t8G53bbm9WzU2/R5l7ShayOlIncCzQArh4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuga/ZgBRRtuJIuxIJA8064P2qsWS1rpralbc4zXfsA=;
 b=Dam2FkJ4IbucL9berQuY4wPRudON8O0vjQNfKixufhqdwfNOCMCn93nDqoCwwiHLiYKF7qP6oj+0Tx63q2tZ2fYQp/ElZXwOV2YQZA2E+SPNE5uLHvEksc+o8jTHbVi/H4P8aAGrBtSgfwijR4OpqOXjZHoJ63U29kQ8ojl3eZPIVuHViwxdmBc+g/LoNyaq0k+uPvvJxN+Ydb214bipX5nSDTOmzglPGY8NXHiHpA9gbRSuoYV+au85R7PyGeuQ8EjpayewjtkJMwR2kvi4AhP4XgCGHiZFTRC4Y2oNYJzEVtUvJIY8LYZ/UKJIeBv1dE8dhlbldmSoDY2X5iMPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuga/ZgBRRtuJIuxIJA8064P2qsWS1rpralbc4zXfsA=;
 b=3KVLLkg2zX9Asg3KQw5RnCq7Us6jM5Pg6nao/Lu6hFtEEHUv5JGSby9IQk6LkjuUL3Z+b4XCBs/VCsOG5DfqtNXrtc/y2jS+U7Lj8xJV+/Y9/GxgnMP3NOKLACCo/B0Lb7NwuLnJ/UU+r6KY2oNatcUnTutB59ljDNVPgIFzWeQ=
Received: from DS7PR03CA0102.namprd03.prod.outlook.com (2603:10b6:5:3b7::17)
 by CY8PR12MB7539.namprd12.prod.outlook.com (2603:10b6:930:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 21:00:47 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::f8) by DS7PR03CA0102.outlook.office365.com
 (2603:10b6:5:3b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Tue, 19 Sep 2023 21:00:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 21:00:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 16:00:46 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 19 Sep 2023 16:00:45 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: [PATCH] drm/mst: check connector state before dereference
Date: Tue, 19 Sep 2023 16:51:51 -0400
Message-ID: <20230919205151.393346-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CY8PR12MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a69c969-aa01-4aa2-87dc-08dbb9537f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MQ96li5lX+Ch/BITn/tZKFLwCHyJ5PdjGBu66kVUHSPa7QZsJeU5tfkjKDKV/lHORgN44n/NfdoT34Bv2SeelvWUcI2YY1kWcUhXULkGpL3gCARomlW8Gl+2R5qXDWeTUhpyi45Q3rG6HqJQ7pLEi5ZeBa7Lyp3w3o8MwwvbmayE1zu9NVLjQLQn70lGsvLtR9v500dfaOk1RRWNLmsjTz3uIbGTGAk7nbTzrgEpt3//+en7/KvJacRz9r8yawikuiSggJENXwXCzMTyVJG2WE2zCsoVsPBdpCnAa2a8xjKmgjQWuyeY0kD3bnp8yTbg+uTbTy9ZD+z52hC1uH19eAJc8dYqwmU95Fbun0qOVB3KMFUTHKFQVZQRw6OU0en0zOzhph97SAjElS7vWcynSNXEcadpRUqdXLZIp9UT7Grj/hMj56a3wyPDQ6erUEle1q8Yazuwl17ly+LUdwh88SxNQIT8mqgEoJ6Q+m7slEEtCbuZVtaTnSJFe2TMtNeMRrtaFON54T0v6tw4Ic1yGFFJAwn4g0DgW2SI3yGntvRnl4qlPH3vvkpbE6uvBoDFVq7P3aQ3iQ/Z0ews8eZSRda+BMnqp+T0dsAe5kNl8nzCEZmwUWDcKUt6+F1ps1T41VEnSbSBc16Xt/Zv4woLsoGTDENpHrQ38FwoPv4AXSinIV4K0u1Ttoft8QwswDIPIuoNWXR1KE6a2O0GCBItZMzSh7VfFIhhp8uuAHLdReiySY8rbdn0QGlgNaC9Lks
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(1800799009)(451199024)(186009)(82310400011)(36840700001)(46966006)(40470700004)(54906003)(316002)(110136005)(26005)(70586007)(70206006)(336012)(426003)(1076003)(2616005)(83380400001)(36756003)(82740400003)(6666004)(47076005)(7696005)(81166007)(356005)(40480700001)(86362001)(36860700001)(966005)(40460700003)(45080400002)(478600001)(2906002)(8676002)(4326008)(8936002)(41300700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 21:00:46.7817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a69c969-aa01-4aa2-87dc-08dbb9537f15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7539
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
Cc: Rodrigo.Siqueira@amd.com, manasi.d.navare@intel.com,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, mario.limonciello@amd.com, Wayne.Lin@amd.com,
 John Lindgren <john@jlindgren.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are seeing the crash in the wild that we cannot repro ourselves.
We want to be able to gather more data and the code should never be
allowed to crash.

[    8.433306] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[    8.433318] #PF: supervisor read access in kernel mode
[    8.433323] #PF: error_code(0x0000) - not-present page
[    8.433327] PGD 0 P4D 0
[    8.433333] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    8.433339] CPU: 7 PID: 488 Comm: Xorg Tainted: G           OE      6.2.=
10-arch1-1-00004-g72efbf0a04ca #2 cb04c5bbf595f3de9363c870cd584da0b91be458
[    8.433348] Hardware name: HP HP ProBook 445 G6/85D9, BIOS R80 Ver. 01.2=
1.01 07/28/2022
[    8.433351] RIP: 0010:drm_dp_atomic_find_time_slots+0x5e/0x260 [drm_disp=
lay_helper]
[    8.433387] Code: 01 00 00 48 8b 85 60 05 00 00 48 63 80 88 00 00 00 3b =
43 28 0f 8d 2e 01 00 00 48 8b 53 30 48 8d 04 80 48 8d 04 c2 48 8b 40 18 <48=
> 8b 40 08 4d 8d 65 38 8b 88 90 00 00 00 b8 01 00 00 00 d3 e0 41
[    8.433392] RSP: 0018:ffffb7b540ee36b0 EFLAGS: 00010293
[    8.433397] RAX: 0000000000000000 RBX: ffff90d6064ae780 RCX: 00000000000=
00224
[    8.433401] RDX: ffff90d6069e0400 RSI: ffff90d60c496568 RDI: ffff90d6064=
ae780
[    8.433405] RBP: ffff90d60c483000 R08: 0000000000000407 R09: ffff90d608c=
8e850
[    8.433408] R10: 0000000000000002 R11: 0000000000000000 R12: ffffb7b540e=
e3798
[    8.433411] R13: ffff90d607ab9660 R14: ffff90d60c496568 R15: 00000000000=
00224
[    8.433415] FS:  00007fead406e440(0000) GS:ffff90d9201c0000(0000) knlGS:=
0000000000000000
[    8.433419] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.433423] CR2: 0000000000000008 CR3: 0000000102f96000 CR4: 00000000003=
506e0
[    8.433427] Call Trace:
[    8.433431]  <TASK>
[    8.433437]  compute_mst_dsc_configs_for_link+0x31a/0xab0 [amdgpu b04128=
2416fbbcc9f3f3583485c4c54bacfbbcf9]
[    8.434321]  ? get_page_from_freelist+0x14a5/0x1630
[    8.434338]  compute_mst_dsc_configs_for_state+0x1e1/0x250 [amdgpu b0412=
82416fbbcc9f3f3583485c4c54bacfbbcf9]
[    8.435205]  amdgpu_dm_atomic_check+0xf33/0x11b0 [amdgpu b041282416fbbcc=
9f3f3583485c4c54bacfbbcf9]
[    8.435985]  drm_atomic_check_only+0x5c0/0xa30
[    8.435994]  drm_atomic_commit+0x5a/0xd0
[    8.436001]  ? __pfx___drm_printfn_info+0x10/0x10
[    8.436008]  drm_atomic_helper_set_config+0x74/0xb0
[    8.436014]  drm_mode_setcrtc+0x515/0x7e0
[    8.436023]  ? __pfx_drm_mode_setcrtc+0x10/0x10
[    8.436029]  drm_ioctl_kernel+0xcd/0x170
[    8.436036]  drm_ioctl+0x233/0x410
[    8.436040]  ? __pfx_drm_mode_setcrtc+0x10/0x10
[    8.436049]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu b041282416fbbcc9f3f35834=
85c4c54bacfbbcf9]
[    8.436755]  __x64_sys_ioctl+0x94/0xd0
[    8.436763]  do_syscall_64+0x5f/0x90
[    8.436772]  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu b041282416fbbcc9f3f358=
3485c4c54bacfbbcf9]
[    8.437477]  ? __x64_sys_ioctl+0xac/0xd0
[    8.437484]  ? syscall_exit_to_user_mode+0x1b/0x40
[    8.437492]  ? do_syscall_64+0x6b/0x90
[    8.437499]  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu b041282416fbbcc9f3f358=
3485c4c54bacfbbcf9]
[    8.438193]  ? __x64_sys_ioctl+0xac/0xd0
[    8.438199]  ? syscall_exit_to_user_mode+0x1b/0x40
[    8.438205]  ? do_syscall_64+0x6b/0x90
[    8.438211]  ? syscall_exit_to_user_mode+0x1b/0x40
[    8.438217]  ? do_syscall_64+0x6b/0x90
[    8.438223]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[    8.438231] RIP: 0033:0x7fead4a3f53f
[    8.438258] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[    8.438262] RSP: 002b:00007ffd20e26be0 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[    8.438268] RAX: ffffffffffffffda RBX: 0000564cc75abfa0 RCX: 00007fead4a=
3f53f
[    8.438271] RDX: 00007ffd20e26c70 RSI: 00000000c06864a2 RDI: 00000000000=
0000f
[    8.438273] RBP: 00007ffd20e26c70 R08: 0000000000000000 R09: 0000564cc75=
dec90
[    8.438276] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c06=
864a2
[    8.438278] R13: 000000000000000f R14: 0000564cc6cb7f00 R15: 0000564cc6a=
b4620
[    8.438286]  </TASK>
[    8.438288] Modules linked in: cmac algif_hash algif_skcipher af_alg bne=
p rtw88_8822be snd_hda_codec_realtek intel_rapl_msr intel_rapl_common rtw88=
_8822b snd_hda_codec_generic edac_mce_amd ledtrig_audio snd_hda_codec_hdmi =
rtw88_pci kvm_amd rtw88_core snd_hda_intel kvm snd_intel_dspcfg mac80211 nl=
s_iso8859_1 snd_intel_sdw_acpi uvcvideo btusb vfat snd_hda_codec irqbypass =
fat btrtl videobuf2_vmalloc crct10dif_pclmul crc32_pclmul videobuf2_memops =
polyval_clmulni btbcm libarc4 snd_hda_core videobuf2_v4l2 polyval_generic b=
tintel gf128mul snd_hwdep btmtk ghash_clmulni_intel hid_multitouch sha512_s=
sse3 videodev r8169 snd_pcm cfg80211 bluetooth aesni_intel ucsi_acpi realte=
k typec_ucsi hp_wmi videobuf2_common crypto_simd mdio_devres sparse_keymap =
snd_timer sp5100_tco cryptd typec mc ecdh_generic mousedev joydev rapl plat=
form_profile snd psmouse rfkill k10temp wmi_bmof i2c_piix4 soundcore libphy=
 ccp roles hp_accel lis3lv02d i2c_hid_acpi i2c_amd_mp2_plat i2c_hid wireles=
s_hotkey i2c_amd_mp2_pci
[    8.438385]  acpi_cpufreq mac_hid vboxnetflt(OE) vboxnetadp(OE) vboxdrv(=
OE) sg crypto_user dm_mod fuse loop bpf_preload ip_tables x_tables ext4 crc=
32c_generic crc16 mbcache jbd2 hid_logitech_hidpp hid_logitech_dj usbhid am=
dgpu rtsx_pci_sdmmc drm_ttm_helper serio_raw atkbd ttm mmc_core libps2 drm_=
buddy vivaldi_fmap gpu_sched crc32c_intel xhci_pci drm_display_helper i8042=
 xhci_pci_renesas rtsx_pci cec video serio wmi
[    8.438436] CR2: 0000000000000008
[    8.438440] ---[ end trace 0000000000000000 ]---
[    8.438443] RIP: 0010:drm_dp_atomic_find_time_slots+0x5e/0x260 [drm_disp=
lay_helper]
[    8.438470] Code: 01 00 00 48 8b 85 60 05 00 00 48 63 80 88 00 00 00 3b =
43 28 0f 8d 2e 01 00 00 48 8b 53 30 48 8d 04 80 48 8d 04 c2 48 8b 40 18 <48=
> 8b 40 08 4d 8d 65 38 8b 88 90 00 00 00 b8 01 00 00 00 d3 e0 41
[    8.438473] RSP: 0018:ffffb7b540ee36b0 EFLAGS: 00010293
[    8.438477] RAX: 0000000000000000 RBX: ffff90d6064ae780 RCX: 00000000000=
00224
[    8.438480] RDX: ffff90d6069e0400 RSI: ffff90d60c496568 RDI: ffff90d6064=
ae780
[    8.438482] RBP: ffff90d60c483000 R08: 0000000000000407 R09: ffff90d608c=
8e850
[    8.438485] R10: 0000000000000002 R11: 0000000000000000 R12: ffffb7b540e=
e3798
[    8.438487] R13: ffff90d607ab9660 R14: ffff90d60c496568 R15: 00000000000=
00224
[    8.438490] FS:  00007fead406e440(0000) GS:ffff90d9201c0000(0000) knlGS:=
0000000000000000
[    8.438493] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.438496] CR2: 0000000000000008 CR3: 0000000102f96000 CR4: 00000000003=
506e0

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2314#note_2080187
Suggested-by: John Lindgren <john@jlindgren.net>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/dr=
m/display/drm_dp_mst_topology.c
index c490e8befc2f..995bf34154ec 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4314,7 +4314,9 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_s=
tate *state,
 		return PTR_ERR(topology_state);
=20
 	conn_state =3D drm_atomic_get_new_connector_state(state, port->connector);
-	topology_state->pending_crtc_mask |=3D drm_crtc_mask(conn_state->crtc);
+	WARN_ON(!conn_state);
+	if (conn_state)
+		topology_state->pending_crtc_mask |=3D drm_crtc_mask(conn_state->crtc);
=20
 	/* Find the current allocation for this port, if any */
 	payload =3D drm_atomic_get_mst_payload_state(topology_state, port);
@@ -4400,12 +4402,14 @@ int drm_dp_atomic_release_time_slots(struct drm_ato=
mic_state *state,
 	bool update_payload =3D true;
=20
 	old_conn_state =3D drm_atomic_get_old_connector_state(state, port->connec=
tor);
-	if (!old_conn_state->crtc)
+	WARN_ON(!old_conn_state);
+	if (!old_conn_state || !old_conn_state->crtc)
 		return 0;
=20
 	/* If the CRTC isn't disabled by this state, don't release it's payload */
 	new_conn_state =3D drm_atomic_get_new_connector_state(state, port->connec=
tor);
-	if (new_conn_state->crtc) {
+	WARN_ON(!new_conn_state);
+	if (new_conn_state && new_conn_state->crtc) {
 		struct drm_crtc_state *crtc_state =3D
 			drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
=20
@@ -4432,7 +4436,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomi=
c_state *state,
 		return -EINVAL;
 	}
=20
-	if (new_conn_state->crtc)
+	if (new_conn_state && new_conn_state->crtc)
 		return 0;
=20
 	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->tim=
e_slots);
--=20
2.34.1

