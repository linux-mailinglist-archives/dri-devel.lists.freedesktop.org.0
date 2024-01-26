Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DBE83DF6B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979A210FC2B;
	Fri, 26 Jan 2024 17:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1684 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jan 2024 17:02:47 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CBB10FC42;
 Fri, 26 Jan 2024 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YfOcLk3qUhSM3WCtPj2ikHsVtx/xRq/0kvZfZABr10g=; b=ZnUW62Q/PQ4CRmFskNpP7Yi927
 VLqXQpS1a6lzuwd5+4oKJPmUgWyUhE9LTevdBjnXQWtDlT9Pq6JsT38P9gfAI9UjwH/UjY6IEUUM+
 rUTRvTy7afjWbBs0IEkZjIyg3crhUbHxxM8ojnxLgUI7UEqniX4tv6yvQ1WBMhR7x4BTNyA8/eB2Y
 QodWTpxURPKusqOHdQ/ULG2p3ps7xiDUwP42EV3XTcjqCyVH2Gb25mOze1TytsOdPhucTTS1StOjT
 MDfmnt7weGwW5Y/X62H/RzYCS4sCjxMaF4CM4LiX+PJlgIGv65P2h5qy/wLT14bCWq1DqSXXDAAxm
 TiDiggkA==;
Received: from [197.255.135.238] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rTPA2-00AOH1-DB; Fri, 26 Jan 2024 17:34:34 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@intel.com,
 alex.hung@amd.com
Subject: [RFC PATCH 1/2] drm/amd/display: fix null-pointer dereference on edid
 reading
Date: Fri, 26 Jan 2024 15:28:53 -0100
Message-ID: <20240126163429.56714-2-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126163429.56714-1-mwen@igalia.com>
References: <20240126163429.56714-1-mwen@igalia.com>
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_edid helpers to fix a null-pointer derefence that happens when
running igt@kms_force_connector_basic in a system with DCN2.1 and HDMI
connector detected as below:

[  +0.178146] BUG: kernel NULL pointer dereference, address: 00000000000004=
c0
[  +0.000010] #PF: supervisor read access in kernel mode
[  +0.000005] #PF: error_code(0x0000) - not-present page
[  +0.000004] PGD 0 P4D 0
[  +0.000006] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  +0.000006] CPU: 15 PID: 2368 Comm: kms_force_conne Not tainted 6.5.0-asd=
n+ #152
[  +0.000005] Hardware name: HP HP ENVY x360 Convertible 13-ay1xxx/8929, BI=
OS F.01 07/14/2021
[  +0.000004] RIP: 0010:i2c_transfer+0xd/0x100
[  +0.000011] Code: ea fc ff ff 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 41 54 55 53 <48>=
 8b 47 10 48 89 fb 48 83 38 00 0f 84 b3 00 00 00 83 3d 2f 80 16
