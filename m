Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4B5AF8CCC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E333510E98A;
	Fri,  4 Jul 2025 08:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 04 Jul 2025 03:35:24 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A8A10E1EF;
 Fri,  4 Jul 2025 03:35:24 +0000 (UTC)
X-UUID: 33d6e296588711f0b29709d653e92f7d-20250704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:7333f72d-cfa2-40be-95fa-6b5dc0a96f72, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-30
X-CID-META: VersionHash:6493067, CLOUDID:79c5d3fe3c20506a7d79babaa6678826,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
 :0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
 R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33d6e296588711f0b29709d653e92f7d-20250704
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <jiangyunshui@kylinos.cn>) (Generic MTA)
 with ESMTP id 1110516493; Fri, 04 Jul 2025 11:30:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 00484E0091AB;
 Fri,  4 Jul 2025 11:30:15 +0800 (CST)
X-ns-mid: postfix-68674AC7-8599861065
Received: from kylin-pc.. (unknown [172.25.130.133])
 by mail.kylinos.cn (NSMail) with ESMTPA id DA066E0091A7;
 Fri,  4 Jul 2025 11:30:14 +0800 (CST)
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 Yunshui Jiang <jiangyunshui@kylinos.cn>
Subject: [PATCH v2] drm/amdgpu: use kmalloc_array() instead of kmalloc()
Date: Fri,  4 Jul 2025 11:30:11 +0800
Message-ID: <20250704033011.2875239-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 04 Jul 2025 08:53:39 +0000
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

Use kmalloc_array() instead of kmalloc() with multiplication.
kmalloc_array() is a safer way because of its multiply overflow check.

Signed-off-by: Yunshui Jiang <jiangyunshui@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
index de0944947eaf..12f5a1b9ff8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2563,7 +2563,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_d=
evice *adev,
 		goto out;
 	}
=20
-	*bps =3D kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KERNEL);
+	*bps =3D kmalloc_array(data->count, sizeof(struct ras_badpage), GFP_KER=
NEL);
 	if (!*bps) {
 		ret =3D -ENOMEM;
 		goto out;
@@ -2719,7 +2719,7 @@ static int amdgpu_ras_realloc_eh_data_space(struct =
amdgpu_device *adev,
 	unsigned int old_space =3D data->count + data->space_left;
 	unsigned int new_space =3D old_space + pages;
 	unsigned int align_space =3D ALIGN(new_space, 512);
-	void *bps =3D kmalloc(align_space * sizeof(*data->bps), GFP_KERNEL);
+	void *bps =3D kmalloc_array(align_space, sizeof(*data->bps), GFP_KERNEL=
);
=20
 	if (!bps) {
 		return -ENOMEM;
--=20
2.47.1

