Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBD86DA50
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 04:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7664610EA58;
	Fri,  1 Mar 2024 03:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DB810EA58
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 03:42:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-qVE-bLeiN_izOndk6cAIJw-1; Thu,
 29 Feb 2024 22:42:41 -0500
X-MC-Unique: qVE-bLeiN_izOndk6cAIJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18F773C0F18F;
 Fri,  1 Mar 2024 03:42:41 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F3E9492BC6;
 Fri,  1 Mar 2024 03:42:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] nouveau: lock the client object tree.
Date: Fri,  1 Mar 2024 13:42:37 +1000
Message-ID: <20240301034238.3041715-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

It appears the client object tree has no locking unless I've missed
something else. Fix races around adding/removing client objects,
mostly vram bar mappings.

 4562.099306] general protection fault, probably for non-canonical address =
0x6677ed422bceb80c: 0000 [#1] PREEMPT SMP PTI
[ 4562.099314] CPU: 2 PID: 23171 Comm: deqp-vk Not tainted 6.8.0-rc6+ #27
[ 4562.099324] Hardware name: Gigabyte Technology Co., Ltd. Z390 I AORUS PR=
O WIFI/Z390 I AORUS PRO WIFI-CF, BIOS F8 11/05/2021
[ 4562.099330] RIP: 0010:nvkm_object_search+0x1d/0x70 [nouveau]
[ 4562.099503] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f =
1f 44 00 00 48 89 f8 48 85 f6 74 39 48 8b 87 a0 00 00 00 48 85 c0 74 12 <48=
> 8b 48 f8 48 39 ce 73 15 48 8b 40 10 48 85 c0 75 ee 48 c7 c0 fe
[ 4562.099506] RSP: 0000:ffffa94cc420bbf8 EFLAGS: 00010206
[ 4562.099512] RAX: 6677ed422bceb814 RBX: ffff98108791f400 RCX: ffff9810f26=
b8f58
[ 4562.099517] RDX: 0000000000000000 RSI: ffff9810f26b9158 RDI: ffff9810879=
1f400
[ 4562.099519] RBP: ffff9810f26b9158 R08: 0000000000000000 R09: 00000000000=
00000
[ 4562.099521] R10: ffffa94cc420bc48 R11: 0000000000000001 R12: ffff9810f02=
a7cc0
[ 4562.099526] R13: 0000000000000000 R14: 00000000000000ff R15: 00000000000=
00007
[ 4562.099528] FS:  00007f629c5017c0(0000) GS:ffff98142c700000(0000) knlGS:=
0000000000000000
[ 4562.099534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4562.099536] CR2: 00007f629a882000 CR3: 000000017019e004 CR4: 00000000003=
706f0
[ 4562.099541] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[ 4562.099542] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[ 4562.099544] Call Trace:
[ 4562.099555]  <TASK>
[ 4562.099573]  ? die_addr+0x36/0x90
[ 4562.099583]  ? exc_general_protection+0x246/0x4a0
[ 4562.099593]  ? asm_exc_general_protection+0x26/0x30
[ 4562.099600]  ? nvkm_object_search+0x1d/0x70 [nouveau]
[ 4562.099730]  nvkm_ioctl+0xa1/0x250 [nouveau]
[ 4562.099861]  nvif_object_map_handle+0xc8/0x180 [nouveau]
[ 4562.099986]  nouveau_ttm_io_mem_reserve+0x122/0x270 [nouveau]
[ 4562.100156]  ? dma_resv_test_signaled+0x26/0xb0
[ 4562.100163]  ttm_bo_vm_fault_reserved+0x97/0x3c0 [ttm]
[ 4562.100182]  ? __mutex_unlock_slowpath+0x2a/0x270
[ 4562.100189]  nouveau_ttm_fault+0x69/0xb0 [nouveau]
[ 4562.100356]  __do_fault+0x32/0x150
[ 4562.100362]  do_fault+0x7c/0x560
[ 4562.100369]  __handle_mm_fault+0x800/0xc10
[ 4562.100382]  handle_mm_fault+0x17c/0x3e0
[ 4562.100388]  do_user_addr_fault+0x208/0x860
[ 4562.100395]  exc_page_fault+0x7f/0x200
[ 4562.100402]  asm_exc_page_fault+0x26/0x30
[ 4562.100412] RIP: 0033:0x9b9870
[ 4562.100419] Code: 85 a8 f7 ff ff 8b 8d 80 f7 ff ff 89 08 e9 18 f2 ff ff =
0f 1f 84 00 00 00 00 00 44 89 32 e9 90 fa ff ff 0f 1f 84 00 00 00 00 00 <44=
> 89 32 e9 f8 f1 ff ff 0f 1f 84 00 00 00 00 00 66 44 89 32 e9 e7
[ 4562.100422] RSP: 002b:00007fff9ba2dc70 EFLAGS: 00010246
[ 4562.100426] RAX: 0000000000000004 RBX: 000000000dd65e10 RCX: 000000fff00=
00000
[ 4562.100428] RDX: 00007f629a882000 RSI: 00007f629a882000 RDI: 00000000000=
00066
[ 4562.100432] RBP: 00007fff9ba2e570 R08: 0000000000000000 R09: 0000000123d=
df000
[ 4562.100434] R10: 0000000000000001 R11: 0000000000000246 R12: 000000007ff=
fffff
[ 4562.100436] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[ 4562.100446]  </TASK>
[ 4562.100448] Modules linked in: nf_conntrack_netbios_ns nf_conntrack_broa=
dcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rej=
ect_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack=
 nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables libcrc32c nfnetlink cmac bn=
ep sunrpc iwlmvm intel_rapl_msr intel_rapl_common snd_sof_pci_intel_cnl x86=
_pkg_temp_thermal intel_powerclamp snd_sof_intel_hda_common mac80211 corete=
mp snd_soc_acpi_intel_match kvm_intel snd_soc_acpi snd_soc_hdac_hda snd_sof=
_pci snd_sof_xtensa_dsp snd_sof_intel_hda_mlink snd_sof_intel_hda snd_sof k=
vm snd_sof_utils snd_soc_core snd_hda_codec_realtek libarc4 snd_hda_codec_g=
eneric snd_compress snd_hda_ext_core vfat fat snd_hda_intel snd_intel_dspcf=
g irqbypass iwlwifi snd_hda_codec snd_hwdep snd_hda_core btusb btrtl mei_hd=
cp iTCO_wdt rapl mei_pxp btintel snd_seq iTCO_vendor_support btbcm snd_seq_=
device intel_cstate bluetooth snd_pcm cfg80211 intel_wmi_thunderbolt wmi_bm=
of intel_uncore snd_timer mei_me snd ecdh_generic i2c_i801
[ 4562.100541]  ecc mei i2c_smbus soundcore rfkill intel_pch_thermal acpi_p=
ad zram nouveau drm_ttm_helper ttm gpu_sched i2c_algo_bit drm_gpuvm drm_exe=
c mxm_wmi drm_display_helper drm_kms_helper drm crct10dif_pclmul crc32_pclm=
ul nvme e1000e crc32c_intel nvme_core ghash_clmulni_intel video wmi pinctrl=
_cannonlake ip6_tables ip_tables fuse
[ 4562.100616] ---[ end trace 0000000000000000 ]---

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 .../drm/nouveau/include/nvkm/core/client.h    |  1 +
 drivers/gpu/drm/nouveau/nvkm/core/client.c    |  1 +
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 21 +++++++++++++++----
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/client.h
index 0d9fc741a719..932c9fd0b2d8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -11,6 +11,7 @@ struct nvkm_client {
 =09u32 debug;
=20
 =09struct rb_root objroot;
+=09spinlock_t obj_lock;
=20
 =09void *data;
 =09int (*event)(u64 token, void *argv, u32 argc);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/client.c
index ebdeb8eb9e77..c55662937ab2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -180,6 +180,7 @@ nvkm_client_new(const char *name, u64 device, const cha=
r *cfg, const char *dbg,
 =09client->device =3D device;
 =09client->debug =3D nvkm_dbgopt(dbg, "CLIENT");
 =09client->objroot =3D RB_ROOT;
+=09spin_lock_init(&client->obj_lock);
 =09client->event =3D event;
 =09INIT_LIST_HEAD(&client->umem);
 =09spin_lock_init(&client->lock);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/object.c
index 7c554c14e884..5dffb969fc38 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -30,8 +30,9 @@ nvkm_object_search(struct nvkm_client *client, u64 handle=
,
 =09=09   const struct nvkm_object_func *func)
 {
 =09struct nvkm_object *object;
-
+=09unsigned long flags;
 =09if (handle) {
+=09=09spin_lock_irqsave(&client->obj_lock, flags);
 =09=09struct rb_node *node =3D client->objroot.rb_node;
 =09=09while (node) {
 =09=09=09object =3D rb_entry(node, typeof(*object), node);
@@ -40,9 +41,12 @@ nvkm_object_search(struct nvkm_client *client, u64 handl=
e,
 =09=09=09else
 =09=09=09if (handle > object->object)
 =09=09=09=09node =3D node->rb_right;
-=09=09=09else
+=09=09=09else {
+=09=09=09=09spin_unlock_irqrestore(&client->obj_lock, flags);
 =09=09=09=09goto done;
+=09=09=09}
 =09=09}
+=09=09spin_unlock_irqrestore(&client->obj_lock, flags);
 =09=09return ERR_PTR(-ENOENT);
 =09} else {
 =09=09object =3D &client->object;
@@ -57,16 +61,22 @@ nvkm_object_search(struct nvkm_client *client, u64 hand=
le,
 void
 nvkm_object_remove(struct nvkm_object *object)
 {
+=09unsigned long flags;
+=09spin_lock_irqsave(&object->client->obj_lock, flags);
 =09if (!RB_EMPTY_NODE(&object->node))
 =09=09rb_erase(&object->node, &object->client->objroot);
+=09spin_unlock_irqrestore(&object->client->obj_lock, flags);
 }
=20
 bool
 nvkm_object_insert(struct nvkm_object *object)
 {
-=09struct rb_node **ptr =3D &object->client->objroot.rb_node;
+=09struct rb_node **ptr;
 =09struct rb_node *parent =3D NULL;
+=09unsigned long flags;
=20
+=09spin_lock_irqsave(&object->client->obj_lock, flags);
+=09ptr =3D &object->client->objroot.rb_node;
 =09while (*ptr) {
 =09=09struct nvkm_object *this =3D rb_entry(*ptr, typeof(*this), node);
 =09=09parent =3D *ptr;
@@ -75,12 +85,15 @@ nvkm_object_insert(struct nvkm_object *object)
 =09=09else
 =09=09if (object->object > this->object)
 =09=09=09ptr =3D &parent->rb_right;
-=09=09else
+=09=09else {
+=09=09=09spin_unlock_irqrestore(&object->client->obj_lock, flags);
 =09=09=09return false;
+=09=09}
 =09}
=20
 =09rb_link_node(&object->node, parent, ptr);
 =09rb_insert_color(&object->node, &object->client->objroot);
+=09spin_unlock_irqrestore(&object->client->obj_lock, flags);
 =09return true;
 }
=20
--=20
2.43.2