[  +0.000004] RSP: 0018:ffff9c4f89c0fad0 EFLAGS: 00010246
[  +0.000005] RAX: 0000000000000000 RBX: 0000000000000005 RCX: 000000000000=
0080
[  +0.000003] RDX: 0000000000000002 RSI: ffff9c4f89c0fb20 RDI: 000000000000=
04b0
[  +0.000003] RBP: ffff9c4f89c0fb80 R08: 0000000000000080 R09: ffff8d8e0b15=
b980
[  +0.000003] R10: 00000000000380e0 R11: 0000000000000000 R12: 000000000000=
0080
[  +0.000002] R13: 0000000000000002 R14: ffff9c4f89c0fb0e R15: ffff9c4f89c0=
fb0f
[  +0.000004] FS:  00007f9ad2176c40(0000) GS:ffff8d90fe9c0000(0000) knlGS:0=
000000000000000
[  +0.000003] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000004] CR2: 00000000000004c0 CR3: 0000000121bc4000 CR4: 000000000075=
0ee0
[  +0.000003] PKRU: 55555554
[  +0.000003] Call Trace:
[  +0.000006]  <TASK>
[  +0.000006]  ? __die+0x23/0x70
[  +0.000011]  ? page_fault_oops+0x17d/0x4c0
[  +0.000008]  ? preempt_count_add+0x6e/0xa0
[  +0.000008]  ? srso_alias_return_thunk+0x5/0x7f
[  +0.000011]  ? exc_page_fault+0x7f/0x180
[  +0.000009]  ? asm_exc_page_fault+0x26/0x30
[  +0.000013]  ? i2c_transfer+0xd/0x100
[  +0.000010]  drm_do_probe_ddc_edid+0xc2/0x140 [drm]
[  +0.000067]  ? srso_alias_return_thunk+0x5/0x7f
[  +0.000006]  ? _drm_do_get_edid+0x97/0x3c0 [drm]
[  +0.000043]  ? __pfx_drm_do_probe_ddc_edid+0x10/0x10 [drm]
[  +0.000042]  edid_block_read+0x3b/0xd0 [drm]
[  +0.000043]  _drm_do_get_edid+0xb6/0x3c0 [drm]
[  +0.000041]  ? __pfx_drm_do_probe_ddc_edid+0x10/0x10 [drm]
[  +0.000043]  drm_edid_read_custom+0x37/0xd0 [drm]
[  +0.000044]  amdgpu_dm_connector_mode_valid+0x129/0x1d0 [amdgpu]
[  +0.000153]  drm_connector_mode_valid+0x3b/0x60 [drm_kms_helper]
[  +0.000000]  __drm_helper_update_and_validate+0xfe/0x3c0 [drm_kms_helper]
[  +0.000000]  ? amdgpu_dm_connector_get_modes+0xb6/0x520 [amdgpu]
[  +0.000000]  ? srso_alias_return_thunk+0x5/0x7f
[  +0.000000]  drm_helper_probe_single_connector_modes+0x2ab/0x540 [drm_kms=
_helper]
[  +0.000000]  status_store+0xb2/0x1f0 [drm]
[  +0.000000]  kernfs_fop_write_iter+0x136/0x1d0
[  +0.000000]  vfs_write+0x24d/0x440
[  +0.000000]  ksys_write+0x6f/0xf0
[  +0.000000]  do_syscall_64+0x60/0xc0
[  +0.000000]  ? srso_alias_return_thunk+0x5/0x7f
[  +0.000000]  ? syscall_exit_to_user_mode+0x2b/0x40
[  +0.000000]  ? srso_alias_return_thunk+0x5/0x7f
[  +0.000000]  ? do_syscall_64+0x6c/0xc0
[  +0.000000]  ? do_syscall_64+0x6c/0xc0
[  +0.000000]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[  +0.000000] RIP: 0033:0x7f9ad46b4b00
[  +0.000000] Code: 40 00 48 8b 15 19 b3 0d 00 f7 d8 64 89 02 48 c7 c0 ff f=
f ff ff eb b7 0f 1f 00 80 3d e1 3a 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48>=
 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
[  +0.000000] RSP: 002b:00007ffcbd3bd6d8 EFLAGS: 00000202 ORIG_RAX: 0000000=
000000001
[  +0.000000] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f9ad46b=
4b00
[  +0.000000] RDX: 0000000000000002 RSI: 00007f9ad48a7417 RDI: 000000000000=
0009
[  +0.000000] RBP: 0000000000000002 R08: 0000000000000064 R09: 000000000000=
0000
[  +0.000000] R10: 0000000000000000 R11: 0000000000000202 R12: 00007f9ad48a=
7417
[  +0.000000] R13: 0000000000000009 R14: 00007ffcbd3bd760 R15: 000000000000=
0001
[  +0.000000]  </TASK>
[  +0.000000] Modules linked in: ctr ccm rfcomm snd_seq_dummy snd_hrtimer s=
nd_seq snd_seq_device cmac algif_hash algif_skcipher af_alg bnep btusb btrt=
l btbcm btintel btmtk bluetooth uvcvideo videobuf2_vmalloc sha3_generic vid=
eobuf2_memops uvc jitterentropy_rng videobuf2_v4l2 videodev drbg videobuf2_=
common ansi_cprng mc ecdh_generic ecc qrtr binfmt_misc hid_sensor_accel_3d =
hid_sensor_magn_3d hid_sensor_gyro_3d hid_sensor_trigger industrialio_trigg=
ered_buffer kfifo_buf industrialio snd_ctl_led joydev hid_sensor_iio_common=
 rtw89_8852ae rtw89_8852a rtw89_pci snd_hda_codec_realtek rtw89_core snd_hd=
