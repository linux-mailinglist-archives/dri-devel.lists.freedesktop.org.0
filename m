Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257AABC90A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 23:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEC210E42C;
	Mon, 19 May 2025 21:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rkojRWWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266AF10E3F2;
 Mon, 19 May 2025 21:21:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0127F629E3;
 Mon, 19 May 2025 21:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03F9C4CEED;
 Mon, 19 May 2025 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747689709;
 bh=IKJpC+Tku/lQIHFzPRHSD9IqhSgVKQ4i14CkK/h8r9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rkojRWWa/1qvAFQq1/hAqRKguJvLMzwJM5lfAOs4z36iPeJgrXeYIeDhS5xw7Ay9Z
 lSrPqO2KCDPodAbue3wSAtFOlqmHBXt0yuX5eA4dls1hAsAIWB2adNv15GqjG3W0JQ
 GWF2BWCcR5cEbEta/qIZC80SgnvZEbppB48keHGF2h+mYBwedS4wCOwPg1iksXvbr9
 weX1w8OwLYfrQcX+tM2ZYttFRtQRLEVEVDVX08ZmSJ7Pq3Ffr/xfEwLVfr8JraWKo4
 e1FQwUUmdiQYNgAkOKk8dQW8+Hp3zX/PvuQZ6SPOEksoo3EnxYaXNZ7nBF0K6tLOCy
 w/A/7dnbvEcEQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Austin Zheng <austin.zheng@amd.com>, Ray Wu <ray.wu@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 11/23] drm/amd/display: check stream id dml21
 wrapper to get plane_id
Date: Mon, 19 May 2025 17:21:18 -0400
Message-Id: <20250519212131.1985647-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212131.1985647-1-sashal@kernel.org>
References: <20250519212131.1985647-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.7
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

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit 2ddac70fed50485aa4ae49cdb7478ce41d8d4715 ]

[Why & How]
Fix a false positive warning which occurs due to lack of correct checks
when querying plane_id in DML21. This fixes the warning when performing a
mode1 reset (cat /sys/kernel/debug/dri/1/amdgpu_gpu_recover):

[   35.751250] WARNING: CPU: 11 PID: 326 at /tmp/amd.PHpyAl7v/amd/amdgpu/..=
/display/dc/dml2/dml2_dc_resource_mgmt.c:91 dml2_map_dc_pipes+0x243d/0x3f40=
 [amdgpu]
[   35.751434] Modules linked in: amdgpu(OE) amddrm_ttm_helper(OE) amdttm(O=
E) amddrm_buddy(OE) amdxcp(OE) amddrm_exec(OE) amd_sched(OE) amdkcl(OE) drm=
_suballoc_helper drm_ttm_helper ttm drm_display_helper cec rc_core i2c_algo=
_bit rfcomm qrtr cmac algif_hash algif_skcipher af_alg bnep amd_atl intel_r=
apl_msr intel_rapl_common snd_hda_codec_hdmi snd_hda_intel edac_mce_amd snd=
_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec kvm_amd snd_hda_core snd_hwd=
ep snd_pcm kvm snd_seq_midi snd_seq_midi_event snd_rawmidi crct10dif_pclmul=
 polyval_clmulni polyval_generic btusb ghash_clmulni_intel sha256_ssse3 btr=
tl sha1_ssse3 snd_seq btintel aesni_intel btbcm btmtk snd_seq_device crypto=
_simd sunrpc cryptd bluetooth snd_timer ccp binfmt_misc rapl snd i2c_piix4 =
wmi_bmof gigabyte_wmi k10temp i2c_smbus soundcore gpio_amdpt mac_hid sch_fq=
_codel msr parport_pc ppdev lp parport efi_pstore nfnetlink dmi_sysfs ip_ta=
bles x_tables autofs4 hid_generic usbhid hid crc32_pclmul igc ahci xhci_pci=
 libahci xhci_pci_renesas video wmi
[   35.751501] CPU: 11 UID: 0 PID: 326 Comm: kworker/u64:9 Tainted: G      =
     OE      6.11.0-21-generic #21~24.04.1-Ubuntu
