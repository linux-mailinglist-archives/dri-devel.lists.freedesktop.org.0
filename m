Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053CAB12869
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 03:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA4C10E239;
	Sat, 26 Jul 2025 01:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IB80YeMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C69910E081;
 Sat, 26 Jul 2025 01:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4F8/K00deBdB9tuuyZ9MImJuWelBf5YWQRAJmCDYg2k=; b=IB80YeMQs+vjGp9YfNOekUkkF2
 5ki/VSFf3dqIxzpJnPJskkiT6AmWStoIH9o4UDwtsI2C/Nb0FeYuFAuLvwVLuKl2BvFzLPS1L2BRt
 ADrBgJAiqFp/Cr5Oefp3VdXd0ltP7oXzUTJlrFD2oCYlHMXFnrKgHtDXT6q/b11ZMsdHIpyjYJ1S9
 CxhWawV+L6+Iqu76S6cSLZsdLaWiz4xtjl7dUe/VHo5BqhF+kZhop9sNcOkxCavoTdnBaHDX2ZFTb
 aUpELOfFo3EUXpj/8Xv4PiQxHKBxtR7Jz1aYeYi4hgSCdbYSMDS/g918jKX46z04Qyc3oMCnqEH8G
 1n2u5WOQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufTYj-003xd7-F7; Sat, 26 Jul 2025 03:18:45 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1ufTYg-000rkj-GU; Sat, 26 Jul 2025 03:18:45 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail with esmtp (Exim 4.96) (envelope-from <mwen@igalia.com>)
 id 1ufTYf-00GuT5-30; Sat, 26 Jul 2025 03:18:42 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 00:18:42 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Jani Nikula <jani.nikula@linux.intel.com>, Michel Daenzer
 <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v5 14/14] drm/amd/display: move dc_sink from dc_edid to
 drm_edid
In-Reply-To: <5199cdc6-b4a2-4184-bcb0-37e793513261@amd.com>
References: <20250618152216.948406-1-mwen@igalia.com>
 <20250618152216.948406-15-mwen@igalia.com>
 <5199cdc6-b4a2-4184-bcb0-37e793513261@amd.com>
Message-ID: <c07f9d22efa27ea6a2190ee89eaa3ed8@igalia.com>
X-Sender: mwen@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3, BAYES_50=0.8,
 URIBL_BLOCKED=0.001
X-Spam-Score: -21
X-Spam-Bar: --
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

On 18-07-2025 20:32, Alex Hung wrote:
> Melisa,
> 
> The following NULL pointer error was reported from promotion test with this patch:

Hi Alex,

Sorry for the delay on addressing it.

I just sent a v6. To address this NULL pointer dereference, I use the
same sanity check proposed in
https://gitlab.freedesktop.org/agd5f/linux/-/commit/7c3be3ce3dfae

It seems enought to me. Let me know if you find any other issue.

Thanks for reviewing and validating this series.

Melissa

