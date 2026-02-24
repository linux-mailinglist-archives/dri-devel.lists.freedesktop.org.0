Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFJyN2wYnWlTMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:18:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E11815A3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A76010E492;
	Tue, 24 Feb 2026 03:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660910E492
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:17:59 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-V0-39w9VNhmGEN-YvCqi2g-1; Mon,
 23 Feb 2026 22:17:57 -0500
X-MC-Unique: V0-39w9VNhmGEN-YvCqi2g-1
X-Mimecast-MFC-AGG-ID: V0-39w9VNhmGEN-YvCqi2g_1771903076
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C5D491800464; Tue, 24 Feb 2026 03:17:55 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7CCFD30001BB; Tue, 24 Feb 2026 03:17:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device is
 asleep
Date: Tue, 24 Feb 2026 13:17:50 +1000
Message-ID: <20260224031750.791621-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G5919o2n-Zf2H3I1_xGkE4FVZA3GMdYStmeC2GUzWLc_1771903076
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 733E11815A3
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
then just tell it the device is busy instead of crashing in the GSP
code.

WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r=
535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_connt=
rack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ip=
v6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct =
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables q=
rtr bnep s>
snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass snd_so=
c_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc firmwar=
e_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda_code=
c_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cfg8021=
1 videobu>
processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_thermal p=
latform_profile rfkill snd soundcore int3403_thermal int340x_thermal_zone i=
nt3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz4hc_c=
ompress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_acpi t=
ypec_ucsi>
CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86_64 #=
1 PREEMPT(lazy)
Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/05/20=
24
RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]

This is a simple fix to get backported. We should probably engineer a prope=
r power domain solution to wake up devices and keep them away while fw upda=
tes are happening.

Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com<
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/=
nouveau/nouveau_connector.c
index 00d4530aea717..cc239492c7f0b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1230,6 +1230,9 @@ nouveau_connector_aux_xfer(struct drm_dp_aux *obj, st=
ruct drm_dp_aux_msg *msg)
 =09u8 size =3D msg->size;
 =09int ret;
=20
+=09if (pm_runtime_suspended(nv_connector->base.dev->dev))
+=09=09return -EBUSY;
+
 =09nv_encoder =3D find_encoder(&nv_connector->base, DCB_OUTPUT_DP);
 =09if (!nv_encoder)
 =09=09return -ENODEV;
--=20
2.53.0