[   35.751504] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[   35.751505] Hardware name: Gigabyte Technology Co., Ltd. X670E AORUS PRO=
 X/X670E AORUS PRO X, BIOS F30 05/22/2024
[   35.751506] Workqueue: amdgpu-reset-dev amdgpu_debugfs_reset_work [amdgp=
u]
[   35.751638] RIP: 0010:dml2_map_dc_pipes+0x243d/0x3f40 [amdgpu]
[   35.751794] Code: 6d 0c 00 00 8b 84 24 88 00 00 00 41 3b 44 9c 20 0f 84 =
fc 07 00 00 48 83 c3 01 48 83 fb 06 75 b3 4c 8b 64 24 68 4c 8b 6c 24 40 <0f=
> 0b b8 06 00 00 00 49 8b 94 24 a0 49 00 00 89 c3 83 f8 07 0f 87
[   35.751796] RSP: 0018:ffffbfa3805d7680 EFLAGS: 00010246
[   35.751798] RAX: 0000000000010000 RBX: 0000000000000006 RCX: 00000000000=
00000
[   35.751799] RDX: 0000000000000000 RSI: 0000000000000005 RDI: 00000000000=
00000
[   35.751800] RBP: ffffbfa3805d78f0 R08: 0000000000000000 R09: 00000000000=
00000
[   35.751801] R10: 0000000000000000 R11: 0000000000000000 R12: ffffbfa3832=
49000
[   35.751802] R13: ffffa0e68f280000 R14: ffffbfa383249658 R15: 00000000000=
00000
[   35.751803] FS:  0000000000000000(0000) GS:ffffa0edbe580000(0000) knlGS:=
0000000000000000
[   35.751804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.751805] CR2: 00005d847ef96c58 CR3: 000000041de3e000 CR4: 0000000000f=
50ef0
[   35.751806] PKRU: 55555554
[   35.751807] Call Trace:
[   35.751810]  <TASK>
[   35.751816]  ? show_regs+0x6c/0x80
[   35.751820]  ? __warn+0x88/0x140
[   35.751822]  ? dml2_map_dc_pipes+0x243d/0x3f40 [amdgpu]
[   35.751964]  ? report_bug+0x182/0x1b0
[   35.751969]  ? handle_bug+0x6e/0xb0
[   35.751972]  ? exc_invalid_op+0x18/0x80
[   35.751974]  ? asm_exc_invalid_op+0x1b/0x20
[   35.751978]  ? dml2_map_dc_pipes+0x243d/0x3f40 [amdgpu]
[   35.752117]  ? math_pow+0x48/0xa0 [amdgpu]
[   35.752256]  ? srso_alias_return_thunk+0x5/0xfbef5
[   35.752260]  ? math_pow+0x48/0xa0 [amdgpu]
[   35.752400]  ? srso_alias_return_thunk+0x5/0xfbef5
[   35.752403]  ? math_pow+0x11/0xa0 [amdgpu]
[   35.752524]  ? srso_alias_return_thunk+0x5/0xfbef5
[   35.752526]  ? core_dcn4_mode_programming+0xe4d/0x20d0 [amdgpu]
[   35.752663]  ? srso_alias_return_thunk+0x5/0xfbef5
[   35.752669]  dml21_validate+0x3d4/0x980 [amdgpu]

Reviewed-by: Austin Zheng <austin.zheng@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit f8ad62c0a93e5dd94243e10f1b742232e4d6411e)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dml2/dml21/dml21_translation_helper.c  | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_he=
lper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper=
.c
index 0c8ec30ea6726..731fbd4bc600b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -910,7 +910,7 @@ static void populate_dml21_plane_config_from_plane_stat=
e(struct dml2_context *dm
 }
=20
 //TODO : Could be possibly moved to a common helper layer.
