Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1FB0D368
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4B10E606;
	Tue, 22 Jul 2025 07:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 22 Jul 2025 05:45:27 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145FA10E2F4;
 Tue, 22 Jul 2025 05:45:26 +0000 (UTC)
X-UUID: 58393c0c66be11f0b29709d653e92f7d-20250722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:0b25fb33-ed9d-4f38-befa-9f33992742c6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:708eaf457a96064c0c3ac0dc8b2deb52,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
 L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 58393c0c66be11f0b29709d653e92f7d-20250722
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
 (envelope-from <zhaoguohan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1436159494; Tue, 22 Jul 2025 13:40:15 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id 985C8B8258E9;
 Tue, 22 Jul 2025 13:40:15 +0800 (CST)
X-ns-mid: postfix-687F243F-42099633
Received: from zgh-VMware-Virtual-Platform.localdomain (unknown [10.42.12.181])
 by node2.com.cn (NSMail) with ESMTPA id 32AD4B8258E7;
 Tue, 22 Jul 2025 05:40:13 +0000 (UTC)
From: zhaoguohan@kylinos.cn
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: [PATCH] drm/xe/hwmon: Return early on power limit read failure
Date: Tue, 22 Jul 2025 13:40:10 +0800
Message-ID: <20250722054010.34608-1-zhaoguohan@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Jul 2025 07:38:12 +0000
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

From: GuoHan Zhao <zhaoguohan@kylinos.cn>

In xe_hwmon_pcode_rmw_power_limit(), when xe_pcode_read() fails,
the function logs the error but continues to execute the subsequent
logic. This can result in undefined behavior as the values val0 and
val1 may contain invalid data.

Fix this by adding an early return after logging the read failure,
ensuring that we don't proceed with potentially corrupted data.

Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
index f08fc4377d25e..4e4f07f3e4788 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -190,9 +190,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const stru=
ct xe_hwmon *hwmon, u32 attr
 						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
 						  &val0, &val1);
=20
-	if (ret)
+	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, =
ret %d\n",
 			channel, val0, val1, ret);
+		return ret;
+	}
=20
 	if (attr =3D=3D PL1_HWMON_ATTR)
 		val0 =3D (val0 & ~clr) | set;
--=20
2.43.0