> 
> 
> [   31.525028] amdgpu 0000:c4:00.0: [drm] *ERROR* No EDID read.
> [   31.525596] amdgpu 0000:c4:00.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AMDGPU DM aux hw bus 2: 0x6921d AUX -> (ret=  3) 00 00 00
> [   31.526132] amdgpu 0000:c4:00.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AMDGPU DM aux hw bus 2: 0x68028 AUX -> (ret=  1) 00
> [   31.526146] BUG: kernel NULL pointer dereference, address: 000000000000007e
> [   31.526148] #PF: supervisor read access in kernel mode
> [   31.526150] #PF: error_code(0x0000) - not-present page
> [   31.526152] PGD 0 P4D 0
> [   31.526155] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   31.526158] CPU: 13 UID: 0 PID: 291 Comm: kworker/13:1H Not tainted 6.14.0-reg-jul14-redo+ #15
> [   31.526162] Hardware name: Unnamed Product
> [   31.526164] Workqueue: events_highpri dm_irq_work_func [amdgpu]
> [   31.526472] RIP: 0010:dc_edid_copy_edid_to_sink+0x21/0xa0 [amdgpu]
> [   31.526781] Code: 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 48 83 ec 08 48 8b bf 08 08 00 00 e8 cf 85 62 ff <0f> b6 58 7e 83 c3 01 c1 e3 07 4c 63 eb 81 fb 00 08 00 00 7f 24 49
> [   31.526783] RSP: 0018:ffffbd72c0623bc8 EFLAGS: 00010246
> [   31.526786] RAX: 0000000000000000 RBX: ffff9a8c8b836800 RCX: 0000000000000000
> [   31.526787] RDX: 0000000000000000 RSI: ffff9a8c8b836af3 RDI: 0000000000000000
> [   31.526788] RBP: ffffbd72c0623be8 R08: 0000000000000000 R09: 0000000000000003
> [   31.526789] R10: ffffbd72c0623778 R11: ffff9a93d07fffe8 R12: ffff9a8c8a4cd000
> [   31.526790] R13: ffff9a8c832ac200 R14: 0000000000000000 R15: ffff9a8c8a4cd000
> [   31.526792] FS:  0000000000000000(0000) GS:ffff9a93de080000(0000) knlGS:0000000000000000
> [   31.526793] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   31.526794] CR2: 000000000000007e CR3: 000000085a236000 CR4: 0000000000750ef0
> [   31.526796] PKRU: 55555554
> [   31.526797] Call Trace:
> [   31.526798]  <TASK>
> [   31.526800]  ? show_regs+0x64/0x70
> [   31.526807]  ? __die+0x24/0x70
> [   31.526809]  ? page_fault_oops+0x160/0x520
> [   31.526814]  ? drm_dp_dpcd_read+0x6b/0xf0 [drm_display_helper]
> [   31.526825]  ? do_user_addr_fault+0x2e9/0x6a0
> [   31.526828]  ? dm_helpers_dp_read_dpcd+0x2d/0x50 [amdgpu]
> [   31.527135]  ? exc_page_fault+0x7f/0x1b0
> [   31.527139]  ? asm_exc_page_fault+0x27/0x30
> [   31.527145]  ? dc_edid_copy_edid_to_sink+0x21/0xa0 [amdgpu]
> [   31.527457]  ? dc_edid_copy_edid_to_sink+0x21/0xa0 [amdgpu]
> [   31.527761]  detect_link_and_local_sink+0x438/0x11f0 [amdgpu]
> [   31.528080]  ? call_rcu+0xe/0x20
> [   31.528084]  ? put_object+0x2f/0x50
> [   31.528089]  ? __delete_object+0x39/0x50
> [   31.528092]  ? delete_object_full+0x57/0x80
> [   31.528094]  ? dal_gpio_destroy+0x49/0x70 [amdgpu]
> [   31.528418]  ? kmemleak_free+0x31/0x60
> [   31.528420]  ? kfree+0x1a3/0x320
> [   31.528424]  ? dm_read_reg_func+0x5a/0xf0 [amdgpu]
> [   31.528739]  link_detect+0x36/0x550 [amdgpu]
> [   31.529044]  ? query_hpd_status+0x6e/0xa0 [amdgpu]
> [   31.529345]  dc_link_detect+0x1d/0x30 [amdgpu]
> [   31.529591]  handle_hpd_irq_helper+0x133/0x1c0 [amdgpu]
> [   31.529894]  handle_hpd_irq+0xe/0x20 [amdgpu]
> [   31.530193]  dm_irq_work_func+0x16/0x20 [amdgpu]
> [   31.530493]  process_one_work+0x176/0x3b0
> [   31.530497]  worker_thread+0x2ca/0x400
> [   31.530499]  ? _raw_spin_unlock_irqrestore+0x27/0x50
> [   31.530501]  ? __pfx_worker_thread+0x10/0x10
> [   31.530504]  kthread+0x10a/0x240
> [   31.530507]  ? _raw_spin_unlock_irq+0x1f/0x40
> [   31.530509]  ? __pfx_kthread+0x10/0x10
> [   31.530511]  ret_from_fork+0x3a/0x60
> [   31.530514]  ? __pfx_kthread+0x10/0x10
> [   31.530516]  ret_from_fork_asm+0x1a/0x30
> [   31.530520]  </TASK>
> [   31.530521] Modules linked in: snd_seq_dummy snd_hrtimer qrtr binfmt_misc intel_rapl_msr amd_atl intel_rapl_common nls_iso8859_1 snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel snd_soc_dmic edac_mce_amd snd_intel_dspcfg snd_intel_sdw_acpi snd_soc_core amdgpu snd_hda_codec snd_hda_core snd_compress ac97_bus snd_hwdep snd_pcm_dmaengine kvm_amd snd_seq_midi snd_pci_ps snd_seq_midi_event amdxcp kvm snd_soc_acpi_amd_match gpu_sched snd_rpl_pci_acp6x drm_panel_backlight_quirks snd_acp_pci snd_rawmidi drm_buddy snd_acp_legacy_common drm_ttm_helper ghash_clmulni_intel snd_pci_acp6x sha512_ssse3 ttm sha256_ssse3 drm_exec sha1_ssse3 snd_seq drm_suballoc_helper drm_client_lib snd_pcm aesni_intel snd_seq_device cec crypto_simd cryptd wmi_bmof snd_pci_acp5x snd_timer rc_core rapl snd_rn_pci_acp3x drm_display_helper snd_acp_config snd k10temp drm_kms_helper snd_soc_acpi i2c_piix4 i2c_algo_bit ccp snd_pci_acp3x joydev soundcore i2c_smbus
amd_pmc input_leds serio_raw mac_hid
> [   31.530565]  sch_fq_codel msr parport_pc ppdev lp parport drm efi_pstore nfnetlink dmi_sysfs ip_tables x_tables autofs4 hid_generic usbhid rtsx_pci_sdmmc r8169 nvme amd_sfh thunderbolt hid video rtsx_pci nvme_core realtek wmi
> [   31.530583] CR2: 000000000000007e
> [   31.530585] ---[ end trace 0000000000000000 ]---
> [   31.785449] RIP: 0010:dc_edid_copy_edid_to_sink+0x21/0xa0 [amdgpu]
> [   31.785817] Code: 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 48 83 ec 08 48 8b bf 08 08 00 00 e8 cf 85 62 ff <0f> b6 58 7e 83 c3 01 c1 e3 07 4c 63 eb 81 fb 00 08 00 00 7f 24 49
> [   31.785819] RSP: 0018:ffffbd72c0623bc8 EFLAGS: 00010246
> [   31.785822] RAX: 0000000000000000 RBX: ffff9a8c8b836800 RCX: 0000000000000000
> [   31.785824] RDX: 0000000000000000 RSI: ffff9a8c8b836af3 RDI: 0000000000000000
> [   31.785824] RBP: ffffbd72c0623be8 R08: 0000000000000000 R09: 0000000000000003
> [   31.785825] R10: ffffbd72c0623778 R11: ffff9a93d07fffe8 R12: ffff9a8c8a4cd000
> [   31.785826] R13: ffff9a8c832ac200 R14: 0000000000000000 R15: ffff9a8c8a4cd000
> [   31.785827] FS:  0000000000000000(0000) GS:ffff9a93de080000(0000) knlGS:0000000000000000
> [   31.785829] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   31.785830] CR2: 000000000000007e CR3: 0000000134804000 CR4: 0000000000750ef0
> [   31.785832] PKRU: 55555554
> 
> 
> 
> On 6/18/25 09:19, Melissa Wen wrote:
>> Reduce direct handling of edid data by resorting to drm helpers that
>> deal with this info inside drm_edid infrastructure.
>> 
>> v3:
>> - use dc_edid_sink_edid_free in link_detection
>> 
>> v5:
>> - no need of drm_edid duplication (Mario)
>> - fix mem leak on dc_sink->drm_edid
>> 
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++-----------
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 27 +++++++------------
>>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 21 +++++----------
>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 26 +++++++++---------
>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  1 +
>>   .../drm/amd/display/dc/link/link_detection.c  |  3 ++-
>>   6 files changed, 42 insertions(+), 62 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index c7efeb9f38b6..ec33a6236e37 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -68,6 +68,7 @@
>>   #endif
>>   #include "amdgpu_dm_psr.h"
>>   #include "amdgpu_dm_replay.h"
>> +#include "dc_edid.h"
>>     #include "ivsrcid/ivsrcid_vislands30.h"
>>   @@ -3708,6 +3709,8 @@ void amdgpu_dm_update_connector_after_detect(
>>   	 * 2. Send an event and let userspace tell us what to do
>>   	 */
>>   	if (sink) {
>> +		const struct drm_edid *drm_edid = sink->drm_edid;
>> +
>>   		/*
>>   		 * TODO: check if we still need the S3 mode update workaround.
>>   		 * If yes, put it here.
>> @@ -3719,16 +3722,15 @@ void amdgpu_dm_update_connector_after_detect(
>>     		aconnector->dc_sink = sink;
>>   		dc_sink_retain(aconnector->dc_sink);
>> -		if (sink->dc_edid.length == 0) {
>> +
>> +		if (!drm_edid_valid(drm_edid)) {
>>   			aconnector->drm_edid = NULL;
>>   			hdmi_cec_unset_edid(aconnector);
>>   			if (aconnector->dc_link->aux_mode) {
>>   				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
>>   			}
>>   		} else {
>> -			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
>> -
>> -			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
>> +			aconnector->drm_edid = drm_edid_dup(sink->drm_edid);
>>   			drm_edid_connector_update(connector, aconnector->drm_edid);
>>     			hdmi_cec_set_edid(aconnector);
>> @@ -7378,12 +7380,8 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>   	aconnector->drm_edid = drm_edid;
>>   	/* Update emulated (virtual) sink's EDID */
>>   	if (dc_em_sink && dc_link) {
>> -		// FIXME: Get rid of drm_edid_raw()
>> -		const struct edid *edid = drm_edid_raw(drm_edid);
>> -
>>   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
>> -		memmove(dc_em_sink->dc_edid.raw_edid, edid,
>> -			(edid->extensions + 1) * EDID_LENGTH);
>> +		dc_edid_copy_edid_to_dc(dc_em_sink, drm_edid, 0);
>>   		dm_helpers_parse_edid_caps(dc_link, dc_em_sink);
>>   	}
>>   }
>> @@ -7416,7 +7414,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>>   	};
>>   	const struct drm_edid *drm_edid;
>> -	const struct edid *edid;
>>   	struct i2c_adapter *ddc;
>>     	if (dc_link && dc_link->aux_mode)
>> @@ -7436,12 +7433,9 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>>     	aconnector->drm_edid = drm_edid;
>>   -	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>> -	aconnector->dc_em_sink = dc_link_add_remote_sink(
>> -		aconnector->dc_link,
>> -		(uint8_t *)edid,
>> -		(edid->extensions + 1) * EDID_LENGTH,
>> -		&init_params);
>> +	aconnector->dc_em_sink = dc_link_add_remote_sink(aconnector->dc_link,
>> +							 drm_edid, 0,
>> +							 &init_params);
>>     	if (aconnector->base.force == DRM_FORCE_ON) {
>>   		aconnector->dc_sink = aconnector->dc_link->local_sink ?
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index abfce44dcee7..288e87f92f9e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -48,6 +48,7 @@
>>   #include "dm_helpers.h"
>>   #include "ddc_service_types.h"
>>   #include "clk_mgr.h"
>> +#include "dc_edid.h"
>>     static void apply_edid_quirks(struct drm_device *dev,
>>   			      const struct drm_edid *drm_edid,
>> @@ -100,20 +101,16 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>>   	struct amdgpu_dm_connector *aconnector = link->priv;
>>   	struct drm_connector *connector = &aconnector->base;
>>   	struct drm_device *dev = connector->dev;
>> -	struct edid *edid_buf;
>> -	const struct drm_edid *drm_edid;
>> +	const struct drm_edid *drm_edid = sink->drm_edid;
>>   	struct drm_edid_product_id product_id;
>>   	struct dc_edid_caps *edid_caps = &sink->edid_caps;
>>   	int sad_count;
>>   	int i = 0;
>>   	enum dc_edid_status result = EDID_OK;
>>   -	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
>> -	if (!edid_caps || !edid_buf)
>> +	if (!edid_caps || !drm_edid)
>>   		return EDID_BAD_INPUT;
>>   -	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
>> -
>>   	if (!drm_edid_valid(drm_edid))
>>   		result = EDID_BAD_CHECKSUM;
>>   @@ -135,10 +132,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>>   	apply_edid_quirks(dev, drm_edid, edid_caps);
>>     	sad_count = drm_eld_sad_count(connector->eld);
>> -	if (sad_count <= 0) {
>> -		drm_edid_free(drm_edid);
>> +	if (sad_count <= 0)
>>   		return result;
>> -	}
>>     	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>>   	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
>> @@ -158,8 +153,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>>   	else
>>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>>   -	drm_edid_free(drm_edid);
>> -
>>   	return result;
>>   }
>>   @@ -991,7 +984,6 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>   	int retry = 3;
>>   	enum dc_edid_status edid_status;
>>   	const struct drm_edid *drm_edid;
>> -	const struct edid *edid;
>>     	if (link->aux_mode)
>>   		ddc = &aconnector->dm_dp_aux.aux.ddc;
>> @@ -1002,6 +994,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>   	 * do check sum and retry to make sure read correct edid.
>>   	 */
>>   	do {
>> +		drm_edid_free(sink->drm_edid);
>> +
>>   		drm_edid = dm_helpers_read_acpi_edid(aconnector);
>>   		if (drm_edid)
>>   			drm_info(connector->dev, "Using ACPI provided EDID for %s\n", connector->name);
>> @@ -1021,12 +1015,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>   		if (!drm_edid)
>>   			return EDID_NO_RESPONSE;
>>   -		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>> -		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
>> -		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
>> -
>> -		/* We don't need the original edid anymore */
>> -		drm_edid_free(drm_edid);
>> +		sink->drm_edid = drm_edid;
>>     		edid_status = dm_helpers_parse_edid_caps(link, sink);
>>   @@ -1051,6 +1040,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>     		test_response.bits.EDID_CHECKSUM_WRITE = 1;
>>   +		// TODO: drm_edid doesn't have a helper for dp_write_dpcd yet
>> +		dc_edid_copy_edid_to_sink(sink);
>>   		dm_helpers_dp_write_dpcd(ctx,
>>   					link,
>>   					DP_TEST_EDID_CHECKSUM,
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> index 7187d5aedf0a..5ca3e668c8aa 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> @@ -359,12 +359,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>>   					.link = aconnector->dc_link,
>>   					.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
>>   -				dc_sink = dc_link_add_remote_sink(
>> -					aconnector->dc_link,
>> -					NULL,
>> -					0,
>> -					&init_params);
>> -
>> +				dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
>> +								  NULL,
>> +								  0,
>> +								  &init_params);
>>   				if (!dc_sink) {
>>   					DRM_ERROR("Unable to add a remote sink\n");
>>   					return 0;
>> @@ -397,15 +395,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>>   		struct dc_sink_init_data init_params = {
>>   				.link = aconnector->dc_link,
>>   				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
>> -		const struct edid *edid;
>> -
>> -		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
>> -		dc_sink = dc_link_add_remote_sink(
>> -			aconnector->dc_link,
>> -			(uint8_t *)edid,
>> -			(edid->extensions + 1) * EDID_LENGTH,
>> -			&init_params);
>>   +		dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
>> +						  aconnector->drm_edid, 0,
>> +						  &init_params);
>>   		if (!dc_sink) {
>>   			DRM_ERROR("Unable to add a remote sink\n");
>>   			return 0;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> index 493815829aa5..8fecfd6a475e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> @@ -6,25 +6,25 @@
>>   bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>   			  struct dc_sink *current_sink)
>>   {
>> -	struct dc_edid *old_edid = &prev_sink->dc_edid;
>> -	struct dc_edid *new_edid = &current_sink->dc_edid;
>> -
>> -       if (old_edid->length != new_edid->length)
>> -               return false;
>> -
>> -       if (new_edid->length == 0)
>> -               return false;
>> -
>> -       return (memcmp(old_edid->raw_edid,
>> -                      new_edid->raw_edid, new_edid->length) == 0);
>> +	return drm_edid_eq(prev_sink->drm_edid, current_sink->drm_edid);
>>   }
>>     void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>>   			     const void *edid,
>>   			     int len)
>>   {
>> -	memmove(dc_sink->dc_edid.raw_edid, edid, len);
>> -	dc_sink->dc_edid.length = len;
>> +	dc_sink->drm_edid = drm_edid_dup((const struct drm_edid *) edid);
>> +}
>> +
>> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink)
>> +{
>> +	const struct edid *edid;
>> +	uint32_t edid_length;
>> +
>> +	edid = drm_edid_raw(sink->drm_edid); // FIXME: Get rid of drm_edid_raw()
>> +	edid_length = EDID_LENGTH * (edid->extensions + 1);
>> +	memcpy(sink->dc_edid.raw_edid, (uint8_t *) edid, edid_length);
>> +	sink->dc_edid.length = edid_length;
>>   }
>>     void dc_edid_sink_edid_free(struct dc_sink *sink)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> index 2c76768be459..a95cc6ccc743 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> @@ -9,6 +9,7 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>   			  struct dc_sink *current_sink);
>>   void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>>   			     const void *edid, int len);
>> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink);
>>   void dc_edid_sink_edid_free(struct dc_sink *sink);
>>     #endif /* __DC_EDID_H__ */
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> index 891d35274f69..7ac2ff39e506 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> @@ -1133,6 +1133,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>>   			dp_trace_init(link);
>>     		/* Connectivity log: detection */
>> +		dc_edid_copy_edid_to_sink(sink);
>>   		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
>>   			CONN_DATA_DETECT(link,
>>   					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
>> @@ -1415,7 +1416,7 @@ struct dc_sink *link_add_remote_sink(
>>   	 * parsing fails
>>   	 */
>>   	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
>> -		dc_sink->dc_edid.length = 0;
>> +		dc_edid_sink_edid_free(dc_sink);
>>   		dm_error("Bad EDID, status%d!\n", edid_status);
>>   	}
>>