a_codec_generic intel_rapl_msr ledtrig_audio intel_rapl_common snd_hda_code=
c_hdmi mac80211 snd_hda_intel snd_intel_dspcfg kvm_amd snd_hda_codec snd_so=
c_dmic snd_acp3x_rn snd_acp3x_pdm_dma libarc4 snd_hwdep snd_soc_core kvm sn=
d_hda_core cfg80211 snd_pci_acp6x snd_pcm nls_ascii snd_timer hp_wmi snd_pc=
i_acp5x nls_cp437 snd_rn_pci_acp3x ucsi_acpi sparse_keymap ccp snd platform=
_profile snd_acp_config typec_ucsi irqbypass vfat sp5100_tco
[  +0.000000]  snd_soc_acpi fat rapl pcspkr wmi_bmof roles rfkill rng_core =
snd_pci_acp3x soundcore k10temp watchdog typec battery ac amd_pmc acpi_tad =
button hid_sensor_hub hid_multitouch evdev serio_raw msr parport_pc ppdev l=
p parport fuse loop efi_pstore configfs ip_tables x_tables autofs4 ext4 crc=
16 mbcache jbd2 btrfs blake2b_generic dm_crypt dm_mod efivarfs raid10 raid4=
56 async_raid6_recov async_memcpy async_pq async_xor async_tx libcrc32c crc=
32c_generic xor raid6_pq raid1 raid0 multipath linear md_mod amdgpu amdxcp =
i2c_algo_bit drm_ttm_helper ttm crc32_pclmul crc32c_intel drm_exec gpu_sche=
d drm_suballoc_helper nvme ghash_clmulni_intel drm_buddy drm_display_helper=
 sha512_ssse3 nvme_core ahci xhci_pci sha512_generic hid_generic xhci_hcd l=
ibahci rtsx_pci_sdmmc t10_pi i2c_hid_acpi drm_kms_helper i2c_hid mmc_core l=
ibata aesni_intel crc64_rocksoft_generic crypto_simd amd_sfh crc64_rocksoft=
 scsi_mod usbcore cryptd crc_t10dif cec drm crct10dif_generic hid rtsx_pci =
crct10dif_pclmul scsi_common rc_core crc64 i2c_piix4
[  +0.000000]  usb_common crct10dif_common video wmi
[  +0.000000] CR2: 00000000000004c0
[  +0.000000] ---[ end trace 0000000000000000 ]---

Fixes: e54ed41620f ("drm/amd/display: Remove unwanted drm edid references")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd98b3565178..68e71e2ea472 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6561,10 +6561,10 @@ amdgpu_dm_connector_late_register(struct drm_connec=
tor *connector)
 static void amdgpu_dm_connector_funcs_force(struct drm_connector *connecto=
r)
 {
 	struct amdgpu_dm_connector *aconnector =3D to_amdgpu_dm_connector(connect=
or);
-	struct amdgpu_connector *amdgpu_connector =3D to_amdgpu_connector(connect=
or);
 	struct dc_link *dc_link =3D aconnector->dc_link;
 	struct dc_sink *dc_em_sink =3D aconnector->dc_em_sink;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
=20
 	/*
 	 * Note: drm_get_edid gets edid in the following order:
@@ -6572,18 +6572,19 @@ static void amdgpu_dm_connector_funcs_force(struct =
drm_connector *connector)
 	 * 2) firmware EDID if set via edid_firmware module parameter
 	 * 3) regular DDC read.
 	 */
-	edid =3D drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
-	if (!edid) {
+	drm_edid =3D drm_edid_read(connector);
+
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
-
+	edid =3D drm_edid_raw(drm_edid);
 	aconnector->edid =3D edid;
=20
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDI=
D_LENGTH);
+		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions=
 + 1) * EDID_LENGTH);
 		dm_helpers_parse_edid_caps(
 			dc_link,
 			&dc_em_sink->dc_edid,
@@ -6613,12 +6614,12 @@ static int get_modes(struct drm_connector *connecto=
r)
 static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector =3D &aconnector->base;
-	struct amdgpu_connector *amdgpu_connector =3D to_amdgpu_connector(&aconne=
ctor->base);
 	struct dc_sink_init_data init_params =3D {
 			.link =3D aconnector->dc_link,
 			.sink_signal =3D SIGNAL_TYPE_VIRTUAL
 	};
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
=20
 	/*
 	 * Note: drm_get_edid gets edid in the following order:
@@ -6626,12 +6627,14 @@ static void create_eml_sink(struct amdgpu_dm_connec=
tor *aconnector)
 	 * 2) firmware EDID if set via edid_firmware module parameter
 	 * 3) regular DDC read.
 	 */
-	edid =3D drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
-	if (!edid) {
+	drm_edid =3D drm_edid_read(connector);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
=20
+	edid =3D drm_edid_raw(drm_edid);
+
 	if (drm_detect_hdmi_monitor(edid))
 		init_params.sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
=20
--=20
2.43.0

