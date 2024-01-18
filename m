Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D14831629
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644310E770;
	Thu, 18 Jan 2024 09:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B8B10E770
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:47:17 +0000 (UTC)
X-UUID: 3d0cabb88c414149bc8eca0681ee3386-20240118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:02285d8d-6596-4773-956c-95702a0cee6f, IP:20,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-INFO: VERSION:1.1.35, REQID:02285d8d-6596-4773-956c-95702a0cee6f, IP:20,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:5
X-CID-META: VersionHash:5d391d7, CLOUDID:c4567d7f-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:240118174709GVOR3L11,BulkQuantity:0,Recheck:0,SF:17|19|44|66|38|24|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 3d0cabb88c414149bc8eca0681ee3386-20240118
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1667805969; Thu, 18 Jan 2024 17:47:08 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 71955E000EB9;
 Thu, 18 Jan 2024 17:47:08 +0800 (CST)
X-ns-mid: postfix-65A8F39C-245485265
Received: from kernel.. (unknown [172.20.15.234])
 by mail.kylinos.cn (NSMail) with ESMTPA id E42E8E000EB9;
 Thu, 18 Jan 2024 17:47:05 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: andersson@kernel.org, konrad.dybcio@linaro.org, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Subject: [PATCH] hwmon: (peci/cputemp) Add a null pointer check to the
 wled_configure
Date: Thu, 18 Jan 2024 17:47:04 +0800
Message-Id: <20240118094704.212641-1-chentao@kylinos.cn>
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
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. Ensure the allocation was successful
by checking the pointer validity.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/video/backlight/qcom-wled.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backligh=
t/qcom-wled.c
index 10129095a4c1..a0b06839d778 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,8 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr =3D be32_to_cpu(*prop_addr);
=20
 	rc =3D of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
+		if (!wled->name)
+			return -ENOMEM;
+	}
=20
 	switch (wled->version) {
 	case 3:
--=20
2.39.2

