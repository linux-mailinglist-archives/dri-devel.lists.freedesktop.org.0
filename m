Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A232582E844
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 04:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073B510E3EC;
	Tue, 16 Jan 2024 03:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 03:32:58 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D07810E3D7;
 Tue, 16 Jan 2024 03:32:57 +0000 (UTC)
X-UUID: f7f6384198e4480d8bf0d0f360722248-20240116
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:e6f0e8f5-f947-4a3c-9cf4-09384cf2a17d, IP:20,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:30
X-CID-INFO: VERSION:1.1.35, REQID:e6f0e8f5-f947-4a3c-9cf4-09384cf2a17d, IP:20,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:30
X-CID-META: VersionHash:5d391d7, CLOUDID:297ae382-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:240116112738XVUOT1J5,BulkQuantity:0,Recheck:0,SF:17|19|44|66|38|24|1
 02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: f7f6384198e4480d8bf0d0f360722248-20240116
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1459130115; Tue, 16 Jan 2024 11:27:37 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 41A55E000EB9;
 Tue, 16 Jan 2024 11:27:37 +0800 (CST)
X-ns-mid: postfix-65A5F7A9-60232416
Received: from kernel.. (unknown [172.20.15.234])
 by mail.kylinos.cn (NSMail) with ESMTPA id A1E9CE000EB9;
 Tue, 16 Jan 2024 11:27:33 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/msm/adreno: Add a null pointer check to the
 zap_shader_load_mdt
Date: Tue, 16 Jan 2024 11:27:32 +0800
Message-Id: <20240116032732.65262-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
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
Cc: Kunwu Chan <chentao@kylinos.cn>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. Ensure the allocation was successful
by checking the pointer validity.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
index 074fb498706f..7e79ead4fe00 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -144,6 +144,10 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, =
const char *fwname,
 		char *newname;
=20
 		newname =3D kasprintf(GFP_KERNEL, "qcom/%s", fwname);
+		if (!newname) {
+			ret =3D -ENOMEM;
+			goto out;
+		}
=20
 		ret =3D qcom_mdt_load(dev, fw, newname, pasid,
 				mem_region, mem_phys, mem_size, NULL);
--=20
2.39.2