-static bool dml21_wrapper_get_plane_id(const struct dc_state *context, con=
st struct dc_plane_state *plane, unsigned int *plane_id)
+static bool dml21_wrapper_get_plane_id(const struct dc_state *context, uns=
igned int stream_id, const struct dc_plane_state *plane, unsigned int *plan=
e_id)
 {
 	int i, j;
=20
@@ -918,10 +918,12 @@ static bool dml21_wrapper_get_plane_id(const struct d=
c_state *context, const str
 		return false;
=20
 	for (i =3D 0; i < context->stream_count; i++) {
-		for (j =3D 0; j < context->stream_status[i].plane_count; j++) {
-			if (context->stream_status[i].plane_states[j] =3D=3D plane) {
-				*plane_id =3D (i << 16) | j;
-				return true;
+		if (context->streams[i]->stream_id =3D=3D stream_id) {
+			for (j =3D 0; j < context->stream_status[i].plane_count; j++) {
+				if (context->stream_status[i].plane_states[j] =3D=3D plane) {
+					*plane_id =3D (i << 16) | j;
+					return true;
+				}
 			}
 		}
 	}
@@ -944,14 +946,14 @@ static unsigned int map_stream_to_dml21_display_cfg(c=
onst struct dml2_context *d
 	return location;
 }
=20
-static unsigned int map_plane_to_dml21_display_cfg(const struct dml2_conte=
xt *dml_ctx,
+static unsigned int map_plane_to_dml21_display_cfg(const struct dml2_conte=
xt *dml_ctx, unsigned int stream_id,
 		const struct dc_plane_state *plane, const struct dc_state *context)
 {
 	unsigned int plane_id;
 	int i =3D 0;
 	int location =3D -1;
=20
-	if (!dml21_wrapper_get_plane_id(context, plane, &plane_id)) {
+	if (!dml21_wrapper_get_plane_id(context, stream_id, plane, &plane_id)) {
 		ASSERT(false);
 		return -1;
 	}
@@ -1037,7 +1039,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const st=
ruct dc *in_dc, struct dc_s
 			dml_dispcfg->plane_descriptors[disp_cfg_plane_location].stream_index =
=3D disp_cfg_stream_location;
 		} else {
 			for (plane_index =3D 0; plane_index < context->stream_status[stream_ind=
ex].plane_count; plane_index++) {
-				disp_cfg_plane_location =3D map_plane_to_dml21_display_cfg(dml_ctx, co=
ntext->stream_status[stream_index].plane_states[plane_index], context);
+				disp_cfg_plane_location =3D map_plane_to_dml21_display_cfg(dml_ctx, co=
ntext->streams[stream_index]->stream_id, context->stream_status[stream_inde=
x].plane_states[plane_index], context);
=20
 				if (disp_cfg_plane_location < 0)
 					disp_cfg_plane_location =3D dml_dispcfg->num_planes++;
@@ -1048,7 +1050,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const st=
ruct dc *in_dc, struct dc_s
 				populate_dml21_plane_config_from_plane_state(dml_ctx, &dml_dispcfg->pl=
ane_descriptors[disp_cfg_plane_location], context->stream_status[stream_ind=
ex].plane_states[plane_index], context, stream_index);
 				dml_dispcfg->plane_descriptors[disp_cfg_plane_location].stream_index =
=3D disp_cfg_stream_location;
=20
-				if (dml21_wrapper_get_plane_id(context, context->stream_status[stream_=
index].plane_states[plane_index], &dml_ctx->v21.dml_to_dc_pipe_mapping.disp=
_cfg_to_plane_id[disp_cfg_plane_location]))
+				if (dml21_wrapper_get_plane_id(context, context->streams[stream_index]=
->stream_id, context->stream_status[stream_index].plane_states[plane_index]=
, &dml_ctx->v21.dml_to_dc_pipe_mapping.disp_cfg_to_plane_id[disp_cfg_plane_=
location]))
 					dml_ctx->v21.dml_to_dc_pipe_mapping.disp_cfg_to_plane_id_valid[disp_c=
fg_plane_location] =3D true;
=20
 				/* apply forced pstate policy */
--=20
2.39.5

